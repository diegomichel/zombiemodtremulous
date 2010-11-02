/*
===========================================================================
Copyright (C) 2007 Amine Haddad

This file is part of Tremulous.

The original works of vcxzet (lamebot3) were used a guide to create TremBot.

Tremulous is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Tremulous is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Tremulous; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
 */

/* Current version: v0.01 */

#include "g_local.h"

#ifndef RAND_MAX
#define RAND_MAX 32768
#endif

void
G_BotAdd(char *name, int team, int skill, gentity_t * ent) {
  int i;
  int clientNum;
  char userinfo[MAX_INFO_STRING];
  int reservedSlots = 0;
  gentity_t *bot;

  //reservedSlots = trap_Cvar_VariableIntegerValue ("sv_privateclients"); // Found a way to have this var in level.

  // find what clientNum to use for bot
  clientNum = -1;

  for (i = 0; i < level.botslots; i++) {
    if (!g_entities[i].inuse) {
      clientNum = i;
      break;
    }
  }


  if (clientNum < 0) {
    trap_Printf("no more slots for bot\n");
    return;
  }
  if (skill < 1) skill = 1;

  bot = &g_entities[clientNum];
  bot->r.svFlags |= SVF_BOT;
  bot->inuse = qtrue;

  //default bot data
  bot->botCommand = BOT_REGULAR;
  if (ent == NULL) {
    bot->botFriend = NULL;
  } else {
    bot->botFriend = ent;
    bot->botFriend->botclientnum[ent->havebot] = clientNum;
  }

  bot->botEnemy = NULL;
  bot->botFriendLastSeen = 0;
  bot->botEnemyLastSeen = 0;
  bot->botSkillLevel = skill;
  bot->botTeam = team;
  bot->turntime = level.time + 3000;

  // register user information
  userinfo[0] = '\0';
  Info_SetValueForKey(userinfo, "name", name);
  Info_SetValueForKey(userinfo, "rate", "8000");
  Info_SetValueForKey(userinfo, "snaps", "20");

  trap_SetUserinfo(clientNum, userinfo);

  // have it connect to the game as a normal client
  if (ClientConnect(clientNum, qtrue) != NULL) {
    // won't let us join
    return;
  }
  level.bots++;
  ClientBegin(clientNum);
  G_ChangeTeam(bot, team);
}

void
G_BotDel(int clientNum) {
  gentity_t *bot;

  bot = &g_entities[clientNum];
  if (!(bot->r.svFlags & SVF_BOT)) {
    trap_Printf(va("'^7%s^7' is not a bot\n", bot->client->pers.netname));
    return;
  }
  if (bot->botFriend != NULL) {
    //bot->botFriend->havebot = 0;
  }
  level.bots--;
  ClientDisconnect(clientNum);
}

void
G_BotCmd(gentity_t * master, int clientNum, char *command) {
  gentity_t *bot;

  bot = &g_entities[clientNum];
  if (!(bot->r.svFlags & SVF_BOT)) {
    return;
  }

  bot->botFriend = NULL;
  bot->botEnemy = NULL;
  bot->botFriendLastSeen = 0;
  bot->botEnemyLastSeen = 0;

  //ROTAX
  if (g_ambush.integer == 1) {
    trap_Printf(va("You can't change aliens behavior in ambush mod\n"));
    return;
  }

  if (!Q_stricmp(command, "regular")) {

    bot->botCommand = BOT_REGULAR;
    //trap_SendServerCommand(-1, "print \"regular mode\n\"");

  } else if (!Q_stricmp(command, "idle")) {

    bot->botCommand = BOT_IDLE;
    //trap_SendServerCommand(-1, "print \"idle mode\n\"");

  } else if (!Q_stricmp(command, "attack")) {

    bot->botCommand = BOT_ATTACK;
    //trap_SendServerCommand(-1, "print \"attack mode\n\"");

  } else if (!Q_stricmp(command, "standground")) {

    bot->botCommand = BOT_STAND_GROUND;
    //trap_SendServerCommand(-1, "print \"stand ground mode\n\"");

  } else if (!Q_stricmp(command, "defensive")) {

    bot->botCommand = BOT_DEFENSIVE;
    //trap_SendServerCommand(-1, "print \"defensive mode\n\"");

  } else if (!Q_stricmp(command, "followprotect")) {

    bot->botCommand = BOT_FOLLOW_FRIEND_PROTECT;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-protect mode\n\"");

  } else if (!Q_stricmp(command, "followattack")) {

    bot->botCommand = BOT_FOLLOW_FRIEND_ATTACK;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-attack mode\n\"");

  } else if (!Q_stricmp(command, "followidle")) {

    bot->botCommand = BOT_FOLLOW_FRIEND_IDLE;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-idle mode\n\"");

  } else if (!Q_stricmp(command, "teamkill")) {

    bot->botCommand = BOT_TEAM_KILLER;
    //trap_SendServerCommand(-1, "print \"team kill mode\n\"");

  } else {

    bot->botCommand = BOT_REGULAR;
    //trap_SendServerCommand(-1, "print \"regular (unknown) mode\n\"");

  }

  return;
}

void
Bot_Buy(gentity_t * self) {

}

qboolean
Bot_Stuck(gentity_t * self, int zone) {
  if (self->turntime < level.time) {
    self->turntime = level.time + 800;
    if (abs(self->posX - self->client->ps.origin[0]) < zone
            && abs(self->posY - self->client->ps.origin[1]) < zone) {
      self->posX = self->client->ps.origin[0];
      self->posY = self->client->ps.origin[1];
      self->posZ = self->client->ps.origin[2];
      return qtrue;
    }

    self->posX = self->client->ps.origin[0];
    self->posY = self->client->ps.origin[1];
    self->posZ = self->client->ps.origin[2];
  }
  return qfalse;
}

void
G_BotThink(gentity_t * self) {
  gentity_t *bot;
  int distance = 0;
  int clicksToStopChase = 30; //5 seconds
  int tooCloseDistance = 100; // about 1/3 of turret range
  int forwardMove = 127; // max speed
  int tempEntityIndex = -1;
  qboolean followFriend = qfalse;
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end;
  vec3_t top = {0, 0, 0};
  int vh = 0;
  trace_t tr;
  int i;


  self->client->pers.cmd.buttons = 0;
  self->client->pers.cmd.forwardmove = 0;
  self->client->pers.cmd.upmove = 0;
  self->client->pers.cmd.rightmove = 0;

  // reset botEnemy if enemy is dead
  if (self->botEnemy->health <= 0) {
    self->botEnemy = NULL;
    self->client->pers.cmd.buttons |= BUTTON_WALKING;
    //&= ~BUTTON_WALKING;
  }

  switch (self->botCommand) {
    case BOT_REGULAR:
      if (self->botEnemy) {
        if (!botTargetInRange(self, self->botEnemy)) {
          if (self->botEnemyLastSeen > clicksToStopChase) {
            self->botEnemy = NULL;
            self->botEnemyLastSeen = 0;
          } else {
            self->botEnemyLastSeen++;
          }
        } else {
          self->botEnemyLastSeen = 0;
        }
      } else {
        tempEntityIndex = botFindClosestEnemy(self, qfalse);
        if (tempEntityIndex >= 0) {
          self->botEnemy = &g_entities[tempEntityIndex];
          self->botEnemy->lastTimeSeen = level.time + 15000; //7 seconds to camp
        }
      }
      if (!self->botEnemy && level.theCamper && level.theCamper->client) {
        if (self->client->lastKillTime > 10000) {
          self->botEnemy = level.theCamper;
        }
      }
      if (!self->botEnemy) {

        if (Bot_Stuck(self, 50)) {
          self->client->ps.delta_angles[1] =
                  ANGLE2SHORT(self->client->ps.delta_angles[1] - 45);
        } else {
          if (WallInFront(self))//if(Bot_Stuck(self,100))
          {
            selectBetterWay(self);
            //self->client->ps.delta_angles[1] =
            //ANGLE2SHORT(self->client->ps.delta_angles[1] - 30);
          }
        }
        self->client->pers.cmd.forwardmove = 60;
        self->client->pers.cmd.buttons |= BUTTON_WALKING;
        // no enemy
      } else {
        if (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
          self->client->pers.hyperspeed = 0;
        // enemy!
        distance = botGetDistanceBetweenPlayer(self, self->botEnemy);
        botAimAtTarget(self, self->botEnemy);
        if (distance > 50) {
          self->client->pers.cmd.forwardmove = forwardMove;
          self->client->pers.cmd.buttons &= ~BUTTON_WALKING;
          if (distance < 200) {
            self->client->pers.cmd.buttons |= BUTTON_GESTURE;
          }
          //botShootIfTargetInRange(self, self->botEnemy);
        }
        if (distance < 45) {
          self->client->pers.cmd.forwardmove = forwardMove + (self->botSkillLevel * 5); //20
          self->client->pers.cmd.buttons &= ~BUTTON_WALKING;
          botShootIfTargetInRange(self, self->botEnemy);
        }
        if (Bot_Stuck(self, 60)) {
          //Jump really high :>
          self->client->pers.cmd.upmove = 30;
          self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
        }
      }
      break;

    case BOT_IDLE:
      // just stand there and look pretty.
      break;
    default:
      // dunno.
      break;
  }
}

void
G_BotSpectatorThink(gentity_t * self) {
  int secToSpawn;
  if (self->client->ps.pm_flags & PMF_QUEUED) {
    //we're queued to spawn, all good
    //G_LogPrintf( "ClientQUEUED: %i\n", self->client->ps.clientNum );
    return;
  }

  if (self->client->sess.sessionTeam == TEAM_SPECTATOR) {
    int teamnum = self->client->pers.teamSelection;
    int clientNum = self->client->ps.clientNum;

    if (teamnum == PTE_HUMANS) {
      self->client->pers.classSelection = PCL_HUMAN;
      self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
      self->client->pers.humanItemSelection = WP_MACHINEGUN;
      G_PushSpawnQueue(&level.humanSpawnQueue, clientNum);
    } else if (teamnum == PTE_ALIENS) {
      //ROTAX
      if (g_ambush.integer == 1) {
        if (ROTACAK_ambush_rebuild_time_temp < level.time
                && ((level.time - level.startTime) >
                (g_ambush_sec_to_start.integer * 1000))) {
          srand(trap_Milliseconds());

          if (ROTACAK_ambush_stage == 1) //adv granger
          {
            self->client->pers.classSelection =
                    PCL_ALIEN_BUILDER0_UPG;
            self->client->ps.stats[STAT_PCLASS] =
                    PCL_ALIEN_BUILDER0_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 2) //dretch
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL0;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL0;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 3) //basilisk
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL1;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL1;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 4) //adv basilisk
          {
            self->client->pers.classSelection =
                    PCL_ALIEN_LEVEL1_UPG;
            self->client->ps.stats[STAT_PCLASS] =
                    PCL_ALIEN_LEVEL1_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 5) //marauder
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL2;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL2;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 6) //adv marauder
          {
            self->client->pers.classSelection =
                    PCL_ALIEN_LEVEL2_UPG;
            self->client->ps.stats[STAT_PCLASS] =
                    PCL_ALIEN_LEVEL2_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 7) //dragon
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL3;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL3;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 8) //adv dragon
          {
            self->client->pers.classSelection =
                    PCL_ALIEN_LEVEL3_UPG;
            self->client->ps.stats[STAT_PCLASS] =
                    PCL_ALIEN_LEVEL3_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          } else if (ROTACAK_ambush_stage == 9) //tyrant
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL4;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL4;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
        }
      } else {
        if (level.slowdownTime < level.time) {
          self->client->pers.classSelection = PCL_HUMAN;
          self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
          self->client->pers.humanItemSelection = WP_BOMB;
          G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
        } else {

        }
      }
    }
  }
}

qboolean
botAimAtTarget(gentity_t * self, gentity_t * target) {
  vec3_t dirToTarget, angleToTarget;
  vec3_t top = {0, 0, 0};
  int vh = 0;
  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
  top[2] = vh;
  VectorAdd(self->s.pos.trBase, top, top);
  VectorSubtract(target->s.pos.trBase, top, dirToTarget);
  VectorNormalize(dirToTarget);
  vectoangles(dirToTarget, angleToTarget);
  self->client->ps.delta_angles[0] = ANGLE2SHORT(angleToTarget[0]);
  self->client->ps.delta_angles[1] = ANGLE2SHORT(angleToTarget[1]);
  self->client->ps.delta_angles[2] = ANGLE2SHORT(angleToTarget[2]);
  return qtrue;
}

qboolean botTargetInRange2(gentity_t * self, gentity_t * target) {
  return qfalse;
}

qboolean
botTargetInRange(gentity_t * self, gentity_t * target) {
  //Dont do shit
  //This shit evidently dont work.
  trace_t trace;
  gentity_t *traceEnt;
  vec3_t forward, right, up;
  vec3_t muzzle;
  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  //int myGunRange;
  //myGunRange = MGTURRET_RANGE * 3;

  if (!self || !target)
    return qfalse;

  //ROTAX - niceni budov
  if (!self->client)
    return qfalse;

  if (!target->client && g_ambush_att_buildables.integer == 0) {
    return qfalse;
  }


  if (target->s.eType == ET_BUILDABLE
          && target->biteam == self->client->ps.stats[STAT_PTEAM]
          && g_ambush_att_buildables.integer == 1)
    return qfalse;


  if (target->client && target->client->ps.stats[STAT_STATE] & SS_HOVELING)
    return qfalse;

  if (target->health <= 0)
    return qfalse;

  if (target->s.eType == ET_BUILDABLE && self->botignorebuilds == 1) {
    return qfalse;
  }

  //BG_FindViewheightForClass(  self->client->ps.stats[ STAT_PCLASS ], &vh, NULL );
  //top[2]=vh;
  //VectorAdd( self->s.pos.trBase, top, top);
  //draw line between us and the target and see what we hit
  //trap_Trace( &trace, self->s.pos.trBase, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT );

  trap_Trace(&trace, muzzle, NULL, NULL, target->s.pos.trBase,
          self->s.number, MASK_SHOT);
  traceEnt = &g_entities[trace.entityNum];
  //if( trace.fraction < 1.0 )
  //{return qfalse;}
  // check that we hit a human and not an object
  //if( !traceEnt->client )
  //      return qfalse;

  //check our target is in LOS
  if (!(traceEnt == target))
    return qfalse;

  //Are we on the same level?

  if (self->client->ps.origin[2] - target->client->ps.origin[2] < -30 &&
          (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)) {
    //trap_SendServerCommand( target-g_entities, va( "print \"^7[A] %s^7: ^2Come down noob\n\"", self->client->pers.netname ) );
    self->client->pers.cmd.upmove = 30;
    self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
    return qfalse;
  }

  if (self->client->ps.origin[2] - target->client->ps.origin[2] < -100 &&
          (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)) {
    //trap_SendServerCommand( target-g_entities, va( "print \"^7[A] %s^7: ^2Come down noob\n\"", self->client->pers.netname ) );
    self->client->pers.cmd.upmove = 30;
    self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
    return qfalse;
  }
  return qtrue;
}

/*
qboolean botTargetInRange( gentity_t *self, gentity_t *target ) {
        trace_t   trace;
        gentity_t *traceEnt;
        vec3_t  forward, right, up;
        vec3_t  muzzle;
        AngleVectors( self->client->ps.viewangles, forward, right, up );
        CalcMuzzlePoint( self, forward, right, up, muzzle );

        if( !self || !target )
                return qfalse;

  //ROTAX - niceni budov
        if( !self->client || (!target->client && g_ambush_att_buildables.integer == 0) )
                return qfalse;

        if( target->client->ps.stats[ STAT_STATE ] & SS_HOVELING )
                return qfalse;

        if( target->health <= 0 )
                return qfalse;

        if( self->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS &&
                 self->client->ps.stats[ STAT_PCLASS ] != PCL_ALIEN_LEVEL3_UPG &&
                 self->client->ps.stats[ STAT_PCLASS ] != PCL_ALIEN_LEVEL3 &&
                 target->s.pos.trBase[2] - self->s.pos.trBase[2] > 150)
                return qfalse;
        if(self->client->ps.weapon == WP_PAIN_SAW &&
                target->s.pos.trBase[2] - self->s.pos.trBase[2] > 150)
        {
                return qfalse;
        }
        else if(self->client->ps.weapon == WP_FLAMER &&
                target->s.pos.trBase[2] - self->s.pos.trBase[2] > 200)
        {
                return qfalse;
        }
        if(self->client->ps.stats[ STAT_PTEAM ] == PTE_ALIENS)
        {
                if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL4 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level4_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL3_UPG &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level3UPG_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL3 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level3_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL2_UPG &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level2UPG_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL2 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level2_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL1_UPG &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level1UPG_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL1 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level1_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_LEVEL0 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_level0_range.integer)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_BUILDER0 &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > 100)
                {return qfalse;}
                else if(self->client->ps.stats[ STAT_PCLASS ] == PCL_ALIEN_BUILDER0_UPG &&
                        Distance( self->s.pos.trBase, target->s.pos.trBase ) > 200)
                {return qfalse;}
        }
        else if((self->client->ps.stats[ STAT_PCLASS ] == PCL_HUMAN ||
                self->client->ps.stats[ STAT_PCLASS ] == PCL_HUMAN_BSUIT ) &&
                Distance( self->s.pos.trBase, target->s.pos.trBase ) > g_human_range.integer)
        {return qfalse;}
        else
        {
                if(Distance( self->s.pos.trBase, target->s.pos.trBase ) > 3000)
                {return qfalse;}
        }
        //BG_FindViewheightForClass(  self->client->ps.stats[ STAT_PCLASS ], &vh, NULL );
        //top[2]=vh;
        //VectorAdd( self->s.pos.trBase, top, top);
        //draw line between us and the target and see what we hit
        //trap_Trace( &trace, self->s.pos.trBase, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT );

        trap_Trace( &trace, muzzle, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT );
        traceEnt = &g_entities[ trace.entityNum ];
        //if( trace.fraction < 1.0 )
        //{return qfalse;}
        // check that we hit a human and not an object
        //if( !traceEnt->client )
        //	return qfalse;

        //check our target is in LOS
        if(!(traceEnt == target))
                return qfalse;

        return qtrue;
}
 * */

qboolean
WallInFront(gentity_t * self) {
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end;
  vec3_t spawn_angles;
  vec3_t top = {0, 0, 0};
  int vh = 0;
  trace_t tr;
  int i;
  int distance;

  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
  top[2] = vh;

  //spawn_angles[0] =0;
  //spawn_angles[1] =90;
  //spawn_angles[2] =0;

  //This is to fix the view angle when facing floor.
  //spawn_angles[ YAW ] += 180.0f;
  //AngleNormalize360( spawn_angles[ YAW ] );
  //G_SetClientViewAngle( self, spawn_angles );

  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  VectorMA(muzzle, 10000, forward, end);

  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);

  distance = Distance(self->s.pos.trBase, tr.endpos);
  if (distance < 90) {
    return qtrue;
  }
  return qfalse;
}

void
selectBetterWay(gentity_t * self) {
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end, tempangle;
  vec3_t top = {0, 0, 0};
  int vh = 0;
  trace_t tr;
  int i;
  int distance1, distance2, distance3;

  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
  top[2] = vh;

  //self->client->ps.delta_angles[1] =
  //ANGLE2SHORT(self->client->ps.delta_angles[1] - 30);
  VectorCopy(self->client->ps.viewangles, tempangle);

  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 60);
  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  VectorMA(muzzle, 1000, forward, end);
  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
  distance1 = Distance(self->s.pos.trBase, tr.endpos);


  VectorCopy(tempangle, self->client->ps.viewangles);
  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 120);
  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  VectorMA(muzzle, 1000, forward, end);
  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
  distance2 = Distance(self->s.pos.trBase, tr.endpos);


  VectorCopy(tempangle, self->client->ps.viewangles);
  self->client->ps.viewangles[1] = ANGLE2SHORT(self->client->ps.viewangles[1] - 180);
  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  VectorMA(muzzle, 1000, forward, end);
  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);
  distance3 = Distance(self->s.pos.trBase, tr.endpos);

  VectorCopy(tempangle, self->client->ps.viewangles);

  if (distance1 > distance2) {
    self->client->ps.delta_angles[1] =
            ANGLE2SHORT(self->client->ps.delta_angles[1] - 60);
  } else if (distance2 > distance3) {
    self->client->ps.delta_angles[1] =
            ANGLE2SHORT(self->client->ps.delta_angles[1] - 120);
  } else {
    self->client->ps.delta_angles[1] =
            ANGLE2SHORT(self->client->ps.delta_angles[1] - 180);
  }
}


//NOT USED ALLREADY, thinking on better solutions.

int
botFindClosesDoor(gentity_t * self) {
  int vectorRange = MGTURRET_RANGE * 3;
  int i;
  int total_entities;
  int entityList[MAX_GENTITIES];
  vec3_t range;
  vec3_t mins, maxs;
  gentity_t *target;

  VectorSet(range, vectorRange, vectorRange, vectorRange);
  VectorAdd(self->client->ps.origin, range, maxs);
  VectorSubtract(self->client->ps.origin, range, mins);

  total_entities = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);

  // check list for enemies
  for (i = 0; i < total_entities; i++) {
    target = &g_entities[entityList[i]];

    if (target == self)
      continue;
    if (target->door != 1)
      continue;

    if (botTargetInRange(self, target)) {
      return entityList[i];
    }
  }
}

int
botFindClosestEnemy(gentity_t * self, qboolean includeTeam) {
  // return enemy entity index, or -1
  int vectorRange = MGTURRET_RANGE * 5;
  int i;
  int total_entities;
  int entityList[MAX_GENTITIES];
  vec3_t range;
  vec3_t mins, maxs;
  gentity_t *target;

  if (g_ambush.integer == 1) //ROTAX
    vectorRange = 1.0f * g_ambush_range.integer;

  if (level.numHumanSpawns < 1) {
    //Gonna try to chase enemys in long distances.
    MGTURRET_RANGE * 10;
  }

  VectorSet(range, vectorRange, vectorRange, vectorRange);
  VectorAdd(self->client->ps.origin, range, maxs);
  VectorSubtract(self->client->ps.origin, range, mins);

  total_entities = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);

  // check list for enemies
  for (i = 0; i < total_entities; i++) {
    target = &g_entities[entityList[i]];

    if (target == self)
      continue;

    if (target->client->ps.stats[STAT_PTEAM] ==
            self->client->ps.stats[STAT_PTEAM])
      continue;
    //ROTAX - niceni budov
    if (mega_wave < 2) {
      if (target->client) {
        if (botTargetInRange(self, target)) {
          return entityList[i];
        }
      }
    } else {
      if (botTargetInRange(self, target)) {
        return entityList[i];
      }
    }
  }

  if (includeTeam) {
    // check list for enemies in team
    for (i = 0; i < total_entities; i++) {
      target = &g_entities[entityList[i]];

      if (target->client && self != target
              && target->client->ps.stats[STAT_PTEAM] ==
              self->client->ps.stats[STAT_PTEAM]) {
        if (botTargetInRange(self, target)) {
          return entityList[i];
        }
      }
    }
  }

  return -1;
}

// really an int? what if it's too long?

int
botGetDistanceBetweenPlayer(gentity_t * self, gentity_t * player) {
  return Distance(self->s.pos.trBase, player->s.pos.trBase);
}

qboolean
botShootIfTargetInRange(gentity_t * self, gentity_t * target) {
  int nahoda = 0;
  botAimAtTarget(self, self->botEnemy);
  srand(trap_Milliseconds());
  nahoda =
          (int) (((double) rand() / ((double) (RAND_MAX) + (double) (1))) * 20);
  self->client->pers.cmd.buttons = 0;
  if (self->client->ps.stats[STAT_PTEAM] == PTE_HUMANS) //Human target buildable
  {
    if (self->client->ps.weapon == WP_FLAMER) {
      if (Distance(self->s.pos.trBase, target->s.pos.trBase) < 200)
        self->client->pers.cmd.buttons |= BUTTON_ATTACK;
    } else if (self->client->ps.weapon == WP_LUCIFER_CANNON) {
      self->client->pers.cmd.buttons |= BUTTON_ATTACK2;
    } else {
      self->client->pers.cmd.buttons |= BUTTON_ATTACK;
    }
  } else {
    self->client->pers.cmd.buttons |= BUTTON_ATTACK;
  }
  return qtrue;
}

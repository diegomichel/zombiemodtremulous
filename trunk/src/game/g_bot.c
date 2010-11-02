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
#include "acebot.h"

#ifndef RAND_MAX
#define RAND_MAX 32768
#endif

void
G_BotAdd(char *name, int team, int skill, gentity_t * ent)
{
  int i;
  int clientNum;
  char userinfo[MAX_INFO_STRING];
  char model[MAX_QPATH];
  char buffer[MAX_QPATH];
  gentity_t *bot;

  if(level.intermissiontime)
  {
    return;
  }
  if(level.time-level.startTime < 12000)
  {
    return;
  }
  //reservedSlots = trap_Cvar_VariableIntegerValue ("sv_privateclients"); // Found a way to have this var in level.

  // find what clientNum to use for bot
  clientNum = -1;

  for(i = 0;i < level.botslots;i++)
  {
    if (!g_entities[i].inuse)
    {
      clientNum = i;
      break;
    }
  }

  if (clientNum < 0)
  {
    trap_Printf("no more slots for bot\n");
    return;
  }
  if (skill < 1)
    skill = 1;

  bot = &g_entities[clientNum];
  bot->r.svFlags |= SVF_BOT;
  bot->inuse = qtrue;

  //default bot data
  bot->botCommand = BOT_REGULAR;
  if (ent == NULL)
  {
    bot->botFriend = NULL;
  }
  else
  {
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
  if (ClientConnect(clientNum, qtrue) != NULL)
  {
    // won't let us join
    return;
  }

  level.bots++;
  //Since i dont update UserInfo for bots i need to set the netname here.
  Q_strncpyz(bot->client->pers.netname,name,sizeof(bot->client->pers.netname));
  ClientBegin(clientNum);
  G_ChangeTeam(bot, team);


  //Setting initial client information.
  Com_sprintf(buffer, MAX_QPATH, "%s/%s", BG_FindModelNameForClass(PCL_HUMAN), BG_FindSkinNameForClass(PCL_HUMAN));
  Q_strncpyz(model, buffer, sizeof(model));
  Com_sprintf(userinfo, sizeof(userinfo), "t\\%i\\model\\%s\\hmodel\\%s\\", PTE_ALIENS, model, model);
  trap_SetConfigstring(CS_PLAYERS + clientNum, userinfo);
  bot->client->ps.persistant[PERS_STATE] &= ~PS_NONSEGMODEL;
  bot->client->ps.persistant[PERS_STATE] &= ~PS_WALLCLIMBINGFOLLOW;
  bot->client->pers.useUnlagged = qfalse;
  bot->client->pers.predictItemPickup = qfalse;
  bot->client->pers.localClient = qtrue;
}

void
G_BotDel(int clientNum)
{
  gentity_t *bot;

  bot = &g_entities[clientNum];
  if (!(bot->r.svFlags & SVF_BOT))
  {
    trap_Printf(va("'^7%s^7' is not a bot\n", bot->client->pers.netname));
    return;
  }
  if (bot->botFriend != NULL)
  {
    //bot->botFriend->havebot = 0;
  }
  level.bots--;
  ClientDisconnect(clientNum);
}

void
G_BotCmd(gentity_t * master, int clientNum, char *command)
{
  gentity_t *bot;

  bot = &g_entities[clientNum];
  if (!(bot->r.svFlags & SVF_BOT))
  {
    return;
  }

  bot->botFriend = NULL;
  bot->botEnemy = NULL;
  bot->botFriendLastSeen = 0;
  bot->botEnemyLastSeen = 0;

  //ROTAX
  if (g_ambush.integer == 1)
  {
    trap_Printf(va("You can't change aliens behavior in ambush mod\n"));
    return;
  }

  if (!Q_stricmp(command, "regular"))
  {

    bot->botCommand = BOT_REGULAR;
    //trap_SendServerCommand(-1, "print \"regular mode\n\"");

  }
  else if (!Q_stricmp(command, "idle"))
  {

    bot->botCommand = BOT_IDLE;
    //trap_SendServerCommand(-1, "print \"idle mode\n\"");

  }
  else if (!Q_stricmp(command, "attack"))
  {

    bot->botCommand = BOT_ATTACK;
    //trap_SendServerCommand(-1, "print \"attack mode\n\"");

  }
  else if (!Q_stricmp(command, "standground"))
  {

    bot->botCommand = BOT_STAND_GROUND;
    //trap_SendServerCommand(-1, "print \"stand ground mode\n\"");

  }
  else if (!Q_stricmp(command, "defensive"))
  {

    bot->botCommand = BOT_DEFENSIVE;
    //trap_SendServerCommand(-1, "print \"defensive mode\n\"");

  }
  else if (!Q_stricmp(command, "followprotect"))
  {

    bot->botCommand = BOT_FOLLOW_FRIEND_PROTECT;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-protect mode\n\"");

  }
  else if (!Q_stricmp(command, "followattack"))
  {

    bot->botCommand = BOT_FOLLOW_FRIEND_ATTACK;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-attack mode\n\"");

  }
  else if (!Q_stricmp(command, "followidle"))
  {

    bot->botCommand = BOT_FOLLOW_FRIEND_IDLE;
    bot->botFriend = master;
    //trap_SendServerCommand(-1, "print \"follow-idle mode\n\"");

  }
  else if (!Q_stricmp(command, "teamkill"))
  {

    bot->botCommand = BOT_TEAM_KILLER;
    //trap_SendServerCommand(-1, "print \"team kill mode\n\"");

  }
  else
  {

    bot->botCommand = BOT_REGULAR;
    //trap_SendServerCommand(-1, "print \"regular (unknown) mode\n\"");

  }

  return;
}

void
Bot_Buy(gentity_t * self)
{

}

qboolean
Bot_Stuck(gentity_t * self, int zone)
{
  if (self->turntime < level.time)
  {
    self->turntime = level.time + 800;
    if (abs(self->posX - self->client->ps.origin[0]) < zone && abs(self->posY - self->client->ps.origin[1]) < zone)
    {
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

qboolean
WallBlockingNode(gentity_t * self)
{
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end;
  vec3_t spawn_angles, nextnode;
  vec3_t top =
  { 0, 0, 0 };
  int vh = 0;
  trace_t tr;
  int i;
  int distanceNode;
  int distance;

  BG_FindViewheightForClass(self->client->ps.stats[STAT_PCLASS], &vh, NULL);
  top[2] = vh;

  AngleVectors(self->client->ps.viewangles, forward, right, up);
  CalcMuzzlePoint(self, forward, right, up, muzzle);
  VectorMA(muzzle, 10000, forward, end);

  trap_Trace(&tr, muzzle, NULL, NULL, end, self->s.number, MASK_SOLID);

  nextnode[0] = ((-(BLOCKSIZE / 2) + level.pathx[self->botnextpath]) * BLOCKSIZE);
  nextnode[1] = ((-(BLOCKSIZE / 2) + level.pathy[self->botnextpath]) * BLOCKSIZE);
  nextnode[2] = self->s.pos.trBase[2];

  distanceNode = Distance(nextnode, self->s.pos.trBase);

  distance = Distance(self->s.pos.trBase, tr.endpos);
  if (distance < distanceNode)
  {
    return qtrue;
  }
  return qfalse;
}
/*
 void
 G_BotFollowPath(gentity_t * self) {
 vec3_t dirToTarget, angleToTarget;
 vec3_t top = {0, 0, 0};
 int vh = 0;
 int tempEntityIndex = -1;
 int cuadrado;

 int x,y;

 if(self->pathfindthink > level.time ) return;

 if(botReachedDestination(self))
 {
 botStopWalk(self);
 trap_SendServerCommand(-1,
 "print \"^1Objetive Reached\n\"");
 return;
 }

 if(self->timedropnodepath > level.time)
 return;

 if(visitedLastNode(self))
 {
 if(nextNode(self))
 {
 trap_SendServerCommand(-1,
 "print \"Moving to next node  \"");
 aimNode(self);
 botWalk(self);
 }


 trap_SendServerCommand(-1,
 va("print \"Distance to node: %d, X:%f , Y:%f, POSx: %f, POSXy: %f, %d\n\"",
 Distance2d(self->s.origin, self->nextnode),
 ((BLOCKSIZE/2)+(self->s.origin[0]/BLOCKSIZE)),
 ((BLOCKSIZE/2)+(self->s.origin[1]/BLOCKSIZE)),
 self->s.origin[0],
 self->s.origin[1],
 self->botnextpath
 ));

 //botStopWalk(self);
 }
 else
 {
 //Posibility of getting stuck here
 //Bot have run out of place.
 if(botLost(self))
 {
 trap_SendServerCommand(-1,
 va("print \"^1BOTLOST: %f %f %f %f.\n\"", self->nextnode[0],self->nextnode[1],self->s.origin[0],self->s.origin[1]));

 if(canMakeWay(self))
 {
 trap_SendServerCommand(-1,
 "print \"i make a way\n\"");
 aimNode(self);
 botWalk(self);
 self->timedropnodepath = level.time +2000;
 }
 else
 {
 //The bot have complety lost him self
 if(findNodeCanSee(self))
 {
 aimNode(self);
 botWalk(self);
 }
 else
 {
 trap_SendServerCommand(-1,
 "print \"Darn it.\n\"");
 }
 }
 }
 else
 {
 trap_SendServerCommand(-1,
 "print \"Looking for next node\n\"");
 if(Bot_Stuck(self,20))
 {
 trap_SendServerCommand(-1,
 "print \"I stuck\n\"");
 if(findNodeCanSee(self))
 {
 trap_SendServerCommand(-1,
 "print \"Finding a node i can see\n\"");
 }
 else
 {
 if(canMakeWay(self))
 {
 aimNode(self);
 botWalk(self);
 self->client->ps.stats[ STAT_STATE ] |= SS_SPEEDBOOST;
 self->pathfindthink = level.time + 3000;
 }
 else
 {
 trap_SendServerCommand(-1,
 "print \"That just damn sucks.\n\"");
 }
 }
 aimNode(self);
 botWalk(self);

 }
 }
 }
 }
 */
void
G_BotThink(gentity_t * self)
{
  gentity_t *bot;
  int distance = 0;
  int clicksToStopChase = 30; //5 seconds
  int tooCloseDistance = 100; // about 1/3 of turret range
  int forwardMove = 127; // max speed
  int tempEntityIndex = -1;
  qboolean followFriend = qfalse;
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end;
  vec3_t top =
  { 0, 0, 0 };
  vec3_t spawn_angles;
  int vh = 0;
  trace_t tr;
  int i;

  self->s.angles[PITCH] = 0;

  self->client->pers.cmd.buttons = 0;
  botWalk(self,0);
  self->client->pers.cmd.upmove = 0;
  self->client->pers.cmd.rightmove = 0;

  switch(self->botCommand)
  {
    case BOT_FOLLOW_PATH:
      if (self->botEnemy->health <= 0 || self->botEnemy->client->ps.stats[STAT_HEALTH] <= 0 || self->botEnemy->client->pers.connected == CON_DISCONNECTED)
      {
        self->botCommand = BOT_REGULAR;
        self->botEnemy = NULL;
        memset(&self->client->pers.cmd, 0, sizeof(self->client->pers.cmd));
        break;
      }
      switch(self->botMetaMode)
      {
        case ATTACK_RAMBO:
        case ATTACK_CAMPER:
        case ATTACK_ALL:
          tempEntityIndex = botFindClosestEnemy(self, qfalse);
          if (tempEntityIndex >= 0)
          {
            if (director_debug.integer)
            {
              G_Printf("Was following path and i found a enemy around so im gonna attack him.\n");
            }
            self->botEnemy = &g_entities[tempEntityIndex];
            self->botEnemy->lastTimeSeen = level.time;
            memset(&self->client->pers.cmd, 0, sizeof(self->client->pers.cmd));
            self->botCommand = BOT_REGULAR;
            ACEND_setCurrentNode(self, INVALID);
          }
          else
          {
            ACEAI_Think(self);
          }
          break;
        default:
          ACEAI_Think(self);
          break;
      }
      break;

    case BOT_REGULAR:
      if (self->botEnemy)
      {
        if (!botTargetInRange(self, self->botEnemy))
        {
          if (self->botEnemyLastSeen > clicksToStopChase)
          {
            self->botEnemy = NULL;
            self->botEnemyLastSeen = 0;
          }
          else
          {
            self->botEnemyLastSeen++;
          }
        }
        else
        {
          self->botEnemyLastSeen = 0;
        }
      }
      else
      {
        tempEntityIndex = botFindClosestEnemy(self, qfalse);
        if (tempEntityIndex >= 0)
        {
          self->botEnemy = &g_entities[tempEntityIndex];
          self->botEnemy->lastTimeSeen = level.time;
        }
      }
      if (!self->botEnemy)
      {

        if (Bot_Stuck(self, 30))
        {
          self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 45);
        }
        else
        {
          if (WallInFront(self))
          {
            selectBetterWay(self);
          }
        }
        botWalk(self, 60);
      }
      else
      {
        if (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
          self->client->pers.hyperspeed = 0;
        // enemy!
        distance = botGetDistanceBetweenPlayer(self, self->botEnemy);

        //VectorCopy(self->s.origin, self->s.pos.trBase);
        botAimAtTarget(self, self->botEnemy);
        if (distance > 50)
        {
          if (g_survival.integer && (level.time - level.startTime) < 340000)
          {
            botWalk(self, 100);
          }
          if (g_survival.integer && (level.time - level.startTime) < 240000)
          {
            botWalk(self, 70);
          }
          if (g_survival.integer && (level.time - level.startTime) < 120000)
          {
            botWalk(self, 60);
          }
          if (g_survival.integer && (level.time - level.startTime) < 60000)
          {
            botWalk(self, 50);
          }
          if (distance < 200)
          {
            self->client->pers.cmd.buttons |= BUTTON_GESTURE;
          }
          else
          {
            botWalk(self, forwardMove);
          }
          //botShootIfTargetInRange(self, self->botEnemy);
        }
        if (distance < 45)
        {
          forwardMove = (forwardMove + (self->botSkillLevel * 5));
          botWalk(self, forwardMove);
          botShootIfTargetInRange(self, self->botEnemy);
        }
        if (Bot_Stuck(self, 60) && Distance(self->s.pos.trBase, self->botEnemy->s.pos.trBase) > 80)
        {
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
G_BotSpectatorThink(gentity_t * self)
{
  int secToSpawn;
  if (self->client->ps.pm_flags & PMF_QUEUED)
  {
    //we're queued to spawn, all good
    //G_LogPrintf( "ClientQUEUED: %i\n", self->client->ps.clientNum );
    return;
  }

  if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
  {
    int teamnum = self->client->pers.teamSelection;
    int clientNum = self->client->ps.clientNum;

    if (teamnum == PTE_HUMANS)
    {
      self->client->pers.classSelection = PCL_HUMAN;
      self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
      self->client->pers.humanItemSelection = WP_MACHINEGUN;
      G_PushSpawnQueue(&level.humanSpawnQueue, clientNum);
    }
    else if (teamnum == PTE_ALIENS)
    {
      //ROTAX
      if (g_ambush.integer == 1)
      {
        if (ROTACAK_ambush_rebuild_time_temp < level.time && ((level.time - level.startTime) > (g_ambush_sec_to_start.integer * 1000)))
        {
          srand(trap_Milliseconds());

          if (ROTACAK_ambush_stage == 1) //adv granger
          {
            self->client->pers.classSelection = PCL_ALIEN_BUILDER0_UPG;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_BUILDER0_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 2) //dretch
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL0;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL0;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 3) //basilisk
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL1;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL1;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 4) //adv basilisk
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL1_UPG;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL1_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 5) //marauder
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL2;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL2;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 6) //adv marauder
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL2_UPG;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL2_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 7) //dragon
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL3;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL3;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 8) //adv dragon
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL3_UPG;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL3_UPG;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
          else if (ROTACAK_ambush_stage == 9) //tyrant
          {
            self->client->pers.classSelection = PCL_ALIEN_LEVEL4;
            self->client->ps.stats[STAT_PCLASS] = PCL_ALIEN_LEVEL4;
            G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
          }
        }
      }
      else
      {
        if (level.slowdownTime < level.time)
        {
          self->client->pers.classSelection = PCL_HUMAN;
          self->client->ps.stats[STAT_PCLASS] = PCL_HUMAN;
          self->client->pers.humanItemSelection = WP_BOMB;
          G_PushSpawnQueue(&level.alienSpawnQueue, clientNum);
        }
        else
        {

        }
      }
    }
  }
}

qboolean
botAimAtTarget(gentity_t * self, gentity_t * target)
{
  vec3_t dirToTarget, angleToTarget;
  vec3_t top =
  { 0, 0, 0 };
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

qboolean
botTargetInRange2(gentity_t * self, gentity_t * target)
{
  return qfalse;
}

qboolean
botTargetInRange(gentity_t * self, gentity_t * target)
{
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
  {
    return qfalse;
  }

  if (!self->client)
    return qfalse;

  if (!target->client)
    return qfalse;
  if (target->health <= 0)
    return qfalse;
  if (target->client->ps.stats[STAT_HEALTH] <= 0)
    return qfalse;
  if (target->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
    return qfalse;

  //To prevent stop following path when isnt need.
  /*if (target->client->ps.origin[2] - self->client->ps.origin[2] >= 50 && self->botCommand == BOT_FOLLOW_PATH)
   return qfalse;*/

  trap_Trace(&trace, muzzle, NULL, NULL, target->s.pos.trBase, self->s.number, MASK_SHOT);
  traceEnt = &g_entities[trace.entityNum];

  //check our target is in LOS
  if (!(traceEnt == target))
    return qfalse;

  //Are we on the same level?
  if (!g_survival.integer)
  {
    if (self->client->ps.origin[2] - target->client->ps.origin[2] < -30 && (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS))
    {
      self->client->pers.cmd.upmove = 30;
      self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
      return qfalse;
    }

    if (self->client->ps.origin[2] - target->client->ps.origin[2] < -100 && (self->client->ps.stats[STAT_PTEAM] == PTE_ALIENS))
    {
      self->client->pers.cmd.upmove = 30;
      self->client->ps.stats[STAT_STAMINA] = MAX_STAMINA;
      return qfalse;
    }
  }
  return qtrue;
}

qboolean
WallInFront(gentity_t * self)
{
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end;
  vec3_t spawn_angles;
  vec3_t top =
  { 0, 0, 0 };
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
  if (distance < 90)
  {
    return qtrue;
  }
  return qfalse;
}

void
selectBetterWay(gentity_t * self)
{
  vec3_t dirToTarget, angleToTarget, forward, right, up, muzzle, end, tempangle;
  vec3_t top =
  { 0, 0, 0 };
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

  if (distance1 > distance2)
  {
    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 60);
  }
  else if (distance2 > distance3)
  {
    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 120);
  }
  else
  {
    self->client->ps.delta_angles[1] = ANGLE2SHORT(self->client->ps.delta_angles[1] - 180);
  }
}

int
botFindClosestEnemy(gentity_t * self, qboolean includeTeam)
{
  // return enemy entity index, or -1
  int vectorRange = MGTURRET_RANGE * 5;
  int i;
  int total_entities;
  int entityList[MAX_GENTITIES];
  vec3_t range;
  vec3_t mins, maxs;
  gentity_t *target;

  int currentNodeType = -1;
  int nextNodeType = -1;
  int lastNodeType = -1;

  if (level.numHumanSpawns < 1)
  {
    //Gonna try to chase enemys in long distances.
    vectorRange = MGTURRET_RANGE * 10;
  }
  if (self->botCommand == BOT_FOLLOW_PATH)
  {
    currentNodeType = nodes[self->bs.currentNode].type;
    nextNodeType = nodes[self->bs.nextNode].type;
    lastNodeType = nodes[self->bs.lastNode].type;

    vectorRange = MGTURRET_RANGE * 1.3;
    if (currentNodeType == NODE_JUMP || nextNodeType == NODE_JUMP || lastNodeType == NODE_JUMP)
      vectorRange = MGTURRET_RANGE / 3;
  }

  VectorSet(range, vectorRange, vectorRange, vectorRange);
  VectorAdd(self->client->ps.origin, range, maxs);
  VectorSubtract(self->client->ps.origin, range, mins);

  total_entities = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);

  // check list for enemies
  for(i = 0;i < total_entities;i++)
  {
    target = &g_entities[entityList[i]];

    if (target == self)
      continue;
    if (!target->client)
      continue;
    if (target->client->ps.stats[STAT_PTEAM] == self->client->ps.stats[STAT_PTEAM])
      continue;

    if (botTargetInRange(self, target))
    {
      return entityList[i];
    }

  }

  if (includeTeam)
  {
    // check list for enemies in team
    for(i = 0;i < total_entities;i++)
    {
      target = &g_entities[entityList[i]];

      if (target->client && self != target && target->client->ps.stats[STAT_PTEAM] == self->client->ps.stats[STAT_PTEAM])
      {
        if (botTargetInRange(self, target))
        {
          return entityList[i];
        }
      }
    }
  }

  return -1;
}

// really an int? what if it's too long?

int
botGetDistanceBetweenPlayer(gentity_t * self, gentity_t * player)
{
  return Distance(self->s.pos.trBase, player->s.pos.trBase);
}

qboolean
botShootIfTargetInRange(gentity_t * self, gentity_t * target)
{
  int nahoda = 0;
  botAimAtTarget(self, self->botEnemy);
  srand(trap_Milliseconds());
  nahoda = (int) (((double) rand() / ((double) (RAND_MAX) + (double) (1))) * 20);
  self->client->pers.cmd.buttons = 0;
  if (self->client->ps.stats[STAT_PTEAM] == PTE_HUMANS) //Human target buildable
  {
    if (self->client->ps.weapon == WP_FLAMER)
    {
      if (Distance(self->s.pos.trBase, target->s.pos.trBase) < 200)
        self->client->pers.cmd.buttons |= BUTTON_ATTACK;
    }
    else if (self->client->ps.weapon == WP_LUCIFER_CANNON)
    {
      self->client->pers.cmd.buttons |= BUTTON_ATTACK2;
    }
    else
    {
      self->client->pers.cmd.buttons |= BUTTON_ATTACK;
    }
  }
  else
  {
    self->client->pers.cmd.buttons |= BUTTON_ATTACK;
  }
  return qtrue;
}
void botWalk(gentity_t *self, int speed)
{
  char validSpeed;

  validSpeed = ClampChar(speed);

  self->client->pers.cmd.forwardmove = validSpeed;
  if(speed <= 64)
  {

    self->client->pers.cmd.buttons |= BUTTON_WALKING;
  }
  else
  {
    self->client->pers.cmd.buttons &= ~BUTTON_WALKING;
  }
}

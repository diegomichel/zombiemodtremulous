/*
 ===========================================================================
 Copyright (C) 1999-2005 Id Software, Inc.
 Copyright (C) 2000-2006 Tim Angus

 This file is part of Tremulous.

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

// g_utils.c -- misc utility functions for game module

#include "g_local.h"

typedef struct
{
  char oldShader[MAX_QPATH];
  char newShader[MAX_QPATH];
  float timeOffset;
} shaderRemap_t;

#define MAX_SHADER_REMAPS 128
#define MAX_VALUE 1000
#define MAX_SPAWN_POINTS  128

int remapCount = 0;
shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];

void
AddRemap(const char *oldShader, const char *newShader, float timeOffset)
{
  int i;

  for(i = 0;i < remapCount;i++)
  {
    if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0)
    {
      // found it, just update this one
      strcpy(remappedShaders[i].newShader, newShader);
      remappedShaders[i].timeOffset = timeOffset;
      return;
    }
  }

  if (remapCount < MAX_SHADER_REMAPS)
  {
    strcpy(remappedShaders[remapCount].newShader, newShader);
    strcpy(remappedShaders[remapCount].oldShader, oldShader);
    remappedShaders[remapCount].timeOffset = timeOffset;
    remapCount++;
  }
}

const char *
BuildShaderStateConfig(void)
{
  static char buff[MAX_STRING_CHARS * 4];
  char out[(MAX_QPATH * 2) + 5];
  int i;

  memset(buff, 0, MAX_STRING_CHARS);

  for(i = 0;i < remapCount;i++)
  {
    Com_sprintf(out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader, remappedShaders[i].newShader, remappedShaders[i].timeOffset);
    Q_strcat(buff, sizeof(buff), out);
  }
  return buff;
}

/*
 =========================================================================

 model / sound configstring indexes

 =========================================================================
 */

/*
 ================
 G_FindConfigstringIndex

 ================
 */
int
G_FindConfigstringIndex(char *name, int start, int max, qboolean create)
{
  int i;
  char s[MAX_STRING_CHARS];

  if (!name || !name[0])
    return 0;

  for(i = 1;i < max;i++)
  {
    trap_GetConfigstring(start + i, s, sizeof(s));
    if (!s[0])
      break;

    if (!strcmp(s, name))
      return i;
  }

  if (!create)
    return 0;

  if (i == max)
    G_Error("G_FindConfigstringIndex: overflow");

  trap_SetConfigstring(start + i, name);

  return i;
}

//TA: added ParticleSystemIndex

int
G_ParticleSystemIndex(char *name)
{
  return G_FindConfigstringIndex(name, CS_PARTICLE_SYSTEMS, MAX_GAME_PARTICLE_SYSTEMS, qtrue);
}

//TA: added ShaderIndex

int
G_ShaderIndex(char *name)
{
  return G_FindConfigstringIndex(name, CS_SHADERS, MAX_GAME_SHADERS, qtrue);
}

int
G_ModelIndex(char *name)
{
  return G_FindConfigstringIndex(name, CS_MODELS, MAX_MODELS, qtrue);
}

int
G_SoundIndex(char *name)
{
  return G_FindConfigstringIndex(name, CS_SOUNDS, MAX_SOUNDS, qtrue);
}

//=====================================================================

/*
 ================
 G_TeamCommand

 Broadcasts a command to only a specific team
 ================
 */
void
G_TeamCommand(pTeam_t team, char *cmd)
{
  int i;

  for(i = 0;i < level.maxclients;i++)
  {
    if (level.clients[i].pers.connected == CON_CONNECTED)
    {
      if (level.clients[i].pers.teamSelection == team || (level.clients[i].pers.teamSelection == PTE_NONE && G_admin_permission(&g_entities[i],
          ADMF_SPEC_ALLCHAT)))
        trap_SendServerCommand(i, cmd);
    }
  }
}

void G_ProjectSource(vec3_t point, vec3_t distance, vec3_t forward, vec3_t right, vec3_t result)
{
        result[0] = point[0] + forward[0] * distance[0] + right[0] * distance[1];
        result[1] = point[1] + forward[1] * distance[0] + right[1] * distance[1];
        result[2] = point[2] + forward[2] * distance[0] + right[2] * distance[1] + distance[2];
}


/*
 =============
 G_Find

 Searches all active entities for the next one that holds
 the matching string at fieldofs (use the FOFS() macro) in the structure.

 Searches beginning at the entity after from, or the beginning if NULL
 NULL will be returned if the end of the list is reached.

 =============
 */
gentity_t *
G_Find(gentity_t *from, int fieldofs, const char *match)
{
  char *s;

  if (!from)
    from = g_entities;
  else
    from++;

  for(;from < &g_entities[level.num_entities];from++)
  {
    if (!from->inuse)
      continue;
    s = *(char **) ((byte *) from + fieldofs);

    if (!s)
      continue;

    if (!Q_stricmp(s, match))
      return from;
  }

  return NULL;
}

/*
 =============
 G_PickTarget

 Selects a random entity from among the targets
 =============
 */
#define MAXCHOICES  32

gentity_t *
G_PickTarget(char *targetname)
{
  gentity_t *ent = NULL;
  int num_choices = 0;
  gentity_t * choice[MAXCHOICES];

  if (!targetname)
  {
    G_Printf("G_PickTarget called with NULL targetname\n");
    return NULL;
  }

  while(1)
  {
    ent = G_Find(ent, FOFS(targetname), targetname);

    if (!ent)
      break;

    choice[num_choices++] = ent;

    if (num_choices == MAXCHOICES)
      break;
  }

  if (!num_choices)
  {
    G_Printf("G_PickTarget: target %s not found\n", targetname);
    return NULL;
  }

  return choice[rand() % num_choices];
}

/*
 ==============================
 G_UseTargets

 "activator" should be set to the entity that initiated the firing.

 Search for (string)targetname in all entities that
 match (string)self.target and call their .use function

 ==============================
 */
void
G_UseTargets(gentity_t *ent, gentity_t *activator)
{
  gentity_t *t;

  if (!ent)
    return;

  if (ent->targetShaderName && ent->targetShaderNewName)
  {
    float f = level.time * 0.001;
    AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
    trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
  }

  if (!ent->target)
    return;

  t = NULL;
  while((t = G_Find(t, FOFS(targetname), ent->target)) != NULL)
  {
    if (t == ent)
      G_Printf("WARNING: Entity used itself.\n");
    else
    {
      if (t->use)
        t->use(t, ent, activator);
    }

    if (!ent->inuse)
    {
      G_Printf("entity was removed while using targets\n");
      return;
    }
  }
}

/*
 =============
 TempVector

 This is just a convenience function
 for making temporary vectors for function calls
 =============
 */
float *
tv(float x, float y, float z)
{
  static int index;
  static vec3_t vecs[8];
  float *v;

  // use an array so that multiple tempvectors won't collide
  // for a while
  v = vecs[index];
  index = (index + 1) & 7;

  v[0] = x;
  v[1] = y;
  v[2] = z;

  return v;
}

/*
 =============
 VectorToString

 This is just a convenience function
 for printing vectors
 =============
 */
char *
vtos(const vec3_t v)
{
  static int index;
  static char str[8][32];
  char *s;

  // use an array so that multiple vtos won't collide
  s = str[index];
  index = (index + 1) & 7;

  Com_sprintf(s, 32, "(%i %i %i)", (int) v[0], (int) v[1], (int) v[2]);

  return s;
}

/*
 ===============
 G_SetMovedir

 The editor only specifies a single value for angles (yaw),
 but we have special constants to generate an up or down direction.
 Angles will be cleared, because it is being used to represent a direction
 instead of an orientation.
 ===============
 */
void
G_SetMovedir(vec3_t angles, vec3_t movedir)
{
  static vec3_t VEC_UP =
  { 0, -1, 0 };
  static vec3_t MOVEDIR_UP =
  { 0, 0, 1 };
  static vec3_t VEC_DOWN =
  { 0, -2, 0 };
  static vec3_t MOVEDIR_DOWN =
  { 0, 0, -1 };

  if (VectorCompare(angles, VEC_UP))
    VectorCopy(MOVEDIR_UP, movedir);
  else if (VectorCompare(angles, VEC_DOWN))
    VectorCopy(MOVEDIR_DOWN, movedir);
  else
    AngleVectors(angles, movedir, NULL, NULL);

  VectorClear(angles);
}

float
vectoyaw(const vec3_t vec)
{
  float yaw;

  if (vec[YAW] == 0 && vec[PITCH] == 0)
  {
    yaw = 0;
  }
  else
  {
    if (vec[PITCH])
      yaw = (atan2(vec[YAW], vec[PITCH]) * 180 / M_PI);
    else if (vec[YAW] > 0)
      yaw = 90;
    else
      yaw = 270;

    if (yaw < 0)
      yaw += 360;
  }

  return yaw;
}

void
G_InitGentity(gentity_t *e)
{
  e->inuse = qtrue;
  e->classname = "noclass";
  e->s.number = e - g_entities;
  e->r.ownerNum = ENTITYNUM_NONE;
}

/*
 =================
 G_Spawn

 Either finds a free entity, or allocates a new one.

 The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
 never be used by anything else.

 Try to avoid reusing an entity that was recently freed, because it
 can cause the client to think the entity morphed into something else
 instead of being removed and recreated, which can cause interpolated
 angles and bad trails.
 =================
 */
gentity_t *
G_Spawn(void)
{
  int i, force;
  gentity_t *e;

  e = NULL; // shut up warning
  i = 0; // shut up warning

  for(force = 0;force < 2;force++)
  {
    // if we go through all entities and can't find one to free,
    // override the normal minimum times before use
    e = &g_entities[MAX_CLIENTS];

    for(i = MAX_CLIENTS;i < level.num_entities;i++, e++)
    {
      if (e->inuse)
        continue;

      // the first couple seconds of server time can involve a lot of
      // freeing and allocating, so relax the replacement policy
      if (!force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000)
        continue;

      // reuse this slot
      G_InitGentity(e);
      return e;
    }

    if (i != MAX_GENTITIES)
      break;
  }

  if (i == ENTITYNUM_MAX_NORMAL)
  {
    for(i = 0;i < MAX_GENTITIES;i++)
      G_Printf("%4i: %s\n", i, g_entities[i].classname);

    G_Error("G_Spawn: no free entities");
  }

  // open up a new slot
  level.num_entities++;

  // let the server system know that there are more entities
  trap_LocateGameData(level.gentities, level.num_entities, sizeof(gentity_t), &level.clients[0].ps, sizeof(level.clients[0]));

  G_InitGentity(e);
  return e;
}

/*
 =================
 G_EntitiesFree
 =================
 */
qboolean
G_EntitiesFree(void)
{
  int i;
  gentity_t *e;

  e = &g_entities[MAX_CLIENTS];

  for(i = MAX_CLIENTS;i < level.num_entities;i++, e++)
  {
    if (e->inuse)
      continue;

    // slot available
    return qtrue;
  }

  return qfalse;
}

/*
 =================
 G_FreeEntity

 Marks the entity as free
 =================
 */
void
G_FreeEntity(gentity_t *ent)
{
  if (g_ctn.integer > 0 && ent && ent->builder && ent->s.eType == ET_BUILDABLE && ent->builder->client && ent->builder->ctn_build_count > 0)
  {
    ent->builder->ctn_build_count--;
  }
  trap_UnlinkEntity(ent); // unlink from world

  if (ent->neverFree)
    return;

  memset(ent, 0, sizeof(*ent));
  ent->classname = "freent";
  ent->freetime = level.time;
  ent->inuse = qfalse;
}

/*
 =================
 G_TempEntity

 Spawns an event entity that will be auto-removed
 The origin will be snapped to save net bandwidth, so care
 must be taken if the origin is right on a surface (snap towards start vector first)
 =================
 */
gentity_t *
G_TempEntity(vec3_t origin, int event)
{
  gentity_t *e;
  vec3_t snapped;

  e = G_Spawn();
  e->s.eType = ET_EVENTS + event;

  e->classname = "tempEntity";
  e->eventTime = level.time;
  e->freeAfterEvent = qtrue;

  VectorCopy(origin, snapped);
  SnapVector(snapped); // save network bandwidth
  G_SetOrigin(e, snapped);

  // find cluster for PVS
  trap_LinkEntity(e);

  return e;
}

/*
 ==============================================================================

 Kill box

 ==============================================================================
 */

/*
 =================
 G_KillBox

 Kills all entities that would touch the proposed new positioning
 of ent.  Ent should be unlinked before calling this!
 =================
 */
void
G_KillBox(gentity_t *ent)
{
  int i, num;
  int touch[MAX_GENTITIES];
  gentity_t *hit;
  vec3_t mins, maxs;

  VectorAdd(ent->client->ps.origin, ent->r.mins, mins);
  VectorAdd(ent->client->ps.origin, ent->r.maxs, maxs);
  num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);

  for(i = 0;i < num;i++)
  {
    hit = &g_entities[touch[i]];

    if (!hit->client)
      continue;

    //TA: impossible to telefrag self
    if (ent == hit)
      continue;

    // nail it
    G_Damage(hit, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
  }

}

//==============================================================================

/*
 ===============
 G_AddPredictableEvent

 Use for non-pmove events that would also be predicted on the
 client side: jumppads and item pickups
 Adds an event+parm and twiddles the event counter
 ===============
 */
void
G_AddPredictableEvent(gentity_t *ent, int event, int eventParm)
{
  if (!ent->client)
    return;

  BG_AddPredictableEventToPlayerstate(event, eventParm, &ent->client->ps);
}

/*
 ===============
 G_AddEvent

 Adds an event+parm and twiddles the event counter
 ===============
 */
void
G_AddEvent(gentity_t *ent, int event, int eventParm)
{
  int bits;

  if (!event)
  {
    G_Printf("G_AddEvent: zero event added for entity %i\n", ent->s.number);
    return;
  }

  // eventParm is converted to uint8_t (0 - 255) in msg.c
  if (eventParm & ~0xFF)
  {
    G_Printf(S_COLOR_YELLOW "WARNING: G_AddEvent: event %d "
    " eventParm uint8_t overflow (given %d)\n", event, eventParm);
  }

  // clients need to add the event in playerState_t instead of entityState_t
  if (ent->client)
  {
    bits = ent->client->ps.externalEvent & EV_EVENT_BITS;
    bits = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
    ent->client->ps.externalEvent = event | bits;
    ent->client->ps.externalEventParm = eventParm;
    ent->client->ps.externalEventTime = level.time;
  }
  else
  {
    bits = ent->s.event & EV_EVENT_BITS;
    bits = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
    ent->s.event = event | bits;
    ent->s.eventParm = eventParm;
  }

  ent->eventTime = level.time;
}

/*
 ===============
 G_BroadcastEvent

 Sends an event to every client
 ===============
 */
void
G_BroadcastEvent(int event, int eventParm)
{
  gentity_t *ent;

  ent = G_TempEntity(vec3_origin, event);
  ent->s.eventParm = eventParm;
  ent->r.svFlags = SVF_BROADCAST; // send to everyone
}

/*
 =============
 G_Sound
 =============
 */
void
G_Sound(gentity_t *ent, int channel, int soundIndex)
{
  gentity_t *te;

  te = G_TempEntity(ent->r.currentOrigin, EV_GENERAL_SOUND);
  te->s.eventParm = soundIndex;
}

/*
 =============
 G_ClientIsLagging
 =============
 */
qboolean
G_ClientIsLagging(gclient_t *client)
{
  if (client)
  {
    if (client->ps.ping >= 999)
      return qtrue;
    else
      return qfalse;
  }

  return qfalse; //is a non-existant client lagging? woooo zen
}

//==============================================================================

/*
 ================
 G_SetOrigin

 Sets the pos trajectory for a fixed position
 ================
 */
void
G_SetOrigin(gentity_t *ent, vec3_t origin)
{
  VectorCopy(origin, ent->s.pos.trBase);
  ent->s.pos.trType = TR_STATIONARY;
  ent->s.pos.trTime = 0;
  ent->s.pos.trDuration = 0;
  VectorClear(ent->s.pos.trDelta);

  VectorCopy(origin, ent->r.currentOrigin);
  VectorCopy(origin, ent->s.origin); //TA: if shit breaks - blame this line
}

//TA: from quakestyle.telefragged.com
// (NOBODY): Code helper function
//

gentity_t
*G_FindRadius(gentity_t * from, const vec3_t org, float rad)
{
  vec3_t eorg;
  int j;

  if (!from)
    from = g_entities;
  else
    from++;

  for(;from < &g_entities[level.num_entities];from++)
  {
    if (!from->inuse)
      continue;

    for(j = 0;j < 3;j++)
      eorg[j] = org[j] - (from->r.currentOrigin[j] + (from->r.mins[j] + from->r.maxs[j]) * 0.5);

    if (VectorLength(eorg) > rad)
      continue;

    return from;
  }

  return NULL;
}

/*
 ===============
 G_Visible

 Test for a LOS between two entities
 ===============
 */
qboolean
G_Visible(gentity_t *ent1, gentity_t *ent2)
{
  trace_t trace;

  trap_Trace(&trace, ent1->s.pos.trBase, NULL, NULL, ent2->s.pos.trBase, ent1->s.number, MASK_SHOT);

  if (trace.contents & CONTENTS_SOLID)
    return qfalse;

  return qtrue;
}

/*
 ===============
 G_ClosestEnt

 Test a list of entities for the closest to a particular point
 ===============
 */
gentity_t *
G_ClosestEnt(vec3_t origin, gentity_t **entities, int numEntities)
{
  int i;
  float nd, d = 1000000.0f;
  gentity_t *closestEnt = NULL;

  for(i = 0;i < numEntities;i++)
  {
    gentity_t *ent = entities[i];

    nd = DistanceSquared(origin, ent->s.origin);
    if (i == 0 || nd < d)
    {
      d = nd;
      closestEnt = ent;
    }
  }

  return closestEnt;
}

/*
 ===============
 G_TriggerMenu

 Trigger a menu on some client
 ===============
 */
void
G_TriggerMenu(int clientNum, dynMenu_t menu)
{
  char buffer[32];

  Com_sprintf(buffer, 32, "servermenu %d", menu);
  trap_SendServerCommand(clientNum, buffer);
}

/*
 ===============
 G_CloseMenus

 Close all open menus on some client
 ===============
 */
void
G_CloseMenus(int clientNum)
{
  char buffer[32];

  Com_sprintf(buffer, 32, "serverclosemenus");
  trap_SendServerCommand(clientNum, buffer);
}

void
G_KillStructuresSurvival()
{
  gentity_t *ent;
  int i;

  /*if (level.numNodes != 0) {
   if (level.numNodes <= 2)
   return;

   level.numNodes = 0;
   }*/

  for(i = 1, ent = g_entities + i;i < level.num_entities;i++, ent++)
  {

    if (ent->s.eType != ET_BUILDABLE)
      continue;
    if (ent->health < 0)
      continue;
    //if (ent->survivalStage != level.survivalStage)
    //  continue;
    if(ent->biteam == BIT_ALIENS)
      continue;

    if (ent->s.modelindex == BA_H_SPAWN && ent->biteam == BIT_ALIENS)
      continue;

    G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);

  }
}

void
G_BuyAll(gentity_t *ent)
{
  int maxAmmo, maxClips;

  level.survivalmoney += MGCLIP_PRICE;

  BG_AddUpgradeToInventory(UP_LIGHTARMOUR, ent->client->ps.stats);
  BG_AddUpgradeToInventory(UP_HELMET, ent->client->ps.stats);
  BG_AddUpgradeToInventory(UP_MEDKIT, ent->client->ps.stats);

  BG_AddWeaponToInventory(WP_MACHINEGUN, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_MACHINEGUN, &maxAmmo, &maxClips);

  if (500 > ent->client->pers.credit)
  {
    trap_SendServerCommand(ent - g_entities, "print \"^1Inventory: Rifle, Medkit, Helmet and Light Armour\n\"");
    return;
  }
  BG_AddWeaponToInventory(WP_HBUILD2, ent->client->ps.stats);
  BG_AddWeaponToInventory(WP_SHOTGUN, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_SHOTGUN, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_SHOTGUN, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  BG_AddWeaponToInventory(WP_LAS_GUN, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_LAS_GUN, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_LAS_GUN, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  BG_AddWeaponToInventory(WP_MASS_DRIVER, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_MASS_DRIVER, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_MASS_DRIVER, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  if (1000 > ent->client->pers.credit)
  {
    trap_SendServerCommand(ent - g_entities, "print \"^1Inventory: Rifle, Shotgun, Lasgun, MassDriver, Medkit, Helmet and Light Armour\n\"");
    return;
  }

  BG_AddWeaponToInventory(WP_CHAINGUN, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_CHAINGUN, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_CHAINGUN, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  BG_AddWeaponToInventory(WP_PULSE_RIFLE, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_PULSE_RIFLE, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_PULSE_RIFLE, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  BG_AddWeaponToInventory(WP_FLAMER, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_FLAMER, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_FLAMER, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  if (1500 > ent->client->pers.credit)
  {
    trap_SendServerCommand(ent - g_entities, "print \"^1Inventory: Everything Except the Lucifer Cannon\n\"");
    return;
  }
  BG_AddWeaponToInventory(WP_LUCIFER_CANNON, ent->client->ps.stats);
  BG_FindAmmoForWeapon(WP_LUCIFER_CANNON, &maxAmmo, &maxClips);
  BG_PackAmmoArray(WP_LUCIFER_CANNON, ent->client->ps.ammo, ent->client->ps.powerups, maxAmmo, maxClips);

  //G_GiveClientMaxAmmo( ent, qtrue );
  G_ForceWeaponChange(ent, WP_SHOTGUN);
  trap_SendServerCommand(ent - g_entities, "print \"^1Inventory: Everything\n\"");
}

int
convertGridToWorld(int gridpos)
{
  return ((-(BLOCKSIZE / 2) + gridpos) * BLOCKSIZE) + (BLOCKSIZE / 2);
}

int
convertWorldToGrid(float worldpos)
{
  return ((BLOCKSIZE / 2) + (worldpos / BLOCKSIZE));
}

int
min(int value1, int value2)
{
  if (value1 > value2)
    return value2;
  return value1;
}
void
cleanvis()
{
  int x, y;
  for(x = 0;x < 100;x++)
    for(y = 0;y < 100;y++)
      level.vis[x][y] = 1;
}
void
cleanpath()
{
  int x, y;
  for(x = 0;x < 100;x++)
  {
    for(y = 0;y < 100;y++)
    {
      level.path[x][y] = 0;
    }

    level.pathx[x] = -1;
    level.pathy[x] = -1;
  }
}
int
findway(int pasos, int x, int y, int fx, int fy)
{
  int bestPath;

  if (x > GRIDSIZE || y > GRIDSIZE || x < 0 || y < 0)
    return MAX_VALUE;
  if ((x == fx && y == fy) || pasos > level.maxpasos)
  {
    return pasos;
  }

  if (pasos >= 1)
  {
    if (level.vis[x][y] == 0 || level.grid[x][y] == 0 || level.path[x][y] == 1)
    {
      //G_LogPrintf(va("%d",level.path[x][y]));
      return MAX_VALUE;
    }
    level.vis[x][y] = 0;

    bestPath = findway(pasos + 1, x + 1, y, fx, fy);
    bestPath = min(bestPath, findway(pasos + 1, x - 1, y, fx, fy));
    bestPath = min(bestPath, findway(pasos + 1, x, y - 1, fx, fy));
    bestPath = min(bestPath, findway(pasos + 1, x, y + 1, fx, fy));

    //    //4 Esquinas
    //    bestPath = min(bestPath, findway(pasos + 1, x - 1, y - 1, fx, fy));
    //    bestPath = min(bestPath, findway(pasos + 1, x + 1, y - 1, fx, fy));
    //
    //    bestPath = min(bestPath, findway(pasos + 1, x + 1, y + 1, fx, fy));
    //    bestPath = min(bestPath, findway(pasos + 1, x - 1, y + 1, fx, fy));
    //G_LogPrintf(va("bestpath: %d", bestPath));

    return bestPath;
  }

  if (pasos == 0)
  {
    level.RIGHT = findway(pasos + 1, x + 1, y, fx, fy);
    cleanvis();
    level.LEFT = findway(pasos + 1, x - 1, y, fx, fy);
    cleanvis();
    level.UP = findway(pasos + 1, x, y - 1, fx, fy);
    cleanvis();
    level.DOWN = findway(pasos + 1, x, y + 1, fx, fy);
    cleanvis();

    //    level.UPRIGHT = findway(pasos + 1, x + 1, y - 1, fx, fy);
    //    cleanvis();
    //    level.DOWNRIGHT = findway(pasos + 1, x + 1, y + 1, fx, fy);
    //    cleanvis();
    //
    //    level.UPLEFT = findway(pasos + 1, x - 1, y - 1, fx, fy);
    //    cleanvis();
    //    level.DOWNLEFT = findway(pasos + 1, x - 1, y + 1, fx, fy);
    //    cleanvis();
    level.UPRIGHT = level.UPLEFT = level.DOWNLEFT = level.DOWNRIGHT = MAX_VALUE;
  }
  if (level.LEFT < MAX_VALUE || level.RIGHT < MAX_VALUE || level.UP < MAX_VALUE || level.DOWN < MAX_VALUE || level.UPRIGHT < MAX_VALUE || level.DOWNRIGHT
      < MAX_VALUE || level.UPLEFT < MAX_VALUE || level.DOWNLEFT < MAX_VALUE)
    return qtrue;

  //G_LogPrintf("fuck lolz");
  return qfalse;

}

int
Distance2d(vec3_t from, vec3_t to)
{
  vec3_t shit1, shit2; // If calling using ps.origin param it get modified how gay
  VectorCopy(from,shit1);
  VectorCopy(to,shit2);
  //from[2] = to[2] = 0; QVM BUG: try call this using ->ps.origin ps origin gets modified.
  shit1[2] = shit2[2];
  return Distance(shit1, shit2);
}

void
kill_aliens_withoutenemy()
{
  int i;
  gentity_t *ent;
  int counter;

  for(i = 0;i < level.numConnectedClients;i++)
  {

    //FIX ME:PRODUCTION
    //if(counter > 15 && !level.theCamper) return;

    ent = &g_entities[level.sortedClients[i]];

    if (ent->health > 0 && ent->client->ps.stats[STAT_PTEAM] == PTE_ALIENS)
    {
      if (1)//!ent->botEnemy)
      {
        counter++;
        //ent->health = 0;
        G_Damage(ent, NULL, NULL, NULL, NULL, 10000, 0, MOD_SUICIDE);
        ent->botpathmode = qtrue;
        ent->botlostpath = qfalse;
      }
    }
  }
}

void
find_path(gentity_t * ent)
{
}

qboolean
canSeeNextNode(vec3_t playerpos, vec3_t nodepos, gentity_t *ent)
{
  vec3_t point_a, point_b;
  trace_t tr;
  vec3_t playerMins =
  { -15, -15, -24 };
  vec3_t playerMaxs =
  { 15, 15, 32 };

  //This is because some weired bug on ps.origin
  VectorCopy(playerpos,point_a);
  VectorCopy(nodepos,point_b);

  point_b[2] = point_a[2] = point_a[2] + 10;

  trap_Trace(&tr, point_a, playerMins, playerMaxs, point_b, -1, MASK_SOLID);

  if (tr.fraction < 1.0)
  {
    trap_SendServerCommand(-1, va("print\"CANT SEE: %f %f %f -> %f %f %f\n\"", point_a[0], point_a[1], point_a[2], point_b[0], point_b[1], point_b[2]));
    return qfalse;
  }

  if (tr.contents & CONTENTS_SOLID)
  {
    trap_SendServerCommand(-1, va("print\"CONTENT_SOLID %f %f %f -> %f %f %f\"", point_a[0], point_a[1], point_a[2], point_b[0], point_b[1], point_b[2]));
    return qfalse;
  }
  return qtrue;
}

qboolean
canSeeNextNodeSpecialCase(vec3_t playerpos, vec3_t nodepos, gentity_t *ent)
{
  trace_t tr, traceMoved;
  if (canSeeNextNode(playerpos, nodepos, ent))
  {
    return qtrue;
  }
    return qfalse;
}

qboolean
findNodeCanSee(gentity_t * self)
{
  vec3_t nextnode;
  int i = GRIDSIZE - 1;
  for(i = GRIDSIZE - 1;i >= 0;i--)
  {
    if (level.pathx[i] == -1 || level.pathy[i] == -1)
      continue;
    else
    {
      nextnode[0] = ((-(BLOCKSIZE / 2) + level.pathx[i]) * BLOCKSIZE);
      nextnode[1] = ((-(BLOCKSIZE / 2) + level.pathy[i]) * BLOCKSIZE);
      nextnode[2] = self->s.pos.trBase[2];
      if (canSeeNextNode(self->s.pos.trBase, nextnode, self))
      {
        VectorCopy(nextnode, self->nextnode);
        self->botnextpath = i + 1;
        return qtrue;
      }
    }
  }
  return qfalse;
}

qboolean
nodeOutOfRange(vec3_t node)
{
  int x, y;
  x = ((BLOCKSIZE / 2) + (node[0] / BLOCKSIZE));
  y = ((BLOCKSIZE / 2) + (node[1] / BLOCKSIZE));

  if (x <= 0 || x >= GRIDSIZE || y <= 0 || y >= GRIDSIZE)
  {
    return qtrue;
  }
  return qfalse;
}

qboolean
nextNode(gentity_t *self)
{
  vec3_t dirToTarget, angleToTarget, nextnode, goodnode;
  vec3_t top =
  { 0, 0, 0 };
  int vh = 0;
  int x, y;
  int moved = 0;

  x = ((BLOCKSIZE / 2) + (self->s.origin[0] / BLOCKSIZE));
  y = ((BLOCKSIZE / 2) + (self->s.origin[1] / BLOCKSIZE));

  self->timedropnodepath = level.time;
  if (self->botnextpath + 1 >= GRIDSIZE)
    return qfalse;

  if (level.pathx[self->botnextpath + 1] <= -1 || level.pathx[self->botnextpath + 1] <= -1)
    return qfalse;

  while((canSeeNextNode(self->s.pos.trBase, self->nextnode, self) || self->botnextpath == 0) && self->botnextpath < GRIDSIZE) //uf botnextpath = 0 then we are on the start.
  {
    nextnode[0] = convertGridToWorld(level.pathx[self->botnextpath + 1]);
    nextnode[1] = convertGridToWorld(level.pathx[self->botnextpath + 1]);
    nextnode[2] = self->s.pos.trBase[2];
    VectorCopy(self->nextnode, goodnode);
    VectorCopy(nextnode, self->nextnode);

    self->botnextpath++;
    trap_SendServerCommand(-1, va("print \"Incrasing botnextpath: %d\n\"", Distance2d(self->s.origin, self->nextnode)));

    moved++;
    self->timedropnodepath += 1000;
  }
  if (moved > 0)
  {
    if (nodeOutOfRange(self->nextnode))
    {
      VectorCopy(goodnode, self->nextnode);
    }
    return qtrue;
  }

  return qfalse;
}

qboolean
aimNode(gentity_t *self)
{
  vec3_t dirToTarget, angleToTarget;
  vec3_t top =
  { 0, 0, 0 };
  //self->nextnode[2] = self->s.pos.trBase[2];
  VectorAdd(self->s.pos.trBase, top, top); //Add a to b result in C
  VectorSubtract(self->nextnode, top, dirToTarget); //Substract b from a result in
  VectorNormalize(dirToTarget);
  vectoangles(dirToTarget, angleToTarget);
  self->client->ps.delta_angles[0] = ANGLE2SHORT(angleToTarget[0]);
  self->client->ps.delta_angles[1] = ANGLE2SHORT(angleToTarget[1]);
  self->client->ps.delta_angles[2] = ANGLE2SHORT(angleToTarget[2]);
  return qtrue;
}

void
botWalk(gentity_t *self)
{
  self->client->pers.cmd.forwardmove = 120;
  self->client->pers.cmd.buttons |= BUTTON_WALKING;
}

qboolean
visitedLastNode(gentity_t *self)
{
  if (self->botnextpath == 0)
    return qtrue;

  if (Distance2d(self->nextnode, self->s.origin) < (BLOCKSIZE))
  {
    self->botnextpath++;
    return qtrue;
  }
  return qfalse;
}

void
botStopWalk(gentity_t *self)
{
  self->client->pers.cmd.forwardmove = 0;
}

qboolean
botReachedDestination(gentity_t *self)
{
  if (level.pathx[self->botnextpath + 1] == -1 && level.pathy[self->botnextpath + 1] == -1 && Distance2d(self->nextnode, self->s.origin) < (BLOCKSIZE / 5))
  {
    trap_SendServerCommand(-1, va("print \"Distance to node: %d\n\"", Distance2d(self->s.origin, self->nextnode)));
    return qtrue;
  }
  return qfalse;
}

qboolean
botLost(gentity_t *self)
{
  if (self->botnextpath == 0)
    return qfalse;
  return !canSeeNextNode(self->s.origin, self->nextnode, self);
}

qboolean
canMakeWay(gentity_t *self)
{
  int cuadrado = 0;
  int scale = 1;
  VectorCopy(self->nextnode, self->lostnode);
  do
  {
    VectorCopy(self->lostnode, self->nextnode);
    cuadrado++;
    switch(cuadrado)
    {
      case 1:
        self->nextnode[1] += (BLOCKSIZE * scale);
        self->nextnode[0] -= (BLOCKSIZE * scale);
        break;
      case 2:
        self->nextnode[1] -= (BLOCKSIZE * scale);
        self->nextnode[0] += (BLOCKSIZE * scale);
        break;
      case 3:
        self->nextnode[1] += (BLOCKSIZE * scale);
        self->nextnode[0] += (BLOCKSIZE * scale);
        break;
      case 4:
        self->nextnode[1] -= (BLOCKSIZE * scale);
        self->nextnode[0] -= (BLOCKSIZE * scale);
        scale++;
        break;

      default:
        break;
    }
  }
  while(botLost(self) && cuadrado <= 16);

  if (!botLost(self))
  {
    return qtrue;
  }

  return qfalse;
}

qboolean
pointIsSolid(vec3_t point)
{
  trace_t tr;
  //trap_Trace(&tr, playerpos, NULL, NULL, nodepos, -1, MASK_SHOT);
  trap_Trace(&tr, point, NULL, NULL, point, -1, MASK_SHOT);

  /*if (tr.fraction < 1.0)
   return qfalse;

   if (tr.contents & CONTENTS_SOLID) {
   return qfalse;
   }*/

  if (tr.fraction < 1.0)
  {
    trap_SendServerCommand(-1, va("print \"This point is inside of a wall: %d\n\""));
    return qtrue;
  }
  return qfalse;
}
qboolean
pointBehindWall(gentity_t *ent, vec3_t point)
{
  trace_t tr;
  vec3_t playerpos2d;

  //Using double size on X and Y to prevent stuck bots.
  //Double size works very good :)
  vec3_t playerMins =
  { -30, -30, -24 };
  vec3_t playerMaxs =
  { 30, 30, 32 };

  VectorCopy(ent->client->ps.origin, playerpos2d);
  point[2] = playerpos2d[2];

  trap_Trace(&tr, playerpos2d, playerMins, playerMaxs, point, ent->s.number, MASK_SOLID);

  if (tr.fraction < 1.0)
    return qtrue;
  if (tr.contents & CONTENTS_SOLID)
    return qtrue;
  return qfalse;
}
void
fillGrid(gentity_t *ent)
{
  int x, y;
  vec3_t point;

  if (ent->health < 1)
    return;
  if (ent->client->ps.stats[STAT_HEALTH] <= 0 || ent->client->sess.sessionTeam == TEAM_SPECTATOR)
    return;

  x = convertWorldToGrid(ent->s.origin[0]);
  y = convertWorldToGrid(ent->s.origin[1]);

  point[0] = convertGridToWorld(x);
  point[1] = convertGridToWorld(y);

  if (level.grid[x][y])
    return;
  if (x >= GRIDSIZE || y >= GRIDSIZE || x < 0 || y < 0)
    return;
  if (pointBehindWall(ent, point))
    return;

  level.grid[x][y] = 1;
}
void
spawnGridNode(gentity_t *ent, int x, int y)
{
  gentity_t *m;

  m = drawRedBall(ent, x, y);
}
qboolean
nextNodeVisible(gentity_t *ent)
{
  vec3_t realPoint;
  realPoint[0] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[0]));
  realPoint[1] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[1]));
  realPoint[2] = convertGridToWorld(convertWorldToGrid(ent->client->ps.origin[2]));
  return canSeeNextNode(realPoint, ent->nextnode, ent);
}
void
walkToNextNode(gentity_t *ent)
{
  int distance = Distance2d(ent->client->ps.origin, ent->nextnode);
  int xclientgrid = convertWorldToGrid(ent->client->ps.origin[0]);
  int yclientgrid = convertWorldToGrid(ent->client->ps.origin[1]);
  int xnodegrid = convertWorldToGrid(ent->nextnode[0]);
  int ynodegrid = convertWorldToGrid(ent->nextnode[1]);
  aimNode(ent);
  botWalk(ent);
  if (distance <= 20 && xclientgrid == xnodegrid && yclientgrid == ynodegrid)
  {
    ent->nextnodeset = qfalse;
    ent->client->pers.cmd.forwardmove = 0;
    G_LogPrintf(va("print\"%s: Reached node sir NODE: %f %f PPOS: %f %f.\n\"", ent->client->pers.netname, ent->nextnode[0], ent->nextnode[1],
        ent->client->ps.origin[0], ent->client->ps.origin[1]));
    return;
  }
  if (distance < BLOCKSIZE && distance > 10)
  {
    ent->client->pers.cmd.forwardmove = ent->client->pers.cmd.forwardmove - (ent->client->pers.cmd.forwardmove / (distance / 5));
    //10 == dist 15 == 40 speed and dont move.
  }
  if (distance <= 20)
  {
    G_LogPrintf(va("print \"%d != %d | %d != %d\n\"", xclientgrid, xnodegrid, yclientgrid, ynodegrid));
  }
  G_LogPrintf(va("print\"%s: Dist %d\n\"", ent->client->pers.netname, distance));
}

int
findNextNode(int pasos, int x, int y, int fx, int fy, gentity_t *ent)
{
  int bestPath;
  vec3_t currentNode;
  vec3_t posibleNode;

  if (x > GRIDSIZE || y > GRIDSIZE || x < 0 || y < 0)
  {
    G_LogPrintf(va("RETURN IN OUT OF GRID\n"));
    return MAX_VALUE;
  }

  if ((x == fx && y == fy) || pasos >= level.maxpasos)
  {
    G_LogPrintf(va("RETURN IN PASOS: %d xs %d %d  ys%d %d\n", pasos, x, fx, y, fy));
    return pasos;
  }

  if (pasos >= 1)
  {
    if (level.vis[x][y] == 0 || level.grid[x][y] == 0 || level.path[x][y] == 1)
    {
      G_LogPrintf(va("X: %d - %d Y: %d - %d GRID:%d VIS:%d PATH:%d \n", convertGridToWorld(x), x, convertGridToWorld(y), y, level.grid[x][y], level.vis[x][y],
          level.path[x][y]));
      return MAX_VALUE;
    }
    level.vis[x][y] = 0;

    currentNode[0] = convertGridToWorld(x);
    currentNode[1] = convertGridToWorld(y);

    currentNode[2] = ent->lastnode[2] = ent->client->ps.origin[2];

    if (!canSeeNextNodeSpecialCase(ent->lastnode, currentNode, ent))
    {
      G_LogPrintf(va("^4Cant See %f %f %f %f \n", currentNode[0], currentNode[1], ent->lastnode[0], ent->lastnode[1]));
      return MAX_VALUE;
    }

    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = findNextNode(pasos + 1, x + 1, y, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x - 1, y, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x, y - 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x, y + 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    //4 Esquinas

    bestPath = min(bestPath, findNextNode(pasos + 1, x - 1, y - 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x + 1, y - 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x + 1, y + 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);
    bestPath = min(bestPath, findNextNode(pasos + 1, x - 1, y + 1, fx, fy, ent));
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("bestpath: %d\n", bestPath));

    return bestPath;
  }

  if (pasos == 0)
  {
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.RIGHT = findNextNode(pasos + 1, x + 1, y, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.LEFT = findNextNode(pasos + 1, x - 1, y, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.UP = findNextNode(pasos + 1, x, y - 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.DOWN = findNextNode(pasos + 1, x, y + 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();

    level.UPRIGHT = findNextNode(pasos + 1, x + 1, y - 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.DOWNRIGHT = findNextNode(pasos + 1, x + 1, y + 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();

    level.UPLEFT = findNextNode(pasos + 1, x - 1, y - 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
    level.DOWNLEFT = findNextNode(pasos + 1, x - 1, y + 1, fx, fy, ent);
    ent->lastnode[0] = convertGridToWorld(x);
    ent->lastnode[1] = convertGridToWorld(y);

    G_LogPrintf(va("^4!!!Set LAST NODE %f %f \n", ent->lastnode[0], ent->lastnode[1]));
    cleanvis();
  }
  if (level.LEFT < MAX_VALUE || level.RIGHT < MAX_VALUE || level.UP < MAX_VALUE || level.DOWN < MAX_VALUE || level.UPRIGHT < MAX_VALUE || level.DOWNRIGHT
      < MAX_VALUE || level.UPLEFT < MAX_VALUE || level.DOWNLEFT < MAX_VALUE)
    return qtrue;

  G_LogPrintf(va("RETURN ALL VALUES ARE MAX VALUE."));
  return qfalse;

}

qboolean
findNextNodeInPath(gentity_t *ent)
{
  int xbotpos, ybotpos;
  int xplayerpos, yplayerpos;

  xbotpos = convertWorldToGrid(ent->client->ps.origin[0]);
  ybotpos = convertWorldToGrid(ent->client->ps.origin[1]);

  if (xbotpos >= GRIDSIZE || ybotpos >= GRIDSIZE || xbotpos < 0 || ybotpos < 0)
  {
    G_LogPrintf(va("print \"%s: ^1Im outside of grid.\n\"", ent->client->pers.netname));
    return qfalse;
  }

  xplayerpos = convertWorldToGrid(ent->pathTarget->client->ps.origin[0]);
  yplayerpos = convertWorldToGrid(ent->pathTarget->client->ps.origin[1]);

  if (xplayerpos >= GRIDSIZE || yplayerpos >= GRIDSIZE || xplayerpos < 0 || yplayerpos < 0)
  {
    G_LogPrintf(va("print \"%s: ^1Target out of grid\n\"", ent->client->pers.netname));
    return qfalse;
  }
  level.path[xbotpos][ybotpos] = 1; //Prevent dial to self
  G_LogPrintf(va("print \"%s: ^5 Bot: %d %d |Target: %d %d\n\"", ent->client->pers.netname, xbotpos, ybotpos, xplayerpos, yplayerpos));

  cleanvis();

  if (findNextNode(0, xbotpos, ybotpos, xplayerpos, yplayerpos, ent)) //Reversed from alien spawn to human
  {
    level.path[xbotpos][ybotpos] = 1;
    if (level.LEFT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      xbotpos = xbotpos - 1;
    }
    else if (level.RIGHT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      xbotpos = xbotpos + 1;
    }
    else if (level.UP == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      ybotpos = ybotpos - 1;
    }
    else if (level.DOWN == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      ybotpos = ybotpos + 1;
    }//////////////////////////////////////////////////////////////////////////Better pathfinding.
    else if (level.DOWNRIGHT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      ybotpos = ybotpos + 1;
      xbotpos = xbotpos + 1;
    }
    else if (level.DOWNLEFT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      ybotpos = ybotpos + 1;
      xbotpos = xbotpos - 1;
    }
    else if (level.UPRIGHT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      xbotpos = xbotpos + 1;
      ybotpos = ybotpos - 1;
    }
    else if (level.UPLEFT == min(min(min(level.LEFT, level.RIGHT), min(level.DOWNRIGHT, level.DOWNLEFT)), min(min(level.UP, level.DOWN), min(level.UPRIGHT,
        level.UPLEFT))))
    {
      xbotpos = xbotpos - 1;
      ybotpos = ybotpos - 1;
    }
    ent->nextnode[0] = convertGridToWorld(xbotpos);
    ent->nextnode[1] = convertGridToWorld(ybotpos);
    G_LogPrintf(va("print \"^1Found node %d %d |Self Position %d %d\n\"", xbotpos, ybotpos, convertWorldToGrid(ent->client->ps.origin[0]), convertWorldToGrid(
        ent->client->ps.origin[0])));
    return qtrue;
  }
  return qfalse;
}

//SYRINX
gentity_t *syrinxSpawn(gentity_t *ent) {

        gentity_t *bolt;
        vec3_t start;

        start[0] = ent->client->ps.origin[0];
        start[1] = ent->client->ps.origin[1];
        start[2] = ent->client->ps.origin[2] + 30;//Over the head.

        bolt = G_Spawn();
        bolt->classname = "pulse";
        bolt->nextthink = level.time + 1000;
        bolt->think = G_itemThink;
        bolt->s.eType = ET_MISSILE;
        bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
        bolt->s.weapon = WP_LUCIFER_CANNON;
        bolt->s.generic1 = ent->s.generic1; //weaponMode
        bolt->r.ownerNum = ent->s.number;
        bolt->parent = ent;
        bolt->damage = PRIFLE_DMG;
        bolt->splashDamage = 0;
        bolt->splashRadius = 0;
        bolt->methodOfDeath = MOD_PRIFLE;
        bolt->splashMethodOfDeath = MOD_PRIFLE;
        bolt->clipmask = MASK_WATER;
        bolt->target_ent = NULL;

        bolt->s.pos.trType = TR_LINEAR;
        bolt->s.pos.trTime = level.time - 50; // move a bit on the very first frame
        VectorCopy(start, bolt->s.pos.trBase);
        VectorScale(start, 0, bolt->s.pos.trDelta);

        SnapVector(bolt->s.pos.trDelta); // save net bandwidth

        VectorCopy(start, bolt->r.currentOrigin);

        return bolt;
}


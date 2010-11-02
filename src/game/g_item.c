#include "g_local.h"

void
G_itemThink(gentity_t *ent)
{
  ent->nextthink = level.time + 3000;
  if(level.spawnedItems >= (10 - ((level.time-level.startTime)/1000/60)))
  {
    G_FreeEntity(ent);
    level.spawnedItems--;
  }
}
void
G_sellAllWeapons(gentity_t *player)
{
  int i;
  for(i = WP_NONE + 1;i < WP_NUM_WEAPONS;i++)
  {
    if (BG_InventoryContainsWeapon(i, player->client->ps.stats) && BG_FindPurchasableForWeapon(i))
    {
      BG_RemoveWeaponFromInventory(i, player->client->ps.stats);
    }
  }
}
void
G_switchWeapon(gentity_t *player, weapon_t weapon)
{
  int maxAmmo, maxClips;

  G_sellAllWeapons(player);

  BG_AddUpgradeToInventory(UP_LIGHTARMOUR, player->client->ps.stats);
  BG_AddUpgradeToInventory(UP_HELMET, player->client->ps.stats);
  BG_AddWeaponToInventory(WP_HBUILD2, player->client->ps.stats);

  BG_AddWeaponToInventory(weapon, player->client->ps.stats);
  BG_FindAmmoForWeapon(weapon, &maxAmmo, &maxClips);
  G_ForceWeaponChange(player, weapon);
  BG_PackAmmoArray(weapon, player->client->ps.ammo, player->client->ps.powerups, maxAmmo, maxClips);
}
void
G_giveHealth(gentity_t *player)
{
  player->health =
      player->client->ps.stats[ STAT_HEALTH ] =
          player->client->ps.stats[ STAT_MAX_HEALTH ];
  G_AddEvent(player, EV_MEDKIT_USED, 0);

  player->client->ps.persistant[ PERS_UNUSED ] = 3;
}
void
G_itemUse(gentity_t *self, gentity_t *other, gentity_t *activator)
{
  G_LogPrintf("Sum1 is tryign to pick me up imma dessapear.\n");
  switch(self->s.modelindex)
  {
    case BA_I_CHAINGUN:
      G_switchWeapon(activator, WP_CHAINGUN);
      break;
    case BA_I_FLAMER:
      G_switchWeapon(activator, WP_FLAMER);
      break;
    case BA_I_LASGUN:
      G_switchWeapon(activator, WP_LAS_GUN);
      break;
    case BA_I_LCANNON:
      G_switchWeapon(activator, WP_LUCIFER_CANNON);
      break;
    case BA_I_MACHINEGUN:
      G_switchWeapon(activator, WP_MACHINEGUN);
      break;
    case BA_I_MDRIVER:
      G_switchWeapon(activator, WP_MASS_DRIVER);
      break;
    case BA_I_PSAW:
      G_switchWeapon(activator, WP_PAIN_SAW);
      break;
    case BA_I_PULSERIFLE:
      G_switchWeapon(activator, WP_PULSE_RIFLE);
      break;
    case BA_I_SHOTGUN:
      G_switchWeapon(activator, WP_SHOTGUN);
      break;
    case BA_I_SYRINX:
      G_giveHealth(activator);
      break;

  }
  G_FreeEntity(self);
  level.spawnedItems--;
}

gentity_t *
spawnItem(gentity_t *ent, buildable_t itemtype)
{
  gentity_t *item;
  vec3_t normal;
  vec3_t origin;

  G_LogPrintf("Spwning an item\n");

  VectorCopy(ent->s.origin, origin);

  origin[2] += 40;

  item = G_Spawn();

  BG_FindBBoxForBuildable(itemtype, item->r.mins, item->r.maxs);

  item->s.eType = ET_BUILDABLE;

  item->classname = BG_FindEntityNameForBuildable(itemtype);

  item->s.modelindex = itemtype;

  item->biteam = item->s.modelindex2 = BIT_HUMANS;

  VectorSet(normal, 0.0f, 0.0f, 1.0f);

  VectorMA(origin, 1.0, normal, origin);

  item->health = 10000;

  item->nextthink = level.time + 3000;
  item->think = G_itemThink;

  item->spawned = qtrue;

  item->s.number = item - g_entities;
  item->r.contents = 0;
  item->clipmask = MASK_SOLID;

  item->enemy = NULL;
  item->s.weapon = BG_FindProjTypeForBuildable(itemtype);

  G_SetOrigin(item, origin);

  item->s.pos.trType = TR_STATIONARY;

  item->s.pos.trTime = level.time;
  item->physicsBounce = 0.5;//BG_FindBounceForBuildable(itemtype);
  item->s.groundEntityNum = 1;//-1;
  //item->s.eFlags = EF_BOUNCE_HALF;
  item->use = G_itemUse;
  item->takedamage = qfalse;

  // gently nudge the buildable onto the surface :)
  VectorScale(normal, -50.0f, item->s.pos.trDelta);
  VectorSet(item->s.pos.trDelta,0,0,0);
  item->s.pos.trTime = level.time;

  item->powered = qtrue;

  item->s.generic1 |= B_POWERED_TOGGLEBIT;
  item->s.generic1 |= B_SPAWNED_TOGGLEBIT;

  VectorCopy(normal, item->s.origin2);

  trap_LinkEntity(item);

  //G_LogPrintf("Item Spawned");
  level.spawnedItems++;
  return item;
}

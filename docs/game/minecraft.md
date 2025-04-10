# minecraft

## server.properties

```
pvp=false

enable-command-block=true
op-permission-level=2

level-seed=nalbam
motd=nalbam server
```

## start

```
screen -S "minecraft server"
java -Xmx1024M -Xms1024M -jar server.jar nogui

screen -r

CTRL + A + D
```

## command

```
/op nalbam

/give @p 137
/give @p command_block

/gamemode [ 0: 서바이벌, 1: 크리에이티브, 2: 어드벤쳐 ] @p

/gamerule doDaylightCycle false

/difficulty 0/1/2/3 @p

/weather clear/rain/thunder

/time set day/night/6000

/spawnpoint

/clear @p
```

## seed

```
-8492498471865879313 # 마을, 벗꽃
```

## items

```
/give @p diamond_sword 1 0 {ench:[{id:16,lvl:30000}]}

/give @p diamond_sword
/give @p diamond_axe
/give @p diamond_shovel
/give @p diamond_pickaxe

/give @p diamond_helmet
/give @p diamond_chestplate
/give @p diamond_leggings
/give @p diamond_boots

/give @p minecraft:golden_apple

/give @p ladder 64
/give @p torch 64

/give @p dirt 64
/give @p coal 64
/give @p planks 64
```

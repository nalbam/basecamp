# oculus

## side quest

* stream crop

```txt
Oculus Quest 1 @ 1440 x 1600 pixes per eye

default:         1280:720:1500:350

2 eyes:          2680:1440:100:50
1 eye fullview:  1440:1600:0:-50
1 eye landscape: 1280:720:100:200

+---------------------------+
|        ^                  |
|        | y                |
|        v                  |
|     +----------+ ^        |
|  x  |          | |        |
|<--->|          | | height |
|     |          | |        |
|     +----------+ v        |
|     <---------->          |
|       width               |
|                           |
+---------------------------+

scrcpy --crop width:height:x:y

1280:720:100:440
```

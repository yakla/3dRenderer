ldi r12 pixel_x
ldi r13 pixel_y
ldi r14 draw_pixel
define fov 60              //pov needs to be bettween 60 - 63
define stopCaculations 24
define viewer_distance 70
define widthAndHeight 8
             //vertices x/y/z address 0-23
			 //sides 24-47
             //projected y/x address 66-81
			 //multiplication address 60-62
      		 //division address 63-65
define x1 4    /please do that the x/y/z be less then 24
define y1 4
define z1 4

define x2 24
define y2 4
define z2 4

define x3 4
define y3 24
define z3 4

define x4 24
define y4 24   
define z4 4

define x5 4
define y5 4       
define z5 24

define x6 24
define y6 4
define z6 24

define x7 4
define y7 24
define z7 24

define x8 24
define y8 24
define z8 24

define size1A 1
define size1B 2

define size2A 2
define size2B 4

define size3A 4
define size3B 3

define size4A 3
define size4B 1

define size5A 5
define size5B 6

define size6A 6
define size6B 8

define size7A 8
define size7B 7

define size8A 7
define size8B 5

define size9A 1
define size9B 5

define size10A 5
define size10B 6  

define size11A 3
define size11B 7  

define size12A 4
define size12B 8  


.main
cal .loadVertices
cal .loadSizes
cal .caculateprojectedXY
cal .loadSidesToCube
.retern
ldi r1 buffer_screen
str r1 r0
hlt

.caculateprojectedXY
ldi r3 fov
ldi r4 63    //devition
ldi r5 64   // is deviding
ldi r6 65   //devition result
ldi r7 60   //multiplication
ldi r8 0
ldi r9 62   //multiplication result
ldi r11 66   //r11 does the laps 2x
.projectedXYloop //r8 lap 3x
mov r8 r2
/mov r8 r2
/ldi r5 64
ldi r3 fov
/lod r9 r10  #work in prograss
/adi r10 32 //translating the cube
ldi r4 63
adi r2 2
lod r2 r1
adi r1 viewer_distance  //add viewer_distance
add r3 r3 r3     //multiply by 4
add r3 r3 r3
str r4 r3
str r5 r1
cal .division
ldi r3 fov
mov r8 r2
lod r2 r1
rsh r1 r1  //devide by 4
rsh r1 r1
ldi r4 63
ldi r5 64
lod r6 r10
ldi r7 60
str r7 r10
ldi r7 61
str r7 r1
cal .multiplication
ldi r4 63
ldi r5 64
ldi r3 fov
lod r9 r10
adi r10 widthAndHeight //center the cube
str r11 r10
str r12 r10
inc r11
inc r8
mov r8 r2
ldi r3 fov
adi r2 1
lod r2 r1
adi r1 viewer_distance //please fix
add r3 r3 r3     //multiply by 4
add r3 r3 r3
str r4 r3
str r5 r1
cal .division
ldi r3 fov
mov r8 r2
lod r2 r1
rsh r1 r1  //devide by 4
rsh r1 r1
ldi r4 63
ldi r5 64
lod r6 r10
ldi r7 60
str r7 r10
ldi r7 61
str r7 r1
cal .multiplication
ldi r4 63
ldi r5 64
ldi r3 fov
lod r9 r10
adi r10 widthAndHeight
str r13 r10
str r11 r10
str r14 r0
inc r11
ldi r15 stopCaculations
/ldi r1 buffer_screen
/str r1 r0
adi r8 2
cmp r8 r15
brh ne .projectedXYloop
ret

.loadSizes
ldi r2 size1A
cal .load
ldi r2 size1B
cal .load
ldi r2 size2A
cal .load
ldi r2 size2B
cal .load
ldi r2 size3A
cal .load
ldi r2 size3B
cal .load
ldi r2 size4A
cal .load
ldi r2 size4B
cal .load
ldi r2 size5A
cal .load
ldi r2 size5B
cal .load
ldi r2 size6A
cal .load
ldi r2 size6B
cal .load
ldi r2 size7A
cal .load
ldi r2 size7B
cal .load
ldi r2 size8A
cal .load
ldi r2 size8B
cal .load
ldi r2 size9A
cal .load
ldi r2 size9B
cal .load
ldi r2 size10A
cal .load
ldi r2 size10B
cal .load
ldi r2 size11A
cal .load
ldi r2 size11B
cal .load
ldi r2 size12A
cal .load
ldi r2 size12B
cal .load
ret

.loadVertices
ldi r2 x1
cal .load
ldi r2 y1
cal .load
ldi r2 z1
cal .load
ldi r2 x2
cal .load
ldi r2 y2
cal .load
ldi r2 z2
cal .load
ldi r2 x3
cal .load
ldi r2 y3
cal .load
ldi r2 z3
cal .load
ldi r2 x4
cal .load
ldi r2 y4
cal .load
ldi r2 z4
cal .load
ldi r2 x5
cal .load
ldi r2 y5
cal .load
ldi r2 z5
cal .load
ldi r2 x6
cal .load
ldi r2 y6
cal .load
ldi r2 z6
cal .load
ldi r2 x7
cal .load
ldi r2 y7
cal .load
ldi r2 z7
cal .load
ldi r2 x8
cal .load
ldi r2 y8
cal .load
ldi r2 z8
cal .load
ret

.load
str r1 r2 
inc r1
ret


.multiplication
ldi r1 61
ldi r2 60
lod r1 r3 /number multiplide by
lod r2 r4 /number is multiplide
ldi r5 0
cmp r3 r0
brh eq .skip1
.multiplicationloop
add r4 r5 r5
dec r3
brh ne .multiplicationloop
.skip1
ldi r1 62
str r1 r5
ret


.division
ldi r1 64
ldi r2 63
lod r1 r3  /number divided by
lod r2 r4  /is dividing
ldi r5 0
.divisionloop
cmp r4 r3
brh lt .skip
inc r5
sub r4 r3 r4
cmp r0 r4
brh lt .divisionloop
.skip
ldi r1 65
str r1 r5
ret


.loadSidesToCube   // regestery 4 memory leak
ldi r11 64
ldi r10 23
ldi r15 3
ldi r9 3
.loadSidesToCubeLoop
adi r10 -47
brh eq .retern
inc r10
adi r10 47
lod r10 r1
inc r10
lod r10 r2
lsh r2 r2
lsh r1 r1
add r11 r1 r1
add r11 r2 r2
lod r1 r3  /x1
inc r1
lod r1 r4  /y1
lod r2 r5  /x2
inc r2
lod r2 r6  /y2
   /after i can use r1/r2
cmp r4 r6
brh lt .oposite  //y r9
sub r4 r6 r7  /dy r7
ldi r9 1
.continue1
cmp r3 r5
brh lt .oposite1  //x r15
sub r3 r5 r8     /dx r8 
ldi r15 1     
ldi r1 100
.createLineLoop     
ldi r2 100 
str r2 r1
cal .continue
lod r2 r2
add r2 r8 r2
add r2 r8 r2
adi r2 -100
cmp r7 r2
brh lt .X+
.con
ldi r2 100
lod r2 r2
add r2 r8 r2
adi r2 -100
add r7 r7 r7
cmp r2 r7
brh lt .Y+
.co
rsh r7 r7
jmp .createLineLoop

.X+
sub r1 r7 r1
sub r1 r7 r1
adi r3 -2
add r3 r15 r3
str r12 r3
str r13 r4
str r14 r0
jmp .con

.Y+
add r1 r8 r1
add r1 r8 r1
adi r4 -2
add r4 r9 r4
str r12 r3
str r13 r4
str r14 r0
jmp .co


.continue
cmp r5 r3
brh eq .compare
ret



.compare
cmp r6 r4
brh eq .loadSidesToCubeLoop
ret

.oposite1
sub r5 r3 r8
ldi r15 3
jmp .createLineLoop

.oposite
sub r6 r4 r7
ldi r9 3
jmp .continue1


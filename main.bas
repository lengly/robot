
DIM tilt_CNT AS BYTE
DIM grip_pose AS BYTE
DIM Action_mode AS BYTE

DIM motorONOFF AS BYTE'把I定义成字节型
DIM I AS BYTE'把I定义成字节型
DIM J AS BYTE'把J定义成字节型
DIM K AS BYTE
DIM pose AS BYTE

DIM A AS BYTE
DIM A_old AS BYTE
DIM B AS BYTE


'**** tilt_port *****

CONST FB_tilt_AD_port = 2'前后倾斜地址 点
CONST LR_tilt_AD_port = 3'左右倾斜地址 点

'**** 2012 NEW tilt Sensors *****‘2012新的倾斜传感器
CONST tilt_time_check = 5  '倾斜时间检查
CONST min = 61			'最小值
CONST max = 107			'最大值
CONST COUNT_MAX = 20'计算
'*******************


PTP SETON 				
PTP ALLON				

DIR G6A,1,0,0,1,0,0		'motor0~5
DIR G6B,1,1,1,1,1,1		'motor6~11
DIR G6C,0,0,0,0,0,0		'motor12~17
DIR G6D,0,1,1,0,1,0		'motor18~23

'**** Feedback *****************************
'**** Feedback *****************************

GOSUB MOTOR_ON

SPEED 5
GOSUB power_first_pose
GOSUB stand_pose


GOTO MAIN




MOTOR_ON:

    GOSUB MOTOR_GET

    MOTOR G6B
    DELAY 50
    MOTOR G6C
    DELAY 50
    MOTOR G6A
    DELAY 50
    MOTOR G6D

    motorONOFF = 0
    'GOSUB start_music			
    RETURN
power_first_pose:
    MOVE G6A,95,  76, 145,  93, 105, 100
    MOVE G6D,95,  76, 145,  93, 105, 100
    MOVE G6B,100,  45,  90, 100, 100, 100
    MOVE G6C,100,  45,  90, 100, 100, 100
    WAIT
    pose = 0
    RETURN

    '************************************************
MOTOR_GET:
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,0
    GETMOTORSET G6C,1,1,1,0,0,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN


    '******************************************	
StandState: '正常站立状态
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	WAIT
	RETURN
MyBackStandUp:'前倒自动站立

    SPEED 15
    MOVE G6A,  100, 155,  110, 120, 100
    MOVE G6D,  100, 155,  110, 120, 100
    MOVE G6B, 190, 80,  15
    MOVE G6C, 190, 80,  15
    WAIT

    GOSUB Leg_motor_mode2
    SPEED 15	
    MOVE G6A,  100, 165,  27, 162, 100
    MOVE G6D,  100, 165,  27, 162, 100
    MOVE G6B,  155, 15, 90
    MOVE G6C,  155, 15, 90
    WAIT


    SPEED 10	
    MOVE G6A,  100, 150,  27, 162, 100
    MOVE G6D,  100, 150,  27, 162, 100
    MOVE G6B,  140, 15, 90
    MOVE G6C,  140, 15, 90
    WAIT


    SPEED 6
    MOVE G6A,  100, 138,  27, 155, 100
    MOVE G6D,  100, 138,  27, 155, 100
    MOVE G6B, 113,  30, 80
    MOVE G6C, 113,  30, 80
    WAIT

    DELAY 100
    SPEED 10
    GOSUB stand_pose
    GOSUB Leg_motor_mode1

    RETURN

Song:

	SPEED 5
	'偏腿
	GOSUB StandState
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 115,  79, 143,  93, 128,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 101,  46, 100,  ,  ,  
	WAIT
	
	GOSUB StandState
	
	MOVE G6A, 115,  79, 143,  93, 128,  
	MOVE G6D, 100,  82, 141,  93,  97,  
	MOVE G6B, 101,  46, 100,  ,  ,  
	MOVE G6C, 102,  16, 100,  ,  ,  
	WAIT
	
	GOSUB StandState
	
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 115,  79, 143,  93, 128,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 101,  46, 100,  ,  ,  
	WAIT
	
	GOSUB StandState
	
	MOVE G6A, 115,  79, 143,  93, 128,  
	MOVE G6D, 100,  82, 141,  93,  97,  
	MOVE G6B, 101,  46, 100,  ,  ,  
	MOVE G6C, 102,  16, 100,  ,  ,  
	WAIT
	
	GOSUB StandState
	DELAY 400
	
	'动手
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 101,  63, 136,  ,  ,  
	WAIT
	
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 101,  63, 136,  ,  ,  
	
	WAIT
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 101,  63, 136,  ,  ,  
	MOVE G6C, 101,  63, 136,  ,  ,  
	WAIT
	
	DELAY 700
	
	MOVE G6A, 100,  75,  ,  94,  99,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 102,  17,  86,  ,  ,  
	MOVE G6C, 101,  63, 136,  ,  ,  
	WAIT
	
	
	GOSUB StandState
	
	DELAY 300

	FOR i = 1 TO 2
		'垫脚
		MOVE G6A,  50,  76, 145,  93, 100,  
		MOVE G6D,  50,  76, 145,  93, 100,  
		MOVE G6B, 100,  30,  80,  ,  ,  
		MOVE G6C, 100,  30,  80,  ,  ,  
		WAIT
		GOSUB StandState
	NEXT i	
	DELAY 300

	
	'扭
	FOR i = 1 TO 3
		MOVE G6A,  82, 113, 133,  65, 120,  
		MOVE G6D,  92,  55, 127, 133, 107,  
		IF i = 1 THEN
			MOVE G6B,  66,  17,  53,  ,  ,  
			MOVE G6C,  70,  15,  56,  ,  ,  
		ELSE
			MOVE G6B, 100, 101, 100,  ,  ,  
			MOVE G6C, 100, 189,  98,  ,  ,  			
		ENDIF
		WAIT
		MOVE G6D,  82, 113, 133,  65, 120,  
		MOVE G6A,  92,  55, 127, 133, 107,  
		IF i = 1 THEN
			MOVE G6B,  66,  17,  53,  ,  ,  
			MOVE G6C,  70,  15,  56,  ,  ,  
		ELSE
			MOVE G6B, 100, 101, 100,  ,  ,  
			MOVE G6C, 100, 189,  98,  ,  ,  			
		ENDIF
		WAIT
	NEXT i

'TODO

	SPEED 5
	MOVE G6A,  87, 124,  79, 108, 115,  
	MOVE G6D,  85, 114,  82, 119, 113,  
	MOVE G6B,  15, 177, 189,  ,  ,  
	MOVE G6C, 158,  10,  26,  ,  ,  
	WAIT
	MOVE G6A,  86, 155,  42, 108,  ,  
	MOVE G6D,  85, 136,  43, 129, 119,  
	MOVE G6B, 158,  10,  26,  ,  ,  
	MOVE G6C,  15, 177, 189,  ,  ,  
	WAIT
	MOVE G6A,  55, 164,  26, 109, 141,  
	MOVE G6D,  55, 164,  26, 109, 141,  
	MOVE G6B, 186,  89,  40,  ,  ,  
	MOVE G6C, 186,  89,  40,  ,  ,  
	WAIT



	SPEED 5
	'站着举手
	MOVE G6A,  86, 155,  42, 108,  ,  
	MOVE G6D,  85, 136,  43, 129, 119,  
	MOVE G6B, 101, 105, 122,  ,  ,  
	MOVE G6C, 100,  96, 129,  ,  ,  
	WAIT
	
	SPEED 8

	FOR i = 1 TO 3
		MOVE G6A,  86, 155,  42, 108,  ,  
		MOVE G6D,  85, 136,  43, 129, 119,  
		MOVE G6B, 103,  51, 115,  ,  ,  150
		MOVE G6C, 107, 138, 110,  ,  ,  150
		WAIT
		MOVE G6A,  86, 155,  42, 108,  ,  
		MOVE G6D,  85, 136,  43, 129, 119,  
		MOVE G6B, 103,  51, 115,  ,  ,  100
		MOVE G6C, 107, 138, 110,  ,  ,  100
		WAIT
	NEXT i
	

	SPEED 10
	FOR i = 1 TO 3
		'站着举手
		MOVE G6A,  87, 124,  79, 108, 115,  
		MOVE G6D,  85, 114,  82, 119, 113,  
		MOVE G6B, 107, 126, 138,  ,  ,  
		MOVE G6C,  88, 131, 140,  ,  ,  
		WAIT
	
		MOVE G6A,  87, 124,  79, 108, 115,  
		MOVE G6D,  85, 114,  82, 119, 113,  
		MOVE G6B, 107, 179, 153,  ,  ,  
		MOVE G6C, 105, 182, 140,  ,  ,  
		WAIT
	NEXT i

	SPEED 8
	'手左右摆
	
	MOVE G6A,  86, 155,  42, 108,  , 20 
	MOVE G6D,  85, 136,  43, 129, 119, 20 
	MOVE G6B, 107, 110, 104,  ,  ,  20
	MOVE G6C, 105, 182, 140,  ,  ,  20
	WAIT
	MOVE G6A,  87, 124,  79, 108, 115, 20 
	MOVE G6D,  85, 114,  82, 119, 113,  20
	MOVE G6B, 105, 182, 140,  ,  ,20
	MOVE G6C, 107, 110, 104,  ,  ,  20
	WAIT

	MOVE G6A,  87, 124,  79, 108, 115,  50
	MOVE G6D,  85, 114,  82, 119, 113,  50
	MOVE G6B, 107, 110, 104,  ,  ,  50
	MOVE G6C, 105, 182, 140,  ,  ,  50
	WAIT
	MOVE G6A,  87, 124,  79, 108, 115, 50 
	MOVE G6D,  85, 114,  82, 119, 113,  50
	MOVE G6B, 105, 182, 140,  ,  ,50
	MOVE G6C, 107, 110, 104,  ,  ,  50
	WAIT
	
	
	MOVE G6A,  55, 164,  26, 109, 141, 120 
	MOVE G6D,  55, 164,  26, 109, 141,  120
	MOVE G6B, 107, 110, 104,  ,  ,  120
	MOVE G6C, 105, 182, 140,  ,  ,  120
	WAIT
	MOVE G6A,  55, 164,  26, 109, 141,  120
	MOVE G6D,  55, 164,  26, 109, 141,  120
	MOVE G6B, 105, 182, 140,  ,  ,120
	MOVE G6C, 107, 110, 104,  ,  ,  120

	
	'===右腿动作
	'踢腿 准备
	MOVE G6A, 109,  92, 119,  98,  95,  
	MOVE G6D,  93,  85, 127,  99, 103,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	WAIT
	SPEED 15
	'踢腿 抬右腿
	MOVE G6A, 109,  53, 174,  98, 115,  
	MOVE G6D,  99,  80,  36, 159,  90,  
	MOVE G6B, 111, 184,  26,  ,  ,  
	MOVE G6C, 104,  10, 175,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 放右腿
	MOVE G6A, 109,  53, 174,  98, 115,  
	MOVE G6D, 100,  80, 110, 117,  90,  
	MOVE G6B, 106, 106,  13,  ,  ,  
	MOVE G6C, 107,  86,  10,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 踢右腿
	MOVE G6A, 109,  53, 174,  98, 115,  
	MOVE G6D, 109,  49, 185, 160, 186,  
	MOVE G6B, 190, 187,  64,  ,  ,  
	MOVE G6C, 190, 187,  64,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 准备
	MOVE G6A, 114,  92, 119,  98,  108,  
	MOVE G6D,  93,  85, 127,  99, 103,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	WAIT
	DELAY 300
	SPEED 5
	'===左腿动作
	GOSUB StandState
	DELAY 300
	FOR i = 1 TO 2
		'垫脚
		MOVE G6A,  50,  76, 145,  93, 100,  
		MOVE G6D,  50,  76, 145,  93, 100,  
		MOVE G6B, 100,  30,  80,  ,  ,  
		MOVE G6C, 100,  30,  80,  ,  ,  
		WAIT
		GOSUB StandState
	NEXT i

	DELAY 300
	'踢腿 准备
	MOVE G6D, 109,  92, 119,  93,  95,  
	MOVE G6A,  93,  85, 127,  99, 103,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	WAIT
	SPEED 15
	'踢腿 抬左腿
	MOVE G6D, 109,  53, 174,  93, 118,  
	MOVE G6A,  99,  80,  36, 159,  90,  
	MOVE G6C, 111, 184,  26,  ,  ,  
	MOVE G6B, 104,  10, 175,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 放左腿
	MOVE G6D, 109,  53, 174,  93, 118,  
	MOVE G6A, 100,  80, 110, 117,  90,  
	MOVE G6C, 106, 106,  13,  ,  ,  
	MOVE G6B, 107,  86,  10,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 踢左腿
	MOVE G6D, 109,  53, 174,  93, 120,  
	MOVE G6A, 109,  49, 185, 160, 186,  
	MOVE G6C, 190, 187,  64,  ,  ,  
	MOVE G6B, 190, 187,  64,  ,  ,  
	WAIT
	DELAY 300
	'踢腿 准备
	MOVE G6D, 114,  92, 119,  105,  108,  
	MOVE G6A,  93,  85, 127,  105,  103,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	WAIT
	DELAY 300
	GOSUB StandState

	'稍微后仰
	FOR k = 1 TO 3
	MOVE G6A, 100,  93, 122,  69, 100,  
	MOVE G6D, 100,  91, 123,  70, 100,  
	MOVE G6B, 148,  24,  94,  ,  ,  
	MOVE G6C, 143,  41,  80,  ,  ,  
	WAIT
	MOVE G6A, 100,  93, 122,  69, 100,  
	MOVE G6D, 100,  91, 123,  70, 100,  
	MOVE G6B, 144,  32,  53,  ,  ,  
	MOVE G6C, 146,  47,  47,  ,  ,  
	WAIT
	NEXT k


	'洗刷刷
	
	'左手上  右手下
	MOVE G6A, 100, 135, 105,  16, 100,  
	MOVE G6D, 100, 135, 105,  16, 100,  
	MOVE G6B, 145,  10,  65,  ,  ,  
	MOVE G6C, 185,  10,  65,  ,  ,  
	DELAY 300
	SPEED 15
	'身体后倾
	FOR i = 1 TO 3
		'左手下  右手上
		MOVE G6A, 100, 135, 105,  16, 100,  
		MOVE G6D, 100, 135, 105,  16, 100,  
		MOVE G6B, 185,  10,  65,  ,  ,  
		MOVE G6C, 145,  10,  65,  ,  ,  
		WAIT
		'左手上  右手下
		MOVE G6A, 100, 135, 105,  16, 100,  
		MOVE G6D, 100, 135, 105,  16, 100,  
		MOVE G6B, 145,  10,  65,  ,  ,  
		MOVE G6C, 185,  10,  65,  ,  ,  
		WAIT
	NEXT i
	DELAY 300
	
	SPEED 10
	FOR k = 1 TO 3
	MOVE G6A, 100,  57, 167, 102, 100,  
	MOVE G6D, 100,  58, 172, 101, 100,   
	MOVE G6B, 148,  24,  94,  ,  ,  
	MOVE G6C, 143,  41,  80,  ,  ,  
	WAIT
	MOVE G6A, 100,  57, 167, 102, 100,  
	MOVE G6D, 100,  58, 172, 101, 100,   
	MOVE G6B, 144,  32,  53,  ,  ,  
	MOVE G6C, 146,  47,  47,  ,  ,  
	WAIT
	NEXT k
	
	SPEED 15
	'身体前倾
	FOR i = 1 TO 3
		'左手下  右手上
		MOVE G6A, 100,  28, 175, 159, 100,  
		MOVE G6D, 100,  28, 175, 159, 100,  
		MOVE G6B, 185,  10,  65,  ,  ,  
		MOVE G6C, 145,  10,  65,  ,  ,  
		WAIT
		'左手上  右手下
		MOVE G6A, 100,  28, 175, 159, 100,  
		MOVE G6D, 100,  28, 175, 159, 100,  
		MOVE G6B, 145,  10,  65,  ,  ,  
		MOVE G6C, 185,  10,  65,  ,  ,  
		WAIT
	NEXT i	
	'tutu
	'双手外
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 164,  25,  35,  ,  ,  
	MOVE G6C, 164,  25,  35,  ,  ,  
	SPEED 10
	FOR i = 1 TO 2
		'双手内
		MOVE G6A, 50,  76, 145,  93, 100,  
		MOVE G6D, 50,  76, 145,  93, 100,  
		MOVE G6B, 164,  35,  15,  ,  ,  
		MOVE G6C, 164,  35,  15,  ,  ,  
		WAIT
		'双手外
		MOVE G6A, 100,  76, 145,  93, 100,  
		MOVE G6D, 100,  76, 145,  93, 100,  
		MOVE G6B, 164,  25,  35,  ,  ,  
		MOVE G6C, 164,  25,  35,  ,  , 
		WAIT
	NEXT i
	DELAY 300

	GOSUB StandState

	SPEED 5
	'左 侧压腿
	MOVE G6A, 109, 163,  25, 126,  81,  
	MOVE G6D,  45,  57, 171,  87, 166,  
	MOVE G6B,  10, 190, 142,  ,  ,  
	MOVE G6C,  14, 190, 142,  ,  ,  
	WAIT
	SPEED 15
	MOVE G6A, 109, 163,  25, 126,  81,  
	MOVE G6D,  45,  57, 171,  87, 166,  
	MOVE G6B,  14,  34,  22,  ,  ,  
	MOVE G6C,  18,  23,  33,  ,  ,  
	WAIT
	MOVE G6A, 109, 163,  25, 126,  81,  
	MOVE G6D,  45,  57, 171,  87, 166,  
	MOVE G6B,  96, 146,  94,  ,  ,  
	MOVE G6C,  46, 170, 185,  ,  ,

	WAIT
	SPEED 8
	'双手大摆动
	FOR i = 1 TO 2
		MOVE G6D, 109, 163,  25, 126,  81,  
		MOVE G6A,  45,  57, 171,  87, 166,  
		MOVE G6B, 180,  14,  25,  ,  ,  
		MOVE G6C, 189,  13,  91,  ,  ,  
		WAIT
		MOVE G6D, 109, 163,  25, 126,  81,  
		MOVE G6A,  45,  57, 171,  87, 166,  
		MOVE G6B,  10, 187, 182,  ,  ,  
		MOVE G6C,  12, 189,  89,  ,  ,  
		WAIT
	NEXT i
	SPEED 15   
	FOR k=1 TO 2
		MOVE G6A, 109, 163,  25, 126,  81,  
		MOVE G6D,  45,  57, 171,  87, 166,
		MOVE G6B,  96, 146,  94,  ,  ,  
		MOVE G6C,  46, 170, 185,  ,  ,
	
		WAIT  
		MOVE G6D, 109, 163,  25, 126,  81,  
		MOVE G6A,  45,  57, 171,  87, 166,  
		MOVE G6B,  96, 146,  94,  ,  ,  
		MOVE G6C,  46, 170, 185,  ,  ,
		WAIT
	NEXT k
	DELAY 300
	GOSUB StandState
	
	'俯卧撑
	SPEED 20
	FOR i = 1 TO 3
	MOVE G6A, 106, 157,  21, 132,  94,  
	MOVE G6D, 102, 154,  20, 136,  98,  
	MOVE G6B, 171, 184,  62,  ,  ,  
	MOVE G6C, 170, 187,  53,  ,  ,  
	WAIT
	
	MOVE G6A, 106, 156,  21, 132,  94,  
	MOVE G6D, 102, 153,  20, 136,  98,  
	MOVE G6B, 173, 147,  30,  ,  ,  
	MOVE G6C, 170, 160,  21,  ,  ,  
	WAIT
	
	NEXT i
	
	SPEED 15
	FOR i = 1 TO 3
	MOVE G6A, 106, 156,  21, 132,  94,  120
	MOVE G6D, 102, 153,  20, 136,  98,  120
	MOVE G6B, 173, 147,  30,  ,  ,  120
	MOVE G6C, 170, 160,  21,  ,  ,  120

	MOVE G6A, 106, 156,  21, 132,  94,  100
	MOVE G6D, 102, 153,  20, 136,  98,  100
	MOVE G6B, 173, 147,  30,  ,  ,  100
	MOVE G6C, 170, 160,  21,  ,  ,  100
	
	NEXT i
	
	DELAY 100
	'蹲 两手前伸
	
	
	MOVE G6A, 100, 166,  20, 114,  99,  
	MOVE G6D, 100, 166,  20, 114,  99,  
	MOVE G6B, 186,  10,  95,  ,  ,  
	MOVE G6C, 186,  10,  95,  ,  ,  
	WAIT
	'手碰地 向前趴 腿弯曲
	MOVE G6A, 100, 165,  67, 133,  98,  
	MOVE G6D, 100, 165,  67, 133,  98,  
	MOVE G6B, 186,  10,  95,  ,  ,  
	MOVE G6C, 186,  10,  95,  ,  ,  
	WAIT
	FOR i = 1 TO 2
		'俯卧
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 190,  57,  11,  ,  ,  
		MOVE G6C, 190,  57,  11,  ,  ,  	
		WAIT
		DELAY 300
		'撑
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 178,  11,  97,  ,  ,  
		MOVE G6C, 178,  11,  97,  ,  ,  
		DELAY 300
	NEXT i
	FOR i = 1 TO 2
		'大俯卧
		MOVE G6A, 100,  76, 145,  93, 100,  
		MOVE G6D, 100,  76, 145,  93, 100,  
		MOVE G6B, 190, 112,  20,  ,  ,  
		MOVE G6C, 190, 112,  20,  ,  ,  
		WAIT
		DELAY 300
		'撑
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 178,  11,  97,  ,  ,  
		MOVE G6C, 178,  11,  97,  ,  ,  
		DELAY 300
	NEXT i
	

	'大俯卧
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	DELAY 300
	'起立
	SPEED 5
	
	FOR i = 1 TO 2
	MOVE G6A, 100,  76, 145,  33, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	MOVE G6A, 50,  26, 145,  53, 150,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	MOVE G6A, 100,  76, 145,  33, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	MOVE G6A, 50,  26, 145,  83, 150,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  33, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 50,  26, 145,  53, 150,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  33, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 50,  26, 145,  83, 150,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	NEXT i

	GOSUB MyBackStandUp


	'''侧滚翻
	'举手 蹲
	SPEED 5
	MOVE G6A, 103, 166,  19, 128,  95,  
	MOVE G6D, 103, 166,  19, 128,  95,  
	MOVE G6B, 103, 110, 188,  ,  ,  
	MOVE G6C, 103, 110, 188,  ,  ,  
	WAIT
	'向左倒
	MOVE G6A, 120, 166,  19, 128, 186,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 103, 162, 190,  ,  ,  
	MOVE G6C, 103, 110, 188,  ,  ,  
	WAIT
	'左胳膊撑地  双腿侧伸直
	MOVE G6A, 100,  76, 145,  93, 186,  
	MOVE G6D, 100,  76, 145,  93, 186,  
	MOVE G6B, 100, 164, 190,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT
	SPEED 10
	'回旋 右腿后 左腿前
	MOVE G6A, 100,  76, 145,  190, 186,  
	MOVE G6D, 100,  76, 145,  10, 186,  
	MOVE G6B, 100, 164, 190,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT
	'回旋 两腿伸直
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  	
	MOVE G6B, 100, 164, 190,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT
	'回旋 右腿前 左腿后
	MOVE G6A, 100,  76, 145,  10, 186,  
	MOVE G6D, 100,  76, 145,  190, 186,  
	MOVE G6B, 100, 164, 190,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT
	'回旋 两腿伸直
	MOVE G6A, 103, 166,  19, 128,  95,  
	MOVE G6D, 103, 166,  19, 128,  95,  	
	MOVE G6B, 100, 164, 190,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT
	'缩腿伸腿
	SPEED 20
	FOR i = 1 TO 2
		MOVE G6A, 107, 163,  28, 124,  82,  
		MOVE G6D, 101, 160,  22, 131, 116,  
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  ,  
		WAIT
		MOVE G6A, 103,  71, 154,  90,  82,  
		MOVE G6D, 102,  70, 154,  90, 115,  
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  , 
		WAIT
	NEXT i
	DELAY 300
	'摆腿
	FOR i = 1 TO 5
		MOVE G6A,  97, 154,  26, 132, 186,  
		MOVE G6D,  97, 154,  26, 132, 186,
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  , 
		WAIT
		MOVE G6A,  42, 154,  26, 133, 117,  
		MOVE G6D,  42, 154,  26, 133, 117,  
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  , 
		WAIT
		MOVE G6A,  83,  69, 150,  94, 140,  
		MOVE G6D,  83,  69, 150,  94, 140,  
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  , 
		WAIT
		MOVE G6A,  84,  68, 150,  95, 187,  
		MOVE G6D,  84,  68, 150,  95, 187,  
		MOVE G6B, 100, 164, 190,  ,  ,  
		MOVE G6C, 101, 109, 179,  ,  , 
		WAIT
		IF i = 2 THEN
			DELAY 500
		ENDIF
	NEXT i
	
	SPEED 15
	'回旋 脚落地 起身
	MOVE G6A, 97, 166, 187, 159, 89,  
	MOVE G6D, 97, 166, 187, 159, 108,  
	MOVE G6B, 101, 109, 179,  ,  ,  
	MOVE G6C, 101, 109, 179,  ,  ,  
	WAIT	
	GOSUB MyBackStandUp

	GOSUB StandState
	DELAY 300
	SPEED 8
	'劈叉
	MOVE G6A, 101,  77, 143,  89, 186,  10
	MOVE G6D, 101,  77, 143,  89, 186,  10
	MOVE G6B, 189, 100,  95,  ,  ,  10
	MOVE G6C, 189, 100,  95,  ,  ,  10
	WAIT
	'收腿
	MOVE G6A,  44, 157,  29, 130, 189,  170
	MOVE G6D,  44, 123,  27, 160, 186,  170
	MOVE G6B,  97, 190,  10,  ,  ,  170
	MOVE G6C,  97, 190,  10,  ,  ,  170
	WAIT
	'蹲
	MOVE G6A,  85, 158,  29, 132, 111, 60 
	MOVE G6D,  81, 150,  27, 141, 122,  60
	MOVE G6B,  10, 190,  10,  ,  ,  60
	MOVE G6C, 190, 190,  10,  ,  ,  60
	WAIT
	'站
	MOVE G6A, 100,  76, 145,  93, 100, 20  
	MOVE G6D, 100,  76, 145,  93, 100, 20
	MOVE G6B, 190, 190,  10,  ,  ,  20
	MOVE G6C,  10, 190,  10,  ,  ,  20
	WAIT
	'劈叉
	MOVE G6A, 101,  77, 143,  89, 186, 80  
	MOVE G6D, 101,  77, 143,  89, 186,  80
	MOVE G6B,  84, 161, 125,  ,  ,  80
	MOVE G6C, 189, 100,  90,  ,  ,  80
	WAIT
	'收腿
	MOVE G6A,  44, 157,  29, 130, 189, 190  
	MOVE G6D,  44, 123,  27, 160, 186, 190
	MOVE G6B, 188,  39, 117,  ,  , 190
	MOVE G6C, 189,  21,  42,  ,  , 190
	WAIT
	'蹲
	MOVE G6A,  85, 158,  29, 132, 111, 10 
	MOVE G6D,  81, 150,  27, 141, 122, 10
	MOVE G6B, 146, 171, 186,  ,  , 10
	MOVE G6C, 189,  21,  20,  ,  , 10
	WAIT
	'站
	MOVE G6A, 100,  76, 145,  93, 100, 100 
	MOVE G6D, 100,  76, 145,  93, 100, 100
	MOVE G6B, 172,  21,  11,  ,  , 100
	MOVE G6C,  56, 186, 158,  ,  , 100
	WAIT
	'劈叉
	MOVE G6A, 101,  77, 143,  89, 186, 53
	MOVE G6D, 101,  77, 143,  89, 186, 53
	MOVE G6B, 188,  91, 116,  ,  , 53
	MOVE G6C, 189, 115,  91,  ,  , 53
	WAIT
	'收腿
	MOVE G6A,  44, 157,  29, 130, 189, 145
	MOVE G6D,  44, 123,  27, 160, 186, 145
	MOVE G6B, 105, 190, 131,  ,  , 145
	MOVE G6C, 104, 186, 140,  ,  , 145
	WAIT
	'蹲
	MOVE G6A,  85, 158,  29, 132, 111, 180
	MOVE G6D,  81, 150,  27, 141, 122, 180
	MOVE G6B, 175,  13,  11,  ,  , 180
	MOVE G6C,  17,  21,  26,  ,  , 180
	WAIT
	'站
	MOVE G6A, 100,  76, 145,  93, 100, 100  
	MOVE G6D, 100,  76, 145,  93, 100, 100
	MOVE G6B, 108, 154, 108,  ,  , 100
	MOVE G6C,  97, 159,  90,  ,  , 100
	WAIT
	GOSUB StandState
	
	SPEED 5
	'蹲 两臂平举
	MOVE G6A,  93, 135,  61, 119, 103,  
	MOVE G6D,  93, 135,  61, 119, 103,  
	MOVE G6B, 100, 100, 100,  ,  ,  
	MOVE G6C, 100, 100, 100,  ,  ,  
	WAIT
	FOR i = 1 TO 2
		'右手上  左手下  身体左倾
		MOVE G6A, 106, 121,  24, 166, 147,  
		MOVE G6D,  63,  76, 139,  94,  83,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		DELAY 300
		WAIT
		'蹲 两臂平举
		MOVE G6A,  93, 135,  61, 119, 103,  
		MOVE G6D,  93, 135,  61, 119, 103,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 300
		'右手下  左手上  身体右倾
		MOVE G6A,  63,  76, 139,  94,  83,  
		MOVE G6D, 106, 121,  24, 166, 147,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 300
		'蹲 两臂平举
		MOVE G6A,  93, 135,  61, 119, 103,  
		MOVE G6D,  93, 135,  61, 119, 103,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 300
	NEXT i
now:
	GOSUB StandState
	SPEED 10
	'波浪手
	'摆左手
	FOR i = 1 TO 2
		'1
		MOVE G6A,  59,  67, 152,  90, 142,  
		MOVE G6D,  94, 130,  71, 110,  99,  
		MOVE G6B,  99, 145,  62,  ,  ,  
		MOVE G6C, 101, 101, 101,  ,  ,  
		WAIT
		'2
		MOVE G6A,  59,  67, 152,  90, 142,  
		MOVE G6D,  94, 130,  71, 110,  99,  
		MOVE G6B,  99, 180, 190,  ,  ,  
		MOVE G6C, 101, 101, 101,  ,  ,  
		WAIT
		'3
		MOVE G6A,  59,  67, 152,  90, 142,  
		MOVE G6D,  94, 130,  71, 110,  99,  
		MOVE G6B,  99,  90, 173,  ,  ,  
		MOVE G6C, 101, 101, 101,  ,  ,  
		WAIT
		'4
		MOVE G6A,  59,  67, 152,  90, 142,  
		MOVE G6D,  94, 130,  71, 110,  99,  
		MOVE G6B,  99,  71,  62,  ,  ,  
		MOVE G6C, 101, 101, 101,  ,  ,  
		WAIT
	NEXT i
	'摆右手
	FOR i = 1 TO 2
		'1
		MOVE G6D,  59,  67, 152,  90, 142,  
		MOVE G6A,  94, 130,  71, 110,  99,  
		MOVE G6C,  99, 145,  62,  ,  ,  
		MOVE G6B, 101, 101, 101,  ,  ,  
		WAIT
		'2
		MOVE G6D,  59,  67, 152,  90, 142,  
		MOVE G6A,  94, 130,  71, 110,  99,  
		MOVE G6C,  99, 180, 190,  ,  ,  
		MOVE G6B, 101, 101, 101,  ,  ,  
		WAIT
		'3
		MOVE G6D,  59,  67, 152,  90, 142,  
		MOVE G6A,  94, 130,  71, 110,  99,  
		MOVE G6C,  99,  90, 173,  ,  ,  
		MOVE G6B, 101, 101, 101,  ,  ,  
		WAIT
		'4
		MOVE G6D,  59,  67, 152,  90, 142,  
		MOVE G6A,  94, 130,  71, 110,  99,  
		MOVE G6C,  99,  71,  62,  ,  ,  
		MOVE G6B, 101, 101, 101,  ,  ,  
		WAIT
	NEXT i
	
	
	
	
	

RETURN




MAIN: '


    ' 'GOSUB LOW_Voltage
    GOSUB FB_tilt_check
    GOSUB LR_tilt_check


    ERX 4800,A,MAIN				'通过RX端口接收RS232信号;4800:端口速度；A:端口号
    A_old = A
    '根据变量的值条件转移,A=0跳转到MAIN，A=1跳转到'...
    ON A GOTO MAIN,KEY1,KEY2,KEY3,KEY4,KEY5',KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,KEY16,KEY17,KEY18 ,KEY19,KEY20,KEY21,KEY22,KEY23,KEY24,KEY25',KEY26,KEY27,KEY28 ,KEY29,KEY30,KEY31,KEY32
    '
    '    GOTO MAIN					跳转到MAIN	
    '*******************************************
    '*******************************************
    '*******************************************
KEY1:
    GOSUB FB_tilt_check
    GOSUB LR_tilt_check


    GOTO RX_EXIT
    '*******************************************
KEY2:

    'GOSUB StandState
    'GOSUB Code2


    GOTO RX_EXIT
   
    '*******************************************
KEY3:

	'GOSUB MyCode
	'GOSUB now


    GOTO RX_EXIT


    '************************************************
    
KEY4:
	GOSUB Song

	'GOSUB now


    GOTO RX_EXIT

key5:
	GOSUB now
	GOTO RX_EXIT


RX_EXIT:

    ERX 4800, A, MAIN

    GOTO RX_EXIT
FB_tilt_check:
    '  IF tilt_check_failure = 0 THEN
    '        RETURN
    '    ENDIF
    FOR i = 0 TO COUNT_MAX
        A = AD(FB_tilt_AD_port)	'将AD端口的模拟信号赋给A
        IF A > 250 OR A < 5 THEN RETURN '返回11041行
        IF A > MIN AND A < MAX THEN RETURN '返回11041行
        DELAY tilt_time_check
    NEXT i

    IF A < MIN THEN GOSUB tilt_front '执行4654行
    IF A > MAX THEN GOSUB tilt_back '执行4660行

    GOSUB GOSUB_RX_EXIT '执行291行

    RETURN '返回11041行

LR_tilt_check:
    '  IF tilt_check_failure = 0 THEN
    '        RETURN
    '    ENDIF
    FOR i = 0 TO COUNT_MAX
        B = AD(LR_tilt_AD_port)	'
        IF B > 250 OR B < 5 THEN RETURN
        IF B > MIN AND B < MAX THEN RETURN
        DELAY tilt_time_check
    NEXT i

    IF B < MIN OR B > MAX THEN
        SPEED 8
        MOVE G6B,140,  40,  80
        MOVE G6C,140,  40,  80
        WAIT
        GOSUB standard_pose	
        RETURN

    ENDIF
    RETURN '返回11042行

GOSUB_RX_EXIT:

    ERX 4800, A, GOSUB_RX_EXIT2'蓝牙发射频率2

    GOTO GOSUB_RX_EXIT
GOSUB_RX_EXIT2:
    RETURN '返回原程序（1.4651行)
tilt_front:
    A = AD(FB_tilt_AD_port)  '将AD端口的模拟信号赋给A
    'IF A < MIN THEN GOSUB front_standup
    IF A < MIN THEN  GOSUB back_standup '执行605行
    RETURN '返回4648行
    '**************************************************
tilt_back:
    A = AD(FB_tilt_AD_port)
    'IF A > MAX THEN GOSUB back_standup
    IF A > MAX THEN GOSUB front_standup '执行661行
    RETURN '返回4650行
    '**************************************************
back_standup: '后倒自动站立

    GOSUB Arm_motor_mode1
    GOSUB Leg_motor_mode1


    SPEED 15
    MOVE G6A,100, 150, 170,  40, 100
    MOVE G6D,100, 150, 170,  40, 100
    MOVE G6B, 150, 150,  45
    MOVE G6C, 150, 150,  45
    WAIT

    SPEED 15
    MOVE G6A,  100, 155,  110, 120, 100
    MOVE G6D,  100, 155,  110, 120, 100
    MOVE G6B, 190, 80,  15
    MOVE G6C, 190, 80,  15
    WAIT

    GOSUB Leg_motor_mode2
    SPEED 15	
    MOVE G6A,  100, 165,  27, 162, 100
    MOVE G6D,  100, 165,  27, 162, 100
    MOVE G6B,  155, 15, 90
    MOVE G6C,  155, 15, 90
    WAIT


    SPEED 10	
    MOVE G6A,  100, 150,  27, 162, 100
    MOVE G6D,  100, 150,  27, 162, 100
    MOVE G6B,  140, 15, 90
    MOVE G6C,  140, 15, 90
    WAIT


    SPEED 6
    MOVE G6A,  100, 138,  27, 155, 100
    MOVE G6D,  100, 138,  27, 155, 100
    MOVE G6B, 113,  30, 80
    MOVE G6C, 113,  30, 80
    WAIT

    DELAY 100
    SPEED 10
    GOSUB stand_pose
    GOSUB Leg_motor_mode1

    RETURN
front_standup: '后倒自动站立
    GOSUB Arm_motor_mode1
    GOSUB Leg_motor_mode1


    SPEED 15
    MOVE G6A,100, 15,  70, 140, 100,
    MOVE G6D,100, 15,  70, 140, 100,
    MOVE G6B,20,  140,  15
    MOVE G6C,20,  140,  15
    WAIT

    SPEED 12
    MOVE G6A,100, 136,  35, 80, 100,
    MOVE G6D,100, 136,  35, 80, 100,
    MOVE G6B,20,  30,  80
    MOVE G6C,20,  30,  80
    WAIT

    SPEED 12
    MOVE G6A,100, 165,  70, 30, 100,
    MOVE G6D,100, 165,  70, 30, 100,
    MOVE G6B,30,  20,  95
    MOVE G6C,30,  20,  95
    WAIT

    SPEED 10
    MOVE G6A,100, 165,  45, 90, 100,
    MOVE G6D,100, 165,  45, 90, 100,
    MOVE G6B,130,  50,  60
    MOVE G6C,130,  50,  60
    WAIT

    SPEED 10
    GOSUB stand_pose

    RETURN

    '******************************************

Arm_motor_mode1:
    MOTORMODE G6B,1,1,1
    MOTORMODE G6C,1,1,1
    RETURN
Leg_motor_mode1:
    MOTORMODE G6A,1,1,1,1,1
    MOTORMODE G6D,1,1,1,1,1
    RETURN
Leg_motor_mode2:
    MOTORMODE G6A,2,2,2,2,2
    MOTORMODE G6D,2,2,2,2,2
    RETURN


start_music:
    TEMPO 220
    MUSIC "O23EAB7EA>3#C"
    RETURN
    '************************************************
stand_pose:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT
    pose = 0
    grip_pose = 0
    RETURN
standard_pose:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT
    RETURN
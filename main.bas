
DIM tilt_CNT AS BYTE
DIM grip_pose AS BYTE
DIM Action_mode AS BYTE

DIM motorONOFF AS BYTE'��I������ֽ���
DIM I AS BYTE'��I������ֽ���
DIM J AS BYTE'��J������ֽ���
DIM K AS BYTE
DIM pose AS BYTE

DIM A AS BYTE
DIM A_old AS BYTE
DIM B AS BYTE


'**** tilt_port *****

CONST FB_tilt_AD_port = 2'ǰ����б��ַ ��
CONST LR_tilt_AD_port = 3'������б��ַ ��

'**** 2012 NEW tilt Sensors *****��2012�µ���б������
CONST tilt_time_check = 5  '��бʱ����
CONST min = 61			'��Сֵ
CONST max = 107			'���ֵ
CONST COUNT_MAX = 20'����
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
StandState: '����վ��״̬
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C, 100,  30,  80,  ,  ,  
	WAIT
	RETURN
MyBackStandUp:'ǰ���Զ�վ��

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

MyCode:
	GOSUB StandState
	'����
	SPEED 5
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C,  70, 160, 190,  ,  ,  
	WAIT
	SPEED 10
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 100,  30,  80,  ,  ,  
	MOVE G6C,  70, 140, 190,  ,  ,  
	WAIT
	DELAY 300
	'ϴˢˢ
	FOR k = 1 TO 2
		'������  ������
		MOVE G6A, 100,  76, 145,  93, 100,  
		MOVE G6D, 100,  76, 145,  93, 100,  
		MOVE G6B, 145,  10,  65,  ,  ,  
		MOVE G6C, 185,  10,  65,  ,  ,  
		DELAY 300
		SPEED 15
		FOR i = 1 TO 2
			FOR j = 1 TO 3
				'������  ������
				MOVE G6A, 100,  76, 145,  93, 100,  
				MOVE G6D, 100,  76, 145,  93, 100,  
				MOVE G6B, 185,  10,  65,  ,  ,  
				MOVE G6C, 145,  10,  65,  ,  ,  
				WAIT
				'������  ������
				MOVE G6A, 100,  76, 145,  93, 100,  
				MOVE G6D, 100,  76, 145,  93, 100,  
				MOVE G6B, 145,  10,  65,  ,  ,  
				MOVE G6C, 185,  10,  65,  ,  ,  
				WAIT
			NEXT j
			DELAY 300
		NEXT i
		'tutu
		'˫����
		MOVE G6A, 100,  76, 145,  93, 100,  
		MOVE G6D, 100,  76, 145,  93, 100,  
		MOVE G6B, 164,  25,  35,  ,  ,  
		MOVE G6C, 164,  25,  35,  ,  ,  
		SPEED 10
		FOR i = 1 TO 2
			'˫����
			MOVE G6A, 90,  76, 145,  93, 100,  
			MOVE G6D, 90,  76, 145,  93, 100,  
			MOVE G6B, 164,  35,  15,  ,  ,  
			MOVE G6C, 164,  35,  15,  ,  ,  
			WAIT
			'˫����
			MOVE G6A, 100,  76, 145,  93, 100,  
			MOVE G6D, 100,  76, 145,  93, 100,  
			MOVE G6B, 164,  25,  35,  ,  ,  
			MOVE G6C, 164,  25,  35,  ,  , 
			WAIT
		NEXT i
		DELAY 300
	NEXT k
	
	GOSUB StandState
	SPEED 5
	'�� ����ƽ��
	MOVE G6A,  93, 135,  61, 119, 103,  
	MOVE G6D,  93, 135,  61, 119, 103,  
	MOVE G6B, 100, 100, 100,  ,  ,  
	MOVE G6C, 100, 100, 100,  ,  ,  
	WAIT
	FOR i = 1 TO 2
		'������  ������  ��������
		MOVE G6A, 106, 121,  24, 166, 147,  
		MOVE G6D,  63,  76, 139,  94,  83,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		'�� ����ƽ��
		MOVE G6A,  93, 135,  61, 119, 103,  
		MOVE G6D,  93, 135,  61, 119, 103,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 500
		'������  ������  ��������
		MOVE G6A,  63,  76, 139,  94,  83,  
		MOVE G6D, 106, 121,  24, 166, 147,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 500
		'�� ����ƽ��
		MOVE G6A,  93, 135,  61, 119, 103,  
		MOVE G6D,  93, 135,  61, 119, 103,  
		MOVE G6B, 100, 100, 100,  ,  ,  
		MOVE G6C, 100, 100, 100,  ,  ,  
		WAIT
		DELAY 500
	NEXT i

	GOSUB StandState
	SPEED 10
	'���Գ�
	'�� ����ǰ��
	MOVE G6A, 100, 166,  20, 114,  99,  
	MOVE G6D, 100, 166,  20, 114,  99,  
	MOVE G6B, 186,  10,  95,  ,  ,  
	MOVE G6C, 186,  10,  95,  ,  ,  
	WAIT
	'������ ��ǰſ ������
	MOVE G6A, 100, 165,  67, 133,  98,  
	MOVE G6D, 100, 165,  67, 133,  98,  
	MOVE G6B, 186,  10,  95,  ,  ,  
	MOVE G6C, 186,  10,  95,  ,  ,  
	WAIT
	FOR i = 1 TO 2
		'����
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 190,  57,  11,  ,  ,  
		MOVE G6C, 190,  57,  11,  ,  ,  	
		WAIT
		DELAY 300
		'��
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 178,  11,  97,  ,  ,  
		MOVE G6C, 178,  11,  97,  ,  ,  
		DELAY 300
	NEXT i
	FOR i = 1 TO 2
		'����
		MOVE G6A, 100,  76, 145,  93, 100,  
		MOVE G6D, 100,  76, 145,  93, 100,  
		MOVE G6B, 190, 112,  20,  ,  ,  
		MOVE G6C, 190, 112,  20,  ,  ,  
		WAIT
		DELAY 300
		'��
		MOVE G6A, 100,  64, 178,  84,  97,  
		MOVE G6D, 100,  64, 178,  84,  97,  
		MOVE G6B, 178,  11,  97,  ,  ,  
		MOVE G6C, 178,  11,  97,  ,  ,  
		DELAY 300
	NEXT i
	'����
	MOVE G6A, 100,  76, 145,  93, 100,  
	MOVE G6D, 100,  76, 145,  93, 100,  
	MOVE G6B, 190, 112,  20,  ,  ,  
	MOVE G6C, 190, 112,  20,  ,  ,  
	WAIT
	DELAY 300
	'����
	GOSUB MyBackStandUp
	

	GOSUB StandState
	RETURN


MAIN: '


    ' 'GOSUB LOW_Voltage
    GOSUB FB_tilt_check
    GOSUB LR_tilt_check


    ERX 4800,A,MAIN				'ͨ��RX�˿ڽ���RS232�ź�;4800:�˿��ٶȣ�A:�˿ں�
    A_old = A
    '���ݱ�����ֵ����ת��,A=0��ת��MAIN��A=1��ת��'...
    ON A GOTO MAIN,KEY1,KEY2,KEY3',KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,KEY16,KEY17,KEY18 ,KEY19,KEY20,KEY21,KEY22,KEY23,KEY24,KEY25',KEY26,KEY27,KEY28 ,KEY29,KEY30,KEY31,KEY32
    '
    '    GOTO MAIN					��ת��MAIN	
    '*******************************************
    '*******************************************
    '*******************************************
KEY1:
    GOSUB FB_tilt_check
    GOSUB LR_tilt_check


    GOTO RX_EXIT
    '*******************************************
KEY2:

    GOSUB StandState


    GOTO RX_EXIT
   
    '*******************************************
KEY3:

	'GOSUB MyCode
	GOSUB now


    GOTO RX_EXIT


    '************************************************

RX_EXIT:

    ERX 4800, A, MAIN

    GOTO RX_EXIT
FB_tilt_check:
    '  IF tilt_check_failure = 0 THEN
    '        RETURN
    '    ENDIF
    FOR i = 0 TO COUNT_MAX
        A = AD(FB_tilt_AD_port)	'��AD�˿ڵ�ģ���źŸ���A
        IF A > 250 OR A < 5 THEN RETURN '����11041��
        IF A > MIN AND A < MAX THEN RETURN '����11041��
        DELAY tilt_time_check
    NEXT i

    IF A < MIN THEN GOSUB tilt_front 'ִ��4654��
    IF A > MAX THEN GOSUB tilt_back 'ִ��4660��

    GOSUB GOSUB_RX_EXIT 'ִ��291��

    RETURN '����11041��

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
    RETURN '����11042��

GOSUB_RX_EXIT:

    ERX 4800, A, GOSUB_RX_EXIT2'��������Ƶ��2

    GOTO GOSUB_RX_EXIT
GOSUB_RX_EXIT2:
    RETURN '����ԭ����1.4651��)
tilt_front:
    A = AD(FB_tilt_AD_port)  '��AD�˿ڵ�ģ���źŸ���A
    'IF A < MIN THEN GOSUB front_standup
    IF A < MIN THEN  GOSUB back_standup 'ִ��605��
    RETURN '����4648��
    '**************************************************
tilt_back:
    A = AD(FB_tilt_AD_port)
    'IF A > MAX THEN GOSUB back_standup
    IF A > MAX THEN GOSUB front_standup 'ִ��661��
    RETURN '����4650��
    '**************************************************
back_standup: '���Զ�վ��

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
front_standup: '���Զ�վ��
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
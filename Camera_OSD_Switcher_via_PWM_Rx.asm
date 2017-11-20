
_DisplayValueLED:

;Camera_OSD_Switcher_via_PWM_Rx.mbas,51 :: 		Dim Temp as Word
;Camera_OSD_Switcher_via_PWM_Rx.mbas,52 :: 		If P1 = 999 then   'Just flash LEDs, program executed the call instruction.
	MOVF       FARG_DisplayValueLED_P1+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED122
	MOVLW      231
	XORWF      FARG_DisplayValueLED_P1+0, 0
L__DisplayValueLED122:
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED2
;Camera_OSD_Switcher_via_PWM_Rx.mbas,53 :: 		For i = 1 to 60
	MOVLW      1
	MOVWF      _i+0
L__DisplayValueLED5:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,54 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED123:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED124
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED123
L__DisplayValueLED124:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,55 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__DisplayValueLED9:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED9
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED9
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,56 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED125:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED126
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED125
L__DisplayValueLED126:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,57 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__DisplayValueLED10:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED10
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED10
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,58 :: 		Next i
	MOVF       _i+0, 0
	XORLW      60
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED8
	INCF       _i+0, 1
	GOTO       L__DisplayValueLED5
L__DisplayValueLED8:
	GOTO       L__DisplayValueLED3
;Camera_OSD_Switcher_via_PWM_Rx.mbas,59 :: 		else                       'Display Count of Param P1
L__DisplayValueLED2:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,60 :: 		temp = P1 / 1000
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_DisplayValueLED_P1+0, 0
	MOVWF      R0+0
	MOVF       FARG_DisplayValueLED_P1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      DisplayValueLED_Temp+0
	MOVF       R0+1, 0
	MOVWF      DisplayValueLED_Temp+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,61 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED127:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED128
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED127
L__DisplayValueLED128:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,62 :: 		Delay_ms(3000)       'Pulse for start of 1000's indicator
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__DisplayValueLED11:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED11
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED11
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED11
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,63 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED129:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED130
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED129
L__DisplayValueLED130:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,64 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED12:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED12
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED12
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED12
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,65 :: 		If temp > 0 then             'Count the 1000's
	MOVF       DisplayValueLED_Temp+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED131
	MOVF       DisplayValueLED_Temp+0, 0
	SUBLW      0
L__DisplayValueLED131:
	BTFSC      STATUS+0, 0
	GOTO       L__DisplayValueLED14
;Camera_OSD_Switcher_via_PWM_Rx.mbas,67 :: 		for i = 1 to temp
	MOVLW      1
	MOVWF      _i+0
L__DisplayValueLED16:
	MOVLW      0
	SUBWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED132
	MOVF       _i+0, 0
	SUBWF      DisplayValueLED_Temp+0, 0
L__DisplayValueLED132:
	BTFSS      STATUS+0, 0
	GOTO       L__DisplayValueLED20
;Camera_OSD_Switcher_via_PWM_Rx.mbas,68 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED133:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED134
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED133
L__DisplayValueLED134:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,69 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED21:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED21
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED21
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED21
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,70 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED135:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED136
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED135
L__DisplayValueLED136:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,71 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED22:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED22
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED22
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED22
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,72 :: 		Next i
	MOVLW      0
	XORWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED137
	MOVF       DisplayValueLED_Temp+0, 0
	XORWF      _i+0, 0
L__DisplayValueLED137:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED20
	INCF       _i+0, 1
	GOTO       L__DisplayValueLED16
L__DisplayValueLED20:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,73 :: 		Delay_ms(750)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L__DisplayValueLED23:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED23
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED23
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED23
	NOP
	NOP
	GOTO       L__DisplayValueLED15
;Camera_OSD_Switcher_via_PWM_Rx.mbas,74 :: 		Else                          'No 1000's
L__DisplayValueLED14:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,75 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED138:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED139
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED138
L__DisplayValueLED139:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,76 :: 		Delay_ms(75)
	MOVLW      98
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L__DisplayValueLED24:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED24
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED24
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,77 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED140:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED141
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED140
L__DisplayValueLED141:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,78 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED25:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED25
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED25
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED25
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,79 :: 		End if
L__DisplayValueLED15:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,80 :: 		P1 = P1 - (temp * 1000)
	MOVF       DisplayValueLED_Temp+0, 0
	MOVWF      R0+0
	MOVF       DisplayValueLED_Temp+1, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      FARG_DisplayValueLED_P1+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_DisplayValueLED_P1+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_DisplayValueLED_P1+0
	MOVF       R0+1, 0
	MOVWF      FARG_DisplayValueLED_P1+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,81 :: 		temp = P1 / 100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      DisplayValueLED_Temp+0
	MOVF       R0+1, 0
	MOVWF      DisplayValueLED_Temp+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,82 :: 		SetBit(OutputPort1,OutputBit1)          'GP1 to go high.
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED142:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED143
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED142
L__DisplayValueLED143:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,83 :: 		Delay_ms(1000)       'Pulse for start of 100's indicator
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED26:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED26
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED26
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED26
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,84 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED144:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED145
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED144
L__DisplayValueLED145:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,85 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED27:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED27
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED27
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED27
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,86 :: 		If temp > 0 then             'Count the 100's
	MOVF       DisplayValueLED_Temp+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED146
	MOVF       DisplayValueLED_Temp+0, 0
	SUBLW      0
L__DisplayValueLED146:
	BTFSC      STATUS+0, 0
	GOTO       L__DisplayValueLED29
;Camera_OSD_Switcher_via_PWM_Rx.mbas,88 :: 		for i = 1 to temp
	MOVLW      1
	MOVWF      _i+0
L__DisplayValueLED31:
	MOVLW      0
	SUBWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED147
	MOVF       _i+0, 0
	SUBWF      DisplayValueLED_Temp+0, 0
L__DisplayValueLED147:
	BTFSS      STATUS+0, 0
	GOTO       L__DisplayValueLED35
;Camera_OSD_Switcher_via_PWM_Rx.mbas,89 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED148:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED149
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED148
L__DisplayValueLED149:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,90 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED36:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED36
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED36
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED36
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,91 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED150:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED151
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED150
L__DisplayValueLED151:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,92 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED37:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED37
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED37
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED37
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,93 :: 		Next i
	MOVLW      0
	XORWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED152
	MOVF       DisplayValueLED_Temp+0, 0
	XORWF      _i+0, 0
L__DisplayValueLED152:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED35
	INCF       _i+0, 1
	GOTO       L__DisplayValueLED31
L__DisplayValueLED35:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,94 :: 		Delay_ms(750)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L__DisplayValueLED38:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED38
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED38
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED38
	NOP
	NOP
	GOTO       L__DisplayValueLED30
;Camera_OSD_Switcher_via_PWM_Rx.mbas,95 :: 		Else                          'No 100's
L__DisplayValueLED29:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,96 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED153:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED154
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED153
L__DisplayValueLED154:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,97 :: 		Delay_ms(75)
	MOVLW      98
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L__DisplayValueLED39:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED39
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED39
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,98 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED155:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED156
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED155
L__DisplayValueLED156:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,99 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED40:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED40
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED40
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED40
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,100 :: 		End if
L__DisplayValueLED30:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,101 :: 		P1 = P1 - (temp * 100)
	MOVF       DisplayValueLED_Temp+0, 0
	MOVWF      R0+0
	MOVF       DisplayValueLED_Temp+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      FARG_DisplayValueLED_P1+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_DisplayValueLED_P1+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_DisplayValueLED_P1+0
	MOVF       R0+1, 0
	MOVWF      FARG_DisplayValueLED_P1+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,102 :: 		temp = P1 / 10
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      DisplayValueLED_Temp+0
	MOVF       R0+1, 0
	MOVWF      DisplayValueLED_Temp+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,103 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED157:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED158
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED157
L__DisplayValueLED158:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,104 :: 		Delay_ms(1000)       'Pulse for start of 10's indicator
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED41:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED41
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED41
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED41
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,105 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED159:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED160
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED159
L__DisplayValueLED160:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,106 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED42:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED42
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED42
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED42
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,107 :: 		If temp > 0 then             'Count the 10's
	MOVF       DisplayValueLED_Temp+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED161
	MOVF       DisplayValueLED_Temp+0, 0
	SUBLW      0
L__DisplayValueLED161:
	BTFSC      STATUS+0, 0
	GOTO       L__DisplayValueLED44
;Camera_OSD_Switcher_via_PWM_Rx.mbas,109 :: 		for i = 1 to temp
	MOVLW      1
	MOVWF      _i+0
L__DisplayValueLED46:
	MOVLW      0
	SUBWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED162
	MOVF       _i+0, 0
	SUBWF      DisplayValueLED_Temp+0, 0
L__DisplayValueLED162:
	BTFSS      STATUS+0, 0
	GOTO       L__DisplayValueLED50
;Camera_OSD_Switcher_via_PWM_Rx.mbas,110 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED163:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED164
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED163
L__DisplayValueLED164:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,111 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED51:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED51
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED51
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED51
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,112 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED165:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED166
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED165
L__DisplayValueLED166:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,113 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED52:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED52
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED52
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED52
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,114 :: 		Next i
	MOVLW      0
	XORWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED167
	MOVF       DisplayValueLED_Temp+0, 0
	XORWF      _i+0, 0
L__DisplayValueLED167:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED50
	INCF       _i+0, 1
	GOTO       L__DisplayValueLED46
L__DisplayValueLED50:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,115 :: 		Delay_ms(750)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L__DisplayValueLED53:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED53
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED53
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED53
	NOP
	NOP
	GOTO       L__DisplayValueLED45
;Camera_OSD_Switcher_via_PWM_Rx.mbas,116 :: 		Else                          'No 10's
L__DisplayValueLED44:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,117 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED168:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED169
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED168
L__DisplayValueLED169:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,118 :: 		Delay_ms(75)
	MOVLW      98
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L__DisplayValueLED54:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED54
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED54
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,119 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED170:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED171
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED170
L__DisplayValueLED171:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,120 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED55:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED55
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED55
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED55
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,121 :: 		End if
L__DisplayValueLED45:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,122 :: 		P1 = P1 - (temp * 10)
	MOVF       DisplayValueLED_Temp+0, 0
	MOVWF      R0+0
	MOVF       DisplayValueLED_Temp+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      FARG_DisplayValueLED_P1+0, 0
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_DisplayValueLED_P1+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_DisplayValueLED_P1+0
	MOVF       R0+1, 0
	MOVWF      FARG_DisplayValueLED_P1+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,123 :: 		temp = P1
	MOVF       R0+0, 0
	MOVWF      DisplayValueLED_Temp+0
	MOVF       R0+1, 0
	MOVWF      DisplayValueLED_Temp+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,124 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED172:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED173
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED172
L__DisplayValueLED173:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,125 :: 		Delay_ms(1000)       'Pulse for start of 1's indicator
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED56:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED56
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED56
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED56
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,126 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED174:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED175
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED174
L__DisplayValueLED175:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,127 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED57:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED57
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED57
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED57
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,128 :: 		If temp > 0 then             'Count the 1's
	MOVF       DisplayValueLED_Temp+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED176
	MOVF       DisplayValueLED_Temp+0, 0
	SUBLW      0
L__DisplayValueLED176:
	BTFSC      STATUS+0, 0
	GOTO       L__DisplayValueLED59
;Camera_OSD_Switcher_via_PWM_Rx.mbas,130 :: 		for i = 1 to temp
	MOVLW      1
	MOVWF      _i+0
L__DisplayValueLED61:
	MOVLW      0
	SUBWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED177
	MOVF       _i+0, 0
	SUBWF      DisplayValueLED_Temp+0, 0
L__DisplayValueLED177:
	BTFSS      STATUS+0, 0
	GOTO       L__DisplayValueLED65
;Camera_OSD_Switcher_via_PWM_Rx.mbas,131 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED178:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED179
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED178
L__DisplayValueLED179:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,132 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED66:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED66
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED66
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED66
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,133 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED180:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED181
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED180
L__DisplayValueLED181:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,134 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__DisplayValueLED67:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED67
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED67
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED67
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,135 :: 		Next i
	MOVLW      0
	XORWF      DisplayValueLED_Temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__DisplayValueLED182
	MOVF       DisplayValueLED_Temp+0, 0
	XORWF      _i+0, 0
L__DisplayValueLED182:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED65
	INCF       _i+0, 1
	GOTO       L__DisplayValueLED61
L__DisplayValueLED65:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,136 :: 		Delay_ms(750)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L__DisplayValueLED68:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED68
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED68
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED68
	NOP
	NOP
	GOTO       L__DisplayValueLED60
;Camera_OSD_Switcher_via_PWM_Rx.mbas,137 :: 		Else                          'No 1's
L__DisplayValueLED59:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,138 :: 		SetBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED183:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED184
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED183
L__DisplayValueLED184:
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,139 :: 		Delay_ms(75)
	MOVLW      98
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L__DisplayValueLED69:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED69
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED69
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,140 :: 		ClearBit(OutputPort1,OutputBit1)
	MOVF       FARG_DisplayValueLED_OutputBit1+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__DisplayValueLED185:
	BTFSC      STATUS+0, 2
	GOTO       L__DisplayValueLED186
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__DisplayValueLED185
L__DisplayValueLED186:
	COMF       R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       FARG_DisplayValueLED_OutputPort1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,141 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__DisplayValueLED70:
	DECFSZ     R13+0, 1
	GOTO       L__DisplayValueLED70
	DECFSZ     R12+0, 1
	GOTO       L__DisplayValueLED70
	DECFSZ     R11+0, 1
	GOTO       L__DisplayValueLED70
	NOP
	NOP
;Camera_OSD_Switcher_via_PWM_Rx.mbas,142 :: 		End if
L__DisplayValueLED60:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,143 :: 		End if
L__DisplayValueLED3:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,144 :: 		End Sub
L_end_DisplayValueLED:
	RETURN
; end of _DisplayValueLED

_fail_safe:

;Camera_OSD_Switcher_via_PWM_Rx.mbas,146 :: 		Sub Procedure fail_safe()
;Camera_OSD_Switcher_via_PWM_Rx.mbas,147 :: 		GPIO.B0 = 1
	BSF        GPIO+0, 0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,148 :: 		GPIO.B5 = 1
	BSF        GPIO+0, 5
;Camera_OSD_Switcher_via_PWM_Rx.mbas,149 :: 		GPIO.B1 = 1
	BSF        GPIO+0, 1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,150 :: 		GPIO.B4 = 0
	BCF        GPIO+0, 4
;Camera_OSD_Switcher_via_PWM_Rx.mbas,151 :: 		GPIO.B2 = 0
	BCF        GPIO+0, 2
;Camera_OSD_Switcher_via_PWM_Rx.mbas,152 :: 		End Sub
L_end_fail_safe:
	RETURN
; end of _fail_safe

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Camera_OSD_Switcher_via_PWM_Rx.mbas,154 :: 		Sub Procedure interrupt()
;Camera_OSD_Switcher_via_PWM_Rx.mbas,155 :: 		If INTCON.GPIF = 1 Then
	BTFSS      INTCON+0, 0
	GOTO       L__interrupt74
;Camera_OSD_Switcher_via_PWM_Rx.mbas,157 :: 		RC_Pulse = 0
	CLRF       _RC_Pulse+0
	CLRF       _RC_Pulse+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,158 :: 		While TestBit(GPIO,3)  = 1
L__interrupt77:
	CLRF       R1+0
	BTFSS      GPIO+0, 3
	GOTO       L__interrupt81
	MOVLW      1
	MOVWF      R1+0
L__interrupt81:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt78
;Camera_OSD_Switcher_via_PWM_Rx.mbas,159 :: 		RC_Pulse = RC_Pulse + 1
	INCF       _RC_Pulse+0, 1
	BTFSC      STATUS+0, 2
	INCF       _RC_Pulse+1, 1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,160 :: 		Wend
	GOTO       L__interrupt77
L__interrupt78:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,166 :: 		RC_Pulse = RC_Pulse * 14.2858
	MOVF       _RC_Pulse+0, 0
	MOVWF      R0+0
	MOVF       _RC_Pulse+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      163
	MOVWF      R4+0
	MOVLW      146
	MOVWF      R4+1
	MOVLW      100
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _RC_Pulse+0
	MOVF       R0+1, 0
	MOVWF      _RC_Pulse+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,179 :: 		If RC_Pulse <=1500 then
	MOVLW      128
	XORLW      5
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt190
	MOVF       R0+0, 0
	SUBLW      220
L__interrupt190:
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt83
;Camera_OSD_Switcher_via_PWM_Rx.mbas,182 :: 		GPIO.B2 = 0
	BCF        GPIO+0, 2
;Camera_OSD_Switcher_via_PWM_Rx.mbas,183 :: 		GPIO.B1 = 1
	BSF        GPIO+0, 1
	GOTO       L__interrupt84
;Camera_OSD_Switcher_via_PWM_Rx.mbas,184 :: 		Else
L__interrupt83:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,187 :: 		GPIO.B1 = 0
	BCF        GPIO+0, 1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,188 :: 		GPIO.B2 = 1
	BSF        GPIO+0, 2
;Camera_OSD_Switcher_via_PWM_Rx.mbas,189 :: 		End If
L__interrupt84:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,191 :: 		If RC_Pulse >= 1250 then
	MOVLW      128
	XORWF      _RC_Pulse+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt191
	MOVLW      226
	SUBWF      _RC_Pulse+0, 0
L__interrupt191:
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt86
;Camera_OSD_Switcher_via_PWM_Rx.mbas,192 :: 		If RC_Pulse <= 1750 then
	MOVLW      128
	XORLW      6
	MOVWF      R0+0
	MOVLW      128
	XORWF      _RC_Pulse+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt192
	MOVF       _RC_Pulse+0, 0
	SUBLW      214
L__interrupt192:
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt89
;Camera_OSD_Switcher_via_PWM_Rx.mbas,195 :: 		GPIO.B5 = 0
	BCF        GPIO+0, 5
;Camera_OSD_Switcher_via_PWM_Rx.mbas,196 :: 		GPIO.B4 = 1
	BSF        GPIO+0, 4
	GOTO       L__interrupt90
;Camera_OSD_Switcher_via_PWM_Rx.mbas,197 :: 		Else
L__interrupt89:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,200 :: 		GPIO.B4 = 0
	BCF        GPIO+0, 4
;Camera_OSD_Switcher_via_PWM_Rx.mbas,201 :: 		GPIO.B5 = 1
	BSF        GPIO+0, 5
;Camera_OSD_Switcher_via_PWM_Rx.mbas,202 :: 		End If
L__interrupt90:
	GOTO       L__interrupt87
;Camera_OSD_Switcher_via_PWM_Rx.mbas,203 :: 		Else
L__interrupt86:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,206 :: 		GPIO.B4 = 0
	BCF        GPIO+0, 4
;Camera_OSD_Switcher_via_PWM_Rx.mbas,207 :: 		GPIO.B5 = 1
	BSF        GPIO+0, 5
;Camera_OSD_Switcher_via_PWM_Rx.mbas,208 :: 		End If
L__interrupt87:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,220 :: 		counter = 0
	CLRF       _counter+0
	CLRF       _counter+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,221 :: 		While TestBit(GPIO,3)  = 0
L__interrupt92:
	CLRF       R1+0
	BTFSS      GPIO+0, 3
	GOTO       L__interrupt96
	MOVLW      1
	MOVWF      R1+0
L__interrupt96:
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt93
;Camera_OSD_Switcher_via_PWM_Rx.mbas,222 :: 		inc(counter)
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,223 :: 		If counter >=7000 then ' about 1 second checks
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      27
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt193
	MOVLW      88
	SUBWF      _counter+0, 0
L__interrupt193:
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt98
;Camera_OSD_Switcher_via_PWM_Rx.mbas,224 :: 		fail_safe
	CALL       _fail_safe+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,225 :: 		counter = 0
	CLRF       _counter+0
	CLRF       _counter+1
L__interrupt98:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,227 :: 		Wend
	GOTO       L__interrupt92
L__interrupt93:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,228 :: 		While TestBit(GPIO,3) = 1 ' will drop through this if no Rx Signal
L__interrupt101:
	CLRF       R1+0
	BTFSS      GPIO+0, 3
	GOTO       L__interrupt105
	MOVLW      1
	MOVWF      R1+0
L__interrupt105:
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt102
;Camera_OSD_Switcher_via_PWM_Rx.mbas,229 :: 		GPIO.B0 = 0 ' Turn off Fail Safe LED
	BCF        GPIO+0, 0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,230 :: 		Wend
	GOTO       L__interrupt101
L__interrupt102:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,231 :: 		counter = 0
	CLRF       _counter+0
	CLRF       _counter+1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,232 :: 		While TestBit(GPIO,3)  = 0
L__interrupt107:
	CLRF       R1+0
	BTFSS      GPIO+0, 3
	GOTO       L__interrupt111
	MOVLW      1
	MOVWF      R1+0
L__interrupt111:
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt108
;Camera_OSD_Switcher_via_PWM_Rx.mbas,233 :: 		inc(counter)
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;Camera_OSD_Switcher_via_PWM_Rx.mbas,234 :: 		If counter >=7000 then ' about 1 second checks
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      27
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt194
	MOVLW      88
	SUBWF      _counter+0, 0
L__interrupt194:
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt113
;Camera_OSD_Switcher_via_PWM_Rx.mbas,235 :: 		fail_safe
	CALL       _fail_safe+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,236 :: 		counter = 0
	CLRF       _counter+0
	CLRF       _counter+1
L__interrupt113:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,238 :: 		Wend
	GOTO       L__interrupt107
L__interrupt108:
L__interrupt74:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,240 :: 		End Sub
L_end_interrupt:
L__interrupt189:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Camera_OSD_Switcher_via_PWM_Rx.mbas,242 :: 		main:
;Camera_OSD_Switcher_via_PWM_Rx.mbas,244 :: 		OPTION_REG = %10000111     'GPIO pull ups are disabled and
	MOVLW      135
	MOVWF      OPTION_REG+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,247 :: 		CMCON0 = %00000111         'Configure comparitor pins as GPIO
	MOVLW      7
	MOVWF      CMCON0+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,248 :: 		ANSEL  = %00000000         'All are digital
	CLRF       ANSEL+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,249 :: 		ADCON0 = %00000000
	CLRF       ADCON0+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,250 :: 		TRISIO = %00000000         'All are Outputs (except B3 which is input only)
	CLRF       TRISIO+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,252 :: 		fail_safe()
	CALL       _fail_safe+0
;Camera_OSD_Switcher_via_PWM_Rx.mbas,255 :: 		INTCON.GIE = 1             'Activate Global Interrupt Enable
	BSF        INTCON+0, 7
;Camera_OSD_Switcher_via_PWM_Rx.mbas,256 :: 		INTCON.GPIE = 1            'Activate the Global Periferral Interrupt
	BSF        INTCON+0, 3
;Camera_OSD_Switcher_via_PWM_Rx.mbas,257 :: 		IOC.IOC3 = 1               'Activate the interrupt for GPIP.B3
	BSF        IOC+0, 3
;Camera_OSD_Switcher_via_PWM_Rx.mbas,260 :: 		While True
L__main117:
	GOTO       L__main117
;Camera_OSD_Switcher_via_PWM_Rx.mbas,261 :: 		Wend
L_end_main:
	GOTO       $+0
; end of _main

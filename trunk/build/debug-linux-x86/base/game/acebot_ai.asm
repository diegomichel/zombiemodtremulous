export ACEAI_StartFrame
code
proc ACEAI_StartFrame 0 4
CNSTI4 1
ARGI4
ADDRGP4 ACEIT_BuildItemNodeTable
CALLV
pop
LABELV $85
endproc ACEAI_StartFrame 0 4
export ACEAI_CheckServerCommands
proc ACEAI_CheckServerCommands 0 0
LABELV $86
endproc ACEAI_CheckServerCommands 0 0
export ACEAI_CheckSnapshotEntities
proc ACEAI_CheckSnapshotEntities 0 0
LABELV $87
endproc ACEAI_CheckSnapshotEntities 0 0
export ACEAI_Think
proc ACEAI_Think 1060 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
INDIRI4
CNSTI4 0
NEI4 $89
ADDRGP4 $91
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACESP_SetupBotState
CALLV
pop
LABELV $89
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1880
DIVI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 876
ADDP4
INDIRI4
CNSTI4 1
NEI4 $92
ADDRGP4 $94
ARGP4
ADDRLP4 1032
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1032
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1032
INDIRI4
ADDP4
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $88
ADDRGP4 $98
ARGP4
ADDRLP4 1040
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1040
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1040
INDIRI4
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $88
JUMPV
LABELV $92
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
CNSTP4 0
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $99
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 928
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
LABELV $99
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
INDIRI4
CNSTI4 3
NEI4 $101
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
INDIRF4
ADDRGP4 level+28
INDIRI4
CVIF4 4
GEF4 $101
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_PickLongRangeGoal
CALLV
pop
LABELV $101
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 ACEAI_FindEnemy
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $104
ADDRGP4 $106
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEAI_ChooseWeapon
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_Attack
CALLV
pop
ADDRGP4 $105
JUMPV
LABELV $104
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
INDIRI4
CNSTI4 3
NEI4 $107
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_Wander
CALLV
pop
ADDRGP4 $108
JUMPV
LABELV $107
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
INDIRI4
CNSTI4 1
NEI4 $109
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ACEMV_Move
CALLV
pop
LABELV $109
LABELV $108
LABELV $105
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $111
ADDRLP4 1044
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1103626240
ADDRLP4 1044
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 1048
ADDRGP4 floor
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+28
INDIRI4
CVIF4 4
ADDRLP4 1048
INDIRF4
CNSTF4 1092616192
ADDF4
CNSTF4 1065353216
ADDF4
SUBF4
CVFI4 4
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $111
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRGP4 level+28
INDIRI4
ASGNI4
LABELV $112
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $116
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 480
ADDP4
ADDP4
CNSTF4 1199570944
ADDRLP4 1052
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
LABELV $117
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $116
LABELV $88
endproc ACEAI_Think 1060 12
export ACEAI_InFront
proc ACEAI_InFront 44 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 40
ADDRGP4 AngleBetweenVectors
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1118437376
GTF4 $123
CNSTI4 1
RETI4
ADDRGP4 $120
JUMPV
LABELV $123
CNSTI4 0
RETI4
LABELV $120
endproc ACEAI_InFront 44 16
export ACEAI_Visible
proc ACEAI_Visible 100 28
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 516
ASGNI4
ADDRLP4 92
CNSTI4 20
ASGNI4
ADDRLP4 0
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 12
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 84
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRLP4 24+52
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $126
CNSTI4 1
RETI4
ADDRGP4 $125
JUMPV
LABELV $126
CNSTI4 0
RETI4
LABELV $125
endproc ACEAI_Visible 100 28
export ACEAI_PickLongRangeGoal
proc ACEAI_PickLongRangeGoal 60 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 32
CNSTI4 -1
ASGNI4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 40
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 40
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2364
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 ace_pickLongRangeGoal+12
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 28
INDIRI4
CNSTI4 -1
NEI4 $130
LABELV $133
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
CNSTI4 -1
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $130
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
ADDRLP4 16
CNSTI4 1880
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
CNSTI4 2400
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $141
ADDRGP4 $136
JUMPV
LABELV $141
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $143
ADDRGP4 $136
JUMPV
LABELV $143
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $145
ADDRGP4 $136
JUMPV
LABELV $145
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $147
ADDRGP4 $136
JUMPV
LABELV $147
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1124073472
ARGF4
CNSTI4 99
ARGI4
ADDRLP4 44
ADDRGP4 ACEND_FindClosestReachableNode
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 ACEND_FindCost
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 3212836864
EQF4 $151
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
GEF4 $149
LABELV $151
ADDRGP4 $136
JUMPV
LABELV $149
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $152
ADDRLP4 24
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $152
LABELV $136
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $138
ADDRLP4 12
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $135
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $156
ADDRLP4 32
INDIRI4
CNSTI4 -1
NEI4 $154
LABELV $156
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
CNSTI4 -1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2356
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $129
ADDRGP4 $161
ARGP4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $129
JUMPV
LABELV $154
ADDRFP4 0
INDIRP4
CNSTI4 2388
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2384
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $162
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $162
ADDRGP4 $165
ARGP4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $162
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 ACEND_SetGoal
CALLV
pop
LABELV $129
endproc ACEAI_PickLongRangeGoal 60 16
export ACEAI_PickShortRangeGoal
proc ACEAI_PickShortRangeGoal 40 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
CNSTF4 1128792064
ASGNF4
ADDRGP4 ace_pickShortRangeGoal+12
INDIRI4
CNSTI4 0
NEI4 $167
ADDRGP4 $166
JUMPV
LABELV $167
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 G_FindRadius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRGP4 $171
JUMPV
LABELV $170
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
ADDRGP4 $166
JUMPV
LABELV $173
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $175
ADDRGP4 $177
JUMPV
LABELV $175
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $180
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $182
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $178
LABELV $182
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $183
ADDRGP4 $186
ARGP4
ADDRLP4 32
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $183
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $172
JUMPV
LABELV $178
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 ACEIT_IsReachable
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $187
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 ACEAI_InFront
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $189
LABELV $189
LABELV $187
LABELV $177
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 G_FindRadius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
LABELV $171
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $170
LABELV $172
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $191
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 ace_debug+12
INDIRI4
CNSTI4 0
EQI4 $193
ADDRFP4 0
INDIRP4
CNSTI4 2348
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
INDIRP4
CVPU4 4
EQU4 $193
ADDRGP4 $196
ARGP4
ADDRLP4 32
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $193
ADDRFP4 0
INDIRP4
CNSTI4 2348
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $191
LABELV $166
endproc ACEAI_PickShortRangeGoal 40 12
export ACEAI_FindEnemy
proc ACEAI_FindEnemy 56 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 1203982208
ASGNF4
ADDRGP4 ace_attackEnemies+12
INDIRI4
CNSTI4 0
NEI4 $198
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $198
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $201
ADDRLP4 8
CNSTI4 1880
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
CNSTI4 2400
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $207
ADDRGP4 $202
JUMPV
LABELV $207
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $209
ADDRGP4 $202
JUMPV
LABELV $209
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $211
ADDRGP4 $202
JUMPV
LABELV $211
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $213
ADDRGP4 $202
JUMPV
LABELV $213
ADDRLP4 24
CNSTI4 516
ASGNI4
ADDRLP4 28
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 32
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 ACEAI_InFront
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $215
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 ACEAI_Visible
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $215
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $215
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
GEF4 $215
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRF4
ASGNF4
LABELV $215
LABELV $202
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $204
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $201
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $218
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $219
ADDRLP4 20
INDIRI4
RETI4
LABELV $197
endproc ACEAI_FindEnemy 56 8
export ACEAI_CheckShot
proc ACEAI_CheckShot 88 28
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTF4 3238002688
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 tv
CALLP4
ASGNP4
ADDRLP4 68
CNSTF4 1090519040
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tv
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 80
CNSTI4 516
ASGNI4
ADDRLP4 84
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
INDIRI4
NEI4 $221
CNSTI4 1
RETI4
ADDRGP4 $220
JUMPV
LABELV $221
CNSTI4 0
RETI4
LABELV $220
endproc ACEAI_CheckShot 88 28
export ACEAI_ChooseWeapon
proc ACEAI_ChooseWeapon 64 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
ADDRGP4 $224
JUMPV
LABELV $225
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 20
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 516
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 876
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 56
ADDRGP4 ACEIT_ChangeWeapon
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $229
ADDRGP4 $224
JUMPV
LABELV $229
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 60
ADDRGP4 ACEIT_ChangeWeapon
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $224
LABELV $224
endproc ACEAI_ChooseWeapon 64 8
import AngleBetweenVectors
import ACEND_selectNextNode
import ACESP_SetupBotState
import ACESP_BotConnect
import ACESP_RemoveBot
import ACESP_ReAddBots
import ACESP_SpawnBot
import ACESP_SetName
import ACESP_FindFreeClient
import ACESP_Respawn
import ACESP_PutClientInServer
import ACESP_HoldSpawn
import ACESP_InitBots
import ACEND_LoadNodes
import ACEND_SaveNodes
import ACEND_ResolveAllPaths
import ACEND_RemoveNodeEdge
import ACEND_UpdateNodeEdge
import ACEND_NodeTypeToString
import ACEND_AddNode
import ACEND_ShowPath
import ACEND_DrawPath
import ACEND_ShowNode
import ACEND_InitNodes
import ACEND_PathMap
import ACEND_CheckForLadder
import ACEND_GrapFired
import ACEND_FollowPath
import ACEND_SetGoal
import ACEND_FindClosestReachableNode
import ACEND_FindCloseReachableNode
import ACEND_FindCost
import ACEMV_Wander
import ACEMV_Attack
import ACEMV_Move
import ACEMV_SpecialMove
import ACEIT_BuildItemNodeTable
import ACEIT_ItemNeed
import ACEIT_ChangeWeapon
import ACEIT_IsReachable
import ACEIT_IsVisible
import ACEIT_PlayerRemoved
import ACEIT_PlayerAdded
import ACECM_Store
import ACECM_Commands
import CopyToBodyQue
import SelectSpawnPoint
import ClientThink_real
import LookAtKiller
import nodes
import numNodes
import director_debug
import ace_botsFile
import ace_spSkill
import ace_attackEnemies
import ace_pickShortRangeGoal
import ace_pickLongRangeGoal
import ace_showPath
import ace_showLinks
import ace_showNodes
import ace_debug
import spawnItem
import G_itemUse
import G_itemThink
import syrinxSpawn
import selectBetterWay
import drawRedBall
import G_FindRadius
import G_ProjectSource
import pointBehindWall
import spawnGridNode
import convertGridToWorld
import convertWorldToGrid
import fillGrid
import WallInFront
import trap_mysql_reconnect
import trap_mysql_fetchfieldbyName
import trap_mysql_fetchfieldbyID
import trap_mysql_fetchrow
import trap_mysql_finishquery
import trap_mysql_runquery
import trap_SendGameStat
import trap_SnapVector
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_antispawncamp
import mega_wave
import ROTACAK_ambush_kills
import ROTACAK_ambush_stage
import ROTACAK_ambush_rebuild_time_temp
import g_bot_lcannon
import g_bot_flamer
import g_bot_prifle
import g_bot_chaingun
import g_bot_mdriver
import g_bot_lasgun
import g_bot_psaw
import g_bot_shotgun
import g_bot_mgun
import g_bot
import g_ambush_turnangle
import g_ambush_range
import g_ambush_att_buildables
import g_ambush_kill_spawns
import g_ambush
import g_ambush_no_egg_ffoff
import g_ambush_stage_suicide
import g_ambush_sec_to_start
import g_ambush_rebuild_time
import g_ambush_dodge_random
import g_ambush_dodge
import g_ambush_tyrants_to_win
import g_ambush_dragon2_s8
import g_ambush_dragon_s7
import g_ambush_marauder2_s6
import g_ambush_marauder_s5
import g_ambush_basilisk2_s4
import g_ambush_basilisk_s3
import g_ambush_dretch_s2
import g_ambush_granger_s1
import g_buildLogMaxLength
import g_survival
import g_ctncapturetime
import g_ctnbuildlimit
import g_ctn
import g_msgTime
import g_msg
import g_mapvoteMaxTime
import g_voteMinTime
import g_devmapNoStructDmg
import g_devmapNoGod
import g_dretchPunt
import g_antiSpawnBlock
import g_myStats
import g_publicSayadmins
import g_decolourLogfiles
import g_privateMessages
import g_devmapKillerHP
import g_banNotice
import g_minLevelToSpecMM1
import g_forceAutoSelect
import g_minLevelToJoinTeam
import g_adminMapLog
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminSayFilter
import g_adminParseSay
import g_adminLog
import g_admin
import g_layoutAuto
import g_layouts
import g_mapConfigs
import g_shove
import g_floodMinTime
import g_floodMaxDemerits
import g_actionPrefix
import g_chatTeamPrefix
import g_initialMapRotation
import g_nextMap
import g_currentMap
import g_currentMapRotation
import g_debugMapRotation
import g_deconDead
import g_markDeconstruct
import g_disabledBuildables
import g_disabledClasses
import g_disabledEquipment
import g_unlagged
import g_teamImbalanceWarnings
import g_alienStage3Threshold
import g_alienStage2Threshold
import g_alienMaxStage
import g_alienKills
import g_alienStage
import g_humanStage3Threshold
import g_humanStage2Threshold
import g_humanMaxStage
import g_humanKills
import g_humanStage
import g_alienBuildPoints
import g_humanBuildPoints
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_allowShare
import g_rankings
import pmove_msec
import pmove_fixed
import g_clientUpgradeNotice
import g_smoothClients
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_designateVotes
import g_mapVotesPercent
import g_suddenDeathVoteDelay
import g_suddenDeathVotePercent
import g_voteLimit
import g_requireVoteReasons
import g_allowVote
import g_blood
import g_doWarmup
import g_warmupMode
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyBuildableFire
import g_friendlyFireMovementAttacks
import g_retribution
import g_friendlyFireAliens
import g_friendlyFireHumans
import g_friendlyFire
import g_layoutmaking
import g_suddenDeathMode
import g_suddenDeath
import g_suddenDeathTime
import g_timelimit
import g_newbieNamePrefix
import g_newbieNumbering
import g_maxNameChanges
import g_minNameChangePeriod
import g_minCommandPeriod
import g_lockTeamsAtStart
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_entities
import level
import G_FindConnectionForCode
import G_ResetPTRConnections
import G_GenerateNewConnection
import G_UpdatePTRConnection
import G_GetCurrentMap
import G_MapExists
import G_InitMapRotations
import G_MapRotationActive
import G_StopMapRotation
import G_StartMapRotation
import G_AdvanceMapRotation
import G_PrintRotations
import G_WriteSessionData
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_DefragmentMemory
import G_Free
import G_InitMemory
import G_Alloc
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_UnlaggedOff
import G_UnlaggedOn
import G_UnlaggedCalc
import G_UnlaggedClear
import G_UnlaggedStore
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Flood_Limited
import CheckMsgTimer
import G_TimeTilSuddenDeath
import LogExit
import CheckTeamVote
import CheckVote
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_AdminsPrintf
import G_LogOnlyPrintf
import G_LogPrintfColoured
import G_LogPrintf
import G_RunThink
import FindIntermissionPoint
import CalculateRanks
import G_MapConfigs
import MoveClientToIntermission
import ScoreboardMessage
import FireWeapon3
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import G_NextNewbieName
import SpotWouldTelefrag
import player_die
import ClientSpawn
import BeginIntermission
import respawn
import SpawnCorpse
import G_SelectHumanLockSpawnPoint
import G_SelectAlienLockSpawnPoint
import G_SelectSpawnPoint
import G_SelectTremulousSpawnPoint
import G_SetClientViewAngle
import TeamCount
import G_AddCreditToClient
import G_UpdateZaps
import ChargeAttack
import CheckPounceAttack
import CheckGrabAttack
import CheckVenomAttack
import SnapVectorTowards
import CalcMuzzlePoint
import G_GiveClientMaxAmmo
import G_ForceWeaponChange
import ShineTorch
import TeleportPlayer
import TeleportZombie
import G_Checktrigger_stages
import trigger_teleporter_touch
import manualTriggerSpectator
import Touch_DoorTrigger
import G_RunMover
import launch_bomb
import launch_grenade
import fire_hive
import fire_bounceBall
import fire_slowBlob
import fire_paraLockBlob
import fire_lockblob
import fire_luciferCannon
import fire_pulseRifle
import fire_blaster
import fire_flamer
import G_RunMissile
import G_InitDamageLocations
import AddScore
import body_die
import G_SelectiveRadiusDamage
import G_RadiusDamage
import G_SelectiveDamage
import G_Damage
import CanDamage
import G_ClosestEnt
import G_Visible
import Distance2d
import G_CloseMenus
import G_TriggerMenu
import G_ClientIsLagging
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_BroadcastEvent
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import G_ShaderIndex
import G_ParticleSystemIndex
import G_FindBuildLogName
import G_CountBuildLog
import G_LogBuild
import G_RevertCanFit
import G_CommitRevertedBuildable
import G_SpawnRevertedBuildable
import G_InstantBuild
import G_BaseSelfDestruct
import G_LayoutLoad
import G_LayoutSelect
import G_LayoutList
import G_LayoutSave
import G_CheckDBProtection
import FinishSpawningBuildable
import G_SpawnBuildable
import G_SetIdleBuildableAnim
import G_SetBuildableAnim
import G_BuildIfValid
import G_BuildingExists
import G_CanBuild
import G_ArmoryRange
import G_BuildableRange
import G_BuildableThink
import G_IsOvermindBuilt
import G_IsDCCBuilt
import G_IsPowered
import G_CheckSpawnPoint
import AHovel_Blocked
import G_Physics
import G_CP
import G_WordWrap
import Cmd_Builder_f
import Cmd_TeamVote_f
import Cmd_Donate_f
import Cmd_Share_f
import G_statsString
import G_PrivateMessage
import G_SanitiseString
import G_ChangeTeam
import G_LeaveTeam
import G_ParseEscapedString
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import G_Say
import G_ClientNumbersFromString
import G_MatchOnePlayer
import G_ToggleFollow
import G_FollowNewClient
import G_StopFollowing
import G_StopFromFollowing
import Cmd_Score_f
import botShootIfTargetInRange
import botGetDistanceBetweenPlayer
import botTargetInRange
import botFindClosestEnemy
import botAimAtTarget
import G_BotSpectatorThink
import G_BotThink
import G_BotCmd
import G_BotDel
import G_BotAdd
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import G_GetPosInSpawnQueue
import G_RemoveFromSpawnQueue
import G_PushSpawnQueue
import G_SearchSpawnQueue
import G_PeekSpawnQueue
import G_PopSpawnQueue
import G_GetSpawnQueueLength
import G_InitSpawnQueue
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_setnextnode
import G_drawnodes
import G_reconnectdb
import G_switchnodes
import G_admin_botcmd
import G_admin_bot
import G_set_survival_stage
import G_admin_findpath
import G_admin_printpath
import G_admin_printgrid
import G_admin_switch
import G_admin_cp
import G_admin_designate
import G_admin_warn
import G_admin_putmespec
import G_admin_L1
import G_admin_L0
import G_admin_pause
import G_admin_revert
import G_admin_buildlog
import G_admin_info
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_register
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_denybuild
import G_admin_mute
import G_admin_layoutsave
import G_admin_maplog
import G_admin_maplog_update
import G_admin_devmap
import G_admin_map
import G_admin_listrotation
import G_admin_listmaps
import G_admin_listplayers
import G_admin_listlayouts
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_subnetban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_adminPrintName
import G_admin_set_adminname
import G_admin_level
import G_admin_maplog_result
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import BG_ClientListParse
import BG_ClientListString
import BG_ClientListRemove
import BG_ClientListAdd
import BG_ClientListTest
import BG_UpgradeClassAvailable
import BG_BuildableIsAllowed
import BG_ClassIsAllowed
import BG_UpgradeIsAllowed
import BG_WeaponIsAllowed
import BG_InitAllowedGameElements
import BG_ParseCSVBuildableList
import BG_ParseCSVClassList
import BG_ParseCSVEquipmentList
import atoi_neg
import atof_neg
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_FindTeamForUpgrade
import BG_FindUsableForUpgrade
import BG_FindPurchasableForUpgrade
import BG_FindIconForUpgrade
import BG_FindHumanNameForUpgrade
import BG_FindUpgradeNumForName
import BG_FindNameForUpgrade
import BG_FindSlotsForUpgrade
import BG_FindStagesForUpgrade
import BG_FindPriceForUpgrade
import BG_FindTeamForWeapon
import BG_FindBuildDelayForWeapon
import BG_FindLongRangedForWeapon
import BG_FindPurchasableForWeapon
import BG_FindZoomFovForWeapon
import BG_WeaponCanZoom
import BG_WeaponHasThirdMode
import BG_WeaponHasAltMode
import BG_FindKnockbackScaleForWeapon
import BG_FindReloadTimeForWeapon
import BG_FindRepeatRate3ForWeapon
import BG_FindRepeatRate2ForWeapon
import BG_FindRepeatRate1ForWeapon
import BG_FindUsesEnergyForWeapon
import BG_FindInfinteAmmoForWeapon
import BG_FindAmmoForWeapon
import BG_FindCrosshairSizeForWeapon
import BG_FindCrosshairForWeapon
import BG_FindIconForWeapon
import BG_FindModelsForWeapon
import BG_FindHumanNameForWeapon
import BG_FindWeaponNumForName
import BG_FindNameForWeapon
import BG_FindSlotsForWeapon
import BG_FindStagesForWeapon
import BG_FindPriceForWeapon
import BG_InitClassOverrides
import BG_FindValueOfClass
import BG_FindCostOfClass
import BG_ClassCanEvolveFromTo
import BG_FindBuildDistForClass
import BG_FindStartWeaponForClass
import BG_ClassHasAbility
import BG_FindSteptimeForClass
import BG_FindKnockbackScaleForClass
import BG_FindJumpMagnitudeForClass
import BG_FindStopSpeedForClass
import BG_FindFrictionForClass
import BG_FindAirAccelerationForClass
import BG_FindAccelerationForClass
import BG_FindSpeedForClass
import BG_FindBobCycleForClass
import BG_FindBobForClass
import BG_FindFovForClass
import BG_FindRegenRateForClass
import BG_FindFallDamageForClass
import BG_FindHealthForClass
import BG_FindViewheightForClass
import BG_FindZOffsetForClass
import BG_FindBBoxForClass
import BG_FindSpriteHeightForClass
import BG_FindStagesForClass
import BG_FindHudNameForClass
import BG_FindShadowScaleForClass
import BG_FindSkinNameForClass
import BG_FindModelScaleForClass
import BG_FindModelNameForClass
import BG_FindHumanNameForClassNum
import BG_FindNameForClassNum
import BG_FindClassNumForName
import BG_InitBuildableOverrides
import BG_FindTransparentTestForBuildable
import BG_FindReplaceableTestForBuildable
import BG_FindUniqueTestForBuildable
import BG_FindDCCTestForBuildable
import BG_FindCreepSizeForBuildable
import BG_FindCreepTestForBuildable
import BG_FindInvertNormalForBuildable
import BG_FindMinNormalForBuildable
import BG_FindProjTypeForBuildable
import BG_FindFireSpeedForBuildable
import BG_FindRangeForBuildable
import BG_FindUsableForBuildable
import BG_FindBuildTimeForBuildable
import BG_FindNextThinkForBuildable
import BG_FindAnimForBuildable
import BG_FindBuildWeaponForBuildable
import BG_FindTeamForBuildable
import BG_FindMODForBuildable
import BG_FindSplashRadiusForBuildable
import BG_FindSplashDamageForBuildable
import BG_FindStagesForBuildable
import BG_FindBuildPointsForBuildable
import BG_FindBounceForBuildable
import BG_FindTrajectoryForBuildable
import BG_FindRegenRateForBuildable
import BG_FindHealthForBuildable
import BG_FindZOffsetForBuildable
import BG_FindBBoxForBuildable
import BG_FindModelScaleForBuildable
import BG_FindModelsForBuildable
import BG_FindEntityNameForBuildable
import BG_FindHumanNameForBuildable
import BG_FindNameForBuildable
import BG_FindBuildNumForEntityName
import BG_FindBuildNumForName
import BG_GetValueOfEquipment
import BG_GetValueOfHuman
import BG_PositionBuildableRelativeToPlayer
import BG_RotateAxis
import BG_UpgradeIsActive
import BG_DeactivateUpgrade
import BG_ActivateUpgrade
import BG_InventoryContainsUpgrade
import BG_RemoveUpgradeFromInventory
import BG_AddUpgradeToInventory
import BG_InventoryContainsWeapon
import BG_RemoveWeaponFromInventory
import BG_AddWeaponToInventory
import BG_WeaponIsFull
import BG_PackAmmoArray
import BG_UnpackAmmoArray
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isdigit
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import BoundsIntersectPoint
import DistanceBetweenLineSegments
import DistanceBetweenLineSegmentsSquared
import VectorMaxComponent
import VectorMinComponent
import pointToLineDistance
import VectorDistance
import ProjectPointOntoVector
import GetPerpendicularViewVector
import Q_isnan
import PerpendicularVector
import VectorToAngles
import AngleVectors
import VectorMatrixMultiply
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AxisToAngles
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import rint
import pow
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $196
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 82
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $186
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 32
byte 1 65
byte 1 76
byte 1 69
byte 1 82
byte 1 84
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $181
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $165
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 76
byte 1 82
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $161
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 100
byte 1 105
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 76
byte 1 82
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 44
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $106
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $98
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 44
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 46
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $94
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 46
byte 1 46
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $91
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 0

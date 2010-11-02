export CG_BuildSolidList
code
proc CG_BuildSolidList 36 0
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg_numSolidEntities
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 cg_numTriggerEntities
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $100
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $100
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
ADDRGP4 $101
JUMPV
LABELV $100
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
LABELV $101
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
ADDRLP4 4
CNSTI4 1720
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $114
ADDRLP4 24
INDIRI4
CNSTI4 9
EQI4 $114
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $111
LABELV $114
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $111
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $115
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $115
LABELV $108
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $107
LABELV $99
endproc CG_BuildSolidList 36 0
proc CG_ClipMoveToEntities 164 36
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRFP4 16
ADDRFP4 16
INDIRI4
ASGNI4
ADDRFP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRP4
ASGNP4
ADDRFP4 28
ADDRFP4 28
INDIRI4
ASGNI4
ADDRFP4 16
INDIRI4
CNSTI4 -2
NEI4 $118
ADDRLP4 128
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 128
ADDRGP4 cg_numSolidEntities
INDIRI4
ASGNI4
LABELV $119
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
GEI4 $124
ADDRLP4 68
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 68
ADDRGP4 cg+108104
ASGNP4
LABELV $125
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $127
ADDRGP4 $121
JUMPV
LABELV $127
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $129
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 112
ADDRLP4 68
INDIRP4
CNSTI4 1568
ADDP4
INDIRB
ASGNB 12
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
ADDRGP4 $130
JUMPV
LABELV $129
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ASGNP4
ADDRLP4 144
CNSTI4 255
ASGNI4
ADDRLP4 124
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 144
INDIRI4
BANDI4
ASGNI4
ADDRLP4 132
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 8
RSHI4
ADDRLP4 144
INDIRI4
BANDI4
ASGNI4
ADDRLP4 136
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 16
RSHI4
ADDRLP4 144
INDIRI4
BANDI4
CNSTI4 32
SUBI4
ASGNI4
ADDRLP4 148
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 152
ADDRLP4 124
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 152
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 152
INDIRF4
ASGNF4
ADDRLP4 72+8
ADDRLP4 132
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 84+8
ADDRLP4 136
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
NEI4 $136
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 156
CNSTP4 0
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 BG_FindBBoxForClass
CALLV
pop
LABELV $136
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 160
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 160
INDIRI4
ASGNI4
ADDRLP4 112
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
ADDRLP4 100
ADDRLP4 68
INDIRP4
CNSTI4 1556
ADDP4
INDIRB
ASGNB 12
LABELV $130
ADDRFP4 28
INDIRI4
CNSTI4 2
NEI4 $138
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 trap_CM_TransformedCapsuleTrace
CALLV
pop
ADDRGP4 $139
JUMPV
LABELV $138
ADDRFP4 28
INDIRI4
CNSTI4 1
NEI4 $140
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
ADDRGP4 $141
JUMPV
LABELV $140
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $142
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 96
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 100
ARGP4
ADDRGP4 trap_CM_TransformedBiSphereTrace
CALLV
pop
LABELV $142
LABELV $141
LABELV $139
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $147
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $144
LABELV $147
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 4+56
INDIRF4
GEF4 $149
ADDRLP4 140
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ASGNF4
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 60
ADDRFP4 24
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 140
INDIRF4
ASGNF4
ADDRGP4 $145
JUMPV
LABELV $149
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 60
ADDRGP4 $145
JUMPV
LABELV $144
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $152
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
LABELV $152
LABELV $145
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $155
ADDRGP4 $117
JUMPV
LABELV $155
LABELV $121
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 64
INDIRI4
ADDRLP4 128
INDIRI4
LTI4 $120
LABELV $117
endproc CG_ClipMoveToEntities 164 36
export CG_Trace
proc CG_Trace 64 32
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $161
ADDRLP4 60
CNSTI4 1022
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $161
ADDRLP4 60
CNSTI4 1023
ASGNI4
LABELV $162
ADDRLP4 0+52
ADDRLP4 60
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
LABELV $157
endproc CG_Trace 64 32
export CG_CapTrace
proc CG_CapTrace 64 32
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_CapsuleTrace
CALLV
pop
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $167
ADDRLP4 60
CNSTI4 1022
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 60
CNSTI4 1023
ASGNI4
LABELV $168
ADDRLP4 0+52
ADDRLP4 60
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
LABELV $163
endproc CG_CapTrace 64 32
export CG_BiSphereTrace
proc CG_BiSphereTrace 96 32
ADDRLP4 84
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 60
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 88
ADDRFP4 16
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BiSphereTrace
CALLV
pop
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $173
ADDRLP4 92
CNSTI4 1022
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 92
CNSTI4 1023
ASGNI4
LABELV $174
ADDRLP4 0+52
ADDRLP4 92
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 60
LABELV $169
endproc CG_BiSphereTrace 96 32
export CG_PointContents
proc CG_PointContents 36 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $180
ADDRGP4 $177
JUMPV
LABELV $180
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $182
ADDRGP4 $177
JUMPV
LABELV $182
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $184
ADDRGP4 $177
JUMPV
LABELV $184
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
LABELV $177
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $176
ADDRLP4 16
INDIRI4
RETI4
LABELV $175
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 88 12
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
LABELV $191
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $193
ADDRGP4 $186
JUMPV
LABELV $193
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GTI4 $196
LABELV $198
ADDRGP4 $186
JUMPV
LABELV $196
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
ADDRLP4 44
CNSTI4 52
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
GEI4 $200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
LABELV $200
ADDRLP4 48
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 48
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $202
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 64
ASGNI4
ADDRLP4 60
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $206
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
CNSTI4 196
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 64
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
LABELV $206
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 80
CNSTI4 76
ASGNI4
ADDRLP4 84
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 76
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $202
LABELV $186
endproc CG_InterpolatePlayerState 88 12
proc CG_TouchTriggerPrediction 92 28
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $209
ADDRGP4 $208
JUMPV
LABELV $209
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $216
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $217
ADDRLP4 76
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $218
ADDRLP4 76
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $218
ADDRGP4 $208
JUMPV
LABELV $218
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $222
ADDRLP4 72
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $226
ADDRGP4 $223
JUMPV
LABELV $226
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 88
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $228
ADDRGP4 $223
JUMPV
LABELV $228
ADDRLP4 12
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+308
ARGP4
ADDRGP4 cg_pmove+320
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
ADDRLP4 12+4
INDIRI4
CNSTI4 0
NEI4 $236
ADDRGP4 $223
JUMPV
LABELV $236
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
NEI4 $239
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
LABELV $239
LABELV $223
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $225
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $222
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $242
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
LABELV $242
LABELV $208
endproc CG_TouchTriggerPrediction 92 28
export CG_PredictPlayerState
proc CG_PredictPlayerState 596 20
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
ADDRGP4 cg+109824
INDIRI4
CNSTI4 0
NEI4 $254
ADDRGP4 cg+109824
CNSTI4 1
ASGNI4
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
LABELV $254
ADDRLP4 532
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 532
INDIRI4
NEI4 $264
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 532
INDIRI4
EQI4 $260
LABELV $264
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $260
ADDRLP4 536
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 536
INDIRI4
NEI4 $269
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 536
INDIRI4
EQI4 $265
LABELV $269
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $265
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
ADDRGP4 cg_pmove+352
ADDRGP4 CG_Trace
ASGNP4
ADDRGP4 cg_pmove+356
ADDRGP4 CG_PointContents
ASGNP4
ADDRGP4 cg_pmove+36
ADDRGP4 cg_debugMove+12
INDIRI4
ASGNI4
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $275
ADDRGP4 cg_pmove+32
CNSTI4 65537
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
ADDRGP4 cg_pmove+32
CNSTI4 33619969
ASGNI4
LABELV $276
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $279
ADDRLP4 540
ADDRGP4 cg_pmove+32
ASGNP4
ADDRLP4 540
INDIRP4
ADDRLP4 540
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
LABELV $279
ADDRGP4 cg_pmove+40
CNSTI4 0
ASGNI4
ADDRLP4 8
ADDRGP4 cg+107636
INDIRB
ASGNB 468
ADDRLP4 544
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 476
ADDRLP4 544
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 508
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
ADDRLP4 548
ADDRLP4 508
INDIRI4
ASGNI4
ADDRLP4 548
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $285
ADDRLP4 548
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $285
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $252
ADDRGP4 $292
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $285
ADDRLP4 476
INDIRI4
ARGI4
ADDRLP4 484
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $293
ADDRLP4 552
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 552
INDIRI4
NEI4 $293
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 552
INDIRI4
NEI4 $293
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
LABELV $294
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $306
ADDRGP4 $309
ARGP4
ADDRGP4 $310
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $307
JUMPV
LABELV $306
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $311
ADDRGP4 $309
ARGP4
ADDRGP4 $314
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $311
LABELV $307
ADDRGP4 cg_pmove+344
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
ADDRGP4 cg_pmove+348
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
ADDRLP4 480
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $319
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cg_pmove+8
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
ADDRGP4 cg_pmove+344
INDIRI4
CNSTI4 0
EQI4 $324
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+8
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
LABELV $324
ADDRGP4 cg_pmove+8
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $328
ADDRGP4 $320
JUMPV
LABELV $328
ADDRGP4 cg_pmove+8
INDIRI4
ADDRLP4 484
INDIRI4
LEI4 $332
ADDRGP4 $320
JUMPV
LABELV $332
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $335
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $338
ADDRLP4 572
CNSTF4 0
ASGNF4
ADDRGP4 cg+109832+8
ADDRLP4 572
INDIRF4
ASGNF4
ADDRGP4 cg+109832+4
ADDRLP4 572
INDIRF4
ASGNF4
ADDRGP4 cg+109832
ADDRLP4 572
INDIRF4
ASGNF4
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $346
ADDRGP4 $349
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $346
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $338
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 572
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRLP4 8+20
ARGP4
ADDRLP4 572
ARGP4
ADDRLP4 584
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
NEI4 $360
ADDRGP4 $363
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $360
LABELV $357
ADDRLP4 556
ADDRLP4 8+20
INDIRF4
ADDRLP4 572
INDIRF4
SUBF4
ASGNF4
ADDRLP4 556+4
ADDRLP4 8+20+4
INDIRF4
ADDRLP4 572+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 556+8
ADDRLP4 8+20+8
INDIRF4
ADDRLP4 572+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 556
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 568
ADDRLP4 584
INDIRF4
ASGNF4
ADDRLP4 568
INDIRF4
CNSTF4 1036831949
LEF4 $373
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $375
ADDRGP4 $378
ARGP4
ADDRLP4 568
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $375
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $379
ADDRLP4 592
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109828
INDIRI4
SUBI4
ASGNI4
ADDRLP4 588
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 592
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
ADDRLP4 588
INDIRF4
CNSTF4 0
GEF4 $386
ADDRLP4 588
CNSTF4 0
ASGNF4
LABELV $386
ADDRLP4 588
INDIRF4
CNSTF4 0
LEF4 $388
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $388
ADDRGP4 $391
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $388
ADDRGP4 cg+109832
ADDRGP4 cg+109832
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+109832+4
ADDRGP4 cg+109832+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+109832+8
ADDRGP4 cg+109832+8
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 $380
JUMPV
LABELV $379
ADDRLP4 588
CNSTF4 0
ASGNF4
ADDRGP4 cg+109832+8
ADDRLP4 588
INDIRF4
ASGNF4
ADDRGP4 cg+109832+4
ADDRLP4 588
INDIRF4
ASGNF4
ADDRGP4 cg+109832
ADDRLP4 588
INDIRF4
ASGNF4
LABELV $380
ADDRGP4 cg+109832
ADDRLP4 556
INDIRF4
ADDRGP4 cg+109832
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+109832+4
ADDRLP4 556+4
INDIRF4
ADDRGP4 cg+109832+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+109832+8
ADDRLP4 556+8
INDIRF4
ADDRGP4 cg+109832+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+109828
ADDRGP4 cg+107608
INDIRI4
ASGNI4
LABELV $373
LABELV $339
LABELV $335
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $421
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_pmove+44
ADDP4
CNSTI4 0
ASGNI4
LABELV $422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 31
LTI4 $421
ADDRGP4 cg_pmove+344
INDIRI4
CNSTI4 0
EQI4 $426
ADDRGP4 cg_pmove+8
ADDRGP4 cg_pmove+8
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
LABELV $426
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
ADDRLP4 480
CNSTI4 1
ASGNI4
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
LABELV $320
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $322
ADDRLP4 4
INDIRI4
ADDRLP4 476
INDIRI4
LEI4 $319
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $434
ADDRGP4 $437
ARGP4
ADDRGP4 cg_pmove+8
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $434
ADDRLP4 480
INDIRI4
CNSTI4 0
NEI4 $440
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $252
ADDRGP4 $445
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 $252
JUMPV
LABELV $440
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $454
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 8+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $457
ADDRGP4 $462
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $457
LABELV $454
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $464
ADDRGP4 cg+109844
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $467
ADDRGP4 $472
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
ADDRGP4 cg+109844
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
LABELV $467
LABELV $464
LABELV $252
endproc CG_PredictPlayerState 596 20
bss
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 360
import trap_GetDemoName
import trap_GetDemoPos
import trap_GetDemoState
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBiSphereTrace
import trap_CM_BiSphereTrace
import trap_CM_TransformedCapsuleTrace
import trap_CM_CapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_LiteralArgs
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_TutorialText
import CG_WritePTRCode
import CG_ReadPTRCode
import CG_DestroyTestTS_f
import CG_TestTS_f
import CG_AddTrails
import CG_IsTrailSystemValid
import CG_DestroyTrailSystem
import CG_SpawnNewTrailSystem
import CG_RegisterTrailSystem
import CG_LoadTrailSystems
import CG_DestroyTestPS_f
import CG_TestPS_f
import CG_ParticleSystemEntity
import CG_AddParticles
import CG_SetParticleSystemNormal
import CG_IsParticleSystemValid
import CG_IsParticleSystemInfinite
import CG_DestroyParticleSystem
import CG_SpawnNewParticleSystem
import CG_RegisterParticleSystem
import CG_LoadParticleSystems
import CG_SetAttachmentOffset
import CG_SetAttachmentParticle
import CG_SetAttachmentTag
import CG_SetAttachmentCent
import CG_SetAttachmentPoint
import CG_AttachToParticle
import CG_AttachToTag
import CG_AttachToCent
import CG_AttachToPoint
import CG_Attached
import CG_AttachmentCentNum
import CG_AttachmentVelocity
import CG_AttachmentAxis
import CG_AttachmentDir
import CG_AttachmentPoint
import CG_DefragmentMemory
import CG_Free
import CG_Alloc
import CG_InitMemory
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_RequestScores
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ProcessSnapshots
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_AlienSense
import CG_Scanner
import CG_UpdateEntityPositions
import CG_DrawItemSelectText
import CG_DrawItemSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_ShotgunFire
import CG_Bullet
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterWeapon
import CG_InitWeapons
import CG_RegisterUpgrade
import CG_InitUpgrades
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_DrawBoundingBox
import CG_PainEvent
import CG_EntityEvent
import CG_CheckEvents
import CG_ModelDoor
import CG_AnimMapObj
import CG_RunLerpFrame
import CG_AlienBuildableExplosion
import CG_HumanBuildableExplosion
import CG_InitBuildables
import CG_Buildable
import CG_GhostBuildable
import CG_AtHighestClass
import CG_Bleed
import CG_PlayerDisconnect
import CG_CustomSound
import CG_PrecacheClientInfo
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Corpse
import CG_Player
import CG_ResetPainBlend
import CG_UpdateMediaFraction
import CG_DrawLoadingScreen
import CG_Text_PaintChar
import CG_GetKillerText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_RunMenuScript
import CG_GetValue
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawActive
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawFadePic
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawPlane
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_addSmoothOp
import CG_AddNotifyText
import CG_RemoveNotifyLine
import CG_FileExists
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_PlayerCount
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugRandom
import ui_humanTeamVoteActive
import ui_alienTeamVoteActive
import ui_voteActive
import ui_loading
import ui_dialog
import ui_stages
import ui_carriage
import ui_currentClass
import cg_painBlendZoom
import cg_painBlendScale
import cg_painBlendMax
import cg_painBlendDownRate
import cg_painBlendUpRate
import cg_tutorial
import cg_disableScannerPlane
import cg_disableWarningDialogs
import cg_debugPVS
import cg_debugTrails
import cg_debugParticles
import cg_lightFlare
import cg_consoleLatency
import cg_depthSortParticles
import cg_wwToggle
import cg_wwFollow
import cg_wwSmoothTime
import cg_debugAlloc
import cg_drawBBOX
import cg_drawSurfNormal
import cg_creepRes
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonhax
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRangehax
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_debugMove
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_teslaTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawDemoState
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_buildables
import cg_upgrades
import cg_weapons
import cg_entities
import cg
import cgs
import g_nameBind2
import g_nameBind1
import BindingFromName
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Item_Text_AutoWrapped_Paint
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
LABELV $472
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $462
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $445
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $437
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $391
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $378
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $314
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $310
byte 1 56
byte 1 0
align 1
LABELV $309
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $292
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0

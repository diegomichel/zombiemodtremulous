data
align 4
LABELV bindings
address $100
address $101
byte 4 -1
byte 4 -1
address $102
address $103
byte 4 -1
byte 4 -1
address $104
address $105
byte 4 -1
byte 4 -1
address $106
address $107
byte 4 -1
byte 4 -1
address $108
address $109
byte 4 -1
byte 4 -1
address $110
address $111
byte 4 -1
byte 4 -1
address $112
address $113
byte 4 -1
byte 4 -1
address $114
address $115
byte 4 -1
byte 4 -1
address $116
address $117
byte 4 -1
byte 4 -1
address $118
address $119
byte 4 -1
byte 4 -1
address $120
address $121
byte 4 -1
byte 4 -1
address $122
address $123
byte 4 -1
byte 4 -1
address $124
address $125
byte 4 -1
byte 4 -1
address $126
address $127
byte 4 -1
byte 4 -1
address $128
address $129
byte 4 -1
byte 4 -1
lit
align 4
LABELV numBindings
byte 4 15
code
proc CG_GetBindings 1056 12
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 bindings+8+4
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 bindings+8
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 1032
ADDRLP4 1044
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 1044
INDIRI4
ASGNI4
LABELV $138
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Key_GetBindingBuf
CALLV
pop
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $142
ADDRGP4 $139
JUMPV
LABELV $142
ADDRLP4 4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $144
ADDRLP4 1052
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
LEI4 $147
ADDRGP4 $140
JUMPV
LABELV $147
LABELV $144
LABELV $139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $138
LABELV $140
LABELV $132
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 1028
INDIRI4
ADDRGP4 numBindings
INDIRI4
LTI4 $131
LABELV $130
endproc CG_GetBindings 1056 12
bss
align 1
LABELV $150
skip 1024
code
proc CG_KeyNameForCommand 52 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $150
CNSTI1 0
ASGNI1
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $151
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $155
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $157
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Key_KeynumToStringBuf
CALLV
pop
ADDRGP4 $150
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $161
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRGP4 $150
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CVII1 4
ASGNI1
LABELV $162
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $161
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $158
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $169
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $150
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRGP4 $150
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+8+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
ADDP4
ARGP4
CNSTI4 1024
ADDRLP4 36
INDIRI4
SUBI4
ARGI4
ADDRGP4 trap_Key_KeynumToStringBuf
CALLV
pop
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRGP4 $150
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 44
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CVII1 4
ASGNI1
LABELV $173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRGP4 $150
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $172
ADDRGP4 $158
JUMPV
LABELV $157
ADDRGP4 $176
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bindings+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $150
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $150
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $178
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $158
ADDRGP4 $150
RETP4
ADDRGP4 $149
JUMPV
LABELV $155
LABELV $152
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $154
ADDRLP4 4
INDIRI4
ADDRGP4 numBindings
INDIRI4
LTI4 $151
ADDRGP4 $179
RETP4
LABELV $149
endproc CG_KeyNameForCommand 52 12
proc CG_BuildableInRange 108 28
ADDRGP4 cg+110404
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 88
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 92
CNSTF4 1115684864
ASGNF4
ADDRLP4 12
ADDRGP4 cg+110036+24
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+110036+24+4
INDIRF4
ADDRLP4 92
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+110036+24+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28
ARGP4
ADDRGP4 cg+110036+24
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
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
ADDRLP4 24
CNSTI4 1720
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $197
ADDRLP4 24
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $197
CNSTI4 1
RETI4
ADDRGP4 $180
JUMPV
LABELV $197
CNSTI4 0
RETI4
LABELV $180
endproc CG_BuildableInRange 108 28
proc CG_AlienBuilderText 28 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $200
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $202
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $114
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $201
JUMPV
LABELV $200
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $204
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_BuildableInRange
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $205
ADDRGP4 $124
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $205
LABELV $201
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 2
NEI4 $208
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $210
ADDRGP4 $114
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $212
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $210
ADDRGP4 $100
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $213
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $108
ARGP4
ADDRLP4 12
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $214
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $208
LABELV $199
endproc CG_AlienBuilderText 28 12
proc CG_AlienLevel0Text 8 12
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $108
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $214
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $215
endproc CG_AlienLevel0Text 8 12
proc CG_AlienLevel1Text 16 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $218
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $212
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 5
NEI4 $219
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $221
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $219
ADDRGP4 $108
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $214
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $217
endproc CG_AlienLevel1Text 16 12
proc CG_AlienLevel2Text 16 12
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $223
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 7
NEI4 $224
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $226
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $224
ADDRGP4 $106
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $227
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $222
endproc CG_AlienLevel2Text 16 12
proc CG_AlienLevel3Text 16 12
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $223
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 9
NEI4 $229
ADDRGP4 $100
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $213
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $229
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $231
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $228
endproc CG_AlienLevel3Text 16 12
proc CG_AlienLevel4Text 16 12
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $212
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $114
ARGP4
ADDRLP4 8
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $233
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $232
endproc CG_AlienLevel4Text 16 12
proc CG_HumanCkitText 28 12
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $235
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $202
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $114
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $236
JUMPV
LABELV $235
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $204
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_BuildableInRange
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $237
ADDRGP4 $124
ARGP4
ADDRLP4 16
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $237
LABELV $236
LABELV $234
endproc CG_HumanCkitText 28 12
proc CG_HumanText 100 20
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+109936
INDIRI4
CNSTI4 32
GTI4 $240
ADDRLP4 12
CNSTI4 900
ADDRGP4 cg+109936
INDIRI4
MULI4
ADDRGP4 cg_weapons+4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $241
JUMPV
LABELV $240
ADDRGP4 cg+109936
INDIRI4
CNSTI4 32
LEI4 $245
ADDRLP4 12
CNSTI4 12
ADDRGP4 cg+109936
INDIRI4
MULI4
ADDRGP4 cg_upgrades-384+4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 cg+109936
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
LABELV $245
LABELV $241
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 BG_UnpackAmmoArray
CALLV
pop
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $252
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $252
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindInfinteAmmoForWeapon
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $252
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 10
LTI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 18
GTI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $261-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $261
address $257
address $253
address $257
address $259
address $259
address $257
address $259
address $257
address $259
code
LABELV $257
ADDRGP4 $118
ARGP4
ADDRLP4 36
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $258
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $253
JUMPV
LABELV $259
ADDRGP4 $118
ARGP4
ADDRLP4 44
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $260
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $253
JUMPV
LABELV $252
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 9
LTI4 $264
ADDRLP4 28
INDIRI4
CNSTI4 30
GTI4 $264
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $275-36
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $275
address $266
address $266
address $270
address $266
address $266
address $268
address $266
address $266
address $266
address $272
address $264
address $264
address $264
address $264
address $264
address $264
address $264
address $264
address $264
address $264
address $274
address $274
code
LABELV $266
ADDRGP4 $112
ARGP4
ADDRLP4 36
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $264
JUMPV
LABELV $268
ADDRGP4 $112
ARGP4
ADDRLP4 48
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $110
ARGP4
ADDRLP4 60
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $269
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $264
JUMPV
LABELV $270
ADDRGP4 $112
ARGP4
ADDRLP4 68
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $271
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $264
JUMPV
LABELV $272
ADDRGP4 $112
ARGP4
ADDRLP4 80
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $273
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $114
ARGP4
ADDRLP4 88
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FindHumanNameForWeapon
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $264
JUMPV
LABELV $274
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_HumanCkitText
CALLV
pop
LABELV $264
LABELV $253
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $277
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $128
ARGP4
ADDRLP4 36
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $278
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $281
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $279
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindUsableForUpgrade
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $279
LABELV $281
ADDRGP4 $100
ARGP4
ADDRLP4 56
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $282
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $279
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 35
GTI4 $283
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_InventoryContainsUpgrade
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $283
ADDRGP4 $120
ARGP4
ADDRLP4 64
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindHumanNameForUpgrade
CALLP4
ASGNP4
ADDRGP4 $285
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $283
ADDRGP4 $122
ARGP4
ADDRLP4 64
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $286
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $239
endproc CG_HumanText 100 20
proc CG_SpectatorText 28 12
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $288
ADDRGP4 $100
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $290
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRLP4 8
ADDRGP4 CG_PlayerCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LEI4 $289
ADDRGP4 $126
ARGP4
ADDRLP4 12
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $293
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $128
ARGP4
ADDRLP4 20
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $294
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $289
JUMPV
LABELV $288
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $295
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRLP4 8
ADDRGP4 CG_PlayerCount
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $296
ADDRGP4 $100
ARGP4
ADDRLP4 12
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $300
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $296
JUMPV
LABELV $295
ADDRGP4 $112
ARGP4
ADDRLP4 0
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $296
LABELV $289
LABELV $287
endproc CG_SpectatorText 28 12
bss
align 1
LABELV $303
skip 4096
export CG_TutorialText
code
proc CG_TutorialText 36 12
ADDRGP4 CG_GetBindings
CALLV
pop
ADDRGP4 $303
CNSTI1 0
ASGNI1
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 cg+24
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $305
ADDRGP4 cg+8
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $305
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
EQI4 $311
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $309
LABELV $311
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SpectatorText
CALLV
pop
ADDRGP4 $310
JUMPV
LABELV $309
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $312
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $315
ADDRLP4 12
INDIRI4
CNSTI4 11
GTI4 $315
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $324-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $324
address $317
address $317
address $318
address $319
address $319
address $320
address $320
address $321
address $321
address $322
address $323
code
LABELV $317
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienBuilderText
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $318
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel0Text
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $319
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel1Text
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $320
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel2Text
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $321
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel3Text
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $322
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AlienLevel4Text
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $323
ADDRGP4 $303
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HumanText
CALLV
pop
LABELV $315
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
NEI4 $326
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BG_UpgradeClassAvailable
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $326
ADDRGP4 $122
ARGP4
ADDRLP4 28
ADDRGP4 CG_KeyNameForCommand
CALLP4
ASGNP4
ADDRGP4 $328
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $303
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $326
LABELV $312
LABELV $310
ADDRGP4 $303
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $329
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $305
ADDRGP4 $303
RETP4
LABELV $302
endproc CG_TutorialText 36 12
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
import CG_PredictPlayerState
import CG_BiSphereTrace
import CG_CapTrace
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isintegral
import Q_isanumber
import Q_isdigit
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Com_HexStrToInt
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
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
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
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
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
LABELV $329
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $328
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $300
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
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
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $297
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $294
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $293
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $290
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
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
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $286
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $285
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $277
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $273
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $269
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $267
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $260
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 82
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $258
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $233
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $231
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $227
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $223
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 114
byte 1 97
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 103
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $218
byte 1 84
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 97
byte 1 98
byte 1 32
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $216
byte 1 84
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $214
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 107
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $212
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 0
align 1
LABELV $178
byte 1 32
byte 1 40
byte 1 117
byte 1 110
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $176
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $169
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 0
align 1
LABELV $129
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $125
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 100
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 47
byte 1 69
byte 1 118
byte 1 111
byte 1 108
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $122
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 0
align 1
LABELV $121
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $120
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 97
byte 1 99
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 66
byte 1 117
byte 1 121
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $118
byte 1 98
byte 1 117
byte 1 121
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $117
byte 1 82
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $116
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $115
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $114
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $113
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $112
byte 1 43
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $111
byte 1 90
byte 1 111
byte 1 111
byte 1 109
byte 1 86
byte 1 105
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $110
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 114
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $108
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $107
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 43
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $105
byte 1 83
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 98
byte 1 111
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 82
byte 1 117
byte 1 110
byte 1 47
byte 1 87
byte 1 97
byte 1 108
byte 1 107
byte 1 0
align 1
LABELV $102
byte 1 43
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 85
byte 1 112
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 0

#define SYSEXBUFSIZE    1024

#define NOTEOFF1        128
#define NOTEOFF2        129
#define NOTEOFF3        130
#define NOTEOFF4        131
#define NOTEOFF5        132
#define NOTEOFF6        133
#define NOTEOFF7        134
#define NOTEOFF8        135
#define NOTEOFF9        136
#define NOTEOFF10       137
#define NOTEOFF11       138
#define NOTEOFF12       139
#define NOTEOFF13       140
#define NOTEOFF14       141
#define NOTEOFF15       142
#define NOTEOFF16       143

#define NOTEON1         144
#define NOTEON2         145
#define NOTEON3         146
#define NOTEON4         147
#define NOTEON5         148
#define NOTEON6         149
#define NOTEON7         150
#define NOTEON8         151
#define NOTEON9         152
#define NOTEON10        153
#define NOTEON11        154
#define NOTEON12        155
#define NOTEON13        156
#define NOTEON14        157
#define NOTEON15        158
#define NOTEON16        159

#define POLYAT1         160
#define POLYAT2         161
#define POLYAT3         162
#define POLYAT4         163
#define POLYAT5         164
#define POLYAT6         165
#define POLYAT7         166
#define POLYAT8         167
#define POLYAT9         168
#define POLYAT10        169
#define POLYAT11        170
#define POLYAT12        171
#define POLYAT13        172
#define POLYAT14        173
#define POLYAT15        174
#define POLYAT16        175

#define CC1             176
#define CC2             177
#define CC3             178
#define CC4             179
#define CC5             180
#define CC6             181
#define CC7             182
#define CC8             183
#define CC9             184
#define CC10            185
#define CC11            186
#define CC12            187
#define CC13            188
#define CC14            189
#define CC15            190
#define CC16            191

#define PROGCHANGE1     192
#define PROGCHANGE2     193
#define PROGCHANGE3     194
#define PROGCHANGE4     195
#define PROGCHANGE5     196
#define PROGCHANGE6     197
#define PROGCHANGE7     198
#define PROGCHANGE8     199
#define PROGCHANGE9     200
#define PROGCHANGE10    201
#define PROGCHANGE11    202
#define PROGCHANGE12    203
#define PROGCHANGE13    204
#define PROGCHANGE14    205
#define PROGCHANGE15    206
#define PROGCHANGE16    207

#define AFTERTOUCH1     208
#define AFTERTOUCH2     208
#define AFTERTOUCH3     208
#define AFTERTOUCH4     208
#define AFTERTOUCH5     208
#define AFTERTOUCH6     208
#define AFTERTOUCH7     208
#define AFTERTOUCH8     208
#define AFTERTOUCH9     208
#define AFTERTOUCH10    208
#define AFTERTOUCH11    208
#define AFTERTOUCH12    208
#define AFTERTOUCH13    208
#define AFTERTOUCH14    208
#define AFTERTOUCH15    208
#define AFTERTOUCH16    208

#define PITCHBEND1      224
#define PITCHBEND2      225
#define PITCHBEND3      226
#define PITCHBEND4      227
#define PITCHBEND5      228
#define PITCHBEND6      229
#define PITCHBEND7      230
#define PITCHBEND8      231
#define PITCHBEND9      232
#define PITCHBEND10     233
#define PITCHBEND11     234
#define PITCHBEND12     235
#define PITCHBEND13     236
#define PITCHBEND14     237
#define PITCHBEND15     238
#define PITCHBEND16     239

#define SYSEX           240
#define MTC             241
#define SONGPOSITION    242
#define SONGSEL         243

#define TUNEREQUEST     246
#define SYSEXEND        247

/*Realtime messages can be found
  inside sysex messages
  if(i<REALTIME) can be used to 
  detect & filter these out 
  of a sysex message.*/
#define REALTIME        248
#define CLOCK           248

#define START           250
#define CONTINUE        251
#define STOP            252

#define KEEPALIVE       254
#define RESET           255
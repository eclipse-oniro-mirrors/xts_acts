/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SPECIAL_Y0_H_H
#define SPECIAL_Y0_H_H

T(ROUND_TO_NEAREST,                  0x0p+0,                    -INF,          0x0p+0, DIVBYZERO)
T(ROUND_TO_NEAREST,                 -0x0p+0,                    -INF,          0x0p+0, DIVBYZERO)
T(ROUND_TO_NEAREST,                 -0x1p+0,                     NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,                     INF,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                    -INF,                     NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,                     NAN,                     NAN,          0x0p+0, 0)
// hard cases
T(ROUND_TO_NEAREST,    0x1.c982eb8d417eap-1,  -0x1.af74bfa0f1304p-56,   0x1.11721cp-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.c982eb8d417ebp-1,   0x1.5666419c0f3c9p-54,   0x1.dc02a8p-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.fa9534d98569bp+1,   0x1.384a000f3fcecp-53,    0x1.58e17p-6, INEXACT)
T(ROUND_TO_NEAREST,    0x1.fa9534d98569cp+1,  -0x1.8fa8956b4b481p-55,   0x1.54cfbep-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.c581dc4e72102p+2,  -0x1.14bb186dc408dp-52,   -0x1.163cfp-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.c581dc4e72103p+2,   0x1.e91b198d39ce2p-56,  -0x1.ee1b6ep-2, INEXACT)

#endif // SPECIAL_Y0_H_H


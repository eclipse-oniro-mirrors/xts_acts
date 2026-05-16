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

#ifndef SPECIAL_Y0F_H_H
#define SPECIAL_Y0F_H_H

T(ROUND_TO_NEAREST,          0x0p+0,            -INF,          0x0p+0, DIVBYZERO)
T(ROUND_TO_NEAREST,         -0x0p+0,            -INF,          0x0p+0, DIVBYZERO)
T(ROUND_TO_NEAREST,         -0x1p+0,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,             INF,          0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,            -INF,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,             NAN,             NAN,          0x0p+0, 0)
T(ROUND_TO_NEAREST,   0x1.0c4a3ap+0,   0x1.ff138ep-4,  -0x1.71585ap-3, INEXACT)
T(ROUND_TO_NEAREST,   0x1.8ae5d4p-1,  -0x1.D88a5ap-4,  -0x1.4d601ap-4, INEXACT)
T(ROUND_TO_NEAREST,   0x1.fa9536p+1, -0x1.da2946p-25,  -0x1.88a2bcp-2, INEXACT)

#endif // SPECIAL_Y0F_H_H


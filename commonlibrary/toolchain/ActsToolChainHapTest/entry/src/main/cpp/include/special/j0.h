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

#ifndef SPECIAL_J0_H_H
#define SPECIAL_J0_H_H

T(ROUND_TO_NEAREST,                  0x0p+0,                  0x1p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                 -0x0p+0,                  0x1p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     INF,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                    -INF,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     NAN,                     NAN,          0x0p+0, 0)
// hard cases
T(ROUND_TO_NEAREST,   -0x1.33d132fd04a92p+1,   0x1.092b2a541a68ep-19,   -0x1.2ebdbp-2, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.33d15297be06fp+1,   0x1.5352913be3275p-26,   0x1.c281e2p-7, INEXACT)
T(ROUND_TO_NEAREST,     0x1.33d152e971b4p+1,  -0x1.19b7921f03c8ep-54,    0x1.ece5dp-5, INEXACT)
T(ROUND_TO_NEAREST,    0x1.6148f5b2c2e45p+2,  -0x1.fbb40985f6e34p-56,  -0x1.1ac8a8p-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.14eb56cccdecap+3,  -0x1.6e8eeb22e5818p-54,  -0x1.63ab44p-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.c071b22fbbafap+1023, -0x1.a348b1f34dd1ap-526,   0x1.3153c2p-6, INEXACT)
T(ROUND_TO_NEAREST,    0x1.f7350b1701ef7p+0,    0x1.f32b3a3640292p-3,  -0x1.b3bad8p-5, INEXACT)
T(ROUND_TO_NEAREST,   0x1.f8e4d2e98fb6bp-14,    0x1.ffffffe0e1d1bp-1,    0x1.e1c4cp-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.fd2421ac2a80ap-14,    0x1.ffffffe05b3a7p-1,   0x1.e0f12cp-2, INEXACT)

#endif // SPECIAL_J0_H_H


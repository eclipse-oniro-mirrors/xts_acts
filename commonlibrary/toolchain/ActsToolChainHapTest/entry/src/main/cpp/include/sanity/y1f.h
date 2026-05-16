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

#ifndef SANITY_Y1F_H_H
#define SANITY_Y1F_H_H

T(ROUND_TO_NEAREST,   -0x1.0223ap+3,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.161868p+2,   0x1.5ab54ap-2,   0x1.6996cep-3, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.0c34b4p+3,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   -0x1.a206fp+2,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.288bbcp+3,   0x1.4d2fa6p-3,  -0x1.15d7b2p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efdp-1,  -0x1.2887c6p+0,   -0x1.84f2cp-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a05cc8p-2,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.1f9efap-1,  -0x1.554174p+0,   0x1.abaa28p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5dbp-1,  -0x1.02189cp+0,   0x1.393376p-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.5b86eap-1,             NAN,          0x0p+0, INVALID)

#endif // SANITY_Y1F_H_H


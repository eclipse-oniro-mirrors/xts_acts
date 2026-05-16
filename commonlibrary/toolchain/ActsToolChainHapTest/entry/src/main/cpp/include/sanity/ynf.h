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

#ifndef SANITY_YNF_H_H
#define SANITY_YNF_H_H

T(ROUND_TO_NEAREST,   -0x1.0223ap+3,          -2,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.161868p+2,          -1,  -0x1.5ab54ap-2,  -0x1.6996cep-3, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.0c34b4p+3,           0,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   -0x1.a206fp+2,           1,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.288bbcp+3,           2,  -0x1.6e6f9cp-3,   -0x1.b964fp-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efdp-1,           3,  -0x1.2935d2p+4,    0x1.47d13p-4, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a05cc8p-2,           4,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.1f9efap-1,           5, -0x1.16919ep+12,  -0x1.d10586p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5dbp-1,           6, -0x1.6dbc1cp+13,   0x1.d597eep-4, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.5b86eap-1,           7,             NAN,          0x0p+0, INVALID)

#endif // SANITY_YNF_H_H


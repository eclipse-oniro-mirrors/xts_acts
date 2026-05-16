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

#ifndef SANITY_TANHF_H_H
#define SANITY_TANHF_H_H

T(ROUND_TO_NEAREST,   -0x1.0223ap+3,  -0x1.fffffap-1,  -0x1.36c82ep-2, INEXACT)
T(ROUND_TO_NEAREST,   0x1.161868p+2,   0x1.ffd3ecp-1,   0x1.b927bep-3, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.0c34b4p+3,  -0x1.fffffcp-1,   0x1.e9b8dap-3, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a206fp+2,  -0x1.ffff72p-1,  -0x1.81eff6p-3, INEXACT)
T(ROUND_TO_NEAREST,   0x1.288bbcp+3,          0x1p+0,   0x1.32c044p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efdp-1,   0x1.28cc46p-1,  -0x1.c9f8c8p-5, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a05cc8p-2,   -0x1.8ad6ep-2,   0x1.662e9cp-2, INEXACT)
T(ROUND_TO_NEAREST,   0x1.1f9efap-1,   0x1.04c09ap-1,  -0x1.39185ep-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5dbp-1,   0x1.4c75f6p-1,    0x1.ba104p-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.5b86eap-1,  -0x1.2e7234p-1,   0x1.a1c772p-2, INEXACT)

#endif // SANITY_TANHF_H_H


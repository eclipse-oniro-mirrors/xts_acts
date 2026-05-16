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

#ifndef SANITY_ERFCF_H_H
#define SANITY_ERFCF_H_H

T(ROUND_TO_NEAREST, -0x1.0223ap+3, 0x1p+1, 0x1.348cbep-76, INEXACT)
T(ROUND_TO_NEAREST, 0x1.161868p+2, 0x1.b75602p-31, -0x1.47de08p-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.0c34b4p+3, 0x1p+1, 0x1.ae82b8p-84, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a206fp+2, 0x1p+1, 0x1.de0c3ap-44, INEXACT)
T(ROUND_TO_NEAREST, 0x1.288bbcp+3, 0x1.0a6cc8p-128, -0x1.f81426p-2, INEXACT | UNDERFLOW)
T(ROUND_TO_NEAREST, 0x1.52efdp-1, 0x1.658e5p-2, 0x1.ac77ap-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc8p-2, 0x1.6f4a2cp+0, 0x1.b2229p-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9efap-1, 0x1.b52e52p-2, 0x1.c9fa6cp-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5dbp-1, 0x1.1829cep-2, 0x1.6cd4fcp-4, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86eap-1, 0x1.a9b402p+0, 0x1.2d6bcp-2, INEXACT)

#endif // SANITY_ERFCF_H_H

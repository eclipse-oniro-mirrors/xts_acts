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

#ifndef SANITY_Y0F_H_H
#define SANITY_Y0F_H_H

T(ROUND_TO_NEAREST,   -0x1.0223ap+3,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.161868p+2,  -0x1.293dbep-3,   0x1.6ffc42p-4, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.0c34b4p+3,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   -0x1.a206fp+2,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.288bbcp+3,   0x1.b657f6p-3,  -0x1.cb5418p-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efdp-1,  -0x1.de7c0cp-3,  -0x1.dab3aap-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a05cc8p-2,             NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,   0x1.1f9efap-1,  -0x1.6ea9b6p-2,  -0x1.c780b4p-4, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5dbp-1,  -0x1.ccadb8p-4,  -0x1.0fa6f6p-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.5b86eap-1,             NAN,          0x0p+0, INVALID)

#endif // SANITY_Y0F_H_H


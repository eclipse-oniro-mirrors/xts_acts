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

#ifndef SANITY_SINHF_H_H
#define SANITY_SINHF_H_H

// minimal subset of musl libc-test sanity/sinhf.h

T(ROUND_TO_NEAREST,   -0x1.0223ap+3, -0x1.8e615cp+10,   0x1.565b4cp-3, INEXACT)
T(ROUND_TO_NEAREST,   0x1.161868p+2,   0x1.3463e2p+5,  -0x1.f93eb6p-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.0c34b4p+3,  -0x1.10d43p+11,   0x1.5c25dap-4, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a206fp+2,  -0x1.5745b8p+8,   0x1.206fbep-4, INEXACT)
T(ROUND_TO_NEAREST,   0x1.288bbcp+3,   0x1.4abc8p+12,  -0x1.c645acp-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efdp-1,    0x1.6c3d7p-1,   0x1.dbfcaep-5, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.a05cc8p-2,  -0x1.abee26p-2,   0x1.92f05ap-2, INEXACT)
T(ROUND_TO_NEAREST,   0x1.1f9efap-1,   0x1.2efd36p-1,  -0x1.ac6bbcp-2, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5dbp-1,   0x1.b5291ap-1,   0x1.d6f58cp-2, INEXACT)
T(ROUND_TO_NEAREST,  -0x1.5b86eap-1,   -0x1.76d58p-1,  -0x1.ed2616p-2, INEXACT)

#endif // SANITY_SINHF_H_H


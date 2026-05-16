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

#ifndef SANITY_ATANHF_H_H
#define SANITY_ATANHF_H_H

T(ROUND_TO_NEAREST, -0x1.0223ap+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.161868p+2, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.0c34b4p+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.a206fp+2, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.288bbcp+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.52efdp-1, 0x1.97b9eep-1, 0x1.876af4p-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc8p-2, -0x1.b9e48p-2, -0x1.a86bep-5, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9efap-1, 0x1.45533cp-1, 0x1.e7e07ap-4, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5dbp-1, 0x1.07d5f6p+0, 0x1.704928p-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86eap-1, -0x1.a754aep-1, 0x1.daaf4cp-4, INEXACT)

#endif // SANITY_ATANHF_H_H

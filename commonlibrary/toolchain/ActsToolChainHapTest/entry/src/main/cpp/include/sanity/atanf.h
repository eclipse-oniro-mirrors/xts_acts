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

#ifndef SANITY_ATANF_H_H
#define SANITY_ATANF_H_H

T(ROUND_TO_NEAREST, -0x1.0223ap+3, -0x1.728cd4p+0, 0x1.03d1b2p-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.161868p+2, 0x1.583792p+0, 0x1.489c4ap-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.0c34b4p+3, -0x1.73b95p+0, -0x1.95513p-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a206fp+2, -0x1.6b3b72p+0, 0x1.a46c8ep-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.288bbcp+3, 0x1.769b0ap+0, 0x1.efa6ep-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.52efdp-1, 0x1.2b6504p-1, 0x1.b33d58p-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc8p-2, -0x1.8b7474p-2, 0x1.741d2ep-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9efap-1, 0x1.060e3p-1, 0x1.666064p-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5dbp-1, 0x1.514ba4p-1, -0x1.008bbep-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86eap-1, -0x1.315244p-1, 0x1.68c06cp-3, INEXACT)

#endif // SANITY_ATANF_H_H

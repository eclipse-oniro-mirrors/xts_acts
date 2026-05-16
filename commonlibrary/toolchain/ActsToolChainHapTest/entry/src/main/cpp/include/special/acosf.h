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

#ifndef SPECIAL_ACOSF_H_H
#define SPECIAL_ACOSF_H_H

T(ROUND_TO_NEAREST, 0x0p+0, 0x1.921fb6p+0, 0x1.777a5cp-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1p+0, 0x1.921fb6p+1, 0x1.777a5cp-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1p+0, 0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, 0x1.000002p+0, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.000002p+0, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, INF, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -INF, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, NAN, NAN, 0x0p+0, 0)
T(ROUND_TO_NEAREST, 0x1.ffa46cp-2, 0x1.0c2f92p+0, -0x1.b164dap-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.02a1c8p-1, 0x1.0cd7fap+1, -0x1.ab103cp-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.09b7aep-1, 0x1.0ee7eep+1, -0x1.2b0662p-3, INEXACT)

#endif // SPECIAL_ACOSF_H_H

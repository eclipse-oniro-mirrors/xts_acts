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

#ifndef UCB_TANHF_H_H
#define UCB_TANHF_H_H

// tanh(+-max) = +-1
T(ROUND_TO_NEAREST, 0x1.fffffep+127, 0x1p+0, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1.fffffep+127, -0x1p+0, 0x0p+0, INEXACT)
T(RZ, 0x1.fffffep+127, 0x1.fffffep-1, -0x1p+0, INEXACT)
T(RZ, -0x1.fffffep+127, -0x1.fffffep-1, 0x1p+0, INEXACT)
T(RU, 0x1.fffffep+127, 0x1p+0, 0x0p+0, INEXACT)
T(RU, -0x1.fffffep+127, -0x1.fffffep-1, 0x1p+0, INEXACT)
T(RD, 0x1.fffffep+127, 0x1.fffffep-1, -0x1p+0, INEXACT)
T(RD, -0x1.fffffep+127, -0x1p+0, 0x0p+0, INEXACT)

// tanh(tiny) :=: tiny
T(ROUND_TO_NEAREST, 0x1p-29, 0x1p-29, 0x1.555556p-37, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-29, -0x1p-29, -0x1.555556p-37, INEXACT)
T(ROUND_TO_NEAREST, 0x1p-126, 0x1p-126, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-126, -0x1p-126, 0x0p+0, INEXACT)

#endif // UCB_TANHF_H_H

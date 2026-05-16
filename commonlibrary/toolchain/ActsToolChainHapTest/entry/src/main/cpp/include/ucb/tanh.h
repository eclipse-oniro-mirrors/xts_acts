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

#ifndef UCB_TANH_H_H
#define UCB_TANH_H_H

T(ROUND_TO_NEAREST, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x0p+0, -0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, 0x1p-1074, 0x1p-1074, 0x0p+0, INEXACT | UNDERFLOW)
T(ROUND_TO_NEAREST, -0x1p-1074, -0x1p-1074, 0x0p+0, INEXACT | UNDERFLOW)
T(ROUND_TO_NEAREST, 0x1p-1042, 0x1p-1042, 0x0p+0, INEXACT | UNDERFLOW)
T(ROUND_TO_NEAREST, -0x1p-1042, -0x1p-1042, 0x0p+0, INEXACT | UNDERFLOW)
T(ROUND_TO_NEAREST, 0x1p-1022, 0x1p-1022, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-1022, -0x1p-1022, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, 0x1p-67, 0x1p-67, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-67, -0x1p-67, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, 0x1.fffffffffffffp+1023, 0x1p+0, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1.fffffffffffffp+1023, -0x1p+0, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, INF, 0x1p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -INF, -0x1p+0, 0x0p+0, 0)

#endif // UCB_TANH_H_H

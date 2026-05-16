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

#ifndef SPECIAL_LOG1PF_H_H
#define SPECIAL_LOG1PF_H_H

T(ROUND_TO_NEAREST, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x0p+0, -0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x1p-100, -0x1p-100, 0x1p-78, INEXACT)
T(ROUND_TO_NEAREST, 0x1p+0, 0x1.62e43p-1, 0x1.05c61p-5, INEXACT)
T(ROUND_TO_NEAREST, -0x1p+0, -INF, 0x0p+0, DIVBYZERO)
T(ROUND_TO_NEAREST, INF, INF, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -INF, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, NAN, NAN, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x1.fffffcp-127, -0x1.fffffcp-127, 0x1p-104, INEXACT | UNDERFLOW)

#endif // SPECIAL_LOG1PF_H_H

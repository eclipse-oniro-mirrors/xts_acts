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

#ifndef UCB_SINHF_H_H
#define UCB_SINHF_H_H

// minimal subset of musl libc-test ucb/sinhf.h

// sinh(log(2*max)chopped) is finite
T(ROUND_TO_NEAREST, 0x1.65a9f8p+6, 0x1.ffffd8p+127, -0x1.f47394p-4, INEXACT)
T(ROUND_TO_NEAREST, -0x1.65a9f8p+6, -0x1.ffffd8p+127, 0x1.f47394p-4, INEXACT)
T(RZ, 0x1.65a9f8p+6, 0x1.ffffd8p+127, -0x1.f47394p-4, INEXACT)
T(RZ, -0x1.65a9f8p+6, -0x1.ffffd8p+127, 0x1.f47394p-4, INEXACT)
T(RU, 0x1.65a9f8p+6, 0x1.ffffdap+127, 0x1.c1718ep-1, INEXACT)
T(RU, -0x1.65a9f8p+6, -0x1.ffffd8p+127, 0x1.f47394p-4, INEXACT)
T(RD, 0x1.65a9f8p+6, 0x1.ffffd8p+127, -0x1.f47394p-4, INEXACT)
T(RD, -0x1.65a9f8p+6, -0x1.ffffdap+127, -0x1.c1718ep-1, INEXACT)

// sinh(tiny) :=: tiny
T(ROUND_TO_NEAREST, 0x1p-29, 0x1p-29, -0x1.555556p-38, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-29, -0x1p-29, 0x1.555556p-38, INEXACT)
T(ROUND_TO_NEAREST, 0x1p-126, 0x1p-126, 0x0p+0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-126, -0x1p-126, 0x0p+0, INEXACT)

// sinh(+-0) = +-0
T(ROUND_TO_NEAREST, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x0p+0, -0x0p+0, 0x0p+0, 0)
T(RZ, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(RZ, -0x0p+0, -0x0p+0, 0x0p+0, 0)
T(RU, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(RU, -0x0p+0, -0x0p+0, 0x0p+0, 0)
T(RD, 0x0p+0, 0x0p+0, 0x0p+0, 0)
T(RD, -0x0p+0, -0x0p+0, 0x0p+0, 0)

#endif // UCB_SINHF_H_H

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

#ifndef SPECIAL_LLRINTF_H_H
#define SPECIAL_LLRINTF_H_H

T(ROUND_TO_NEAREST, 0x0p+0, 0, 0)
T(ROUND_TO_NEAREST, -0x0p+0, 0, 0)
T(ROUND_TO_NEAREST, 0x1p-1, 0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-1, 0, INEXACT)
T(ROUND_TO_NEAREST, 0x1p+0, 1, 0)
T(ROUND_TO_NEAREST, -0x1p+0, -1, 0)
T(ROUND_TO_NEAREST, 0x1.0001p+0, 1, INEXACT)
T(ROUND_TO_NEAREST, -0x1.0001p+0, -1, INEXACT)
T(ROUND_TO_NEAREST, 0x1.ffffp-1, 1, INEXACT)
T(ROUND_TO_NEAREST, -0x1.ffffp-1, -1, INEXACT)
T(ROUND_TO_NEAREST, 0x1p-100, 0, INEXACT)
T(ROUND_TO_NEAREST, -0x1p-100, 0, INEXACT)
// Return value is unspecified.
#if INVALID
T(ROUND_TO_NEAREST, NAN, 0, INVALID)
T(ROUND_TO_NEAREST, INF, 0, INVALID)
T(ROUND_TO_NEAREST, -INF, 0, INVALID)
T(ROUND_TO_NEAREST, 0x1p+100, 0, INVALID)
T(ROUND_TO_NEAREST, -0x1p+100, 0, INVALID)
#endif

#endif // SPECIAL_LLRINTF_H_H


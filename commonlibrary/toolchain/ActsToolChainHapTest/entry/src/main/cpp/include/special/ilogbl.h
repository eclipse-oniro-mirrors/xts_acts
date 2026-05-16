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

#ifndef SPECIAL_ILOGBL_H_H
#define SPECIAL_ILOGBL_H_H

T(ROUND_TO_NEAREST, 0x0p+0, FP_ILOGB0, INVALID)
T(ROUND_TO_NEAREST, -0x0p+0, FP_ILOGB0, INVALID)
T(ROUND_TO_NEAREST, -0x1p-100, -100, 0)
T(ROUND_TO_NEAREST, 0x1p+0, 0, 0)
T(ROUND_TO_NEAREST, -0x1p+0, 0, 0)
T(ROUND_TO_NEAREST, INF, -1U / 2, INVALID)
T(ROUND_TO_NEAREST, -INF, -1U / 2, INVALID)
T(ROUND_TO_NEAREST, NAN, FP_ILOGBNAN, INVALID)
T(ROUND_TO_NEAREST, 0x1p-16445L, -16445, 0)

#endif // SPECIAL_ILOGBL_H_H

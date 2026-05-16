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

#ifndef SPECIAL_ATANL_H_H
#define SPECIAL_ATANL_H_H

T(ROUND_TO_NEAREST, 0x0p+0L, 0x0p+0L, 0x0p+0, 0)
T(ROUND_TO_NEAREST, -0x0p+0L, -0x0p+0L, 0x0p+0, 0)
T(ROUND_TO_NEAREST, 0x1p+0L, 0x1.921fb54442d1846ap-1L, 0x1.d9ccecp-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1p+0L, -0x1.921fb54442d1846ap-1L, -0x1.d9ccecp-3, INEXACT)
T(ROUND_TO_NEAREST, INF, 0x1.921fb54442d1846ap+0L, 0x1.d9ccecp-3, INEXACT)
T(ROUND_TO_NEAREST, -INF, -0x1.921fb54442d1846ap+0L, -0x1.d9ccecp-3, INEXACT)
T(ROUND_TO_NEAREST, NAN, NAN, 0x0p+0, 0)
T(ROUND_TO_NEAREST, 0x1.bd04f56701294p-2L, 0x1.a3cdc8cc1f2e6d0ep-2L, 0x1.bc9c04p-9, INEXACT)

#endif // SPECIAL_ATANL_H_H

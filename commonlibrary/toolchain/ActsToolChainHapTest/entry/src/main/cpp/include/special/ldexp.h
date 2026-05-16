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

#ifndef SPECIAL_LDEXP_H_H
#define SPECIAL_LDEXP_H_H

T(ROUND_TO_NEAREST,                  0x0p+0,  2147483647,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                  0x0p+0, -2147483647,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                 -0x0p+0,  2147483647,                 -0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     NAN,           0,                     NAN,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     INF,           0,                     INF,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                    -INF,           0,                    -INF,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                  0x1p+0,           0,                  0x1p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                  0x1p+0,           1,                  0x1p+1,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                  0x1p+0,          -1,                  0x1p-1,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                  0x1p+0,  2147483647,                     INF,          0x0p+0, INEXACT|OVERFLOW)
T(ROUND_TO_NEAREST,                     NAN,           1,                     NAN,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     INF,  2147483647,                     INF,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                     INF, -2147483647,                     INF,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                    -INF,  2147483647,                    -INF,          0x0p+0, 0)

#endif // SPECIAL_LDEXP_H_H


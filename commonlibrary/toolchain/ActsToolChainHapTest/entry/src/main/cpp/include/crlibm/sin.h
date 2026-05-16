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

#ifndef CRLIBM_SIN_H_H
#define CRLIBM_SIN_H_H

// minimal subset of musl libc-test crlibm/sin.h

// zeros
T(ROUND_TO_NEAREST,                  0x0p+0,                  0x0p+0,          0x0p+0, 0)
T(ROUND_TO_NEAREST,                 -0x0p+0,                 -0x0p+0,          0x0p+0, 0)
T(RU,                  0x0p+0,                  0x0p+0,          0x0p+0, 0)
T(RU,                 -0x0p+0,                 -0x0p+0,          0x0p+0, 0)
T(RD,                  0x0p+0,                  0x0p+0,          0x0p+0, 0)
T(RD,                 -0x0p+0,                 -0x0p+0,          0x0p+0, 0)
T(RZ,                  0x0p+0,                  0x0p+0,          0x0p+0, 0)
T(RZ,                 -0x0p+0,                 -0x0p+0,          0x0p+0, 0)

// smallest denorms
T(ROUND_TO_NEAREST,               0x1p-1074,               0x1p-1074,          0x0p+0, INEXACT|UNDERFLOW)
T(ROUND_TO_NEAREST,              -0x1p-1074,              -0x1p-1074,          0x0p+0, INEXACT|UNDERFLOW)

// infinities and NaNs
T(ROUND_TO_NEAREST,                     INF,                     NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,                    -INF,                     NAN,          0x0p+0, INVALID)
T(ROUND_TO_NEAREST,                     NAN,                     NAN,          0x0p+0, 0)

#endif // CRLIBM_SIN_H_H


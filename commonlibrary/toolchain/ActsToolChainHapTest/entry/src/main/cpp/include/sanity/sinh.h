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

#ifndef SANITY_SINH_H_H
#define SANITY_SINH_H_H

// minimal subset of musl libc-test sanity/sinh.h

T(ROUND_TO_NEAREST,   -0x1.02239f3c6a8f1p+3,  -0x1.8e6152d2b112bp+10,  -0x1.b602ecp-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.161868e18bc67p+2,    0x1.3463e73bcdaaap+5,   0x1.b9162ap-3, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.0c34b3e01e6e7p+3,  -0x1.10d42f1bb3fe5p+11,   0x1.4c0f26p-3, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a206f0a19dcc4p+2,   -0x1.5745bb86e8aefp+8,   0x1.a36ba2p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.288bbb0d6a1e6p+3,   0x1.4abc7717e44f6p+12,  -0x1.f27292p-2, INEXACT)

#endif // SANITY_SINH_H_H


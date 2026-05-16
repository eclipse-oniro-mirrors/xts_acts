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

#ifndef SANITY_SIN_H_H
#define SANITY_SIN_H_H

// minimal subset of musl libc-test sanity/sin.h

T(ROUND_TO_NEAREST,   -0x1.02239f3c6a8f1p+3,   -0x1.f4719cbe20bd2p-1,  -0x1.2a4a16p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.161868e18bc67p+2,   -0x1.dde0a33834424p-1,  -0x1.6902d6p-4, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.0c34b3e01e6e7p+3,   -0x1.ba6a5410cb9ccp-1,  -0x1.e1078ap-4, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a206f0a19dcc4p+2,   -0x1.f7aed6ca5f32fp-3,   -0x1.040d5p-3, INEXACT)
T(ROUND_TO_NEAREST,    0x1.288bbb0d6a1e6p+3,    0x1.41acd05fae3c4p-3,  -0x1.e4265ap-6, INEXACT)

#endif // SANITY_SIN_H_H


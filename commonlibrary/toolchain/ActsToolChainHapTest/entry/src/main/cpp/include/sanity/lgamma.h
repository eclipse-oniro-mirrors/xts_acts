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

#ifndef SANITY_LGAMMA_H_H
#define SANITY_LGAMMA_H_H

T(ROUND_TO_NEAREST,   -0x1.02239f3c6a8f1p+3,   -0x1.0120f61b63d5ep+3,   0x1.89ccc4p-6,          -1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.161868e18bc67p+2,    0x1.1ef3b263fd60bp+1,  -0x1.6d0264p-3,           1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.0c34b3e01e6e7p+3,   -0x1.46d73255263d9p+3,   0x1.e0ec76p-3,          -1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a206f0a19dcc4p+2,   -0x1.9c91f19ac48c5p+2,   0x1.c2a38cp-2,          -1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.288bbb0d6a1e6p+3,    0x1.65c60768fcc11p+3,   0x1.2f22c2p-2,           1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efd0cd80497p-1,    0x1.3cc760be720b3p-2,   0x1.0527e2p-2,           1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a05cc754481d1p-2,    0x1.4ef387fea1014p+0,  -0x1.c3b036p-2,          -1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.1f9ef934745cbp-1,    0x1.d6f0efacc5699p-2,   0x1.c0b0a8p-2,           1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5db097f7442p-1,    0x1.6c1a14cf91533p-3,   0x1.16f4cap-5,           1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.5b86ea8118a0ep-1,    0x1.695b1e0a0a59ep+0,   0x1.ada69ep-2,          -1, INEXACT)

#endif // SANITY_LGAMMA_H_H


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

#ifndef SANITY_LLRINT_H_H
#define SANITY_LLRINT_H_H

T(ROUND_TO_NEAREST,   -0x1.02239f3c6a8f1p+3,          -8, INEXACT)
T(ROUND_TO_NEAREST,    0x1.161868e18bc67p+2,           4, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.0c34b3e01e6e7p+3,          -8, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a206f0a19dcc4p+2,          -7, INEXACT)
T(ROUND_TO_NEAREST,    0x1.288bbb0d6a1e6p+3,           9, INEXACT)
T(ROUND_TO_NEAREST,    0x1.52efd0cd80497p-1,           1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.a05cc754481d1p-2,           0, INEXACT)
T(ROUND_TO_NEAREST,    0x1.1f9ef934745cbp-1,           1, INEXACT)
T(ROUND_TO_NEAREST,    0x1.8c5db097f7442p-1,           1, INEXACT)
T(ROUND_TO_NEAREST,   -0x1.5b86ea8118a0ep-1,          -1, INEXACT)

#endif // SANITY_LLRINT_H_H


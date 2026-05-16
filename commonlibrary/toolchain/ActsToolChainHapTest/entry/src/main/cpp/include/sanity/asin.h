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

#ifndef SANITY_ASIN_H_H
#define SANITY_ASIN_H_H

T(ROUND_TO_NEAREST, -0x1.02239f3c6a8f1p+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.161868e18bc67p+2, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.0c34b3e01e6e7p+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.a206f0a19dcc4p+2, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.288bbb0d6a1e6p+3, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.52efd0cd80497p-1, 0x1.726a0955210cep-1, -0x1.1686b6p-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc754481d1p-2, -0x1.acc889e5e4bd5p-2, -0x1.7b768p-4, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9ef934745cbp-1, 0x1.3169eff0eb11bp-1, -0x1.bcff8ap-4, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5db097f7442p-1, 0x1.c54fd8e34dd3dp-1, -0x1.b3da16p-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86ea8118a0ep-1, -0x1.7dfde9309046cp-1, 0x1.1e721ap-3, INEXACT)

#endif // SANITY_ASIN_H_H

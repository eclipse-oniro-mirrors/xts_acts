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

#ifndef SANITY_ATANHL_H_H
#define SANITY_ATANHL_H_H

T(ROUND_TO_NEAREST, -0x1.02239f3c6a8f13dep+3L, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.161868e18bc67782p+2L, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.0c34b3e01e6e682cp+3L, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, -0x1.a206f0a19dcc3948p+2L, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.288bbb0d6a1e5bdap+3L, NAN, 0x0p+0, INVALID)
T(ROUND_TO_NEAREST, 0x1.52efd0cd80496a5ap-1L, 0x1.97b9ef0bf3dba288p-1L, 0x1.56fc72p-9, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc754481d0bdp-2L, -0x1.b9e47f17be13d41p-2L, -0x1.059282p-4, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9ef934745cad6p-1L, 0x1.45533a999e98ad36p-1L, 0x1.da64b2p-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5db097f744257ep-1L, 0x1.07d5f6618f442484p+0L, 0x1.b1eeecp-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86ea8118a0e2bcp-1L, -0x1.a754af2ab8cdd74ep-1L, 0x1.2a4e2ap-3, INEXACT)

#endif // SANITY_ATANHL_H_H

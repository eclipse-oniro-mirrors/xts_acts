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

#ifndef SANITY_SINCOSF_H_H
#define SANITY_SINCOSF_H_H

// minimal subset of musl libc-test sanity/sincosf.h

T(ROUND_TO_NEAREST, -0x1.0223ap+3, -0x1.f4719ap-1, 0x1.481cf2p-4, -0x1.b0aabep-3, 0x1.eee272p-2, INEXACT)
T(ROUND_TO_NEAREST, 0x1.161868p+2, -0x1.dde0ap-1, 0x1.6107cap-2, -0x1.6f9238p-2, 0x1.5c33e2p-5, INEXACT)
T(ROUND_TO_NEAREST, -0x1.0c34b4p+3, -0x1.ba6a54p-1, -0x1.dfe862p-2, -0x1.01b4e2p-1, -0x1.1be494p-3, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a206fp+2, -0x1.f7aec4p-3, -0x1.95029cp-2, 0x1.f0462cp-1, 0x1.6df7bcp-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.288bbcp+3, 0x1.41ac94p-3, -0x1.eba8d2p-3, -0x1.f9a51ep-1, 0x1.1c971cp-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.52efdp-1, 0x1.3ab7ecp-1, -0x1.3bafcap-4, 0x1.93da12p-1, 0x1.322268p-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.a05cc8p-2, -0x1.94fbf8p-2, -0x1.e01394p-4, 0x1.d6419ap-1, 0x1.f0a754p-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.1f9efap-1, 0x1.10baf4p-1, -0x1.48e402p-3, 0x1.b150bap-1, -0x1.ec3366p-3, INEXACT)
T(ROUND_TO_NEAREST, 0x1.8c5dbp-1, 0x1.65f1c6p-1, 0x1.0e2d0ap-2, 0x1.6e164ep-1, -0x1.595b9cp-2, INEXACT)
T(ROUND_TO_NEAREST, -0x1.5b86eap-1, -0x1.417318p-1, 0x1.5010ccp-8, 0x1.8e83d4p-1, 0x1.52f278p-3, INEXACT)

#endif // SANITY_SINCOSF_H_H

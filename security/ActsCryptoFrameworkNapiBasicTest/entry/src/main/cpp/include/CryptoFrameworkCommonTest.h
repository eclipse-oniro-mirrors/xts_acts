/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#ifndef OHCRYPTO_COMMON_TEST_H
#define OHCRYPTO_COMMON_TEST_H

#include <cstdint>
#include <cstddef>

constexpr size_t RSA4096_PRI_KEY_LEN = 2416;
constexpr size_t RSA4096_PUB_KEY_LEN = 592;
constexpr size_t RSA3072_PRI_KEY_LEN = 1824;
constexpr size_t RSA3072_PUB_KEY_LEN = 464;
constexpr size_t RSA8192_PRI_KEY_LEN = 4720;
constexpr size_t RSA8192_PUB_KEY_LEN = 1104;

extern uint8_t g_rsa4096PriKey[RSA4096_PRI_KEY_LEN];
extern uint8_t g_rsa4096PubKey[RSA4096_PUB_KEY_LEN];
extern uint8_t g_rsa3072PriKey[RSA3072_PRI_KEY_LEN];
extern uint8_t g_rsa3072PubKey[RSA3072_PUB_KEY_LEN];
extern uint8_t g_rsa8192PriKey[RSA8192_PRI_KEY_LEN];
extern uint8_t g_rsa8192PubKey[RSA8192_PUB_KEY_LEN];

#endif // OHCRYPTO_COMMON_TEST_H
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef OHCRYPTO_MAC_TEST_H
#define OHCRYPTO_MAC_TEST_H

#include "crypto_common.h"
#include "crypto_mac.h"
#include "crypto_rand.h"
#include "crypto_sym_key.h"

#define OHTEST_MAC_HMAC "HMAC"
#define OHTEST_MAC_CMAC "CMAC"

typedef struct {
    const char *type;
    const char *algoKeyName;
    union {
        const char *degistName;
        const char *cipherName;
    } paramType;
} MacSpec;

typedef struct {
    const char *macType;
    const char *vectorSource;
    const char *algoName;
    uint8_t key[256];
    size_t keyLen;
    uint8_t msg[256];
    size_t msgLen;
    uint8_t expectMac[64];
    size_t macLen;
} VectorMacSpec;

#endif
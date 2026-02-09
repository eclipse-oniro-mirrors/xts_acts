/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef OHCRYPTO_CIPHER_TEST_H
#define OHCRYPTO_CIPHER_TEST_H

#include "crypto_common.h"
#include "crypto_sym_cipher.h"

#define OH_CRYPTO_ENCRYPT_MODE 0
#define OH_CRYPTO_DECRYPT_MODE 1

#define OH_CRYPTO_AES_BLOCKSIZE 16

#define OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE 64
#define OH_CRYPTO_GCM_TAG_LEN 16
#define OH_CRYPTO_CCM_TAG_LEN 12

#define OH_CRYPTO_CHACHA20_POLY1305_TAG_LEN 16

typedef struct SymCipherSpec {
    uint8_t *algName;
    uint8_t *cipherAlgName;
    uint32_t ivLen;
    uint32_t aadLen;
    uint32_t tagLen;
    uint32_t msgLen;
    bool ispadding;
} SymCipherSpec;

#endif
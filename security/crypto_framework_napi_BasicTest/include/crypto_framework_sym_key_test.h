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
#ifndef OHCRYPTO_SYMKEY_TEST_H
#define OHCRYPTO_SYMKEY_TEST_H

#include "crypto_common.h"
#include "crypto_sym_key.h"


typedef struct SymKeySpec {
    uint8_t *algName;
    int bits;
    uint8_t *getAlgName;
} SymKeySpec;

#define OH_CRYPTO_AES_128_KEY_SIZE        128
#define OH_CRYPTO_AES_192_KEY_SIZE        192
#define OH_CRYPTO_AES_256_KEY_SIZE        256

#define OH_CRYPTO_3DES_192_KEY_SIZE       192

#define OH_CRYPTO_SM4_128_KEY_SIZE        128

#define OH_CRYPTO_HMAC_SHA1_KEY_SIZE      160
#define OH_CRYPTO_HMAC_SHA224_KEY_SIZE    224
#define OH_CRYPTO_HMAC_SHA256_KEY_SIZE    256
#define OH_CRYPTO_HMAC_SHA384_KEY_SIZE    384
#define OH_CRYPTO_HMAC_SHA512_KEY_SIZE    512
#define OH_CRYPTO_HMAC_SM3_KEY_SIZE       256

#endif

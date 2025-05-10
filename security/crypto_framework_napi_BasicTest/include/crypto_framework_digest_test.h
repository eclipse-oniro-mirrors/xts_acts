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
#ifndef OHCRYPTO_DIGEST_TEST_H
#define OHCRYPTO_DIGEST_TEST_H

#include "crypto_common.h"
#include "crypto_digest.h"

typedef struct MdSpec {
    uint8_t *algName;
    int mdLen;
} MdSpec;

typedef struct MdMultSpec {
    OH_CryptoDigest *ctx;
    Crypto_DataBlob *in;
} MdMultSpec;

#define OH_CRYPTO_MD5_DIGESTSIZE    16
#define OH_CRYPTO_SHA1_DIGESTSIZE   20
#define OH_CRYPTO_SHA224_DIGESTSIZE 28
#define OH_CRYPTO_SHA256_DIGESTSIZE 32
#define OH_CRYPTO_SHA384_DIGESTSIZE 48
#define OH_CRYPTO_SHA512_DIGESTSIZE 64
#define OH_CRYPTO_SM3_DIGESTSIZE    32

#define OH_CRYPTO_DIGEST_DATA_MAX   (1024 * 1024 * 100)
#define OH_CRYPTO_DIGEST_DATA_SIZE  64
#define OH_CRYPTO_ITERATIONS_NUMBER 3

#define OH_CRYPTO_RETURN_NULL nullptr
#define OH_CRYPTO_STABILITY_RUN_TIMES 1000

void OH_CryptoDigestMultUpdate(MdMultSpec *in);

#endif

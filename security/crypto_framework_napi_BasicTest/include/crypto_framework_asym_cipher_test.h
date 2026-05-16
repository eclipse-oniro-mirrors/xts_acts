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
#ifndef OHCRYPTO_ASYM_CIPHER_TEST_H
#define OHCRYPTO_ASYM_CIPHER_TEST_H

#include "crypto_common.h"
#include "crypto_asym_cipher.h"
#include "crypto_framework_common_test.h"

#define OHTEST_RSA_512_KEYSIZE 64
#define OHTEST_RSA_768_KEYSIZE 96
#define OHTEST_RSA_1024_KEYSIZE 128
#define OHTEST_RSA_2048_KEYSIZE 256
#define OHTEST_RSA_3072_KEYSIZE 384
#define OHTEST_RSA_4096_KEYSIZE 512
#define OHTEST_RSA_8192_KEYSIZE 1024

#define OHTEST_MD5_DIGIESTSIZE 16
#define OHTEST_SHA1_DIGIESTSIZE 20
#define OHTEST_SHA224_DIGIESTSIZE 28
#define OHTEST_SHA256_DIGIESTSIZE 32
#define OHTEST_SHA384_DIGIESTSIZE 48
#define OHTEST_SHA512_DIGIESTSIZE 64
#define OHTEST_SM3_DIGIESTSIZE 32

#define OHTEST_RSA_PKCS1_PADDING_SIZE 11

typedef struct {
    const char *algoName;
    const char *cipherName;
    int pkLen;
} AsymCipherSpec;

typedef struct {
    const char *algoName;
    const char *cipherName;
    int pkLen;
    int len;
} AsymSegmentCipherSpec;

#endif
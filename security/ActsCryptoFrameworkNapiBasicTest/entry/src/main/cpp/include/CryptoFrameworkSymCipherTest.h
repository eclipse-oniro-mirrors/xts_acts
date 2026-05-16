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
#ifndef OHCRYPTO_CIPHER_TEST_H
#define OHCRYPTO_CIPHER_TEST_H

#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_sym_cipher.h>

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

namespace Unittest::CryptoFramework {

const size_t SYM_CIPHER_DATA_COUNT = 76;
const size_t SYM_AES_WRAP_CIPHER_DATA_COUNT = 6;
const size_t SYM_CHA_CHA20_POLY1305_CIPHER_DATA_COUNT = 1;
const size_t SYM_CIPHER_GCM_DATA_COUNT = 12;
const size_t SYM_CIPHER_CCM_DATA_COUNT = 9;
const size_t SYM_CIPHER_IV_ERROR_COUNT = 8;
const size_t CHA_CHA20_IV_ERROR_COUNT = 1;

extern SymCipherSpec g_symCipherData[SYM_CIPHER_DATA_COUNT];
extern SymCipherSpec g_symAesWrapCipherData[SYM_AES_WRAP_CIPHER_DATA_COUNT];
extern SymCipherSpec g_symChaCha20Poly1305CipherData[SYM_CHA_CHA20_POLY1305_CIPHER_DATA_COUNT];
extern SymCipherSpec g_symCipherGCMData[SYM_CIPHER_GCM_DATA_COUNT];
extern SymCipherSpec g_symCipherCCMData[SYM_CIPHER_CCM_DATA_COUNT];
extern SymCipherSpec g_symCipherIvError[SYM_CIPHER_IV_ERROR_COUNT];
extern SymCipherSpec g_chaCha20IvError[CHA_CHA20_IV_ERROR_COUNT];
    
int SubCryptoFrameworkNapiSymCipherTest0100 ();
int SubCryptoFrameworkNapiSymCipherTest0200 ();
int SubCryptoFrameworkNapiSymCipherTest0300 ();
int SubCryptoFrameworkNapiSymCipherTest0400 ();
int SubCryptoFrameworkNapiSymCipherTest3100 ();
int SubCryptoFrameworkNapiSymCipherTest0500 ();
int SubCryptoFrameworkNapiSymCipherTest0600 ();
int SubCryptoFrameworkNapiSymCipherTest0700 ();
int SubCryptoFrameworkNapiSymCipherTest0800 ();
int SubCryptoFrameworkNapiSymCipherTest0900 ();
int SubCryptoFrameworkNapiSymCipherTest1000 ();
int SubCryptoFrameworkNapiSymCipherTest1100 ();
int SubCryptoFrameworkNapiSymCipherTest1200 ();
int SubCryptoFrameworkNapiSymCipherTest1300 ();
int SubCryptoFrameworkNapiSymCipherTest1400 ();
int SubCryptoFrameworkNapiSymCipherTest1500 ();
int SubCryptoFrameworkNapiSymCipherTest1600 ();
int SubCryptoFrameworkNapiSymCipherTest1700 ();
int SubCryptoFrameworkNapiSymCipherTest1800 ();
int SubCryptoFrameworkNapiSymCipherTest1900 ();
int SubCryptoFrameworkNapiSymCipherTest2000 ();
int SubCryptoFrameworkNapiSymCipherTest2100 ();
int SubCryptoFrameworkNapiSymCipherTest2200 ();
int SubCryptoFrameworkNapiSymCipherTest2300 ();
int SubCryptoFrameworkNapiSymCipherTest2600 ();
int SubCryptoFrameworkNapiSymCipherTest2700 ();
int SubCryptoFrameworkNapiSymCipherTest2800 ();
int SubCryptoFrameworkNapiSymCipherTest2900 ();
int SubCryptoFrameworkNapiSymCipherTest3000 ();
}
#endif
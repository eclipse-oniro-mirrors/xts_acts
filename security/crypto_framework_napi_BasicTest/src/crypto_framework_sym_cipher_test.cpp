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
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>

#include "crypto_framework_sym_cipher_test.h"
#include "blob.h"
#include "log.h"
#include "rand.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkSymCipherNapiTest {

class OHCryptoFrameworkSymCipherNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class SYMCIPHER_TEST : public testing::TestWithParam<SymCipherSpec> {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};

class OHCryptoFrameworkSymCipherIvErrorNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class SYMCIPHER_IV_ERROR_TEST : public testing::TestWithParam<SymCipherSpec> {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};

class OHCryptoFrameworkSymCipherGcmNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class OHCryptoFrameworkSymCipherCcmNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class SYMCIPHER_GCM_TEST : public testing::TestWithParam<SymCipherSpec> {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};

class SYMCIPHER_CCM_TEST : public testing::TestWithParam<SymCipherSpec> {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};

SymCipherSpec g_symCipherData[] = {
    {(uint8_t *)"AES128", (uint8_t *)"AES128|ECB|NoPadding", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|ECB|NoPadding", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|ECB|NoPadding", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CBC|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CBC|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CBC|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CTR|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CTR|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CTR|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|OFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|OFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|OFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|ECB|NoPadding", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CBC|NoPadding", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|OFB|NoPadding", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CFB|NoPadding", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|ECB|NoPadding", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CBC|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CTR|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|OFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB128|NoPadding", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},

    {(uint8_t *)"AES128", (uint8_t *)"AES128|ECB|PKCS5", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true}, // 25
    {(uint8_t *)"AES192", (uint8_t *)"AES128|ECB|PKCS5", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|ECB|PKCS5", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CBC|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CBC|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CBC|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true}, // 30
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CTR|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CTR|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CTR|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|OFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|OFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|OFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true}, // 39
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|ECB|PKCS5", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true}, // 40
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CBC|PKCS5", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|OFB|PKCS5", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CFB|PKCS5", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|ECB|PKCS5", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CBC|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CTR|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|OFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB128|PKCS5", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},  // 49

    {(uint8_t *)"AES128", (uint8_t *)"AES128|ECB|PKCS7", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|ECB|PKCS7", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|ECB|PKCS7", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CBC|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CBC|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CBC|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CTR|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CTR|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CTR|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|CFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|OFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|OFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES128|OFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|ECB|PKCS7", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CBC|PKCS7", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|OFB|PKCS7", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"3DES192", (uint8_t *)"3DES192|CFB|PKCS7", 8, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|ECB|PKCS7", 0, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CBC|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CTR|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|OFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|CFB128|PKCS7", 16, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
};

SymCipherSpec g_symCipherGCMData[] = {
    {(uint8_t *)"AES128", (uint8_t *)"AES128|GCM|NoPadding", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|GCM|NoPadding", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|GCM|NoPadding", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|GCM|NoPadding", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},

    {(uint8_t *)"AES128", (uint8_t *)"AES128|GCM|PKCS5", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|GCM|PKCS5", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|GCM|PKCS5", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|GCM|PKCS5", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},

    {(uint8_t *)"AES128", (uint8_t *)"AES128|GCM|PKCS7", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|GCM|PKCS7", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|GCM|PKCS7", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"SM4_128", (uint8_t *)"SM4_128|GCM|PKCS7", 12, 16, 16, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
};

SymCipherSpec g_symCipherCCMData[] = {
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CCM|NoPadding", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|CCM|NoPadding", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|CCM|NoPadding", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},

    {(uint8_t *)"AES128", (uint8_t *)"AES128|CCM|PKCS5", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|CCM|PKCS5", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|CCM|PKCS5", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},

    {(uint8_t *)"AES128", (uint8_t *)"AES128|CCM|PKCS7", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES192|CCM|PKCS7", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES256", (uint8_t *)"AES256|CCM|PKCS7", 7, 8, 12, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
};

SymCipherSpec g_symCipherIvError[] = {
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CBC|NoPadding", 15, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CBC|NoPadding", 17, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CTR|NoPadding", 15, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CTR|NoPadding", 17, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|CFB|NoPadding", 15, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|CFB|NoPadding", 17, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES128", (uint8_t *)"AES128|OFB|NoPadding", 15, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
    {(uint8_t *)"AES192", (uint8_t *)"AES128|OFB|NoPadding", 17, 0, 0, OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE, true},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymCipherNapiTest, SYMCIPHER_TEST, ::testing::ValuesIn(g_symCipherData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymCipherGcmNapiTest, SYMCIPHER_GCM_TEST, ::testing::ValuesIn(g_symCipherGCMData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymCipherCcmNapiTest, SYMCIPHER_CCM_TEST, ::testing::ValuesIn(g_symCipherCCMData));
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymCipherIvErrorNapiTest, SYMCIPHER_IV_ERROR_TEST, ::testing::ValuesIn(g_symCipherIvError));

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0100
* @tc.name OHCryptoFrameworkSymCipherNapiTest/SYMCIPHER_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0100/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_TEST, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0100, TestSize.Level0)
{
    SymCipherSpec symCipherData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = symCipherData.msgLen;
    int32_t ivLen = symCipherData.ivLen;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    }
    // generater SymKey
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    // params
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    }
    // encrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    // decrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherData.cipherAlgName, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0200
* @tc.name OHCryptoFrameworkSymCipherGcmNapiTest/SYMCIPHER_GCM_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0200/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_GCM_TEST, Security_CryptoFramework_NAPI_SymCipher_Test_0200, TestSize.Level0)
{
    SymCipherSpec symCipherAEADData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = symCipherAEADData.msgLen;
    int32_t ivLen = symCipherAEADData.ivLen;
    int32_t aadLen = symCipherAEADData.aadLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    HcfBlob aadBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob tag = {.data = nullptr, .len = 0};
    uint8_t tagArr[OH_CRYPTO_GCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr), .len = OH_CRYPTO_GCM_TAG_LEN};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);
    // generater SymKey
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherAEADData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    // params
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB, (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    // encrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &tag), CRYPTO_SUCCESS);
    // decrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&tag);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0300
* @tc.name OHCryptoFrameworkSymCipherCcmNapiTest/SYMCIPHER_CCM_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0300/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_CCM_TEST, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0300, TestSize.Level0)
{
    SymCipherSpec symCipherAEADData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = symCipherAEADData.msgLen;
    int32_t ivLen = symCipherAEADData.ivLen;
    int32_t aadLen = symCipherAEADData.aadLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    HcfBlob aadBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob tag = {.data = nullptr, .len = 0};
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr), .len = OH_CRYPTO_CCM_TAG_LEN};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);
    // generater SymKey
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherAEADData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    // params
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB, (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    // encrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &tag), CRYPTO_SUCCESS);
    // decrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&tag);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0400
* @tc.name OHCryptoFrameworkSymCipherNapiTest/SYMCIPHER_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0400/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_TEST, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0400, TestSize.Level0)
{
    SymCipherSpec symCipherData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    int32_t ivLen = symCipherData.ivLen;
    int32_t cipherLen = 0;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    int blockSize = 20;
    int cnt = randomLen / blockSize;
    int rem = randomLen % blockSize;
    uint8_t cipherText[OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE + 16] = {0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    }
    // generater SymKey
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    // params
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    }
    // encrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    for (int i = 0; i < cnt; i++) {
        OH_Crypto_FreeDataBlob(&outUpdate);
        msgBlob.len = blockSize;
        EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
        msgBlob.data += blockSize;
        memcpy(&cipherText[cipherLen], outUpdate.data, outUpdate.len);
        cipherLen += outUpdate.len;
    }
    if (rem > 0) {
        msgBlob.len = rem;
        OH_Crypto_FreeDataBlob(&outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
        memcpy(&cipherText[cipherLen], outUpdate.data, outUpdate.len);
        cipherLen += outUpdate.len;
    }
    if (symCipherData.ispadding) {
        OH_Crypto_FreeDataBlob(&outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &outUpdate), CRYPTO_SUCCESS);
        memcpy(&cipherText[cipherLen], outUpdate.data, outUpdate.len);
        cipherLen += outUpdate.len;
    }
    Crypto_DataBlob cipherBlob = {
        .data = reinterpret_cast<uint8_t *>(cipherText),
        .len = cipherLen
    };
    // decrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherData.cipherAlgName, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(decCtx, &cipherBlob, &decUpdate), CRYPTO_SUCCESS);
    msgBlob.data -=  OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE - rem;
    msgBlob.len = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0401
* @tc.name OHCryptoFrameworkSymCipherGcmNapiTest/SYMCIPHER_GCM_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0401/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_GCM_TEST, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0401, TestSize.Level0)
{
    SymCipherSpec symCipherAEADData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    int32_t ivLen = symCipherAEADData.ivLen;
    int32_t aadLen = symCipherAEADData.aadLen;
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    HcfBlob aadBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob tag = {.data = nullptr, .len = 0};
    uint8_t tagArr[OH_CRYPTO_GCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr), .len = OH_CRYPTO_GCM_TAG_LEN};
    int32_t cipherLen = 0;
    int blockSize = 20;
    int cnt = randomLen / blockSize;
    int rem = randomLen % blockSize;
    uint8_t cipherText[OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE + 16] = {0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);
    // generater SymKey
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherAEADData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    // params
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB, (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    // encrypto
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    for (int i = 0; i < cnt; i++) {
        msgBlob.len = blockSize;
        OH_Crypto_FreeDataBlob(&outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
        msgBlob.data += blockSize;
        memcpy(&cipherText[cipherLen], outUpdate.data, outUpdate.len);
        cipherLen += outUpdate.len;
    }
    if (rem > 0) {
        OH_Crypto_FreeDataBlob(&outUpdate);
        msgBlob.len = rem;
        EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
        memcpy(&cipherText[cipherLen], outUpdate.data, outUpdate.len);
        cipherLen += outUpdate.len;
    }
    if (symCipherAEADData.ispadding) {
        EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &tag), CRYPTO_SUCCESS);
    }
    Crypto_DataBlob cipherBlob = {
        .data = reinterpret_cast<uint8_t *>(cipherText),
        .len = cipherLen
    };

    // decrypto
    msgBlob.data -=  OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE - rem;
    msgBlob.len = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherAEADData.cipherAlgName, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &cipherBlob, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&tag);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0500
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0500
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0500, TestSize.Level0)
{
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(nullptr), CRYPTO_INVALID_PARAMS);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0600
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0600
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0600, TestSize.Level0)
{
    OH_CryptoSymCipherParams *params = nullptr;
    HcfBlob ivBlob = {0};
    
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(nullptr, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0700
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0700
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0700, TestSize.Level0)
{
    OH_CryptoSymCipher *encCtx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|GCM|NoPadding", nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(nullptr, &encCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|XTS|NoPadding", &encCtx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"aes128|GCM|NoPadding", &encCtx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"RSA512", &encCtx), CRYPTO_INVALID_PARAMS);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0800
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0800
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0800, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymCipherParams *params_gcm = nullptr;
    HcfRand *randomObj = nullptr;
    int32_t ivLen = 16;
    int32_t aadLen = 16;
    HcfBlob ivBlob = {0};
    HcfBlob aadBlob = {0};
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr), .len = OH_CRYPTO_CCM_TAG_LEN};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);

    if (ivLen != 0) {
        EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES256", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params_gcm), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params_gcm, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params_gcm, CRYPTO_AAD_DATABLOB, (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params_gcm, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(nullptr, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, nullptr, params), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params_gcm), CRYPTO_SUCCESS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipherParams_Destroy(params_gcm);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0900
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0900
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_0900, TestSize.Level0)
{
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES256", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Update(nullptr, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, nullptr, &outUpdate), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1000
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1000
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1000, TestSize.Level0)
{
    OH_CryptoSymCipher *encCtx = nullptr;
    Crypto_DataBlob out= {.data = nullptr, .len = 0};
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(nullptr, &msgBlob, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, &msgBlob, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, &msgBlob, &out), CRYPTO_INVALID_PARAMS);

    EXPECT_EQ(OH_CryptoSymCipher_GetAlgoName(nullptr), nullptr);

    OH_CryptoSymCipher_Destroy(encCtx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1100
* @tc.name OHCryptoFrameworkSymCipherIvErrorNapiTest/SYMCIPHER_IV_ERROR_TEST.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1100/x
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(SYMCIPHER_IV_ERROR_TEST, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1100, TestSize.Level0)
{
    SymCipherSpec symCipherData = GetParam();
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t ivLen = symCipherData.ivLen;
    HcfRand *randomObj = nullptr;
    HcfBlob ivBlob = {0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)symCipherData.algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)symCipherData.cipherAlgName, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1200
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1200
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1200, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t ivLen = 7;
    int32_t aadLen = 9;
    HcfRand *randomObj = nullptr;
    HcfBlob ivBlob = {0};
    HcfBlob aadBlob = {0};
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr), .len = OH_CRYPTO_CCM_TAG_LEN};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB, (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CCM|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1300
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1300
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1300, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 20;
    int32_t ivLen = 16;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    outUpdate.data[msgBlob.len]++;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1400
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1400
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1400, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 20;
    int32_t ivLen = 16;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    outUpdate.data[randomLen - OH_CRYPTO_AES_BLOCKSIZE - 1]++; 
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) != 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1500
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1500
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1500, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 20;
    int32_t ivLen = 16;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|NoPadding", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);
    EXPECT_TRUE(msgBlob.len != decUpdate.len);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1600
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1600
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1600, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 64;
    int32_t ivLen = 16;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[63] = 1; // 刚好符合PKCS7填充方式
    EXPECT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|NoPadding", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|PKCS7", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) != 0);
    EXPECT_TRUE(msgBlob.len == decUpdate.len + 1);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfObjDestroy(randomObj);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1700
* @tc.name OHCryptoFrameworkSymCipherNapiTest.SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1700
* @tc.desc algorithm is Sym Cipher
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkSymCipherNapiTest, SUB_Security_CryptoFramework_NAPI_SymCipher_Test_1700, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
     
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 16;
    int32_t ivLen = 16;
    
    HcfRand *randomObj = nullptr;
    HcfBlob msgBlob = {0};
    HcfBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    HcfRandCreate(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    ASSERT_EQ(randomObj->generateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    ASSERT_EQ(randomObj->generateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    ASSERT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES256", &genCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|NoPadding", &encCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Create((const char *)"AES256|ECB|PKCS7", &decCtx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((HcfBlob *)&outUpdate);
    HcfBlobDataClearAndFree((HcfBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfObjDestroy(randomObj);
}


} // namespace Unittest::CryptoFrameworkSymCipherNapiTest
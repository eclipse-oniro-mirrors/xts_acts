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

#include "crypto_framework_digest_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkDigestNapiTest {
class OHCryptoFrameworkDigestNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void OHCryptoFrameworkDigestNapiTest::SetUpTestCase(void)
{
}

void OHCryptoFrameworkDigestNapiTest::TearDownTestCase(void)
{
}

void OHCryptoFrameworkDigestNapiTest::SetUp()
{
}

void OHCryptoFrameworkDigestNapiTest::TearDown()
{
}

void *OH_CryptoDigestMultUpdate(void *args)
{
    MdMultSpec *in = (MdMultSpec *)args;
    EXPECT_EQ(OH_CryptoDigest_Update(in->ctx, in->in), CRYPTO_SUCCESS);

    return nullptr;
}

MdSpec g_mdData[] = {
    {(uint8_t *)"MD5", OH_CRYPTO_MD5_DIGESTSIZE},
    {(uint8_t *)"SHA1", OH_CRYPTO_SHA1_DIGESTSIZE},
    {(uint8_t *)"SHA224", OH_CRYPTO_SHA224_DIGESTSIZE},
    {(uint8_t *)"SHA256", OH_CRYPTO_SHA256_DIGESTSIZE},
    {(uint8_t *)"SHA384", OH_CRYPTO_SHA384_DIGESTSIZE},
    {(uint8_t *)"SHA512", OH_CRYPTO_SHA512_DIGESTSIZE},
    {(uint8_t *)"SM3", OH_CRYPTO_SM3_DIGESTSIZE},
};

class MD_TEST : public testing::TestWithParam<MdSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkDigestNapiTest, MD_TEST, ::testing::ValuesIn(g_mdData));

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0100
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0100/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, SUB_Security_CryptoFramework_NAPI_Digest_Test_0100, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";
    
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    int mdLen = 0;
    
    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoDigest_Update(ctx, &in);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    mdLen = OH_CryptoDigest_GetLength(ctx);
    EXPECT_EQ(mdLen, mdData.mdLen);
    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0200
* @tc.name OHCryptoFrameworkDigestNapiTest.SUB_Security_CryptoFramework_NAPI_Digest_Test_0200
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkDigestNapiTest, SUB_Security_CryptoFramework_NAPI_Digest_Test_0200, TestSize.Level0)
{
    OH_CryptoDigest *ctx = nullptr;
    
    EXPECT_EQ(OH_CryptoDigest_Create("MD9", &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Create("MD5", nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0300
* @tc.name OHCryptoFrameworkDigestNapiTest.SUB_Security_CryptoFramework_NAPI_Digest_Test_0300
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkDigestNapiTest, SUB_Security_CryptoFramework_NAPI_Digest_Test_0300, TestSize.Level0)
{
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob in2 = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = 0
    };
    
    EXPECT_EQ(OH_CryptoDigest_Create("SHA1", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoDigest_Update(nullptr, &in), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Update(ctx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Update(ctx, &in2), CRYPTO_INVALID_PARAMS);
    OH_DigestCrypto_Destroy(ctx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0400
* @tc.name OHCryptoFrameworkDigestNapiTest.SUB_Security_CryptoFramework_NAPI_Digest_Test_0400
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkDigestNapiTest, SUB_Security_CryptoFramework_NAPI_Digest_Test_0400, TestSize.Level0)
{
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    EXPECT_EQ(OH_CryptoDigest_Create("SHA224", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoDigest_Update(ctx, &in), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoDigest_Final(ctx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Final(nullptr, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_GetLength(nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_GetAlgoName(nullptr), OH_CRYPTO_RETURN_NULL);
    OH_DigestCrypto_Destroy(ctx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0500
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0500/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, Security_CryptoFramework_NAPI_Digest_Test_0500, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    uint8_t *testData = (uint8_t *)malloc(OH_CRYPTO_DIGEST_DATA_MAX);
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = OH_CRYPTO_DIGEST_DATA_MAX
    };
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    int mdLen = 0;
    
    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoDigest_Update(ctx, &in);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    mdLen = OH_CryptoDigest_GetLength(ctx);
    EXPECT_EQ(mdLen, mdData.mdLen);
    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
    free(testData);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0600
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0600/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, SUB_Security_CryptoFramework_NAPI_Digest_Test_0600, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    for (int i = 0; i < OH_CRYPTO_ITERATIONS_NUMBER; i++) {
        ret = OH_CryptoDigest_Update(ctx, &in);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
    }
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);


    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0700
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0700/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, SUB_Security_CryptoFramework_NAPI_Digest_Test_0700, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";
    pthread_t thrd[OH_CRYPTO_ITERATIONS_NUMBER];
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    MdMultSpec multIn = {
        .ctx = ctx,
        .in = &in
    };
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    for (int i = 0; i < OH_CRYPTO_ITERATIONS_NUMBER; i++) {
        int thrd_ret = pthread_create(&thrd[i], nullptr, OH_CryptoDigestMultUpdate, &multIn);
        EXPECT_EQ(thrd_ret, CRYPTO_SUCCESS);
    }
    for (int i = 0; i < OH_CRYPTO_ITERATIONS_NUMBER; i++) {
        int thrd_ret = pthread_join(thrd[i], nullptr);
        EXPECT_EQ(thrd_ret, CRYPTO_SUCCESS);
    }
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0800
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0800/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, SUB_Security_CryptoFramework_NAPI_Digest_Test_0800, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    const char *algoName = OH_CryptoDigest_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp((const char *)mdData.algName, algoName, strlen(algoName)) == 0);
    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_Digest_Test_0900
* @tc.name OHCryptoFrameworkDigestNapiTest/MD_TEST.SUB_Security_CryptoFramework_NAPI_Digest_Test_0900/x
* @tc.desc algorithm is Digest
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(MD_TEST, SUB_Security_CryptoFramework_NAPI_Digest_Test_0900, TestSize.Level0)
{
    MdSpec mdData = GetParam();
    OH_Crypto_ErrCode ret;
    OH_CryptoDigest *ctx = nullptr;
    uint8_t *testData = (uint8_t *)malloc(OH_CRYPTO_DIGEST_DATA_MAX);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    int isBlockSize = 20;
    int offset = 0;
    
    ret = OH_CryptoDigest_Create((const char *)mdData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    for (int i = 0; i < OH_CRYPTO_DIGEST_DATA_MAX / isBlockSize; i++) {
        Crypto_DataBlob in = {
            .data = reinterpret_cast<uint8_t *>(testData + offset),
            .len = isBlockSize
        };
        ret = OH_CryptoDigest_Update(ctx, &in);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        offset += isBlockSize;
    }
    ret = OH_CryptoDigest_Final(ctx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);

    OH_DigestCrypto_Destroy(ctx);
    HcfBlobDataClearAndFree((HcfBlob *)&out);
    free(testData);
}

} // namespace Unittest::CryptoFrameworkDigestNapiTest

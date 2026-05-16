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
#include <cstdlib>
#include <cstdio>
#include <pthread.h>
#include <cstring>

#include "include/CryptoFrameworkDigestTest.h"
#include "include/CommonToolTest.h"
#include <native_drawing/drawing_text_blob.h>
#include <hilog/log.h>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkDigestNapiTest {
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
    {reinterpret_cast<uint8_t*>(const_cast<char*>("MD5")), OH_CRYPTO_MD5_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA1")), OH_CRYPTO_SHA1_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA224")), OH_CRYPTO_SHA224_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA256")), OH_CRYPTO_SHA256_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA384")), OH_CRYPTO_SHA384_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA512")), OH_CRYPTO_SHA512_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM3")), OH_CRYPTO_SM3_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA3-256")), OH_CRYPTO_SHA3_256_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA3-384")), OH_CRYPTO_SHA3_384_DIGESTSIZE},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SHA3-512")), OH_CRYPTO_SHA3_512_DIGESTSIZE},
};

class MD_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

int SubCryptoFrameworkNapiDigestTest0100()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        uint8_t testData[] = "0123456789";
        
        Crypto_DataBlob in = {
            .data = reinterpret_cast<uint8_t *>(testData),
            .len = sizeof(testData)
        };
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        int mdLen = 0;
        
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoDigest_Update(ctx, &in);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        mdLen = OH_CryptoDigest_GetLength(ctx);
        EXPECT_EQ(mdLen, mdData.mdLen);
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
    }
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0200()
{
    OH_CryptoDigest *ctx = nullptr;
    
    EXPECT_EQ(OH_CryptoDigest_Create("MD9", &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Create("MD5", nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoDigest_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0300()
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
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0400()
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
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0500()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        if (OH_CRYPTO_DIGEST_DATA_MAX == 0) {
            EXPECT_FALSE(true);
            continue;
        }
        uint8_t *testData = (uint8_t *)malloc(OH_CRYPTO_DIGEST_DATA_MAX);
        if (testData == nullptr) {
            EXPECT_FALSE(true);
            continue;
        }
        Crypto_DataBlob in = {
            .data = testData,
            .len = OH_CRYPTO_DIGEST_DATA_MAX
        };
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        int mdLen = 0;
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        if (ctx == nullptr) {
            EXPECT_FALSE(true);
            free(testData);
            continue;
        }
        ret = OH_CryptoDigest_Update(ctx, &in);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        mdLen = OH_CryptoDigest_GetLength(ctx);
        EXPECT_EQ(mdLen, mdData.mdLen);
        
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
        free(testData);
    }
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0600()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        uint8_t testData[] = "0123456789";
        Crypto_DataBlob in = {
            .data = reinterpret_cast<uint8_t *>(testData),
            .len = sizeof(testData)
        };
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        for (int i1 = 0; i1 < OH_CRYPTO_ITERATIONS_NUMBER; i1++) {
            ret = OH_CryptoDigest_Update(ctx, &in);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
        }
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
    
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
    }
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0700()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        uint8_t testData[] = "0123456789";
        pthread_t thrd[OH_CRYPTO_ITERATIONS_NUMBER];
        Crypto_DataBlob in = {
            .data = reinterpret_cast<uint8_t *>(testData),
            .len = sizeof(testData)
        };
        
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        MdMultSpec multIn = {
            .ctx = ctx,
            .in = &in
        };
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        for (int i1 = 0; i1 < OH_CRYPTO_ITERATIONS_NUMBER; i1++) {
            int thrdRet = pthread_create(&thrd[i1], nullptr, OH_CryptoDigestMultUpdate, &multIn);
            EXPECT_EQ(thrdRet, CRYPTO_SUCCESS);
        }
        for (int i2 = 0; i2 < OH_CRYPTO_ITERATIONS_NUMBER; i2++) {
            int thrdRet = pthread_join(thrd[i2], nullptr);
            EXPECT_EQ(thrdRet, CRYPTO_SUCCESS);
        }
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
    }
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0800()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        const char *algoName = OH_CryptoDigest_GetAlgoName(ctx);
        EXPECT_TRUE(memcmp(reinterpret_cast<const char*>(mdData.algName), algoName, strlen(algoName)) == 0);
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
    }
    return 0;
}

int SubCryptoFrameworkNapiDigestTest0900()
{
    const int mdSpecCount = sizeof(g_mdData) / sizeof(g_mdData[0]);
    for (int i = 0; i < mdSpecCount; i++) {
        MdSpec mdData = g_mdData[i];
        OH_Crypto_ErrCode ret;
        OH_CryptoDigest *ctx = nullptr;
        uint8_t *testData = (uint8_t *)malloc(OH_CRYPTO_DIGEST_DATA_MAX);
        if (testData == nullptr) {
            EXPECT_FALSE(true);
            continue;
        }
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        int isBlockSize = 20;
        int offset = 0;
        
        ret = OH_CryptoDigest_Create(reinterpret_cast<const char*>(mdData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        for (int i1 = 0; i1 < OH_CRYPTO_DIGEST_DATA_MAX / isBlockSize; i1++) {
            Crypto_DataBlob in = {
                .data = reinterpret_cast<uint8_t *>(testData + offset),
                .len = static_cast<size_t>(isBlockSize)
            };
            ret = OH_CryptoDigest_Update(ctx, &in);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            offset += isBlockSize;
        }
        ret = OH_CryptoDigest_Final(ctx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
    
        OH_DigestCrypto_Destroy(ctx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
        free(testData);
    }
    return 0;
}

} // namespace Unittest::CryptoFrameworkDigestNapiTest

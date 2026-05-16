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
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <limits.h>

#include "crypto_framework_random_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkRandomNapiTest {
class OHCryptoFrameworkRandomNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class RANDOM_TEST : public testing::TestWithParam<int> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class RANDOM_SEED_TEST : public testing::TestWithParam<int> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

int g_randomLen[] = {
    1, 11, 16, 32, 64, 128, 256, 512, 1024, 2048, 3072, 4096, 8192, 1024 * 1024
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkRandomNapiTest, RANDOM_TEST, ::testing::ValuesIn(g_randomLen));

HWTEST_P(RANDOM_TEST, SUB_Security_CryptoFramework_NAPI_Random_Test_0100, TestSize.Level0)
{
    int len = GetParam();
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    if (len == INT_MAX) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_MEMORY_ERROR);
    } else {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_SUCCESS);
        EXPECT_EQ(out.len, len);
    }
    const char *algoName = OH_CryptoRand_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp("CTR_DRBG", algoName, strlen(algoName)) == 0);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

HWTEST_P(RANDOM_TEST, SUB_Security_CryptoFramework_NAPI_Random_Test_0500, TestSize.Level0)
{
    int len = GetParam();
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    OH_CryptoRand_EnableHardwareEntropy(ctx);
    if (len == INT_MAX) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_MEMORY_ERROR);
    } else {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_SUCCESS);
        EXPECT_EQ(out.len, len);
    }
    const char *algoName = OH_CryptoRand_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp("CTR_DRBG", algoName, strlen(algoName)) == 0);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkRandomNapiTest, RANDOM_SEED_TEST, ::testing::ValuesIn(g_randomLen));

HWTEST_P(RANDOM_SEED_TEST, SUB_Security_CryptoFramework_NAPI_Random_Test_0600, TestSize.Level0)
{
    int len = GetParam();
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint8_t seedData[] = {
        0x30, 0x79, 0x02, 0x21, 0x00, 0x9b, 0x17, 0xa5, 0xd3, 0xac, 0xcc, 0xf3, 0x3c, 0x2e, 0x36, 0x23
    };
    Crypto_DataBlob seed = {.data = seedData, .len = sizeof(seedData) / sizeof(seedData[0])};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    OH_CryptoRand_EnableHardwareEntropy(ctx);
    EXPECT_EQ(OH_CryptoRand_SetSeed(ctx, &seed), CRYPTO_SUCCESS);
    if (len == INT_MAX) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_MEMORY_ERROR);
    } else {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_SUCCESS);
        EXPECT_EQ(out.len, len);
    }
    const char *algoName = OH_CryptoRand_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp("CTR_DRBG", algoName, strlen(algoName)) == 0);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

HWTEST_P(RANDOM_SEED_TEST, SUB_Security_CryptoFramework_NAPI_Random_Test_0200, TestSize.Level0)
{
    int len = GetParam();
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint8_t seedData[] = {
        0x30, 0x79, 0x02, 0x21, 0x00, 0x9b, 0x17, 0xa5, 0xd3, 0xac, 0xcc, 0xf3, 0x3c, 0x2e, 0x36, 0x23
    };
    Crypto_DataBlob seed = {.data = seedData, .len = sizeof(seedData) / sizeof(seedData[0])};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_SetSeed(ctx, &seed), CRYPTO_SUCCESS);
    if (len == INT_MAX) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_MEMORY_ERROR);
    } else {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_SUCCESS);
        EXPECT_EQ(out.len, len);
    }
    const char *algoName = OH_CryptoRand_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp("CTR_DRBG", algoName, strlen(algoName)) == 0);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Random_Test_0300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Random_Test_0300
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkRandomNapiTest, SUB_Security_CryptoFramework_NAPI_Random_Test_0300, TestSize.Level0)
{
    int len = -1;
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_PARAMETER_CHECK_FAILED);


    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Random_Test_0400
 * @tc.number SUB_Security_CryptoFramework_NAPI_Random_Test_0400
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkRandomNapiTest, SUB_Security_CryptoFramework_NAPI_Random_Test_0400, TestSize.Level0)
{
    int len = 0;
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_PARAMETER_CHECK_FAILED);


    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
}

} // namespace Unittest::CryptoFrameworkRandomNapiTest
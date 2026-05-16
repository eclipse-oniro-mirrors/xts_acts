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
#include <climits>

#include "include/CryptoFrameworkRandomTest.h"
#include "include/CommonToolTest.h"
#include <CryptoArchitectureKit/crypto_rand.h>

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkRandomNapiTest {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class RANDOM_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class RANDOM_SEED_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

int g_randomLen[] = {
    1, 11, 16, 32, 64, 128, 256, 512, 1024, 2048, 3072, 4096, 8192, 1024 * 1024
};
int SubCryptoFrameworkNapiRandomTest0100()
{
    const int randomLenCount = sizeof(g_randomLen) / sizeof(g_randomLen[0]);
    for (int i = 0; i < randomLenCount; i++) {
        int len = g_randomLen[i];
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
    return 0;
}

int SubCryptoFrameworkNapiRandomTest0500()
{
    const int randomLenCount = sizeof(g_randomLen) / sizeof(g_randomLen[0]);
    for (int i = 0; i < randomLenCount; i++) {
        int len = g_randomLen[i];
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
    return 0;
}

int SubCryptoFrameworkNapiRandomTest0600()
{
    const int randomLenCount = sizeof(g_randomLen) / sizeof(g_randomLen[0]);
    for (int i = 0; i < randomLenCount; i++) {
        int len = g_randomLen[i];
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
    return 0;
}

int SubCryptoFrameworkNapiRandomTest0200()
{
    const int randomLenCount = sizeof(g_randomLen) / sizeof(g_randomLen[0]);
    for (int i = 0; i < randomLenCount; i++) {
        int len = g_randomLen[i];
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
    return 0;
}

int SubCryptoFrameworkNapiRandomTest0300()
{
    int len = -1;
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
    return 0;
}

int SubCryptoFrameworkNapiRandomTest0400()
{
    int len = 0;
    OH_CryptoRand *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    
    EXPECT_EQ(OH_CryptoRand_Create(&ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx, len, &out), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoRand_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&out);
    return 0;
}

} // namespace Unittest::CryptoFrameworkRandomNapiTest
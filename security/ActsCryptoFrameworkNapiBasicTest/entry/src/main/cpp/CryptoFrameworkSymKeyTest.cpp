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
#include <hilog/log.h>
#include <pthread.h>
#include <cstring>

#include "include/CryptoFrameworkSymKeyTest.h"
#include "include/CommonToolTest.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkSymKeyNapiTest {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void OHCryptoFrameworkSymKeyNapiTest::SetUpTestCase(void)
{
}

void OHCryptoFrameworkSymKeyNapiTest::TearDownTestCase(void)
{
}

void OHCryptoFrameworkSymKeyNapiTest::SetUp()
{
}

void OHCryptoFrameworkSymKeyNapiTest::TearDown()
{
}

class OHCryptoFrameworkSymKeyConvertNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class SYMKEY_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SYMKEY_CONVERT_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

const int VALUE_2 = 2;
const int VALUE_8 = 8;

SymKeySpec g_symKeyData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("AES128")), OH_CRYPTO_AES_128_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("AES128"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("AES192")), OH_CRYPTO_AES_192_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("AES192"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("AES256")), OH_CRYPTO_AES_256_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("AES256"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("ChaCha20")), OH_CRYPTO_CHACHA20_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("ChaCha20"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("3DES192")), OH_CRYPTO_3DES_192_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("3DES192"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM4_128")), OH_CRYPTO_SM4_128_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM4128"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SHA1")), OH_CRYPTO_HMAC_SHA1_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC160"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SHA224")), OH_CRYPTO_HMAC_SHA224_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC224"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SHA256")), OH_CRYPTO_HMAC_SHA256_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC256"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SHA384")), OH_CRYPTO_HMAC_SHA384_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC384"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SHA512")), OH_CRYPTO_HMAC_SHA512_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC512"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC|SM3")), OH_CRYPTO_HMAC_SM3_KEY_SIZE,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC256"))},
};

SymKeySpec g_symKeyConvertData[] = {
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC")), 1,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC8"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC")), 16,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC128"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC")), 64,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC512"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC")), 1024,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC8192"))},
    {reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC")), 4096,
        reinterpret_cast<uint8_t*>(const_cast<char*>("HMAC32768"))},
};

int SubCryptoFrameworkNapiSymKeyTest0100()
{
    const int symKeySpecCount = sizeof(g_symKeyData) / sizeof(g_symKeyData[0]);
    for (int i = 0; i < symKeySpecCount; i++) {
        SymKeySpec symKeyData = g_symKeyData[i];
        OH_CryptoSymKeyGenerator *ctx = nullptr;
        OH_CryptoSymKey *keyCtx = nullptr;
        OH_CryptoSymKey *convertKeyCtx = nullptr;
        OH_Crypto_ErrCode ret;
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};
    
        ret = OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>(symKeyData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        const char *algoName1 = OH_CryptoSymKeyGenerator_GetAlgoName(ctx);
        EXPECT_TRUE(memcmp(reinterpret_cast<const char*>(symKeyData.algName), algoName1, strlen(algoName1)) == 0);
        const char *algoName2 = OH_CryptoSymKey_GetAlgoName(keyCtx);
        EXPECT_TRUE(memcmp(reinterpret_cast<const char*>(symKeyData.getAlgName), algoName2, strlen(algoName2)) == 0);
        ret = OH_CryptoSymKey_GetKeyData(keyCtx, &out);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoSymKeyGenerator_Convert(ctx, &out, &convertKeyCtx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoSymKey_GetKeyData(convertKeyCtx, &convertOut);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(out.data, convertOut.data, out.len) == 0);
    
        OH_CryptoSymKeyGenerator_Destroy(ctx);
        OH_CryptoSymKey_Destroy(keyCtx);
        OH_CryptoSymKey_Destroy(convertKeyCtx);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&convertOut);
    }
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0200()
{
    const int symKeySpecCount = sizeof(g_symKeyConvertData) / sizeof(g_symKeyConvertData[0]);
    for (int i = 0; i < symKeySpecCount; i++) {
        SymKeySpec symKeyData = g_symKeyConvertData[i];
        OH_CryptoSymKeyGenerator *ctx = nullptr;
        OH_CryptoSymKey *convertKeyCtx = nullptr;
        OH_Crypto_ErrCode ret;
    
        uint8_t *testData = (uint8_t *)malloc(symKeyData.bits);
        if (testData == nullptr) {
            EXPECT_TRUE(false);
            continue;
        }
        Crypto_DataBlob in = {
            .data = reinterpret_cast<uint8_t *>(testData),
            .len = static_cast<size_t>(symKeyData.bits)
        };
        Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};
    
        ret = OH_CryptoSymKeyGenerator_Create((const char *)symKeyData.algName, &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OH_CryptoSymKeyGenerator_Convert(ctx, &in, &convertKeyCtx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        const char *algoName = OH_CryptoSymKey_GetAlgoName(convertKeyCtx);
        EXPECT_TRUE(memcmp(reinterpret_cast<const char*>(symKeyData.getAlgName), algoName, strlen(algoName)) == 0);
        ret = OH_CryptoSymKey_GetKeyData(convertKeyCtx, &convertOut);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(in.data, convertOut.data, in.len) == 0);

        OH_CryptoSymKeyGenerator_Destroy(ctx);
        OH_CryptoSymKey_Destroy(convertKeyCtx);
        OH_Crypto_FreeDataBlob(&in);
        HcfBlobDataClearAndFree((Crypto_DataBlob *)&convertOut);
    }
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0300()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("RC5"), &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("aes128"), &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES225"), &ctx), CRYPTO_NOT_SUPPORTED);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0400()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES256"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(nullptr, &keyCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(nullptr, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0500()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("HMAC|SHA256"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_GetAlgoName(nullptr), nullptr);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0600()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    const char *algName = "HMAC|SHA256";

    uint8_t *testData1 = static_cast<uint8_t*>(malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 - 2));
    if (testData1 == nullptr) {
        return -1;
    }
    Crypto_DataBlob in1 = {
        .data = reinterpret_cast<uint8_t *>(testData1),
        .len = OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 - 2
    };
    uint8_t *testData2 = static_cast<uint8_t*>(malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 + 2));
    if (testData2 == nullptr) {
        free(testData1);
        return -1;
    }
    Crypto_DataBlob in2 = {
        .data = reinterpret_cast<uint8_t *>(testData2),
        .len = OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 + 2
    };
    uint8_t *testData3 = static_cast<uint8_t*>(malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8));
    if (testData3 == nullptr) {
        free(testData1);
        free(testData2);
        return -1;
    }
    Crypto_DataBlob in3 = {
        .data = reinterpret_cast<uint8_t *>(testData3),
        .len = OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8
    };

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(algName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(nullptr, &in3, &convertKeyCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(ctx, nullptr, &convertKeyCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(ctx, &in3, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(ctx, &in1, &convertKeyCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(ctx, &in2, &convertKeyCtx), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(convertKeyCtx);
    OH_Crypto_FreeDataBlob(&in1);
    OH_Crypto_FreeDataBlob(&in2);
    OH_Crypto_FreeDataBlob(&in3);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0700()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES192"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKey_GetKeyData(nullptr, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKey_GetKeyData(keyCtx, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0800()
{
    const char *algName = "3DES192";
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;

    uint8_t arr[] = {
        0xba, 0x3d, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
        0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c,
        0xba, 0x3b, 0xc2, 0x71, 0xab, 0xa0, 0x30, 0x72
    };
    Crypto_DataBlob convertBlob = {.data = arr, .len = sizeof(arr)};
    Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};

    ret = OH_CryptoSymKeyGenerator_Create(algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Convert(ctx, &convertBlob, &convertKeyCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKey_GetKeyData(convertKeyCtx, &convertOut);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(convertBlob.data, convertOut.data, convertBlob.len) == 0);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(convertKeyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&convertOut);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest0900()
{
    const char *algName = "3DES192";
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;

    uint8_t arr[] = {
        0xba, 0x3d, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
        0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c,
        0xba, 0x3b, 0xc2, 0x71, 0xab, 0xa0, 0x30,
    };
    Crypto_DataBlob convertBlob = {.data = arr, .len = sizeof(arr)};

    ret = OH_CryptoSymKeyGenerator_Create(algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Convert(ctx, &convertBlob, &convertKeyCtx);
    EXPECT_EQ(ret, CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest1000()
{
    const char *algName = "SM4_128";
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;

    uint8_t arr[] = {
        0xba, 0x3d, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
        0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c,
        0xba,
    };
    Crypto_DataBlob convertBlob = {.data = arr, .len = sizeof(arr)};

    ret = OH_CryptoSymKeyGenerator_Create(algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Convert(ctx, &convertBlob, &convertKeyCtx);
    EXPECT_EQ(ret, CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiSymKeyTest1100()
{
    const char *genAlgName = "HMAC|SHA256";
    const char *conertAlgName = "AES256";
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKeyGenerator *convertCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};

    ret = OH_CryptoSymKeyGenerator_Create(genAlgName, &genCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKey_GetKeyData(keyCtx, &out);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Create(conertAlgName, &convertCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Convert(convertCtx, &out, &convertKeyCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKey_GetKeyData(convertKeyCtx, &convertOut);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(out.data, convertOut.data, out.len) == 0);

    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKeyGenerator_Destroy(convertCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_CryptoSymKey_Destroy(convertKeyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&out);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&convertOut);
    return 0;
}

} // namespace Unittest::CryptoFrameworkSymKeyNapiTest

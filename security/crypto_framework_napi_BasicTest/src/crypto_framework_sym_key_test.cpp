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

#include "crypto_framework_sym_key_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkSymKeyNapiTest {
class OHCryptoFrameworkSymKeyNapiTest : public testing::Test {
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

class OHCryptoFrameworkSymKeyConvertNapiTest : public testing::Test {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class SYMKEY_TEST : public testing::TestWithParam<SymKeySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SYMKEY_CONVERT_TEST : public testing::TestWithParam<SymKeySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

SymKeySpec g_symKeyData[] = {
    {(uint8_t *)"AES128", OH_CRYPTO_AES_128_KEY_SIZE, (uint8_t *)"AES128"},
    {(uint8_t *)"AES192", OH_CRYPTO_AES_192_KEY_SIZE, (uint8_t *)"AES192"},
    {(uint8_t *)"AES256", OH_CRYPTO_AES_256_KEY_SIZE, (uint8_t *)"AES256"},
    {(uint8_t *)"ChaCha20", OH_CRYPTO_CHACHA20_KEY_SIZE, (uint8_t *)"ChaCha20"},
    {(uint8_t *)"3DES192", OH_CRYPTO_3DES_192_KEY_SIZE, (uint8_t *)"3DES192"},
    {(uint8_t *)"SM4_128", OH_CRYPTO_SM4_128_KEY_SIZE, (uint8_t *)"SM4128"},
    {(uint8_t *)"HMAC|SHA1", OH_CRYPTO_HMAC_SHA1_KEY_SIZE, (uint8_t *)"HMAC160"},
    {(uint8_t *)"HMAC|SHA224", OH_CRYPTO_HMAC_SHA224_KEY_SIZE, (uint8_t *)"HMAC224"},
    {(uint8_t *)"HMAC|SHA256", OH_CRYPTO_HMAC_SHA256_KEY_SIZE, (uint8_t *)"HMAC256"},
    {(uint8_t *)"HMAC|SHA384", OH_CRYPTO_HMAC_SHA384_KEY_SIZE, (uint8_t *)"HMAC384"},
    {(uint8_t *)"HMAC|SHA512", OH_CRYPTO_HMAC_SHA512_KEY_SIZE, (uint8_t *)"HMAC512"},
    {(uint8_t *)"HMAC|SM3", OH_CRYPTO_HMAC_SM3_KEY_SIZE, (uint8_t *)"HMAC256"},
};

SymKeySpec g_symKeyConvertData[] = {
    {(uint8_t *)"HMAC", 1, (uint8_t *)"HMAC8"},
    {(uint8_t *)"HMAC", 16, (uint8_t *)"HMAC128"},
    {(uint8_t *)"HMAC", 64, (uint8_t *)"HMAC512"},
    {(uint8_t *)"HMAC", 1024, (uint8_t *)"HMAC8192"},
    {(uint8_t *)"HMAC", 4096, (uint8_t *)"HMAC32768"},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymKeyNapiTest, SYMKEY_TEST, ::testing::ValuesIn(g_symKeyData));

HWTEST_P(SYMKEY_TEST, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0100, TestSize.Level0)
{
    SymKeySpec symKeyData = GetParam();
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};

    ret = OH_CryptoSymKeyGenerator_Create((const char *)symKeyData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    const char *algoName1 = OH_CryptoSymKeyGenerator_GetAlgoName(ctx);
    EXPECT_TRUE(memcmp((const char *)symKeyData.algName, algoName1, strlen(algoName1)) == 0);
    const char *algoName2 = OH_CryptoSymKey_GetAlgoName(keyCtx);
    EXPECT_TRUE(memcmp((const char *)symKeyData.getAlgName, algoName2, strlen(algoName2)) == 0);
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
    HcfBlobDataClearAndFree((HcfBlob *)&out);
    HcfBlobDataClearAndFree((HcfBlob *)&convertOut);
}

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkSymKeyConvertNapiTest, SYMKEY_CONVERT_TEST, ::testing::ValuesIn(g_symKeyConvertData));

HWTEST_P(SYMKEY_CONVERT_TEST, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0200, TestSize.Level0)
{
    SymKeySpec symKeyData = GetParam();
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    OH_Crypto_ErrCode ret;

    uint8_t *testData = (uint8_t *)malloc(symKeyData.bits);
    Crypto_DataBlob in = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = symKeyData.bits
    };
    Crypto_DataBlob convertOut = {.data = nullptr, .len = 0};

    ret = OH_CryptoSymKeyGenerator_Create((const char *)symKeyData.algName, &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    ret = OH_CryptoSymKeyGenerator_Convert(ctx, &in, &convertKeyCtx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    const char *algoName = OH_CryptoSymKey_GetAlgoName(convertKeyCtx);
    EXPECT_TRUE(memcmp((const char *)symKeyData.getAlgName, algoName, strlen(algoName)) == 0);
    ret = OH_CryptoSymKey_GetKeyData(convertKeyCtx, &convertOut);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(in.data, convertOut.data, in.len) == 0);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(convertKeyCtx);
    OH_Crypto_FreeDataBlob(&in);
    HcfBlobDataClearAndFree((HcfBlob *)&convertOut);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0300
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0300
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0300, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"RC4", &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"aes128", &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES225", &ctx), CRYPTO_NOT_SUPPORTED);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0400
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0400
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0400, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES256", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(nullptr, &keyCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(nullptr, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0500
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0500
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0500, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"HMAC|SHA256", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_GetAlgoName(nullptr), nullptr);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0600
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0600
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0600, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    const char *algName = "HMAC|SHA256";

    uint8_t *testData1 = (uint8_t *)malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 - 2);
    Crypto_DataBlob in1 = {
        .data = reinterpret_cast<uint8_t *>(testData1),
        .len = OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 - 2
    };
    uint8_t *testData2 = (uint8_t *)malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 + 2);
    Crypto_DataBlob in2 = {
        .data = reinterpret_cast<uint8_t *>(testData2),
        .len = OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8 + 2
    };
    uint8_t *testData3 = (uint8_t *)malloc(OH_CRYPTO_HMAC_SHA256_KEY_SIZE / 8);
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
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0700
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0700
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0700, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES192", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKey_GetKeyData(nullptr, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymKey_GetKeyData(keyCtx, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0800
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0800
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0800, TestSize.Level0)
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
    HcfBlobDataClearAndFree((HcfBlob *)&convertOut);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_0900
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_0900
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_0900, TestSize.Level0)
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
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_1000
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_1000
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_1000, TestSize.Level0)
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
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_SymKey_Test_1100
 * @tc.number SUB_Security_CryptoFramework_NAPI_SymKey_Test_1100
 * @tc.desc   algorithm is Sym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkSymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_SymKey_Test_1100, TestSize.Level0)
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
    HcfBlobDataClearAndFree((HcfBlob *)&out);
    HcfBlobDataClearAndFree((HcfBlob *)&convertOut);
}

} // namespace Unittest::CryptoFrameworkSymKeyNapiTest

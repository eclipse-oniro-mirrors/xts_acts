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

#include "crypto_framework_asym_key_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkAsymKeyNapiTest {
class OHCryptoFrameworkAsymKeyNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void OHCryptoFrameworkAsymKeyNapiTest::SetUpTestCase(void)
{
}

void OHCryptoFrameworkAsymKeyNapiTest::TearDownTestCase(void)
{
}

void OHCryptoFrameworkAsymKeyNapiTest::SetUp()
{
}

void OHCryptoFrameworkAsymKeyNapiTest::TearDown()
{
}

class ASYMKEY_TEST : public testing::TestWithParam<AsymKeySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

AsymKeySpec g_asymKeyData[] = {
    {(uint8_t *)"DSA1024", "DSA"},
    {(uint8_t *)"DSA2048", "DSA"},
    {(uint8_t *)"DSA3072", "DSA"},
    {(uint8_t *)"Ed25519", "Ed25519"},
    {(uint8_t *)"X25519", "X25519"},
    {(uint8_t *)"DH_modp1536", "DH"},
    {(uint8_t *)"DH_modp2048", "DH"},
    {(uint8_t *)"DH_modp3072", "DH"},
    {(uint8_t *)"DH_modp4096", "DH"},
    {(uint8_t *)"DH_modp6144", "DH"},
    {(uint8_t *)"DH_modp8192", "DH"},
    {(uint8_t *)"DH_ffdhe2048", "DH"},
    {(uint8_t *)"DH_ffdhe3072", "DH"},
    {(uint8_t *)"DH_ffdhe4096", "DH"},
    {(uint8_t *)"DH_ffdhe6144", "DH"},
    {(uint8_t *)"DH_ffdhe8192", "DH"},
    {(uint8_t *)"RSA512|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA768|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA1024|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA1024|PRIMES_3", "RSA"},
    {(uint8_t *)"RSA2048|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA2048|PRIMES_3", "RSA"},
    {(uint8_t *)"RSA3072|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA3072|PRIMES_3", "RSA"},
    {(uint8_t *)"RSA4096|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA4096|PRIMES_3", "RSA"},
    {(uint8_t *)"RSA4096|PRIMES_4", "RSA"},
    {(uint8_t *)"RSA8192|PRIMES_2", "RSA"},
    {(uint8_t *)"RSA8192|PRIMES_3", "RSA"},
    {(uint8_t *)"RSA8192|PRIMES_4", "RSA"},
    {(uint8_t *)"RSA8192|PRIMES_5", "RSA"},
    {(uint8_t *)"SM2_256", "SM2"},
    {(uint8_t *)"ECC224", "ECC"},
    {(uint8_t *)"ECC256", "ECC"},
    {(uint8_t *)"ECC384", "ECC"},
    {(uint8_t *)"ECC521", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP160r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP160t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP192r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP192t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP224r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP224t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP256r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP256t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP320r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP320t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP384r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP384t1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP512r1", "ECC"},
    {(uint8_t *)"ECC_BrainPoolP512t1", "ECC"},
};

static OH_Crypto_ErrCode Rsa_PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx, OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
{
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_PEM, &retBlob, nullptr, dupKeyPair);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    return ret;
}

static OH_Crypto_ErrCode Ecc_PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx, OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
{
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, "X509|COMPRESSED", &retBlob);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &retBlob, nullptr, dupKeyPair);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    return ret;
}

static OH_Crypto_ErrCode PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx, OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
{
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &retBlob);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &retBlob, nullptr, dupKeyPair);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    return ret;
}

static OH_Crypto_ErrCode Ecc_GetEncode(OH_CryptoPubKey *pubKey, Crypto_DataBlob *value)
{
    OH_Crypto_ErrCode ret = OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FP_P_DATABLOB, value);
    return ret;
}

static OH_Crypto_ErrCode Rsa_GetEncode(OH_CryptoPubKey *pubKey, Crypto_DataBlob *value)
{
    OH_Crypto_ErrCode ret = OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, value);
    return ret;
}

static OH_Crypto_ErrCode GetEncode(const char *name, OH_CryptoPubKey *pubKey, Crypto_DataBlob *value)
{
    CryptoAsymKey_ParamType item;
    if (strcmp(name, "DH") == 0) {
        item = CRYPTO_DH_P_DATABLOB;
    } else if (strcmp(name, "Ed25519") == 0) {
        item = CRYPTO_ED25519_PK_DATABLOB;
    } else if (strcmp(name, "X25519") == 0) {
        item = CRYPTO_X25519_PK_DATABLOB;
    } else if (strcmp(name, "DSA") == 0) {
        item = CRYPTO_DSA_P_DATABLOB; 
    } else {
        item = CRYPTO_ECC_H_INT;
    }
    
    OH_Crypto_ErrCode ret = OH_CryptoPubKey_GetParam(pubKey, item, value);
    return ret;
}


INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_TEST, ::testing::ValuesIn(g_asymKeyData));

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0100
* @tc.name OHCryptoFrameworkAsymKeyNapiTest/ASYMKEY_TEST.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0100/x
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_P(ASYMKEY_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0100, TestSize.Level0)
{
    AsymKeySpec AsymKeyData = GetParam();
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;

    ret = OH_CryptoAsymKeyGenerator_Create((const char *)AsymKeyData.algName, &ctx);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);

    ret = OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);

    const char *algoName = OH_CryptoAsymKeyGenerator_GetAlgoName(ctx);
    EXPECT_NE(algoName, nullptr);

    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);

    OH_CryptoKeyPair *dupKeyPair = nullptr;
    Crypto_DataBlob dataBlob = { .data = nullptr, .len = 0 };
    if (strcmp(AsymKeyData.name, "RSA") == 0) {
        ret = Rsa_PubkeyEncode(ctx, pubKey, &dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        ret = Rsa_GetEncode(pubKey1, &dataBlob);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
    } else if (strcmp(AsymKeyData.name, "ECC") == 0) {
        ret = Ecc_PubkeyEncode(ctx, pubKey, &dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        ret = Ecc_GetEncode(pubKey1, &dataBlob);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
    } else {
        ret = PubkeyEncode(ctx, pubKey, &dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
        ret = GetEncode(AsymKeyData.name, pubKey1, &dataBlob);
        ASSERT_EQ(ret, CRYPTO_SUCCESS);
    }

    ASSERT_NE(dataBlob.data, nullptr);
    ASSERT_NE(dataBlob.len, 0);
    OH_Crypto_FreeDataBlob(&dataBlob);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(dupKeyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0200
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0200
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0200, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("SM9", &ctx);
    EXPECT_NE(ret, CRYPTO_SUCCESS);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0300
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0300
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0300, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("SM", &ctx);
    EXPECT_NE(ret, CRYPTO_SUCCESS);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0400
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0400
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0400, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *dupKeyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC224", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t array[] = {48, 50, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0,
        33, 3, 30, 0, 2, 62, 18, 146, 41, 146, 160, 136, 78, 124, 38, 148, 1, 204, 24, 45, 172,
        101, 234, 253, 74, 133, 28, 184, 168, 153, 170, 203, 134};
    Crypto_DataBlob dataBlob = { .data = array, .len = sizeof(array) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &dataBlob, nullptr, &dupKeyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
    ASSERT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(dupKeyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0500
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0500
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0500, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *dupKeyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC521", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t array[] = { 48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3,
        3, 2, 8, 1, 1, 7, 3, 66, 0, 4, 143, 39, 57, 249, 145, 50, 63, 222, 35, 70, 178, 121,
        202, 154, 21, 146, 129, 75, 76, 63, 8, 195, 157, 111, 40, 217, 215, 148, 120, 224,
        205, 82, 83, 92, 185, 21, 211, 184, 5, 19, 114, 33, 86, 85, 228, 123, 242, 206, 200,
        98, 178, 184, 130, 35, 232, 45, 5, 202, 189, 11, 46, 163, 156, 152};
    Crypto_DataBlob dataBlob = { .data = array, .len = sizeof(array) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &dataBlob, nullptr, &dupKeyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
    ASSERT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(dupKeyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0600
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0600
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0600, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob dsaPBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaQBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaGBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaPKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaSKBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"DSA1024", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);

    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_P_DATABLOB, &dsaPBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_Q_DATABLOB, &dsaQBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_G_DATABLOB, &dsaGBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_SK_DATABLOB, &dsaSKBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_PK_DATABLOB, &dsaPKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&dsaPBlob);
    OH_Crypto_FreeDataBlob(&dsaQBlob);
    OH_Crypto_FreeDataBlob(&dsaGBlob);
    OH_Crypto_FreeDataBlob(&dsaPKBlob);
    OH_Crypto_FreeDataBlob(&dsaSKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0700
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0700
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0700, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob ecc_FP_PBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_ABlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_BBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_G_XBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_G_YBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_NBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_SKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_PK_XBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_PK_YBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_HBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_FIELD_TYPEBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_FELD_SIZEBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ecc_NAMEBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"ECC224", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FP_P_DATABLOB, &ecc_FP_PBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_A_DATABLOB, &ecc_ABlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_B_DATABLOB, &ecc_BBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_X_DATABLOB, &ecc_G_XBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_Y_DATABLOB, &ecc_G_YBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_N_DATABLOB, &ecc_NBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_H_INT, &ecc_HBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_SK_DATABLOB, &ecc_SKBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, &ecc_PK_XBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &ecc_PK_YBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FIELD_TYPE_STR, &ecc_FIELD_TYPEBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FIELD_SIZE_INT, &ecc_FELD_SIZEBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_CURVE_NAME_STR, &ecc_NAMEBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&ecc_FP_PBlob);
    OH_Crypto_FreeDataBlob(&ecc_ABlob);
    OH_Crypto_FreeDataBlob(&ecc_BBlob);
    OH_Crypto_FreeDataBlob(&ecc_G_XBlob);
    OH_Crypto_FreeDataBlob(&ecc_G_YBlob);
    OH_Crypto_FreeDataBlob(&ecc_NBlob);
    OH_Crypto_FreeDataBlob(&ecc_SKBlob);
    OH_Crypto_FreeDataBlob(&ecc_PK_XBlob);
    OH_Crypto_FreeDataBlob(&ecc_PK_YBlob);
    OH_Crypto_FreeDataBlob(&ecc_HBlob);
    OH_Crypto_FreeDataBlob(&ecc_NAMEBlob);
    OH_Crypto_FreeDataBlob(&ecc_FIELD_TYPEBlob);
    OH_Crypto_FreeDataBlob(&ecc_FELD_SIZEBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0800
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0800
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0800, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob rsaNBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob rsaDBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob rsaEBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"RSA512", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, &rsaNBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_D_DATABLOB, &rsaDBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_E_DATABLOB, &rsaEBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&rsaNBlob);
    OH_Crypto_FreeDataBlob(&rsaDBlob);
    OH_Crypto_FreeDataBlob(&rsaEBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0900
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0900
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0900, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob dhPBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhGBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhLBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhSKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhPKBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"DH_modp1536", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_P_DATABLOB, &dhPBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_G_DATABLOB, &dhGBlob), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_L_INT, &dhLBlob), CRYPTO_NOT_SUPPORTED);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_SK_DATABLOB, &dhSKBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, &dhPKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&dhPBlob);
    OH_Crypto_FreeDataBlob(&dhGBlob);
    OH_Crypto_FreeDataBlob(&dhLBlob);
    OH_Crypto_FreeDataBlob(&dhSKBlob);
    OH_Crypto_FreeDataBlob(&dhPKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1000
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1000
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1000, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob ed25519SKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ed25519PKBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"Ed25519", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ED25519_SK_DATABLOB, &ed25519SKBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ED25519_PK_DATABLOB, &ed25519PKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&ed25519SKBlob);
    OH_Crypto_FreeDataBlob(&ed25519PKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1100
* @tc.name OHCryptoFrameworkAsymKeyNapiTest.SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1100
* @tc.desc algorithm is Asym Key
* @tc.size Medium
* @tc.type Func
* @tc.level Level0
*/
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1100, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob x25519SKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob x25519PKBlob = { .data = nullptr, .len = 0 };

    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Create((const char *)"X25519", &ctx), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_X25519_SK_DATABLOB, &x25519SKBlob), CRYPTO_INVALID_PARAMS);
    ASSERT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_X25519_PK_DATABLOB, &x25519PKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&x25519SKBlob);
    OH_Crypto_FreeDataBlob(&x25519PKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

} // namespace Unittest::CryptoFrameworkAsymKeyNapiTest

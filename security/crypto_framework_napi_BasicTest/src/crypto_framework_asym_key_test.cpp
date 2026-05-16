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

class ASYMKEY_PRIV_TEST : public testing::TestWithParam<AsymPrivKeySpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_ECC_KEYPAIR_TEST : public testing::TestWithParam<CommonECCSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_RSA_KEYPAIR_TEST : public testing::TestWithParam<CommonRSASpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_DH_KEYPAIR_TEST : public testing::TestWithParam<CommonDHSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_DSA_KEYPAIR_TEST : public testing::TestWithParam<CommonDSASpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_KEYPAIR_TEST : public testing::TestWithParam<CommonSpec> {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_EC_POINT_TEST : public testing::TestWithParam<ECPointSpec> {
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
    OH_Crypto_FreeDataBlob(&retBlob);
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
    OH_Crypto_FreeDataBlob(&retBlob);
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
    OH_Crypto_FreeDataBlob(&retBlob);
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0200
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0200
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0300
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0300
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0400
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0400
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0500
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0500
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0600
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0600
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0700
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0700
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0800
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0800
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0900
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_0900
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1000
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1000
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1100
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1100
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
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

static OH_CryptoKeyPair *OHTEST_GenerateKeyPair(const char *algoName, const char *algKeyName)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algKeyName, &ctx), CRYPTO_SUCCESS);
    if (strcmp(algoName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192pubKey, .len = sizeof(g_rsa8192pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192priKey, .len = sizeof(g_rsa8192priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096pubKey, .len = sizeof(g_rsa4096pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096priKey, .len = sizeof(g_rsa4096priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072pubKey, .len = sizeof(g_rsa3072pubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072priKey, .len = sizeof(g_rsa3072priKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    }

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return keyPair;
}

static OH_CryptoKeyPair *OHTEST_ConvertKeyPair(const char *algoName, Crypto_EncodingType type,
    Crypto_DataBlob *privKey, Crypto_DataBlob *pubKey, Crypto_DataBlob *password)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoAsymKeyGenerator_Create(algoName, &ctx);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    if (password != nullptr && password->data != nullptr) {
        ret = OH_CryptoAsymKeyGenerator_SetPassword(ctx, password->data, password->len);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    }
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, type, pubKey, privKey, &keyPair);

EXIT:
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return keyPair;
}

static OH_CryptoPrivKeyEncodingParams *OHTEST_SetParam(Crypto_DataBlob *password, Crypto_DataBlob *cipher)
{
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoPrivKeyEncodingParams_Create(&params);
    if (params == nullptr || ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, password);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoPrivKeyEncodingParams_Destroy(params);
        params = nullptr;
        goto EXIT;
    }
    ret = OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, cipher);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoPrivKeyEncodingParams_Destroy(params);
        params = nullptr;
        goto EXIT;
    }

EXIT:
    return params;
}


AsymPrivKeySpec g_asymPrivKeyData[] = {
    /* RSA privKey format not support der type，RSA privKey support der type */
    /* RSA512*/
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 0
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 1
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 2
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 3
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 4
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 5
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 6
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 7
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 8
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 9
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 10
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 11
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 12
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 13
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 14
    {"PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 15
    /* RSA768 */
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA768", (uint8_t *)"RSA768|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* RSA1024 */
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA1024", (uint8_t *)"RSA1024|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* RSA2048 */
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA2048", (uint8_t *)"RSA2048|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* RSA3072 */
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA3072", (uint8_t *)"RSA3072|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* RSA4096 */
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA4096", (uint8_t *)"RSA4096|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* RSA8192 */
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_2", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_3", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_4", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 16
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 17
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 18
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_PEM}, // 19
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 20
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 21
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 22
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS1", CRYPTO_PEM}, // 23
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 24
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 25
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 26
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_PEM},  // 27
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 28
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 29
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 30
    {"PKCS1", (uint8_t *)"RSA8192", (uint8_t *)"RSA8192|PRIMES_5", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS1", CRYPTO_PEM},  // 31
    /* ECC privKey not support pem、pkcs1 type */
    /* ECC224 */
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC224", (uint8_t *)"ECC224", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC224", (uint8_t *)"ECC224", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC224", (uint8_t *)"ECC224", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC224", (uint8_t *)"ECC224", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC256 */
    {"X509|COMPRESSED", (uint8_t *)"ECC256", (uint8_t *)"ECC256", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC256", (uint8_t *)"ECC256", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC256", (uint8_t *)"ECC256", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC256", (uint8_t *)"ECC256", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC384 */
    {"X509|COMPRESSED", (uint8_t *)"ECC384", (uint8_t *)"ECC384", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC384", (uint8_t *)"ECC384", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC384", (uint8_t *)"ECC384", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC384", (uint8_t *)"ECC384", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC521 */
    {"X509|COMPRESSED", (uint8_t *)"ECC521", (uint8_t *)"ECC521", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC521", (uint8_t *)"ECC521", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC521", (uint8_t *)"ECC521", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC521", (uint8_t *)"ECC521", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP160r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP160r1", (uint8_t *)"ECC_BrainPoolP160r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP160t1 */
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP160t1", (uint8_t *)"ECC_BrainPoolP160t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP192r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192r1", (uint8_t *)"ECC_BrainPoolP192r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP192t1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP192t1", (uint8_t *)"ECC_BrainPoolP192t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP224r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224r1", (uint8_t *)"ECC_BrainPoolP224r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP224t1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP224t1", (uint8_t *)"ECC_BrainPoolP224t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP256r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP256r1", (uint8_t *)"ECC_BrainPoolP256r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP256t1 */
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|UNCOMPRESSED", (uint8_t *)"ECC_BrainPoolP256t1", (uint8_t *)"ECC_BrainPoolP256t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP320r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320r1", (uint8_t *)"ECC_BrainPoolP320r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP320t1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP320t1", (uint8_t *)"ECC_BrainPoolP320t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP384r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384r1", (uint8_t *)"ECC_BrainPoolP384r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP384t1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP384t1", (uint8_t *)"ECC_BrainPoolP384t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP512r1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512r1", (uint8_t *)"ECC_BrainPoolP512r1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_BrainPoolP512t1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_BrainPoolP512t1", (uint8_t *)"ECC_BrainPoolP512t1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* ECC_Secp256k1 */
    {"X509|COMPRESSED", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-192-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    {"X509|COMPRESSED", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"0123456789", 10, (uint8_t *)"AES-256-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_DER},  // 18
    {"X509|COMPRESSED", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"0123456789", 10, (uint8_t *)"DES-EDE3-CBC", 12, (uint8_t *)"PKCS8", CRYPTO_DER}, // 19
    {"X509|COMPRESSED", (uint8_t *)"ECC_Secp256k1", (uint8_t *)"ECC_Secp256k1", nullptr, 0, nullptr, 0, (uint8_t *)"PKCS8", CRYPTO_DER},  // 17
    /* DSA not format not support pem、der */
    {nullptr, (uint8_t *)"DSA1024", (uint8_t *)"DSA1024", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DSA2048", (uint8_t *)"DSA2048", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DSA3072", (uint8_t *)"DSA3072", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* SM2 not format not support pem、der */
    {nullptr, (uint8_t *)"SM2_256", (uint8_t *)"SM2_256", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* Ed25519 not format not support pem、der */
    {nullptr, (uint8_t *)"Ed25519", (uint8_t *)"Ed25519", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* X25519 not format not support pem、der */
    {nullptr, (uint8_t *)"X25519", (uint8_t *)"X25519", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    /* DH not format not support pem、der */
    {nullptr, (uint8_t *)"DH_modp1536", (uint8_t *)"DH_modp1536", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_modp2048", (uint8_t *)"DH_modp2048", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_modp3072", (uint8_t *)"DH_modp3072", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_modp4096", (uint8_t *)"DH_modp4096", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_modp6144", (uint8_t *)"DH_modp6144", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_modp8192", (uint8_t *)"DH_modp8192", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_ffdhe2048", (uint8_t *)"DH_ffdhe2048", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_ffdhe3072", (uint8_t *)"DH_ffdhe3072", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_ffdhe4096", (uint8_t *)"DH_ffdhe4096", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_ffdhe6144", (uint8_t *)"DH_ffdhe6144", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
    {nullptr, (uint8_t *)"DH_ffdhe8192", (uint8_t *)"DH_ffdhe8192", nullptr, 0, nullptr, 0, nullptr, CRYPTO_DER},  // 17
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_PRIV_TEST, ::testing::ValuesIn(g_asymPrivKeyData));

HWTEST_P(ASYMKEY_PRIV_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1200, TestSize.Level0)
{
    AsymPrivKeySpec asymInfo = GetParam();
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = asymInfo.pwLen};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = asymInfo.cipherLen};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    Crypto_DataBlob outPub = { .data = nullptr, .len = 0 };
    Crypto_DataBlob new_out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    uint8_t *type = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName, (const char *)asymInfo.algKeyName);
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_TRUE(pubKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        ASSERT_TRUE(params != nullptr);
    }
    type = asymInfo.type ? asymInfo.type : nullptr;
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding, (const char *)type, params, &out), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, asymInfo.encoding, asymInfo.pubType, &outPub), CRYPTO_SUCCESS);
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding, &out, &outPub, &pwBlob);
    ASSERT_TRUE(new_keyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(new_keyPair);
    ASSERT_TRUE(new_privKey != nullptr);
    ASSERT_EQ(OH_CryptoPrivKey_Encode(new_privKey, asymInfo.encoding, (const char *)type, params, &new_out), CRYPTO_SUCCESS);
    EXPECT_TRUE(new_out.len == out.len);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&new_out);
    OH_Crypto_FreeDataBlob(&outPub);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(new_keyPair);
}

static OH_CryptoAsymKeySpec *OHTEST_GenEcCommonParamsSpec(OH_CryptoPubKey *pubKey)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    Crypto_DataBlob fp = { .data = nullptr, .len = 0};
    Crypto_DataBlob a = { .data = nullptr, .len = 0};
    Crypto_DataBlob b = { .data = nullptr, .len = 0};
    Crypto_DataBlob g_x = { .data = nullptr, .len = 0};
    Crypto_DataBlob g_y = { .data = nullptr, .len = 0};
    Crypto_DataBlob n = { .data = nullptr, .len = 0};
    Crypto_DataBlob h = { .data = nullptr, .len = 0};
    Crypto_DataBlob gh = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FP_P_DATABLOB, &fp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_A_DATABLOB, &a), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_B_DATABLOB, &b), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_X_DATABLOB, &g_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_Y_DATABLOB, &g_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_N_DATABLOB, &n), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_H_INT, &h), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_FP_P_DATABLOB, &fp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_A_DATABLOB, &a), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_B_DATABLOB, &b), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_G_X_DATABLOB, &g_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_G_Y_DATABLOB, &g_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_N_DATABLOB, &n), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_H_INT, &h), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GetParam(specCtx, CRYPTO_ECC_H_INT, &gh), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&g_x);
    OH_Crypto_FreeDataBlob(&g_y);
    OH_Crypto_FreeDataBlob(&a);
    OH_Crypto_FreeDataBlob(&b);
    OH_Crypto_FreeDataBlob(&n);
    OH_Crypto_FreeDataBlob(&h);
    OH_Crypto_FreeDataBlob(&gh);
    OH_Crypto_FreeDataBlob(&fp);
    return specCtx;
}

static OH_CryptoAsymKeySpec *OHTEST_GenDhCommonParamsSpec(OH_CryptoPubKey *pubKey)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    Crypto_DataBlob p = { .data = nullptr, .len = 0};
    Crypto_DataBlob g = { .data = nullptr, .len = 0};
    Crypto_DataBlob l = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_P_DATABLOB, &p), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_G_DATABLOB, &g), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_L_INT, &l), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_P_DATABLOB, &p), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_G_DATABLOB, &g), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_L_INT, &l), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_Crypto_FreeDataBlob(&g);
    OH_Crypto_FreeDataBlob(&p);
    OH_Crypto_FreeDataBlob(&l);
    return specCtx;
}

CommonECCSpec g_commonEccSpec[] = {
    {"ECC224", "ECC", "NID_secp224r1", false},
    {"ECC256", "ECC", "NID_X9_62_prime256v1", false},
    {"ECC384", "ECC", "NID_secp384r1", false},
    {"ECC521", "ECC", "NID_secp521r1", false},
    {"ECC_BrainPoolP160r1", "ECC", "NID_brainpoolP160r1", false},
    {"ECC_BrainPoolP160t1", "ECC", "NID_brainpoolP160t1", false},
    {"ECC_BrainPoolP192r1", "ECC", "NID_brainpoolP192r1", false},
    {"ECC_BrainPoolP192t1", "ECC", "NID_brainpoolP192t1", false},
    {"ECC_BrainPoolP224r1", "ECC", "NID_brainpoolP224r1", false},
    {"ECC_BrainPoolP224t1", "ECC", "NID_brainpoolP224t1", false},
    {"ECC_BrainPoolP256r1", "ECC", "NID_brainpoolP256r1", false},
    {"ECC_BrainPoolP256t1", "ECC", "NID_brainpoolP256t1", false},
    {"ECC_BrainPoolP320r1", "ECC", "NID_brainpoolP320r1", false},
    {"ECC_BrainPoolP320t1", "ECC", "NID_brainpoolP320t1", false},
    {"ECC_BrainPoolP384r1", "ECC", "NID_brainpoolP384r1", false},
    {"ECC_BrainPoolP384t1", "ECC", "NID_brainpoolP384t1", false},
    {"ECC_BrainPoolP512r1", "ECC", "NID_brainpoolP512r1", false},
    {"ECC_BrainPoolP512t1", "ECC", "NID_brainpoolP512t1", false},
    {"ECC_Secp256k1", "ECC", "NID_secp256k1", false},
    {"ECC224", "ECC", "NID_secp224r1", true},
    {"ECC256", "ECC", "NID_X9_62_prime256v1", true},
    {"ECC384", "ECC", "NID_secp384r1", true},
    {"ECC521", "ECC", "NID_secp521r1", true},
    {"ECC_BrainPoolP160r1", "ECC", "NID_brainpoolP160r1", true},
    {"ECC_BrainPoolP160t1", "ECC", "NID_brainpoolP160t1", true},
    {"ECC_BrainPoolP192r1", "ECC", "NID_brainpoolP192r1", true},
    {"ECC_BrainPoolP192t1", "ECC", "NID_brainpoolP192t1", true},
    {"ECC_BrainPoolP224r1", "ECC", "NID_brainpoolP224r1", true},
    {"ECC_BrainPoolP224t1", "ECC", "NID_brainpoolP224t1", true},
    {"ECC_BrainPoolP256r1", "ECC", "NID_brainpoolP256r1", true},
    {"ECC_BrainPoolP256t1", "ECC", "NID_brainpoolP256t1", true},
    {"ECC_BrainPoolP320r1", "ECC", "NID_brainpoolP320r1", true},
    {"ECC_BrainPoolP320t1", "ECC", "NID_brainpoolP320t1", true},
    {"ECC_BrainPoolP384r1", "ECC", "NID_brainpoolP384r1", true},
    {"ECC_BrainPoolP384t1", "ECC", "NID_brainpoolP384t1", true},
    {"ECC_BrainPoolP512r1", "ECC", "NID_brainpoolP512r1", true},
    {"ECC_BrainPoolP512t1", "ECC", "NID_brainpoolP512t1", true},
    {"ECC_Secp256k1", "ECC", "NID_secp256k1", true},
    {"SM2_256", "SM2", "NID_sm2", false},
    {"SM2_256", "SM2", "NID_sm2", true},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_ECC_KEYPAIR_TEST, ::testing::ValuesIn(g_commonEccSpec));

HWTEST_P(ASYMKEY_ECC_KEYPAIR_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1300, TestSize.Level0)
{
    CommonECCSpec asymInfo = GetParam();
    const char *algoName = asymInfo.algoName;
    const char *curve = asymInfo.curve;
    const char *curveNid = asymInfo.curveNid;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk_x = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk_y = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk_x = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk_y = { .data = nullptr, .len = 0};
    
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, &pk_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_ECC_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(curve, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    if (asymInfo.isGetCommonSpec) {
        commonSpec = OHTEST_GenEcCommonParamsSpec(pubKey);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(curveNid, &commonSpec), CRYPTO_SUCCESS);
    }
    EXPECT_TRUE(commonSpec != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_X_DATABLOB, &pk_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_Y_DATABLOB, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(new_privKey != nullptr);
    OH_CryptoPubKey *new_pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(new_pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, CRYPTO_ECC_PK_X_DATABLOB, &new_pk_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &new_pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, CRYPTO_ECC_SK_DATABLOB, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk_x.data, pk_x.data, new_pk_x.len) == 0);
    EXPECT_TRUE(memcmp(new_pk_y.data, pk_y.data, new_pk_y.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk_x);
    OH_Crypto_FreeDataBlob(&pk_y);
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk_x);
    OH_Crypto_FreeDataBlob(&new_pk_y);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

CommonDHSpec g_commonDhSpec[] = {
    {"DH_modp1536", "DH", 0, 0, false},
    {"DH_modp2048", "DH", 0, 0, false},
    {"DH_modp3072", "DH", 0, 0, false},
    {"DH_modp4096", "DH", 0, 0, false},
    {"DH_modp6144", "DH", 0, 0, false},
    {"DH_modp8192", "DH", 0, 0, false},
    {"DH_ffdhe2048", "DH", 0, 0, false},
    {"DH_ffdhe3072", "DH", 0, 0, false},
    {"DH_ffdhe4096", "DH", 0, 0, false},
    {"DH_ffdhe6144", "DH", 0, 0, false},
    {"DH_ffdhe8192", "DH", 0, 0, false},
    {"DH_modp1536", "DH", 1536, 200, true},
    {"DH_modp2048", "DH", 2048, 1024, true},
    {"DH_modp3072", "DH", 3072, 1536, true},
    {"DH_modp4096", "DH", 4096, 1536, true},
    {"DH_modp6144", "DH", 6144, 1536, true},
    {"DH_modp8192", "DH", 8192, 1536, true},
    {"DH_ffdhe2048", "DH", 2048, 1536, true},
    {"DH_ffdhe3072", "DH", 3072, 1536, true},
    {"DH_ffdhe4096", "DH", 4096, 1536, true},
    {"DH_ffdhe6144", "DH", 6144, 1536, true},
    {"DH_ffdhe8192", "DH", 8192, 1536, true},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_DH_KEYPAIR_TEST, ::testing::ValuesIn(g_commonDhSpec));

HWTEST_P(ASYMKEY_DH_KEYPAIR_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1400, TestSize.Level0)
{
    CommonDHSpec asymInfo = GetParam();
    const char *algoName = asymInfo.algoName;
    const char *curve = asymInfo.curve;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};
    
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DH_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(curve, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    if (!asymInfo.isGetCommonSpec) {
        commonSpec = OHTEST_GenDhCommonParamsSpec(pubKey);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(asymInfo.pLen, asymInfo.skLen, &commonSpec), CRYPTO_SUCCESS);
    }
    EXPECT_TRUE(commonSpec != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(new_privKey != nullptr);
    OH_CryptoPubKey *new_pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(new_pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, CRYPTO_DH_PK_DATABLOB, &new_pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, CRYPTO_DH_SK_DATABLOB, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk.data, pk.data, new_pk.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

CommonRSASpec g_commonRsaSpec[] = {
    {"RSA", "RSA512", "RSA512|PRIMES_2"},
    {"RSA", "RSA768", "RSA768|PRIMES_2"},
    {"RSA", "RSA1024", "RSA1024|PRIMES_2"},
    {"RSA", "RSA1024", "RSA1024|PRIMES_3"},
    {"RSA", "RSA2048", "RSA2048|PRIMES_2"},
    {"RSA", "RSA2048", "RSA2048|PRIMES_3"},
    {"RSA", "RSA3072", "RSA3072|PRIMES_2"},
    {"RSA", "RSA3072", "RSA3072|PRIMES_3"},
    {"RSA", "RSA4096", "RSA4096|PRIMES_2"},
    {"RSA", "RSA4096", "RSA4096|PRIMES_3"},
    {"RSA", "RSA4096", "RSA4096|PRIMES_4"},
    {"RSA", "RSA8192", "RSA8192|PRIMES_2"},
    {"RSA", "RSA8192", "RSA8192|PRIMES_3"},
    {"RSA", "RSA8192", "RSA8192|PRIMES_4"},
    {"RSA", "RSA8192", "RSA8192|PRIMES_5"},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_RSA_KEYPAIR_TEST, ::testing::ValuesIn(g_commonRsaSpec));

HWTEST_P(ASYMKEY_RSA_KEYPAIR_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1500, TestSize.Level0)
{
    CommonRSASpec asymInfo = GetParam();
    const char *algoName = asymInfo.algoName;
    const char *specName = asymInfo.specName;
    const char *algoKeyName = asymInfo.algoKeyName;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob n = { .data = nullptr, .len = 0};
    
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoKeyName);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_E_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_RSA_D_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(specName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, &n), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_RSA_N_DATABLOB, &n), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_RSA_D_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_RSA_E_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(new_privKey != nullptr);
    OH_CryptoPubKey *new_pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(new_pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, CRYPTO_RSA_E_DATABLOB, &new_pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, CRYPTO_RSA_D_DATABLOB, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk.data, pk.data, new_pk.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_Crypto_FreeDataBlob(&n);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

CommonDSASpec g_commonDsaSpec[] = {
    {"DSA", "DSA1024"},
    {"DSA", "DSA2048"},
    {"DSA", "DSA3072"},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_DSA_KEYPAIR_TEST, ::testing::ValuesIn(g_commonDsaSpec));

HWTEST_P(ASYMKEY_DSA_KEYPAIR_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1600, TestSize.Level0)
{
    CommonDSASpec asymInfo = GetParam();
    const char *algoName = asymInfo.algoName;
    const char *specName = asymInfo.specName;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob g = { .data = nullptr, .len = 0};
    Crypto_DataBlob p = { .data = nullptr, .len = 0};
    Crypto_DataBlob q = { .data = nullptr, .len = 0};
    
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DSA_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(specName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_P_DATABLOB, &p), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_Q_DATABLOB, &q), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_G_DATABLOB, &g), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_P_DATABLOB, &p), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_Q_DATABLOB, &q), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_G_DATABLOB, &g), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(new_privKey != nullptr);
    OH_CryptoPubKey *new_pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(new_pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, CRYPTO_DSA_PK_DATABLOB, &new_pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, CRYPTO_DSA_SK_DATABLOB, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk.data, pk.data, new_pk.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_Crypto_FreeDataBlob(&p);
    OH_Crypto_FreeDataBlob(&q);
    OH_Crypto_FreeDataBlob(&g);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

CommonSpec g_CommonSpec[] = {
    {"X25519", CRYPTO_X25519_SK_DATABLOB, CRYPTO_X25519_PK_DATABLOB},
    {"Ed25519", CRYPTO_ED25519_SK_DATABLOB, CRYPTO_ED25519_PK_DATABLOB},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_KEYPAIR_TEST, ::testing::ValuesIn(g_CommonSpec));

HWTEST_P(ASYMKEY_KEYPAIR_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1700, TestSize.Level0)
{
    CommonSpec asymInfo = GetParam();
    const char *algoName = asymInfo.algoName;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};
    
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, asymInfo.pk, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, asymInfo.sk, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(algoName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, asymInfo.sk, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, asymInfo.pk, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(newKeyPair);
    EXPECT_TRUE(new_privKey != nullptr);
    OH_CryptoPubKey *new_pubKey = OH_CryptoKeyPair_GetPubKey(newKeyPair);
    EXPECT_TRUE(new_pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, asymInfo.pk, &new_pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, asymInfo.sk, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk.data, pk.data, new_pk.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1800
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1800
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1800, TestSize.Level0)
{
    Crypto_DataBlob password = {.data = (uint8_t *)"", .len = 0};
    Crypto_DataBlob cipher = {.data = (uint8_t *)"AES-128-CBC", .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)"RSA512", (const char *)"RSA512");
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    ASSERT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, (const char *)"PKCS8", params, &out), CRYPTO_OPERTION_ERROR);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1900
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1900
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_1900, TestSize.Level0)
{
    Crypto_DataBlob password = {.data = (uint8_t *)"0123456789", .len = 10};
    Crypto_DataBlob cipher = {.data = (uint8_t *)"SM4-128-CBC", .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)"RSA512", (const char *)"RSA512");
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    ASSERT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, (const char *)"PKCS8", params, &out), CRYPTO_NOT_SUPPORTED);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2000
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2000
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2000, TestSize.Level0)
{
    Crypto_DataBlob password = {.data = (uint8_t *)"0123456789", .len = 10};
    Crypto_DataBlob cipher = {.data = (uint8_t *)"AES-128-CBC", .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)"RSA512", (const char *)"RSA512");
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    ASSERT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, (const char *)"X509", params, &out), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2100
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2100
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2100, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_TRUE(generator == nullptr);

    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2200
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2200
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2200, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t sk_data[] = {
        0xc1, 0xef, 0x9c, 0xd1, 0xb0, 0xd7, 0xf3, 0xcc, 0x99, 0xf7, 0x6d, 0x93, 0x07, 0x26, 0x9e, 0xcc,
        0xa9, 0x39, 0x09, 0x4f, 0x8a, 0x59, 0xbb, 0x1d, 0xb8, 0x61, 0xf6, 0xc1, 0x2f, 0x95, 0x6b, 0x60,
        0x61, 0xf9, 0x62, 0xaa, 0x3e, 0x22, 0x94, 0xee, 0x3d, 0x0a, 0x19, 0x46, 0x39, 0x96, 0xdf, 0x94,
        0x24, 0x10, 0xdf, 0x0a, 0x1c, 0x40, 0x55, 0x10, 0x5a, 0x89, 0x6a, 0x43, 0xd5, 0xe4, 0x47, 0x3c,
        0xf1, 0x40, 0xf1, 0xb9, 0x68, 0xa8, 0x63, 0x38, 0xbc, 0x97, 0xfa, 0x82, 0xb4, 0xdf, 0xf1, 0x51,
        0x31, 0x82, 0xb2, 0x05, 0xe4, 0x3f, 0x8a, 0xdc, 0xc3, 0xf3, 0xfa, 0xa4, 0x88, 0xd3, 0xca, 0x9b,
        0x5c, 0x03, 0x3b, 0x0a, 0x7c, 0xd9, 0xff, 0xc2, 0x3b, 0x36, 0xff, 0xfe, 0x06, 0xc9, 0x3b, 0x26,
        0x1d, 0xfe, 0xe7, 0x23, 0xde, 0xda, 0xe5, 0xa6, 0x91, 0x91, 0x64, 0xe3, 0x44, 0x4f, 0x75, 0x60,
        0x4b, 0x76, 0x59, 0x2b, 0x9e, 0x09, 0x87, 0xd4, 0x5c, 0xd9, 0x7a, 0x9d, 0x35, 0x94, 0x03, 0x23,
        0xeb, 0xe9, 0xea, 0x32, 0x4e, 0x3b, 0x4c, 0xa3, 0xce, 0x36, 0xac, 0xd4, 0x5e, 0x1c, 0xdc, 0x29,
        0xc4, 0x51, 0x98, 0xfa, 0x1f, 0xd4, 0x72, 0x30, 0x10, 0xd3, 0x77, 0x48, 0x43, 0x94, 0xa1, 0x96,
        0xc0, 0x63, 0x14, 0xc5, 0x83, 0x45, 0x00, 0xb4, 0xe5, 0x05, 0xe8, 0x1a, 0x99, 0x13, 0x1d
    };
    uint8_t pk_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f
    };
    Crypto_DataBlob sk = { .data = sk_data, .len = sizeof(sk_data)};
    Crypto_DataBlob pk = { .data = pk_data, .len = sizeof(pk_data)};
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(1536, 200, &commonSpec), CRYPTO_SUCCESS);
    EXPECT_TRUE(commonSpec != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, &new_pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DH_SK_DATABLOB, &new_sk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk.data, pk.data, new_pk.len) == 0);
    EXPECT_TRUE(memcmp(new_sk.data, sk.data, new_sk.len) == 0);
    EXPECT_EQ(new_pk.len, pk.len);
    EXPECT_EQ(new_sk.len, sk.len);

    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2300
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2300
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2300, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    uint8_t pk_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    uint8_t sk_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    Crypto_DataBlob pk = { .data = pk_data, .len = sizeof(pk_data)};
    Crypto_DataBlob sk = { .data = sk_data, .len = sizeof(sk_data)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ED25519_PK_DATABLOB, &pk), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_X25519_SK_DATABLOB, &sk), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2400
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2400
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2400, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx1 = nullptr;
    OH_CryptoAsymKeySpec *specCtx2 = nullptr;
    uint8_t pk_x_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    uint8_t sk_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    Crypto_DataBlob pk_x = { .data = pk_x_data, .len = sizeof(pk_x_data)};
    Crypto_DataBlob sk = { .data = sk_data, .len = sizeof(sk_data)};
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PUBLIC_KEY_SPEC, &specCtx1), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx2), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx1 != nullptr && specCtx2 != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx1, CRYPTO_ECC_SK_DATABLOB, &sk), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx2, CRYPTO_ECC_PK_X_DATABLOB, &pk_x), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoAsymKeySpec_Destroy(specCtx1);
    OH_CryptoAsymKeySpec_Destroy(specCtx2);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2500
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2500
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2500, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t pk_data[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x45
    };
    Crypto_DataBlob pk = { .data = pk_data, .len = sizeof(pk_data)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_PUBLIC_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(1536, 200, &commonSpec), CRYPTO_SUCCESS);
    EXPECT_TRUE(commonSpec != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_PK_DATABLOB, &pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey == nullptr);
    
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2600
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2600
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2600, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t sk_data[] = {
        0xc1, 0xef, 0x9c, 0xd1, 0xb0, 0xd7, 0xf3, 0xcc, 0x99, 0xf7, 0x6d, 0x93, 0x07, 0x26, 0x9e, 0xcc,
        0xa9, 0x39, 0x09, 0x4f, 0x8a, 0x59, 0xbb, 0x1d, 0xb8, 0x61, 0xf6, 0xc1, 0x2f, 0x95, 0x6b, 0x60,
        0x61, 0xf9, 0x62, 0xaa, 0x3e, 0x22, 0x94, 0xee, 0x3d, 0x0a, 0x19, 0x46, 0x39, 0x96, 0xdf, 0x94,
        0x24, 0x10, 0xdf, 0x0a, 0x1c, 0x40, 0x55, 0x10, 0x5a, 0x89, 0x6a, 0x43, 0xd5, 0xe4, 0x47, 0x3c,
        0xf1, 0x40, 0xf1, 0xb9, 0x68, 0xa8, 0x63, 0x38, 0xbc, 0x97, 0xfa, 0x82, 0xb4, 0xdf, 0xf1, 0x51,
        0x31, 0x82, 0xb2, 0x05, 0xe4, 0x3f, 0x8a, 0xdc, 0xc3, 0xf3, 0xfa, 0xa4, 0x88, 0xd3, 0xca, 0x9b,
        0x5c, 0x03, 0x3b, 0x0a, 0x7c, 0xd9, 0xff, 0xc2, 0x3b, 0x36, 0xff, 0xfe, 0x06, 0xc9, 0x3b, 0x26,
        0x1d, 0xfe, 0xe7, 0x23, 0xde, 0xda, 0xe5, 0xa6, 0x91, 0x91, 0x64, 0xe3, 0x44, 0x4f, 0x75, 0x60,
        0x4b, 0x76, 0x59, 0x2b, 0x9e, 0x09, 0x87, 0xd4, 0x5c, 0xd9, 0x7a, 0x9d, 0x35, 0x94, 0x03, 0x23,
        0xeb, 0xe9, 0xea, 0x32, 0x4e, 0x3b, 0x4c, 0xa3, 0xce, 0x36, 0xac, 0xd4, 0x5e, 0x1c, 0xdc, 0x29,
        0xc4, 0x51, 0x98, 0xfa, 0x1f, 0xd4, 0x72, 0x30, 0x10, 0xd3, 0x77, 0x48, 0x43, 0x94, 0xa1, 0x96,
        0xc0, 0x63, 0x14, 0xc5, 0x83, 0x45, 0x00, 0xb4, 0xe5, 0x05, 0xe8, 0x1a, 0x99, 0x13, 0x1d, 0xd9
    };
    Crypto_DataBlob sk = { .data = sk_data, .len = sizeof(sk_data)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(1536, 200, &commonSpec), CRYPTO_SUCCESS);
    EXPECT_TRUE(commonSpec != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_SK_DATABLOB, &sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);

    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

ECPointSpec g_ecPointSpec[] = {
    {"ECC224", "NID_secp224r1", "UNCOMPRESSED"},
    {"ECC256", "NID_X9_62_prime256v1", "UNCOMPRESSED"},
    {"ECC384", "NID_secp384r1", "UNCOMPRESSED"},
    {"ECC521", "NID_secp521r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP160r1", "NID_brainpoolP160r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP160t1", "NID_brainpoolP160t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP192r1", "NID_brainpoolP192r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP192t1", "NID_brainpoolP192t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP224r1", "NID_brainpoolP224r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP224t1", "NID_brainpoolP224t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP256r1", "NID_brainpoolP256r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP256t1", "NID_brainpoolP256t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP320r1", "NID_brainpoolP320r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP320t1", "NID_brainpoolP320t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP384r1", "NID_brainpoolP384r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP384t1", "NID_brainpoolP384t1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP512r1", "NID_brainpoolP512r1", "UNCOMPRESSED"},
    {"ECC_BrainPoolP512t1", "NID_brainpoolP512t1", "UNCOMPRESSED"},
    {"ECC_Secp256k1", "NID_secp256k1", "UNCOMPRESSED"},
    {"SM2_256", "NID_sm2", "UNCOMPRESSED"},
    {"SM2_256", "NID_sm2", "COMPRESSED"},
    {"ECC224", "NID_secp224r1", "COMPRESSED"},
    {"ECC256", "NID_X9_62_prime256v1", "COMPRESSED"},
    {"ECC384", "NID_secp384r1", "COMPRESSED"},
    {"ECC521", "NID_secp521r1", "COMPRESSED"},
    {"ECC_BrainPoolP160r1", "NID_brainpoolP160r1", "COMPRESSED"},
    {"ECC_BrainPoolP160t1", "NID_brainpoolP160t1", "COMPRESSED"},
    {"ECC_BrainPoolP192r1", "NID_brainpoolP192r1", "COMPRESSED"},
    {"ECC_BrainPoolP192t1", "NID_brainpoolP192t1", "COMPRESSED"},
    {"ECC_BrainPoolP224r1", "NID_brainpoolP224r1", "COMPRESSED"},
    {"ECC_BrainPoolP224t1", "NID_brainpoolP224t1", "COMPRESSED"},
    {"ECC_BrainPoolP256r1", "NID_brainpoolP256r1", "COMPRESSED"},
    {"ECC_BrainPoolP256t1", "NID_brainpoolP256t1", "COMPRESSED"},
    {"ECC_BrainPoolP320r1", "NID_brainpoolP320r1", "COMPRESSED"},
    {"ECC_BrainPoolP320t1", "NID_brainpoolP320t1", "COMPRESSED"},
    {"ECC_BrainPoolP384r1", "NID_brainpoolP384r1", "COMPRESSED"},
    {"ECC_BrainPoolP384t1", "NID_brainpoolP384t1", "COMPRESSED"},
    {"ECC_BrainPoolP512r1", "NID_brainpoolP512r1", "COMPRESSED"},
    {"ECC_BrainPoolP512t1", "NID_brainpoolP512t1", "COMPRESSED"},
    {"ECC_Secp256k1", "NID_secp256k1", "COMPRESSED"},
};

INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkAsymKeyNapiTest, ASYMKEY_EC_POINT_TEST, ::testing::ValuesIn(g_ecPointSpec));

HWTEST_P(ASYMKEY_EC_POINT_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2700, TestSize.Level0)
{
    ECPointSpec asymInfo = GetParam();
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk_x = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk_y = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk_x = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk_y = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(asymInfo.curve, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, &pk_x), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Create(asymInfo.curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pk_x, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, asymInfo.format, &ecKeyData), CRYPTO_SUCCESS);
    OH_CryptoEcPoint_Destroy(point);
    point = nullptr;
    EXPECT_EQ(OH_CryptoEcPoint_Create(asymInfo.curveNid, &ecKeyData, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_GetCoordinate(point, &new_pk_x, &new_pk_y), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_pk_y.data, pk_y.data, new_pk_y.len) == 0);
    EXPECT_TRUE(memcmp(new_pk_x.data, new_pk_x.data, new_pk_x.len) == 0);
    EXPECT_EQ(new_pk_x.len, pk_x.len);
    EXPECT_EQ(pk_y.len, new_pk_y.len); 

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&new_pk_x);
    OH_Crypto_FreeDataBlob(&new_pk_y);
    OH_Crypto_FreeDataBlob(&pk_x);
    OH_Crypto_FreeDataBlob(&pk_y);
    OH_Crypto_FreeDataBlob(&ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2800
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2800
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2800, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
    uint8_t x[] = {
        0x59, 0xfb, 0xf8, 0xce, 0xe6, 0xd1, 0xf3, 0xd6, 0xe0, 0x20, 0x9e, 0x88, 0xa9, 0x59, 0x22, 0xa4,
        0xd4, 0x23, 0xe2, 0x93, 0xfd, 0xd3, 0xcd, 0x11, 0xf1, 0x11, 0xa1, 0x9e, 0x9c, 0x81, 0x78, 0x27
    };
    uint8_t y[] = {
        0x03, 0xb0, 0x17, 0x54, 0x62, 0xb9, 0x38, 0x88, 0xc4, 0xca, 0x7e, 0x55, 0x50, 0xa7, 0x6d, 0xe6,
        0x0c, 0xc2, 0xd7, 0xd5, 0x07, 0x57, 0xa4, 0x4b, 0x22, 0x8e, 0xc5, 0x54, 0xbd, 0x24, 0xc4, 0x8a
    };
    Crypto_DataBlob pk_x = { .data = x, .len = sizeof(x)};
    Crypto_DataBlob pk_y = { .data = y, .len = sizeof(y)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pk_x, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2900
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2900
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_2900, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
    uint8_t x[] = {
        0x59, 0xfb, 0xf8, 0xce, 0xe6, 0xd1, 0xf3, 0xd6, 0xe0, 0x20, 0x9e, 0x88, 0xa9, 0x59, 0x22, 0xa4,
        0xd4, 0x23, 0xe2, 0x93, 0xfd, 0xd3, 0xcd, 0x11, 0xf1, 0x11, 0xa1, 0x9e, 0x9c, 0x81, 0x78, 0x27
    };
    uint8_t y[] = {
        0x94, 0x73, 0x65, 0x53, 0x8b, 0xeb, 0x1f, 0x06, 0x80, 0x17, 0xc1, 0x08, 0xf6, 0x94, 0x7c, 0xf2,
        0x5a, 0x3e, 0x5e, 0x08, 0x2e, 0x6e, 0x42, 0xb2, 0x15, 0x18, 0x8d, 0x1f, 0x69, 0xac, 0xdf, 0x12
    };
    Crypto_DataBlob pk_x = { .data = x, .len = sizeof(x)};
    Crypto_DataBlob pk_y = { .data = y, .len = sizeof(y)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pk_x, &pk_y), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3000
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3000
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3000, TestSize.Level0)
{
    const char *curveNid = "NID_sm2";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ec[] = {
        0x03, 0x64, 0xaf, 0x65, 0x68, 0x6c, 0x49, 0xd6, 0xe3, 0x3d, 0x4e, 0x15, 0x74, 0xda, 0xc1, 0xbf,
        0xeb, 0x60, 0xc5, 0x03, 0x51, 0xd8, 0xd9, 0x96, 0xbf, 0xdc, 0x7d, 0xb2, 0xe8, 0x15, 0x65, 0xcc,
        0x05
    };
    Crypto_DataBlob ecKeyData = { .data = ec, .len = sizeof(ec)};
    Crypto_DataBlob new_ecKeyData = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &new_ecKeyData), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_ecKeyData.data, ecKeyData.data, new_ecKeyData.len) == 0);
    EXPECT_EQ(new_ecKeyData.len, ecKeyData.len);
    
    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&new_ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3100
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3100
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3100, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ec[] = {
        0x02, 0x42, 0x7f, 0x7a, 0xa1, 0x7e, 0x79, 0x89, 0x77, 0x98, 0x77, 0x2f, 0xcc, 0xcb, 0x43, 0x65,
        0x8f, 0x77, 0xe8, 0xef, 0x26, 0xad, 0x76, 0x25, 0x0d, 0x12, 0x5e, 0xcf, 0x26, 0xf1, 0xfd, 0x0b,
        0x6f
    };
    Crypto_DataBlob ecKeyData = { .data = ec, .len = sizeof(ec)};
    Crypto_DataBlob new_ecKeyData = { .data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &new_ecKeyData), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(new_ecKeyData.data, ecKeyData.data, new_ecKeyData.len) == 0);
    EXPECT_EQ(new_ecKeyData.len, ecKeyData.len);
    
    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&new_ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3200
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3200
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3200, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ec[] = {
        0x06, 0xb4, 0x2d, 0x9f, 0xa7, 0x68, 0x6f, 0xed, 0x95, 0x1b, 0xf0, 0x02, 0x72, 0x89, 0x96, 0x95,
        0x1b, 0x39, 0x4c, 0x6e, 0xc6, 0x63, 0x86, 0xb7, 0x78, 0x49, 0xac, 0xc5, 0x30, 0x24, 0xb8, 0x4f,
        0x5a, 0xd7, 0xf3, 0x0e, 0x51, 0xe7, 0x6a, 0x9d, 0x12, 0x7a, 0x96, 0x00, 0x0a, 0xd1, 0xcb, 0xf3,
        0xd7, 0xf7, 0x69, 0xfd, 0x58, 0xd9, 0xac, 0x7d, 0xab, 0xac, 0xde, 0xf9, 0xbe, 0xb1, 0xc6, 0x5b,
        0xe7
    };
    Crypto_DataBlob ecKeyData = { .data = ec, .len = sizeof(ec)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    
    OH_CryptoEcPoint_Destroy(point);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3300
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3300
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3300, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ec_ge[] = {
        0x03, 0x42, 0x7f, 0x6a, 0xa1, 0x6e, 0x39, 0x89, 0xb7, 0x78, 0x77, 0x2f, 0xcc, 0xcb, 0x43, 0x65,
        0x8f, 0x77, 0xe8, 0xef, 0x26, 0xad, 0x76, 0x25, 0x0d, 0x12, 0x5e, 0xcf, 0x26, 0xf1, 0xfd, 0x0b,
    };
    uint8_t ec_le[] = {
        0x03, 0x42, 0x7f, 0x6a, 0xa1, 0x6e, 0x39, 0x89, 0xb7, 0x78, 0x77, 0x2f, 0xcc, 0xcb, 0x43, 0x65,
        0x8f, 0x77, 0xe8, 0xef, 0x26, 0xad, 0x76, 0x25, 0x0d, 0x12, 0x5e, 0xcf, 0x26, 0xf1, 0xfd, 0x0b,
        0x6f, 0x6f
    };
    uint8_t infinity_point[] = {
        0x00
    };
    Crypto_DataBlob ecKeyDataGe = { .data = ec_ge, .len = sizeof(ec_ge)};
    Crypto_DataBlob ecKeyDataLe = { .data = ec_le, .len = sizeof(ec_le)};
    Crypto_DataBlob ecKeyData = { .data = infinity_point, .len = sizeof(infinity_point)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyDataGe, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyDataLe, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    
    OH_CryptoEcPoint_Destroy(point);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3400
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3400
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3400, TestSize.Level0)
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
    uint8_t x_le[] = {
        0xce, 0x9f, 0xee, 0x1b, 0xca, 0x74, 0x09, 0x8c, 0xef, 0x35, 0x01, 0x57, 0x0c, 0xb5, 0x16, 0x3a,
        0x73, 0x95, 0xb5, 0x94, 0x41, 0xc7, 0xc5, 0x81, 0xd4, 0x56, 0x8f, 0xa7, 0x29, 0xfe, 0x21, 0xc1,
        0xc1
    };
    uint8_t y_le[] = {
        0x94, 0x73, 0x65, 0x53, 0x8b, 0xeb, 0x1f, 0x06, 0x80, 0x17, 0xc1, 0x08, 0xf6, 0x94, 0x7c, 0xf2,
        0x5a, 0x3e, 0x5e, 0x08, 0x2e, 0x6e, 0x42, 0xb2, 0x15, 0x18, 0x8d, 0x1f, 0x69, 0xac, 0xdf, 0x12,
        0x12
    };
    uint8_t x_ge[] = {
        0xce, 0x9f, 0xee, 0x1b, 0xca, 0x74, 0x09, 0x8c, 0xef, 0x35, 0x01, 0x57, 0x0c, 0xb5, 0x16, 0x3a,
        0x73, 0x95, 0xb5, 0x94, 0x41, 0xc7, 0xc5, 0x81, 0xd4, 0x56, 0x8f, 0xa7, 0x29, 0xfe, 0x21,
    };
    uint8_t y_ge[] = {
        0x94, 0x73, 0x65, 0x53, 0x8b, 0xeb, 0x1f, 0x06, 0x80, 0x17, 0xc1, 0x08, 0xf6, 0x94, 0x7c, 0xf2,
        0x5a, 0x3e, 0x5e, 0x08, 0x2e, 0x6e, 0x42, 0xb2, 0x15, 0x18, 0x8d, 0x1f, 0x69, 0xac, 0xdf,
    };
    Crypto_DataBlob pk_x_le = { .data = x_le, .len = sizeof(x_le)};
    Crypto_DataBlob pk_y_le = { .data = y_le, .len = sizeof(y_le)};
    Crypto_DataBlob pk_x_ge = { .data = x_ge, .len = sizeof(x_ge)};
    Crypto_DataBlob pk_y_ge = { .data = y_ge, .len = sizeof(y_ge)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pk_x_le, &pk_y_le), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    OH_CryptoEcPoint_Destroy(point);
    point = nullptr;
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pk_x_ge, &pk_y_ge), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3500
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3500
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3500, TestSize.Level0)
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789",
        10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = asymInfo.pwLen};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = asymInfo.cipherLen};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    uint8_t new_password[] = "9876543210";

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName, (const char *)asymInfo.algKeyName);
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        ASSERT_TRUE(params != nullptr);
    }
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding, (const char *)asymInfo.type, params, &out), CRYPTO_SUCCESS);
    pwBlob.data = new_password;
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding, &out, nullptr, &pwBlob);
    ASSERT_TRUE(new_keyPair == nullptr);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3600
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3600
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3600, TestSize.Level0)
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2",
        (uint8_t *)"0123456789", 10, (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = asymInfo.pwLen};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = asymInfo.cipherLen};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName, (const char *)asymInfo.algKeyName);
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        ASSERT_TRUE(params != nullptr);
    }
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding, (const char *)asymInfo.type, params, &out), CRYPTO_SUCCESS);
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding, &out, nullptr, nullptr);
    ASSERT_TRUE(new_keyPair == nullptr);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3700
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3700
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3700, TestSize.Level0)
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", (uint8_t *)"RSA512", (uint8_t *)"RSA512|PRIMES_2", (uint8_t *)"0123456789", 10,
        (uint8_t *)"AES-128-CBC", 11, (uint8_t *)"PKCS8", CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = asymInfo.pwLen};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = asymInfo.cipherLen};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName, (const char *)asymInfo.algKeyName);
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        ASSERT_TRUE(params != nullptr);
    }
    ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding, (const char *)asymInfo.type, params, &out), CRYPTO_SUCCESS);
    out.data[0]++;
    OH_CryptoKeyPair *new_keyPair1 = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding, &out, nullptr, &pwBlob);
    ASSERT_TRUE(new_keyPair1 == nullptr);
    out.data[0]--;
    out.data[160]++;
    OH_CryptoKeyPair *new_keyPair2 = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding, &out, nullptr, &pwBlob);
    ASSERT_TRUE(new_keyPair2 == nullptr);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3800
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3800
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3800, TestSize.Level0)
{
    const unsigned char *password = (const unsigned char *)"123456";
    const char *algoName = "RSA512";
    uint32_t passLen = 6;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob privBlob = { .data = g_privData, .len = sizeof(g_privData) };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_SetPassword(ctx, password, passLen), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_PEM, nullptr, &privBlob, &keyPair), CRYPTO_OPERTION_ERROR);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3900
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3900
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_3900, TestSize.Level0)
{
    const char *algoName = "RSA512";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob privBlob = { .data = g_privDerData, .len = sizeof(g_privDerData) };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &privBlob, &keyPair), CRYPTO_SUCCESS);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

HWTEST_P(ASYMKEY_PRIV_TEST, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4000, TestSize.Level0)
{
    AsymPrivKeySpec asymInfo = GetParam();
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    Crypto_DataBlob outPub = { .data = nullptr, .len = 0 };
    Crypto_DataBlob new_out = { .data = nullptr, .len = 0 };
    uint8_t *type = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName, (const char *)asymInfo.algKeyName);
    ASSERT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    ASSERT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_TRUE(pubKey != nullptr);
    type = asymInfo.type ? asymInfo.type : nullptr;
    if (type != nullptr && strstr((const char *)type, "ECC") != nullptr) {
        ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, (const char *)type, nullptr, &out), CRYPTO_SUCCESS);
        ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, asymInfo.pubType, &outPub), CRYPTO_SUCCESS);
    } else {
        ASSERT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, nullptr, nullptr, &out), CRYPTO_SUCCESS);
        ASSERT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &outPub), CRYPTO_SUCCESS);
    }
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, CRYPTO_DER, &out, &outPub, nullptr);
    ASSERT_TRUE(new_keyPair != nullptr);
    OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(new_keyPair);
    ASSERT_TRUE(new_privKey != nullptr);
    if (type != nullptr && strstr((const char *)type, "ECC") != nullptr) {
        ASSERT_EQ(OH_CryptoPrivKey_Encode(new_privKey, CRYPTO_DER, (const char *)type, nullptr, &new_out), CRYPTO_SUCCESS);
    } else {
        ASSERT_EQ(OH_CryptoPrivKey_Encode(new_privKey, CRYPTO_DER, nullptr, nullptr, &new_out), CRYPTO_SUCCESS);
    }
    if (new_out.len == out.len) {
        EXPECT_TRUE(memcmp(new_out.data, out.data, new_out.len) == 0);
    }
    EXPECT_TRUE(new_out.len == out.len);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&new_out);
    OH_Crypto_FreeDataBlob(&outPub);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(new_keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4100
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4100
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4100, TestSize.Level0)
{
    const char *algoName = "RSA512";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob privBlob = { .data = g_privDerData, .len = sizeof(g_privDerData) };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_PEM, nullptr, &privBlob, &keyPair), CRYPTO_OPERTION_ERROR);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4200
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4200
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4200, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x77, 0x02, 0x01, 0x01, 0x04, 0x20, 0x86, 0xcd, 0xb0, 0x6c, 0xed, 0x1f, 0x5b, 0x0a, 0x58,
        0x56, 0xde, 0xdc, 0x66, 0x89, 0x64, 0x3f, 0x43, 0x26, 0x98, 0xc0, 0x7b, 0x70, 0xb4, 0xed, 0x54,
        0x42, 0x52, 0xb0, 0x3e, 0x6c, 0x39, 0xcb, 0xa0, 0x0a, 0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d,
        0x03, 0x01, 0x07, 0xa1, 0x44, 0x03, 0x42, 0x00, 0x04, 0x77, 0xdf, 0x02, 0x14, 0x7e, 0x23, 0x46,
        0x15, 0x64, 0xc2, 0x9b, 0x17, 0x25, 0x2a, 0x81, 0xfe, 0x61, 0x18, 0xb1, 0x75, 0xa8, 0xca, 0x9c,
        0xf6, 0x56, 0x33, 0x19, 0x2e, 0x75, 0xb0, 0xbd, 0xd2, 0x56, 0x2f, 0xcb, 0x39, 0xfb, 0x0f, 0x08,
        0x53, 0x3f, 0xda, 0x94, 0xfd, 0x6f, 0x37, 0x95, 0x34, 0xf4, 0xa5, 0x20, 0x93, 0x50, 0x86, 0x39,
        0xb7, 0x78, 0x14, 0x1d, 0x4a, 0x65, 0x75, 0x38, 0x78
    };
    uint8_t expectedPubData[] = {
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0x77, 0xdf, 0x02, 0x14, 0x7e,
        0x23, 0x46, 0x15, 0x64, 0xc2, 0x9b, 0x17, 0x25, 0x2a, 0x81, 0xfe, 0x61, 0x18, 0xb1, 0x75, 0xa8,
        0xca, 0x9c, 0xf6, 0x56, 0x33, 0x19, 0x2e, 0x75, 0xb0, 0xbd, 0xd2, 0x56, 0x2f, 0xcb, 0x39, 0xfb,
        0x0f, 0x08, 0x53, 0x3f, 0xda, 0x94, 0xfd, 0x6f, 0x37, 0x95, 0x34, 0xf4, 0xa5, 0x20, 0x93, 0x50,
        0x86, 0x39, 0xb7, 0x78, 0x14, 0x1d, 0x4a, 0x65, 0x75, 0x38, 0x78
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4300
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4300
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4300, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x77, 0x02, 0x01, 0x01, 0x04, 0x20, 0x86, 0xcd, 0xb0, 0x6c, 0xed, 0x1f, 0x5b, 0x0a, 0x58,
        0x56, 0xde, 0xdc, 0x66, 0x89, 0x64, 0x3f, 0x43, 0x26, 0x98, 0xc0, 0x7b, 0x70, 0xb4, 0xed, 0x54,
        0x42, 0x52, 0xb0, 0x3e, 0x6c, 0x39, 0xcb, 0xa0, 0x0a, 0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d,
        0x03, 0x01, 0x07, 0xa1, 0x44, 0x03, 0x42, 0x00, 0x04, 0x77, 0xdf, 0x02, 0x14, 0x7e, 0x23, 0x46,
        0x15, 0x64, 0xc2, 0x9b, 0x17, 0x25, 0x2a, 0x81, 0xfe, 0x61, 0x18, 0xb1, 0x75, 0xa8, 0xca, 0x9c,
        0xf6, 0x56, 0x33, 0x19, 0x2e, 0x75, 0xb0, 0xbd, 0xd2, 0x56, 0x2f, 0xcb, 0x39, 0xfb, 0x0f, 0x08,
        0x53, 0x3f, 0xda, 0x94, 0xfd, 0x6f, 0x37, 0x95, 0x34, 0xf4, 0xa5, 0x20, 0x93, 0x50, 0x86, 0x39,
        0xb7, 0x78, 0x14, 0x1d, 0x4a, 0x65, 0x75, 0x38, 0x78
    };
    uint8_t pubData[] = {
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0x77, 0xdf, 0x02, 0x14, 0x7e,
        0x23, 0x46, 0x15, 0x64, 0xc2, 0x9b, 0x17, 0x25, 0x2a, 0x81, 0xfe, 0x61, 0x18, 0xb1, 0x75, 0xa8,
        0xca, 0x9c, 0xf6, 0x56, 0x33, 0x19, 0x2e, 0x75, 0xb0, 0xbd, 0xd2, 0x56, 0x2f, 0xcb, 0x39, 0xfb,
        0x0f, 0x08, 0x53, 0x3f, 0xda, 0x94, 0xfd, 0x6f, 0x37, 0x95, 0x34, 0xf4, 0xa5, 0x20, 0x93, 0x50,
        0x86, 0x39, 0xb7, 0x78, 0x14, 0x1d, 0x4a, 0x65, 0x75, 0x38, 0x78
    };
    Crypto_DataBlob privBlob = { .data = privData, .len = sizeof(privData) };
    Crypto_DataBlob pubBlob = { .data = pubData, .len = sizeof(pubData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubBlob, &privBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);

    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4400
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4400
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4400, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t pubData[] = {
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0x77, 0xdf, 0x02, 0x14, 0x7e,
        0x23, 0x46, 0x15, 0x64, 0xc2, 0x9b, 0x17, 0x25, 0x2a, 0x81, 0xfe, 0x61, 0x18, 0xb1, 0x75, 0xa8,
        0xca, 0x9c, 0xf6, 0x56, 0x33, 0x19, 0x2e, 0x75, 0xb0, 0xbd, 0xd2, 0x56, 0x2f, 0xcb, 0x39, 0xfb,
        0x0f, 0x08, 0x53, 0x3f, 0xda, 0x94, 0xfd, 0x6f, 0x37, 0x95, 0x34, 0xf4, 0xa5, 0x20, 0x93, 0x50,
        0x86, 0x39, 0xb7, 0x78, 0x14, 0x1d, 0x4a, 0x65, 0x75, 0x38, 0x78
    };
    Crypto_DataBlob pubBlob = { .data = pubData, .len = sizeof(pubData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubBlob, nullptr, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4500
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4500
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4500, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("RSA512", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x82, 0x01, 0x3c, 0x02, 0x01, 0x00, 0x02, 0x41, 0x00, 0xe4, 0x0c, 0xc1, 0x45, 0x43, 0xff,
        0x9f, 0x2c, 0x02, 0x99, 0x11, 0x00, 0xff, 0x45, 0xb0, 0x8e, 0x01, 0xe1, 0x2f, 0x83, 0xf4, 0xe3,
        0x28, 0xbe, 0x15, 0x45, 0xd9, 0x7a, 0x31, 0xfb, 0xa5, 0x6b, 0xc2, 0x1a, 0x0e, 0x1e, 0x60, 0xf6,
        0xd6, 0xab, 0xdc, 0xb6, 0x72, 0x7e, 0xed, 0x52, 0xd2, 0xc3, 0x46, 0x8a, 0x99, 0x8d, 0xac, 0x50,
        0x35, 0x3f, 0x8c, 0x58, 0x5d, 0xdd, 0x9f, 0x0c, 0x04, 0xc1, 0x02, 0x03, 0x01, 0x00, 0x01, 0x02,
        0x41, 0x00, 0x84, 0xad, 0x8b, 0x10, 0x72, 0x74, 0x59, 0x35, 0xf0, 0xb8, 0xff, 0x34, 0x96, 0x50,
        0x04, 0x5d, 0x4a, 0x68, 0xaa, 0x0d, 0x5a, 0xbf, 0x82, 0xa7, 0xbc, 0x96, 0xab, 0xe5, 0xb5, 0x08,
        0xd4, 0x7f, 0x18, 0xfc, 0x24, 0x22, 0x43, 0x8e, 0x52, 0x70, 0x5e, 0x70, 0xaf, 0xbe, 0xdb, 0x0b,
        0x86, 0x12, 0xea, 0x51, 0xeb, 0x0f, 0xd4, 0x5a, 0x55, 0xef, 0x21, 0x4b, 0xf5, 0x6e, 0x08, 0x04,
        0x7e, 0xb1, 0x02, 0x21, 0x00, 0xf4, 0xf5, 0xe9, 0x8c, 0x5f, 0x15, 0xbd, 0xb0, 0xd3, 0xea, 0x88,
        0xe4, 0x5a, 0xd9, 0xde, 0x00, 0xec, 0xaf, 0xa0, 0x74, 0xe2, 0xb4, 0x94, 0x47, 0x12, 0x8d, 0xd6,
        0x62, 0x83, 0x90, 0xf6, 0xd5, 0x02, 0x21, 0x00, 0xee, 0x53, 0xbe, 0xa2, 0x8a, 0x17, 0x09, 0xcd,
        0x5d, 0xbf, 0xc0, 0x8b, 0x32, 0xc9, 0xbb, 0x65, 0xea, 0x81, 0x04, 0x00, 0x8c, 0x09, 0xfa, 0x9e,
        0xc4, 0x8d, 0x2d, 0x96, 0x27, 0xbe, 0x64, 0x3d, 0x02, 0x21, 0x00, 0xcf, 0x08, 0xa0, 0x51, 0x91,
        0x73, 0xb0, 0x95, 0x29, 0x26, 0x8a, 0x78, 0x66, 0x08, 0xc9, 0x47, 0x82, 0xc3, 0x95, 0x1b, 0xf5,
        0x17, 0xa6, 0x52, 0xc3, 0x6d, 0xb9, 0x8a, 0x1d, 0xa4, 0x81, 0xd9, 0x02, 0x20, 0x12, 0x19, 0x58,
        0x03, 0xdd, 0xfa, 0xcb, 0xea, 0xc5, 0xb0, 0xd7, 0x3d, 0x7a, 0xf8, 0xe8, 0xfb, 0x5f, 0x68, 0xb6,
        0xd6, 0x17, 0xcc, 0x76, 0x34, 0xf2, 0x76, 0x4a, 0x3c, 0xf9, 0xfd, 0xb2, 0x7d, 0x02, 0x21, 0x00,
        0xbe, 0x19, 0x10, 0x81, 0x5d, 0x0f, 0x20, 0x7a, 0x34, 0x70, 0x55, 0xae, 0xc6, 0x5e, 0xb7, 0xb9,
        0xea, 0x26, 0x82, 0x9f, 0x8d, 0x72, 0xdc, 0xd0, 0x3b, 0x75, 0xfd, 0xf3, 0x58, 0x61, 0x9e, 0xcc,
    };
    uint8_t expectedPubData[] = {
        0x30, 0x5c, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05,
        0x00, 0x03, 0x4b, 0x00, 0x30, 0x48, 0x02, 0x41, 0x00, 0xe4, 0x0c, 0xc1, 0x45, 0x43, 0xff, 0x9f,
        0x2c, 0x02, 0x99, 0x11, 0x00, 0xff, 0x45, 0xb0, 0x8e, 0x01, 0xe1, 0x2f, 0x83, 0xf4, 0xe3, 0x28,
        0xbe, 0x15, 0x45, 0xd9, 0x7a, 0x31, 0xfb, 0xa5, 0x6b, 0xc2, 0x1a, 0x0e, 0x1e, 0x60, 0xf6, 0xd6,
        0xab, 0xdc, 0xb6, 0x72, 0x7e, 0xed, 0x52, 0xd2, 0xc3, 0x46, 0x8a, 0x99, 0x8d, 0xac, 0x50, 0x35,
        0x3f, 0x8c, 0x58, 0x5d, 0xdd, 0x9f, 0x0c, 0x04, 0xc1, 0x02, 0x03, 0x01, 0x00, 0x01
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4600
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4600
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4600, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("Ed25519", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x2e, 0x02, 0x01, 0x00, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x70, 0x04, 0x22, 0x04, 0x20,
        0xee, 0xa1, 0x58, 0x18, 0x29, 0x2c, 0xb5, 0xdf, 0xdc, 0xc9, 0xb7, 0x87, 0xec, 0x17, 0x4b, 0xf9,
        0xa7, 0x15, 0x6d, 0xdc, 0xb5, 0x8c, 0x42, 0xb3, 0xad, 0xc2, 0x3a, 0x70, 0x98, 0xe4, 0x4e, 0x9f,
    };
    uint8_t expectedPubData[] = {
        0x30, 0x2a, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x70, 0x03, 0x21, 0x00, 0x93, 0x0f, 0x40, 0x71,
        0x35, 0x31, 0xc0, 0x07, 0x3f, 0x51, 0x74, 0x1c, 0x18, 0x0e, 0x95, 0xa4, 0x8f, 0x68, 0xce, 0xaf,
        0xd3, 0x38, 0x12, 0x10, 0x86, 0xdb, 0x80, 0x3d, 0x1c, 0x5a, 0x5e, 0x08
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4700
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4700
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4700, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("X25519", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x2e, 0x02, 0x01, 0x00, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x6e, 0x04, 0x22, 0x04, 0x20,
        0x00, 0xca, 0xaf, 0x91, 0x8e, 0x59, 0xf4, 0x8f, 0x59, 0x04, 0xed, 0x5f, 0xeb, 0xd6, 0x68, 0x73,
        0xfb, 0x31, 0x83, 0x1c, 0x20, 0xae, 0x21, 0x5d, 0x7e, 0x3d, 0x58, 0xc0, 0xd8, 0xe2, 0x51, 0x5b,
    };
    uint8_t expectedPubData[] = {
        0x30, 0x2a, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x6e, 0x03, 0x21, 0x00, 0x04, 0xf5, 0x3d, 0x74,
        0x68, 0xf5, 0x92, 0xb7, 0x67, 0x7f, 0xa2, 0x16, 0x28, 0xb1, 0x4b, 0x73, 0xb3, 0xce, 0x95, 0xd2,
        0xa9, 0xd7, 0xcb, 0xfa, 0x6f, 0xdb, 0xdf, 0x23, 0xa6, 0x83, 0x61, 0x15
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4800
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4800
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4800, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("DH_modp1536", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x82, 0x01, 0xa1, 0x02, 0x01, 0x00, 0x30, 0x81, 0xd5, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
        0xf7, 0x0d, 0x01, 0x03, 0x01, 0x30, 0x81, 0xc7, 0x02, 0x81, 0xc1, 0x00, 0xdf, 0x8d, 0x01, 0xd1,
        0x36, 0xee, 0x84, 0xb3, 0x69, 0x86, 0x1c, 0x0d, 0x06, 0xf6, 0x0c, 0x49, 0x65, 0x6b, 0x8c, 0xad,
        0x9f, 0x1d, 0xdc, 0x28, 0x7a, 0x90, 0xb6, 0x31, 0xe5, 0xc4, 0x98, 0x7a, 0x94, 0xab, 0x42, 0xb6,
        0x00, 0xc6, 0x97, 0xf0, 0xf6, 0x90, 0x15, 0x8c, 0x83, 0x21, 0x8e, 0x38, 0x42, 0x7a, 0xf7, 0xe9,
        0xc8, 0x2a, 0x24, 0x49, 0xc1, 0xde, 0xc4, 0x4a, 0xa1, 0x80, 0x1b, 0x5e, 0x45, 0x15, 0x64, 0x75,
        0xa3, 0xe4, 0x5f, 0x16, 0x41, 0x38, 0x16, 0xde, 0xe8, 0x29, 0x30, 0xf0, 0xcf, 0x9b, 0x1f, 0xa0,
        0x44, 0x62, 0x4e, 0xa2, 0x41, 0xa6, 0x75, 0x83, 0x26, 0xee, 0x90, 0x91, 0x33, 0x62, 0x9f, 0x3b,
        0x8d, 0xd7, 0xe6, 0x46, 0x9d, 0x84, 0xc9, 0x9b, 0x8c, 0xdc, 0xbd, 0xe7, 0x5d, 0xfb, 0x3c, 0x72,
        0xa4, 0xaf, 0x96, 0x61, 0xde, 0x78, 0xf9, 0x31, 0x50, 0xe3, 0xd7, 0xf5, 0x4c, 0x30, 0x57, 0x79,
        0x53, 0x74, 0xbc, 0x79, 0x68, 0xe2, 0x6a, 0xd0, 0xb3, 0xa7, 0x76, 0xcb, 0x07, 0x22, 0x96, 0xfb,
        0x8f, 0x87, 0x3f, 0x4a, 0xf8, 0x85, 0x0c, 0x0c, 0xe4, 0x91, 0x95, 0x40, 0x6d, 0x60, 0x46, 0x3e,
        0x1c, 0x79, 0xa7, 0x51, 0x88, 0x55, 0xdf, 0x10, 0x33, 0x70, 0xea, 0xac, 0xc3, 0xe6, 0x8f, 0xdc,
        0x2e, 0x9f, 0x7b, 0x2f, 0x17, 0xad, 0x20, 0xa8, 0x1d, 0x34, 0xa4, 0x83, 0x02, 0x01, 0x02, 0x04,
        0x81, 0xc3, 0x02, 0x81, 0xc0, 0x65, 0x04, 0xff, 0xc3, 0x5a, 0xdb, 0x19, 0xca, 0x7f, 0xbb, 0x94,
        0xe2, 0x9e, 0x11, 0xf1, 0x1d, 0x12, 0xaf, 0x0e, 0xc2, 0x3d, 0xb0, 0x68, 0xff, 0x4c, 0x6a, 0x55,
        0x52, 0xb5, 0x6a, 0x51, 0xbb, 0x77, 0xe9, 0x1b, 0x1b, 0x3e, 0x43, 0x67, 0x2c, 0xf5, 0x47, 0x61,
        0x82, 0xab, 0xd7, 0xbe, 0x0b, 0xbd, 0xe6, 0x40, 0x44, 0x85, 0xb5, 0xd6, 0xb3, 0xff, 0xad, 0xcb,
        0x41, 0x10, 0xd0, 0x21, 0x71, 0x30, 0x1c, 0xfc, 0xdf, 0x47, 0x39, 0x0f, 0x12, 0x3e, 0xd8, 0xbd,
        0xbe, 0x78, 0x4e, 0x9b, 0x4f, 0x69, 0x9d, 0x54, 0x83, 0x01, 0x14, 0x34, 0x80, 0x84, 0x5b, 0xe5,
        0xd5, 0x65, 0x09, 0xb7, 0x2c, 0x4f, 0xb5, 0xbc, 0x78, 0xd3, 0x6f, 0xc3, 0x5b, 0x57, 0xbc, 0x99,
        0x14, 0x91, 0x1e, 0x03, 0xb8, 0x2d, 0xf0, 0x2d, 0x91, 0x04, 0x33, 0xd6, 0x92, 0x6c, 0xaa, 0x12,
        0xbe, 0x34, 0xec, 0x8b, 0x1c, 0x0f, 0x6e, 0x5d, 0x35, 0x3f, 0xd8, 0x4b, 0x4b, 0x80, 0x17, 0x61,
        0x2b, 0xe5, 0x51, 0xfb, 0x23, 0x55, 0xed, 0xd4, 0x81, 0x0d, 0x1e, 0xaa, 0x21, 0xbd, 0xb1, 0xa9,
        0x5b, 0xe3, 0x54, 0xf0, 0x37, 0x8f, 0x92, 0x9c, 0xa8, 0x68, 0x35, 0x75, 0x3c, 0xc0, 0x73, 0x37,
        0x7f, 0x31, 0x6e, 0x3e, 0xbb, 0x71, 0x02, 0x33, 0x29, 0xb4, 0x68, 0x71, 0xcf, 0x74, 0x06, 0x9c,
        0xb8, 0x87, 0x71, 0x89, 0x4e
    };
    uint8_t expectedPubData[] = {
        0x30, 0x82, 0x01, 0xa0, 0x30, 0x81, 0xd5, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01,
        0x03, 0x01, 0x30, 0x81, 0xc7, 0x02, 0x81, 0xc1, 0x00, 0xdf, 0x8d, 0x01, 0xd1, 0x36, 0xee, 0x84,
        0xb3, 0x69, 0x86, 0x1c, 0x0d, 0x06, 0xf6, 0x0c, 0x49, 0x65, 0x6b, 0x8c, 0xad, 0x9f, 0x1d, 0xdc,
        0x28, 0x7a, 0x90, 0xb6, 0x31, 0xe5, 0xc4, 0x98, 0x7a, 0x94, 0xab, 0x42, 0xb6, 0x00, 0xc6, 0x97,
        0xf0, 0xf6, 0x90, 0x15, 0x8c, 0x83, 0x21, 0x8e, 0x38, 0x42, 0x7a, 0xf7, 0xe9, 0xc8, 0x2a, 0x24,
        0x49, 0xc1, 0xde, 0xc4, 0x4a, 0xa1, 0x80, 0x1b, 0x5e, 0x45, 0x15, 0x64, 0x75, 0xa3, 0xe4, 0x5f,
        0x16, 0x41, 0x38, 0x16, 0xde, 0xe8, 0x29, 0x30, 0xf0, 0xcf, 0x9b, 0x1f, 0xa0, 0x44, 0x62, 0x4e,
        0xa2, 0x41, 0xa6, 0x75, 0x83, 0x26, 0xee, 0x90, 0x91, 0x33, 0x62, 0x9f, 0x3b, 0x8d, 0xd7, 0xe6,
        0x46, 0x9d, 0x84, 0xc9, 0x9b, 0x8c, 0xdc, 0xbd, 0xe7, 0x5d, 0xfb, 0x3c, 0x72, 0xa4, 0xaf, 0x96,
        0x61, 0xde, 0x78, 0xf9, 0x31, 0x50, 0xe3, 0xd7, 0xf5, 0x4c, 0x30, 0x57, 0x79, 0x53, 0x74, 0xbc,
        0x79, 0x68, 0xe2, 0x6a, 0xd0, 0xb3, 0xa7, 0x76, 0xcb, 0x07, 0x22, 0x96, 0xfb, 0x8f, 0x87, 0x3f,
        0x4a, 0xf8, 0x85, 0x0c, 0x0c, 0xe4, 0x91, 0x95, 0x40, 0x6d, 0x60, 0x46, 0x3e, 0x1c, 0x79, 0xa7,
        0x51, 0x88, 0x55, 0xdf, 0x10, 0x33, 0x70, 0xea, 0xac, 0xc3, 0xe6, 0x8f, 0xdc, 0x2e, 0x9f, 0x7b,
        0x2f, 0x17, 0xad, 0x20, 0xa8, 0x1d, 0x34, 0xa4, 0x83, 0x02, 0x01, 0x02, 0x03, 0x81, 0xc5, 0x00,
        0x02, 0x81, 0xc1, 0x00, 0xda, 0xb9, 0x3c, 0x9b, 0x84, 0x01, 0xd7, 0x69, 0x06, 0xd4, 0x43, 0x34,
        0x7b, 0xc3, 0xdc, 0xfd, 0x1e, 0x64, 0x28, 0xd1, 0xc6, 0x94, 0xec, 0x0c, 0xba, 0x7d, 0x4b, 0x3d,
        0x21, 0x95, 0x9e, 0xeb, 0xd5, 0x79, 0xfa, 0x1a, 0x15, 0x82, 0x81, 0xe9, 0xde, 0x19, 0x33, 0x8a,
        0x4c, 0x08, 0x6c, 0x2f, 0x9a, 0xa7, 0x76, 0x63, 0x73, 0x67, 0xae, 0x8e, 0x08, 0xcd, 0x6a, 0xd7,
        0xbc, 0xef, 0xe2, 0xab, 0xcb, 0xf0, 0xac, 0x6b, 0xf4, 0xe0, 0x01, 0x16, 0xa5, 0x47, 0x63, 0x07,
        0x81, 0x8e, 0x1e, 0x9e, 0x3f, 0x3d, 0xf5, 0xce, 0x0f, 0x9f, 0xdf, 0x57, 0xea, 0x32, 0x0a, 0xac,
        0xba, 0xd5, 0xe9, 0xf5, 0xe9, 0xdb, 0x01, 0xff, 0xff, 0x55, 0x7a, 0x70, 0x3b, 0x62, 0xf3, 0x87,
        0xed, 0x3f, 0x06, 0x89, 0x7e, 0x5d, 0x68, 0x07, 0x2c, 0x62, 0x1f, 0x32, 0xc4, 0x8f, 0xdb, 0xd2,
        0xc5, 0x98, 0xd1, 0x6a, 0x4f, 0xe7, 0xb0, 0x43, 0xc4, 0x6d, 0x53, 0x7c, 0x94, 0xbd, 0x50, 0x30,
        0x57, 0xaf, 0xe8, 0xb6, 0xc8, 0x12, 0x6f, 0x70, 0x22, 0x43, 0x00, 0x92, 0x53, 0xe9, 0x9e, 0x14,
        0xda, 0x4c, 0xad, 0x68, 0xaa, 0x62, 0x79, 0x59, 0x6a, 0x75, 0x5c, 0xb7, 0x5e, 0x23, 0x1d, 0x94,
        0x23, 0x42, 0x83, 0x25, 0x88, 0xe6, 0x06, 0x7e, 0xfa, 0xdc, 0xfb, 0xaa, 0x2b, 0xe1, 0x65, 0x45,
        0x73, 0x67, 0x30, 0x5e
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4900
 * @tc.number SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4900
 * @tc.desc   algorithm is Asym Key
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkAsymKeyNapiTest, SUB_Security_CryptoFramework_NAPI_AsymKey_Test_4900, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoAsymKeyGenerator_Create("SM2_256", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t privData[] = {
        0x30, 0x77, 0x02, 0x01, 0x01, 0x04, 0x20, 0x94, 0x55, 0x32, 0xdf, 0x5e, 0xdf, 0x65, 0xa4, 0x51,
        0xeb, 0xc0, 0xb5, 0x56, 0xa7, 0x54, 0x74, 0x1c, 0xce, 0x21, 0xdf, 0x3d, 0x85, 0x64, 0x29, 0xbf,
        0xc7, 0x39, 0xcb, 0x7c, 0x66, 0xbb, 0x8c, 0xa0, 0x0a, 0x06, 0x08, 0x2a, 0x81, 0x1c, 0xcf, 0x55,
        0x01, 0x82, 0x2d, 0xa1, 0x44, 0x03, 0x42, 0x00, 0x04, 0xe5, 0x95, 0x7d, 0x61, 0x99, 0x3a, 0xcf,
        0x1c, 0x43, 0x0e, 0xdb, 0x70, 0xba, 0xcb, 0x82, 0xb7, 0x71, 0xbe, 0xc1, 0xcc, 0x5f, 0x14, 0xbd,
        0x8a, 0x32, 0x04, 0x53, 0x7b, 0xb4, 0x9b, 0x00, 0xc1, 0xbb, 0xee, 0xb5, 0x36, 0xca, 0xdf, 0x0a,
        0x61, 0xda, 0xad, 0x63, 0xd3, 0x83, 0x9a, 0x8c, 0x68, 0xe0, 0x6a, 0x87, 0x01, 0xdd, 0x77, 0x23,
        0x34, 0xab, 0xc4, 0x1d, 0xf7, 0xf8, 0xbe, 0xa3, 0x3c
    };
    uint8_t expectedPubData[] = {
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x81, 0x1c, 0xcf, 0x55, 0x01, 0x82, 0x2d, 0x03, 0x42, 0x00, 0x04, 0xe5, 0x95, 0x7d, 0x61, 0x99,
        0x3a, 0xcf, 0x1c, 0x43, 0x0e, 0xdb, 0x70, 0xba, 0xcb, 0x82, 0xb7, 0x71, 0xbe, 0xc1, 0xcc, 0x5f,
        0x14, 0xbd, 0x8a, 0x32, 0x04, 0x53, 0x7b, 0xb4, 0x9b, 0x00, 0xc1, 0xbb, 0xee, 0xb5, 0x36, 0xca,
        0xdf, 0x0a, 0x61, 0xda, 0xad, 0x63, 0xd3, 0x83, 0x9a, 0x8c, 0x68, 0xe0, 0x6a, 0x87, 0x01, 0xdd,
        0x77, 0x23, 0x34, 0xab, 0xc4, 0x1d, 0xf7, 0xf8, 0xbe, 0xa3, 0x3c
    };
    Crypto_DataBlob dataBlob = { .data = privData, .len = sizeof(privData) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &dataBlob, &keyPair);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ASSERT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    ASSERT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
}

} // namespace Unittest::CryptoFrameworkAsymKeyNapiTest

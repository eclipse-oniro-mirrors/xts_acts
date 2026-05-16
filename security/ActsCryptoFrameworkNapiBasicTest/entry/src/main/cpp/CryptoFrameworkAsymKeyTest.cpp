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


#include "include/CryptoFrameworkAsymKeyTest.h"
#include "include/CommonToolTest.h"
#include <native_drawing/drawing_text_blob.h>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkAsymKeyNapiTest {
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

class ASYMKEY_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_PRIV_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_ECC_KEYPAIR_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_RSA_KEYPAIR_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_DH_KEYPAIR_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_DSA_KEYPAIR_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_KEYPAIR_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class ASYMKEY_EC_POINT_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

static OH_Crypto_ErrCode Rsa_PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx,
    OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
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

static OH_Crypto_ErrCode Ecc_PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx,
    OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
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

static OH_Crypto_ErrCode PubkeyEncode(OH_CryptoAsymKeyGenerator *ctx,
    OH_CryptoPubKey *pubKey, OH_CryptoKeyPair **dupKeyPair)
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

int SubCryptoFrameworkNapiAsymKeyTest0100()
{
    const int asymKeySpecCount = ASYM_KEY_DATA_COUNT;
    for (int i = 0; i < asymKeySpecCount; i++) {
        AsymKeySpec asymKeyData = g_asymKeyData[i];
        OH_CryptoAsymKeyGenerator *ctx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>
            (asymKeyData.algName), &ctx);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);

        ret = OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);

        const char *algoName = OH_CryptoAsymKeyGenerator_GetAlgoName(ctx);
        EXPECT_NE(algoName, nullptr);

        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);

        OH_CryptoKeyPair *dupKeyPair = nullptr;
        Crypto_DataBlob dataBlob = { .data = nullptr, .len = 0 };
        if (strcmp(asymKeyData.name, "RSA") == 0) {
            ret = Rsa_PubkeyEncode(ctx, pubKey, &dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            ret = Rsa_GetEncode(pubKey1, &dataBlob);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
        } else if (strcmp(asymKeyData.name, "ECC") == 0) {
            ret = Ecc_PubkeyEncode(ctx, pubKey, &dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            ret = Ecc_GetEncode(pubKey1, &dataBlob);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
        } else {
            ret = PubkeyEncode(ctx, pubKey, &dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            OH_CryptoPubKey *pubKey1 = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
            ret = GetEncode(asymKeyData.name, pubKey1, &dataBlob);
            EXPECT_EQ(ret, CRYPTO_SUCCESS);
        }

        EXPECT_NE(dataBlob.data, nullptr);
        EXPECT_NE(dataBlob.len, 0);
        OH_Crypto_FreeDataBlob(&dataBlob);

        OH_CryptoAsymKeyGenerator_Destroy(ctx);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_CryptoKeyPair_Destroy(dupKeyPair);
    }
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0200()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("SM9", &ctx);
    EXPECT_NE(ret, CRYPTO_SUCCESS);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0300()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("SM", &ctx);
    EXPECT_NE(ret, CRYPTO_SUCCESS);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0400()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *dupKeyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("ECC224", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t array[] = {48, 50, 48, 16, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 5, 43, 129, 4, 0,
        33, 3, 30, 0, 2, 62, 18, 146, 41, 146, 160, 136, 78, 124, 38, 148, 1, 204, 24, 45, 172,
        101, 234, 253, 74, 133, 28, 184, 168, 153, 170, 203, 134};
    Crypto_DataBlob dataBlob = { .data = array, .len = sizeof(array) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &dataBlob, nullptr, &dupKeyPair);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
    EXPECT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(dupKeyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0500()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *dupKeyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("ECC521", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    uint8_t array[] = { 48, 90, 48, 20, 6, 7, 42, 134, 72, 206, 61, 2, 1, 6, 9, 43, 36, 3,
        3, 2, 8, 1, 1, 7, 3, 66, 0, 4, 143, 39, 57, 249, 145, 50, 63, 222, 35, 70, 178, 121,
        202, 154, 21, 146, 129, 75, 76, 63, 8, 195, 157, 111, 40, 217, 215, 148, 120, 224,
        205, 82, 83, 92, 185, 21, 211, 184, 5, 19, 114, 33, 86, 85, 228, 123, 242, 206, 200,
        98, 178, 184, 130, 35, 232, 45, 5, 202, 189, 11, 46, 163, 156, 152};
    Crypto_DataBlob dataBlob = { .data = array, .len = sizeof(array) };
    ret = OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &dataBlob, nullptr, &dupKeyPair);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(dupKeyPair);
    EXPECT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(dupKeyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0600()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob dsaPBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaQBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaGBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaPKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dsaSKBlob = { .data = nullptr, .len = 0 };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("DSA1024"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);

    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_P_DATABLOB, &dsaPBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_Q_DATABLOB, &dsaQBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_G_DATABLOB, &dsaGBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_SK_DATABLOB, &dsaSKBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_PK_DATABLOB, &dsaPKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&dsaPBlob);
    OH_Crypto_FreeDataBlob(&dsaQBlob);
    OH_Crypto_FreeDataBlob(&dsaGBlob);
    OH_Crypto_FreeDataBlob(&dsaPKBlob);
    OH_Crypto_FreeDataBlob(&dsaSKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0700()
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

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("ECC224"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FP_P_DATABLOB, &ecc_FP_PBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_A_DATABLOB, &ecc_ABlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_B_DATABLOB, &ecc_BBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_X_DATABLOB, &ecc_G_XBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_G_Y_DATABLOB, &ecc_G_YBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_N_DATABLOB, &ecc_NBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_H_INT, &ecc_HBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_SK_DATABLOB, &ecc_SKBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, &ecc_PK_XBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &ecc_PK_YBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FIELD_TYPE_STR, &ecc_FIELD_TYPEBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_FIELD_SIZE_INT, &ecc_FELD_SIZEBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_CURVE_NAME_STR, &ecc_NAMEBlob), CRYPTO_SUCCESS);
   
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
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0800()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob rsaNBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob rsaDBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob rsaEBlob = { .data = nullptr, .len = 0 };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA512"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, &rsaNBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_D_DATABLOB, &rsaDBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_E_DATABLOB, &rsaEBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&rsaNBlob);
    OH_Crypto_FreeDataBlob(&rsaDBlob);
    OH_Crypto_FreeDataBlob(&rsaEBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest0900()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob dhPBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhGBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhLBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhSKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob dhPKBlob = { .data = nullptr, .len = 0 };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("DH_modp1536"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_P_DATABLOB, &dhPBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_G_DATABLOB, &dhGBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_L_INT, &dhLBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_SK_DATABLOB, &dhSKBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, &dhPKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&dhPBlob);
    OH_Crypto_FreeDataBlob(&dhGBlob);
    OH_Crypto_FreeDataBlob(&dhLBlob);
    OH_Crypto_FreeDataBlob(&dhSKBlob);
    OH_Crypto_FreeDataBlob(&dhPKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest1000()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob ed25519SKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob ed25519PKBlob = { .data = nullptr, .len = 0 };
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("Ed25519"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ED25519_SK_DATABLOB, &ed25519SKBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ED25519_PK_DATABLOB, &ed25519PKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&ed25519SKBlob);
    OH_Crypto_FreeDataBlob(&ed25519PKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest1100()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob x25519SKBlob = { .data = nullptr, .len = 0 };
    Crypto_DataBlob x25519PKBlob = { .data = nullptr, .len = 0 };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("X25519"), &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_X25519_SK_DATABLOB, &x25519SKBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_X25519_PK_DATABLOB, &x25519PKBlob), CRYPTO_SUCCESS);
   
    OH_Crypto_FreeDataBlob(&x25519SKBlob);
    OH_Crypto_FreeDataBlob(&x25519PKBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

static OH_CryptoKeyPair *OHTEST_GenerateKeyPair(const char *algoName, const char *algKeyName)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algKeyName, &ctx), CRYPTO_SUCCESS);
    if (strcmp(algoName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096PubKey, .len = sizeof(g_rsa4096PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096PriKey, .len = sizeof(g_rsa4096PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072PubKey, .len = sizeof(g_rsa3072PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072PriKey, .len = sizeof(g_rsa3072PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
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

int SubCryptoFrameworkNapiAsymKeyTest1200()
{
    const int asymPrivKeySpecCount = ASYM_PRIV_KEY_DATA_COUNT;
    for (int i = 0; i < asymPrivKeySpecCount; i++) {
        AsymPrivKeySpec asymInfo = g_asymPrivKeyData[i];
        Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = static_cast<size_t>(asymInfo.pwLen)};
        Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = static_cast<size_t>(asymInfo.cipherLen)};
        Crypto_DataBlob out = { .data = nullptr, .len = 0 };
        Crypto_DataBlob outPub = { .data = nullptr, .len = 0 };
        Crypto_DataBlob new_out = { .data = nullptr, .len = 0 };
        OH_CryptoPrivKeyEncodingParams *params = nullptr;
        uint8_t *type = nullptr;

        OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair((const char *)asymInfo.algName,
            (const char *)asymInfo.algKeyName);
        EXPECT_TRUE(keyPair != nullptr);
        OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(pubKey != nullptr);
        if (asymInfo.password != nullptr) {
            params = OHTEST_SetParam(&pwBlob, &cipherBlob);
            EXPECT_TRUE(params != nullptr);
        }
        type = asymInfo.type ? asymInfo.type : nullptr;
        EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding,
            (const char *)type, params, &out), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, asymInfo.encoding, asymInfo.pubType, &outPub), CRYPTO_SUCCESS);
        OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair((const char *)asymInfo.algName, asymInfo.encoding,
            &out, &outPub, &pwBlob);
        EXPECT_TRUE(new_keyPair != nullptr);
        OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(new_keyPair);
        EXPECT_TRUE(new_privKey != nullptr);
        EXPECT_EQ(OH_CryptoPrivKey_Encode(new_privKey, asymInfo.encoding, (const char *)type, params,
            &new_out), CRYPTO_SUCCESS);
        EXPECT_TRUE(new_out.len == out.len);
    
        OH_Crypto_FreeDataBlob(&out);
        OH_Crypto_FreeDataBlob(&new_out);
        OH_Crypto_FreeDataBlob(&outPub);
        OH_CryptoPrivKeyEncodingParams_Destroy(params);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_CryptoKeyPair_Destroy(new_keyPair);
    }
    return 0;
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

static OH_CryptoKeyPair* GenerateAndGetKeyPair(const char *algoName)
{
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair);
    return keyPair;
}

static OH_CryptoPrivKey* GetPrivKeyFromKeyPair(OH_CryptoKeyPair *keyPair)
{
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey);
    return privKey;
}

static OH_CryptoPubKey* GetPubKeyFromKeyPair(OH_CryptoKeyPair *keyPair)
{
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey);
    return pubKey;
}

static void GetEccKeyParams(OH_CryptoPrivKey *privKey, OH_CryptoPubKey *pubKey, Crypto_DataBlob *sk,
    Crypto_DataBlob *pkX, Crypto_DataBlob *pkY)
{
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, pkX);
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, pkY);
    OH_CryptoPrivKey_GetParam(privKey, CRYPTO_ECC_SK_DATABLOB, sk);
}

static void CreateAndInitKeySpec(const CommonECCSpec *asymInfo, OH_CryptoPubKey *pubKey,
    OH_CryptoAsymKeySpec *&commonSpec, OH_CryptoAsymKeySpec *&specCtx)
{
    OH_CryptoAsymKeySpec_Create(asymInfo->curve, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx);
    if (asymInfo->isGetCommonSpec) {
        commonSpec = OHTEST_GenEcCommonParamsSpec(pubKey);
    } else {
        OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(asymInfo->curveNid, &commonSpec);
    }
    EXPECT_TRUE(commonSpec && specCtx);
}

static void SetKeySpecParams(OH_CryptoAsymKeySpec *specCtx, OH_CryptoAsymKeySpec *commonSpec,
    Crypto_DataBlob *sk, Crypto_DataBlob *pkX, Crypto_DataBlob *pkY)
{
    OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_SK_DATABLOB, sk);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_X_DATABLOB, pkX);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_Y_DATABLOB, pkY);
}

static OH_CryptoKeyPair* GenerateNewKeyPair(OH_CryptoAsymKeySpec *specCtx,
    OH_CryptoAsymKeyGeneratorWithSpec *&generator)
{
    OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator);
    EXPECT_TRUE(generator);
    
    OH_CryptoKeyPair *newKeyPair = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair);
    EXPECT_TRUE(newKeyPair);
    return newKeyPair;
}

static void VerifyEccPublicParams(Crypto_DataBlob *newPkX, Crypto_DataBlob *pkX, Crypto_DataBlob *newPkY,
    Crypto_DataBlob *pkY)
{
    EXPECT_TRUE(!memcmp(newPkX->data, pkX->data, newPkX->len) && !memcmp(newPkY->data, pkY->data, newPkY->len));
}

static void VerifyEccPrivateParams(Crypto_DataBlob *newSk, Crypto_DataBlob *sk)
{
    EXPECT_TRUE(!memcmp(newSk->data, sk->data, newSk->len));
}

static void FreeEccKeyParams(Crypto_DataBlob *sk, Crypto_DataBlob *pkX, Crypto_DataBlob *pkY)
{
    OH_Crypto_FreeDataBlob(sk);
    OH_Crypto_FreeDataBlob(pkX);
    OH_Crypto_FreeDataBlob(pkY);
}

static void DestroyAllResources(OH_CryptoKeyPair *keyPair, OH_CryptoKeyPair *newKeyPair,
    OH_CryptoAsymKeyGeneratorWithSpec *generator, OH_CryptoAsymKeySpec *specCtx,
    OH_CryptoAsymKeySpec *commonSpec)
{
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

static void TestEccSpecCore(const CommonECCSpec *asymInfo)
{
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPrivKey *newPrivKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    OH_CryptoPubKey *newPubKey = nullptr;
    Crypto_DataBlob sk = {nullptr, 0};
    Crypto_DataBlob pkX = {nullptr, 0};
    Crypto_DataBlob pkY = {nullptr, 0};
    Crypto_DataBlob newSk = {nullptr, 0};
    Crypto_DataBlob newPkX = {nullptr, 0};
    Crypto_DataBlob newPkY = {nullptr, 0};

    keyPair = GenerateAndGetKeyPair(asymInfo->algoName);
    privKey = GetPrivKeyFromKeyPair(keyPair);
    pubKey = GetPubKeyFromKeyPair(keyPair);
    
    GetEccKeyParams(privKey, pubKey, &sk, &pkX, &pkY);
    CreateAndInitKeySpec(asymInfo, pubKey, commonSpec, specCtx);
    SetKeySpecParams(specCtx, commonSpec, &sk, &pkX, &pkY);
    
    newKeyPair = GenerateNewKeyPair(specCtx, generator);
    newPrivKey = GetPrivKeyFromKeyPair(newKeyPair);
    newPubKey = GetPubKeyFromKeyPair(newKeyPair);
    
    GetEccKeyParams(newPrivKey, newPubKey, &newSk, &newPkX, &newPkY);
    VerifyEccPublicParams(&newPkX, &pkX, &newPkY, &pkY);
    VerifyEccPrivateParams(&newSk, &sk);
    
    FreeEccKeyParams(&sk, &pkX, &pkY);
    FreeEccKeyParams(&newSk, &newPkX, &newPkY);
    DestroyAllResources(keyPair, newKeyPair, generator, specCtx, commonSpec);
}

int SubCryptoFrameworkNapiAsymKeyTest1300()
{
    int cnt = sizeof(g_commonEccSpec) / sizeof(*g_commonEccSpec);
    for (int i = 0; i < cnt; i++) {
        TestEccSpecCore(&g_commonEccSpec[i]);
    }
    return 0;
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

static OH_CryptoKeyPair* GenerateDhKeyPair(const char *algoName)
{
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
    EXPECT_TRUE(keyPair != nullptr);
    return keyPair;
}

static void GetDhKeyDataBlob(OH_CryptoKeyPair *keyPair, Crypto_DataBlob *sk,
    Crypto_DataBlob *pk)
{
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, pk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DH_SK_DATABLOB, sk), CRYPTO_SUCCESS);
}

static OH_CryptoAsymKeySpec* CreateDhSpec(const char *curve)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(curve, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx),
        CRYPTO_SUCCESS);
    return specCtx;
}

static OH_CryptoAsymKeySpec* GenDhCommonSpec(const CommonDHSpec *asymInfo, OH_CryptoPubKey *pubKey)
{
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    if (!asymInfo->isGetCommonSpec) {
        commonSpec = OHTEST_GenDhCommonParamsSpec(pubKey);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(asymInfo->pLen, asymInfo->skLen, &commonSpec),
            CRYPTO_SUCCESS);
    }
    EXPECT_TRUE(commonSpec != nullptr);
    return commonSpec;
}

static void ConfigDhSpec(OH_CryptoAsymKeySpec *specCtx, OH_CryptoAsymKeySpec *commonSpec,
    Crypto_DataBlob *sk, Crypto_DataBlob *pk)
{
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_SK_DATABLOB, sk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_PK_DATABLOB, pk), CRYPTO_SUCCESS);
}

static OH_CryptoKeyPair* GenerateDhKeyPairWithSpec(OH_CryptoAsymKeySpec *specCtx)
{
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_SUCCESS);
    EXPECT_TRUE(generator != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(newKeyPair != nullptr);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    return newKeyPair;
}

static void VerifyDhKeyData(OH_CryptoKeyPair *newKeyPair, Crypto_DataBlob *sk, Crypto_DataBlob *pk)
{
    Crypto_DataBlob newSk = { .data = nullptr, .len = 0};
    Crypto_DataBlob newPk = { .data = nullptr, .len = 0};
    OH_CryptoPrivKey *newPrivKey = OH_CryptoKeyPair_GetPrivKey(newKeyPair);
    EXPECT_TRUE(newPrivKey != nullptr);
    OH_CryptoPubKey *newPubKey = OH_CryptoKeyPair_GetPubKey(newKeyPair);
    EXPECT_TRUE(newPubKey != nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(newPubKey, CRYPTO_DH_PK_DATABLOB, &newPk), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_GetParam(newPrivKey, CRYPTO_DH_SK_DATABLOB, &newSk), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(newPk.data, pk->data, newPk.len) == 0);
    EXPECT_TRUE(memcmp(newSk.data, sk->data, newSk.len) == 0);
    OH_Crypto_FreeDataBlob(&newSk);
    OH_Crypto_FreeDataBlob(&newPk);
}

static void ReleaseDhResources(OH_CryptoKeyPair *keyPair,
    OH_CryptoKeyPair *newKeyPair, OH_CryptoAsymKeySpec *specCtx,
    OH_CryptoAsymKeySpec *commonSpec)
{
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
}

static void TestDhSpecCore(const CommonDHSpec *asymInfo)
{
    const char *algoName = asymInfo->algoName;
    const char *curve = asymInfo->curve;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};

    OH_CryptoKeyPair *keyPair = GenerateDhKeyPair(algoName);
    GetDhKeyDataBlob(keyPair, &sk, &pk);
    OH_CryptoAsymKeySpec *specCtx = CreateDhSpec(curve);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    OH_CryptoAsymKeySpec *commonSpec = GenDhCommonSpec(asymInfo, pubKey);

    ConfigDhSpec(specCtx, commonSpec, &sk, &pk);
    OH_CryptoKeyPair *newKeyPair = GenerateDhKeyPairWithSpec(specCtx);
    VerifyDhKeyData(newKeyPair, &sk, &pk);

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    ReleaseDhResources(keyPair, newKeyPair, specCtx, commonSpec);
}

int SubCryptoFrameworkNapiAsymKeyTest1400()
{
    const int commonDhSpecCount = sizeof(g_commonDhSpec) / sizeof(g_commonDhSpec[0]);
    for (int i = 0; i < commonDhSpecCount; i++) {
        TestDhSpecCore(&g_commonDhSpec[i]);
    }
    return 0;
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

static void TestRsaSpecCore(const CommonRSASpec *info)
{
    OH_CryptoAsymKeySpec *spec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *gen = nullptr;
    OH_CryptoKeyPair *key = nullptr;
    OH_CryptoKeyPair *newKey = nullptr;
    OH_CryptoPrivKey *priv = nullptr;
    OH_CryptoPrivKey *newPriv = nullptr;
    OH_CryptoPubKey *pub = nullptr;
    OH_CryptoPubKey *newPub = nullptr;
    Crypto_DataBlob sk = {0};
    Crypto_DataBlob pk = {0};
    Crypto_DataBlob newSk = {0};
    Crypto_DataBlob newPk = {0};
    Crypto_DataBlob n = {0};

    key = OHTEST_GenerateKeyPair(info->algoName, info->algoKeyName);
    EXPECT_TRUE(key);
    priv = OH_CryptoKeyPair_GetPrivKey(key);
    pub = OH_CryptoKeyPair_GetPubKey(key);
    EXPECT_TRUE(priv && pub);
    OH_CryptoPubKey_GetParam(pub, CRYPTO_RSA_E_DATABLOB, &pk);
    OH_CryptoPrivKey_GetParam(priv, CRYPTO_RSA_D_DATABLOB, &sk);
    OH_CryptoAsymKeySpec_Create(info->specName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &spec);
    OH_CryptoPubKey_GetParam(pub, CRYPTO_RSA_N_DATABLOB, &n);
    OH_CryptoAsymKeySpec_SetParam(spec, CRYPTO_RSA_N_DATABLOB, &n);
    OH_CryptoAsymKeySpec_SetParam(spec, CRYPTO_RSA_D_DATABLOB, &sk);
    OH_CryptoAsymKeySpec_SetParam(spec, CRYPTO_RSA_E_DATABLOB, &pk);
    OH_CryptoAsymKeyGeneratorWithSpec_Create(spec, &gen);
    EXPECT_TRUE(gen);
    OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(gen, &newKey);
    EXPECT_TRUE(newKey);
    newPriv = OH_CryptoKeyPair_GetPrivKey(newKey);
    newPub = OH_CryptoKeyPair_GetPubKey(newKey);
    EXPECT_TRUE(newPriv && newPub);
    OH_CryptoPubKey_GetParam(newPub, CRYPTO_RSA_E_DATABLOB, &newPk);
    OH_CryptoPrivKey_GetParam(newPriv, CRYPTO_RSA_D_DATABLOB, &newSk);
    EXPECT_TRUE(!memcmp(newPk.data, pk.data, newPk.len) && !memcmp(newSk.data, sk.data, newSk.len));

    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&newSk);
    OH_Crypto_FreeDataBlob(&newPk);
    OH_Crypto_FreeDataBlob(&n);
    OH_CryptoKeyPair_Destroy(key);
    OH_CryptoKeyPair_Destroy(newKey);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(gen);
    OH_CryptoAsymKeySpec_Destroy(spec);
}

int SubCryptoFrameworkNapiAsymKeyTest1500()
{
    int cnt = sizeof(g_commonRsaSpec) / sizeof(*g_commonRsaSpec);
    for (int i = 0; i < cnt; i++) {
        TestRsaSpecCore(&g_commonRsaSpec[i]);
    }
    return 0;
}

CommonDSASpec g_commonDsaSpec[] = {
    {"DSA", "DSA1024"},
    {"DSA", "DSA2048"},
    {"DSA", "DSA3072"},
};

static OH_CryptoKeyPair* GenerateDsaKeyPair(const CommonDSASpec *asymInfo)
{
    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(asymInfo->algoName,
        asymInfo->algoName);
    EXPECT_TRUE(keyPair);
    return keyPair;
}

static void GetDsaKeyBlob(OH_CryptoKeyPair *keyPair, Crypto_DataBlob *sk,
    Crypto_DataBlob *pk)
{
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(privKey && pubKey);
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_PK_DATABLOB, pk);
    OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DSA_SK_DATABLOB, sk);
}

static OH_CryptoAsymKeySpec* CreateDsaSpec(const CommonDSASpec *asymInfo)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec_Create(asymInfo->specName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx);
    EXPECT_TRUE(specCtx);
    return specCtx;
}

static void GetDsaParamBlob(OH_CryptoPubKey *pubKey, Crypto_DataBlob *p, Crypto_DataBlob *q,
    Crypto_DataBlob *g)
{
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_P_DATABLOB, p);
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_Q_DATABLOB, q);
    OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DSA_G_DATABLOB, g);
}

static void SetDsaSpecBaseParams(OH_CryptoAsymKeySpec *specCtx, Crypto_DataBlob *p,
    Crypto_DataBlob *q, Crypto_DataBlob *g)
{
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_P_DATABLOB, p);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_Q_DATABLOB, q);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_G_DATABLOB, g);
}

static void SetDsaSpecKeyParams(OH_CryptoAsymKeySpec *specCtx, Crypto_DataBlob *sk,
    Crypto_DataBlob *pk)
{
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_SK_DATABLOB, sk);
    OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DSA_PK_DATABLOB, pk);
}

static OH_CryptoKeyPair* GenDsaKeyPairWithSpec(OH_CryptoAsymKeySpec *specCtx)
{
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *newKeyPair = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator);
    EXPECT_TRUE(generator);
    OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &newKeyPair);
    EXPECT_TRUE(newKeyPair);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    return newKeyPair;
}

static void VerifyDsaKey(OH_CryptoKeyPair *newKeyPair, Crypto_DataBlob *sk,
    Crypto_DataBlob *pk)
{
    Crypto_DataBlob newSk = {nullptr, 0};
    Crypto_DataBlob newPk = {nullptr, 0};
    OH_CryptoPrivKey *newPrivKey = OH_CryptoKeyPair_GetPrivKey(newKeyPair);
    OH_CryptoPubKey *newPubKey = OH_CryptoKeyPair_GetPubKey(newKeyPair);
    EXPECT_TRUE(newPrivKey && newPubKey);
    OH_CryptoPubKey_GetParam(newPubKey, CRYPTO_DSA_PK_DATABLOB, &newPk);
    OH_CryptoPrivKey_GetParam(newPrivKey, CRYPTO_DSA_SK_DATABLOB, &newSk);
    EXPECT_TRUE(!memcmp(newPk.data, pk->data, newPk.len) && !memcmp(newSk.data,
        sk->data, newSk.len));
    OH_Crypto_FreeDataBlob(&newSk);
    OH_Crypto_FreeDataBlob(&newPk);
}

static void FreeDsaBlob(Crypto_DataBlob *sk, Crypto_DataBlob *pk, Crypto_DataBlob *p,
    Crypto_DataBlob *q, Crypto_DataBlob *g)
{
    OH_Crypto_FreeDataBlob(sk);
    OH_Crypto_FreeDataBlob(pk);
    OH_Crypto_FreeDataBlob(p);
    OH_Crypto_FreeDataBlob(q);
    OH_Crypto_FreeDataBlob(g);
}

static void ReleaseDsaRes(OH_CryptoKeyPair *keyPair, OH_CryptoKeyPair *newKeyPair,
    OH_CryptoAsymKeySpec *specCtx)
{
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoKeyPair_Destroy(newKeyPair);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
}

static void TestDsaSpecCore(const CommonDSASpec *asymInfo)
{
    Crypto_DataBlob sk = {nullptr, 0};
    Crypto_DataBlob pk = {nullptr, 0};
    Crypto_DataBlob p = {nullptr, 0};
    Crypto_DataBlob q = {nullptr, 0};
    Crypto_DataBlob g = {nullptr, 0};

    OH_CryptoKeyPair *keyPair = GenerateDsaKeyPair(asymInfo);
    GetDsaKeyBlob(keyPair, &sk, &pk);
    OH_CryptoAsymKeySpec *specCtx = CreateDsaSpec(asymInfo);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    GetDsaParamBlob(pubKey, &p, &q, &g);
    
    SetDsaSpecBaseParams(specCtx, &p, &q, &g);
    SetDsaSpecKeyParams(specCtx, &sk, &pk);

    OH_CryptoKeyPair *newKeyPair = GenDsaKeyPairWithSpec(specCtx);
    VerifyDsaKey(newKeyPair, &sk, &pk);

    FreeDsaBlob(&sk, &pk, &p, &q, &g);
    ReleaseDsaRes(keyPair, newKeyPair, specCtx);
}

int SubCryptoFrameworkNapiAsymKeyTest1600()
{
    int cnt = sizeof(g_commonDsaSpec) / sizeof(*g_commonDsaSpec);
    for (int i = 0; i < cnt; i++) {
        TestDsaSpecCore(&g_commonDsaSpec[i]);
    }
    return 0;
}

CommonSpec g_commonSpec[] = {
    {"X25519", CRYPTO_X25519_SK_DATABLOB, CRYPTO_X25519_PK_DATABLOB},
    {"Ed25519", CRYPTO_ED25519_SK_DATABLOB, CRYPTO_ED25519_PK_DATABLOB},
};

int SubCryptoFrameworkNapiAsymKeyTest1700()
{
    const int commonSpecCount = sizeof(g_commonSpec) / sizeof(g_commonSpec[0]);
    for (int i = 0; i < commonSpecCount; i++) {
        CommonSpec asymInfo = g_commonSpec[i];
        const char *algoName = asymInfo.algoName;
        OH_CryptoAsymKeySpec *specCtx = nullptr;
        OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
        OH_CryptoKeyPair *newKeyPair = nullptr;
        Crypto_DataBlob sk = { .data = nullptr, .len = 0};
        Crypto_DataBlob pk = { .data = nullptr, .len = 0};
        Crypto_DataBlob newSk = { .data = nullptr, .len = 0};
        Crypto_DataBlob newPk = { .data = nullptr, .len = 0};
    
        OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(algoName, algoName);
        EXPECT_TRUE(keyPair != nullptr);
        OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(pubKey != nullptr);
        EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, asymInfo.pk, &pk), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoPrivKey_GetParam(privKey, asymInfo.sk, &sk), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeySpec_Create(algoName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx),
            CRYPTO_SUCCESS);
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
        EXPECT_EQ(OH_CryptoPubKey_GetParam(new_pubKey, asymInfo.pk, &newPk), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoPrivKey_GetParam(new_privKey, asymInfo.sk, &newSk), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(newPk.data, pk.data, newPk.len) == 0);
        EXPECT_TRUE(memcmp(newSk.data, sk.data, newSk.len) == 0);

        OH_Crypto_FreeDataBlob(&sk);
        OH_Crypto_FreeDataBlob(&pk);
        OH_Crypto_FreeDataBlob(&newSk);
        OH_Crypto_FreeDataBlob(&newPk);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_CryptoKeyPair_Destroy(newKeyPair);
        OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
        OH_CryptoAsymKeySpec_Destroy(specCtx);
    }
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest1800()
{
    Crypto_DataBlob password = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("")),
        .len = 0};
    Crypto_DataBlob cipher = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>("RSA512"),
        reinterpret_cast<const char*>("RSA512"));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, reinterpret_cast<const char*>("PKCS8"),
        params, &out), CRYPTO_OPERTION_ERROR);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest1900()
{
    Crypto_DataBlob password = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        .len = 10};
    Crypto_DataBlob cipher = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("SM4-128-CBC")),
        .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>("RSA512"),
        reinterpret_cast<const char*>("RSA512"));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, reinterpret_cast<const char*>("PKCS8"),
        params, &out), CRYPTO_NOT_SUPPORTED);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKeyTest2000()
{
    Crypto_DataBlob password = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        .len = 10};
    Crypto_DataBlob cipher = {.data = reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>("RSA512"),
        reinterpret_cast<const char*>("RSA512"));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_TRUE(params != nullptr);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKeyEncodingParams_SetParam(
        params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, reinterpret_cast<const char*>("X509"),
        params, &out), CRYPTO_PARAMETER_CHECK_FAILED);
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}
    
int SubCryptoFrameworkNapiAsymKeyTest2100()
{
    const int asymPrivKeySpecCount = ASYM_PRIV_KEY_DATA_COUNT;
    for (int i = 0; i < asymPrivKeySpecCount; i++) {
        AsymPrivKeySpec asymInfo = g_asymPrivKeyData[i];
        Crypto_DataBlob out = { .data = nullptr, .len = 0 };
        Crypto_DataBlob outPub = { .data = nullptr, .len = 0 };
        Crypto_DataBlob newOut = { .data = nullptr, .len = 0 };
        uint8_t *type = nullptr;

        OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
            reinterpret_cast<const char*>(asymInfo.algKeyName));
        EXPECT_TRUE(keyPair != nullptr);
        OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(pubKey != nullptr);
        type = asymInfo.type ? asymInfo.type : nullptr;
        if (type != nullptr && strstr(reinterpret_cast<const char*>(type), "ECC") != nullptr) {
            EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, reinterpret_cast<const char*>(type),
                nullptr, &out), CRYPTO_SUCCESS);
            EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, asymInfo.pubType, &outPub), CRYPTO_SUCCESS);
        } else {
            EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, nullptr, nullptr, &out),
                CRYPTO_SUCCESS);
            EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &outPub), CRYPTO_SUCCESS);
        }
        OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair(
            reinterpret_cast<const char*>(asymInfo.algName), CRYPTO_DER, &out, &outPub, nullptr);
        EXPECT_TRUE(new_keyPair != nullptr);
        OH_CryptoPrivKey *new_privKey = OH_CryptoKeyPair_GetPrivKey(new_keyPair);
        EXPECT_TRUE(new_privKey != nullptr);
        if (type != nullptr && strstr(reinterpret_cast<const char*>(type), "ECC") != nullptr) {
            EXPECT_EQ(OH_CryptoPrivKey_Encode(new_privKey, CRYPTO_DER,
                reinterpret_cast<const char*>(type), nullptr, &newOut), CRYPTO_SUCCESS);
        } else {
            EXPECT_EQ(OH_CryptoPrivKey_Encode(new_privKey, CRYPTO_DER, nullptr, nullptr,
                &newOut), CRYPTO_SUCCESS);
        }
        if (newOut.len == out.len) {
            EXPECT_TRUE(memcmp(newOut.data, out.data, newOut.len) == 0);
        }
        EXPECT_TRUE(newOut.len == out.len);
    
        OH_Crypto_FreeDataBlob(&out);
        OH_Crypto_FreeDataBlob(&newOut);
        OH_Crypto_FreeDataBlob(&outPub);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_CryptoKeyPair_Destroy(new_keyPair);
    }
    return 0;
}

} // namespace Unittest
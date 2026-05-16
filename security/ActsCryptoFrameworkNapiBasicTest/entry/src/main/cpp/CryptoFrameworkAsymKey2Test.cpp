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

#include <hilog/log.h>
#include "include/CryptoFrameworkAsymKey2Test.h"
#include <CryptoArchitectureKit/crypto_asym_key.h>
#include "include/CommonToolTest.h"
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

namespace Unittest::CryptoFramework {

const int VALUE_0 = 0;
const int VALUE_160 = 160;
const int VALUE_200 = 200;
const int VALUE_1536 = 1536;

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
    
static OH_CryptoKeyPair *OHTEST_GenerateKeyPair(const char *algoName, const char *algKeyName)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algKeyName, &ctx), CRYPTO_SUCCESS);
    if (strcmp(algoName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096PubKey, .len = sizeof(g_rsa4096PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096PriKey, .len = sizeof(g_rsa4096PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072PubKey, .len = sizeof(g_rsa3072PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072PriKey, .len = sizeof(g_rsa3072PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
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

int SubCryptoFrameworkNapiAsymKey2Test0100()
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_TRUE(generator == nullptr);

    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    return 0;
}

struct DhKeySpecGeneratorParams {
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    Crypto_DataBlob sk;
    Crypto_DataBlob pk;
};
    
struct DhKeyPairVerifyParams {
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    Crypto_DataBlob orig_sk;
    Crypto_DataBlob orig_pk;
};

static OH_Crypto_ErrCode CreateDhKeySpecAndGenerator(DhKeySpecGeneratorParams &params)
{
    OH_Crypto_ErrCode ret;

    ret = OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &params.specCtx);
    if (ret != CRYPTO_SUCCESS || params.specCtx == nullptr) return ret;

    ret = OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(VALUE_1536, VALUE_200, &params.commonSpec);
    if (ret != CRYPTO_SUCCESS || params.commonSpec == nullptr) return ret;

    ret = OH_CryptoAsymKeySpec_SetCommonParamsSpec(params.specCtx, params.commonSpec);
    if (ret != CRYPTO_SUCCESS) return ret;

    ret = OH_CryptoAsymKeySpec_SetParam(params.specCtx, CRYPTO_DH_SK_DATABLOB, &params.sk);
    if (ret != CRYPTO_SUCCESS) return ret;

    ret = OH_CryptoAsymKeySpec_SetParam(params.specCtx, CRYPTO_DH_PK_DATABLOB, &params.pk);
    if (ret != CRYPTO_SUCCESS) return ret;

    ret = OH_CryptoAsymKeyGeneratorWithSpec_Create(params.specCtx, &params.generator);
    if (ret != CRYPTO_SUCCESS || params.generator == nullptr) return ret;

    return CRYPTO_SUCCESS;
}

static OH_Crypto_ErrCode GenerateDhKeyPairAndVerify(DhKeyPairVerifyParams &params)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob new_sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob new_pk = { .data = nullptr, .len = 0};

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(params.generator, &keyPair);
    if (ret != CRYPTO_SUCCESS || keyPair == nullptr) return ret;

    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    if (privKey == nullptr || pubKey == nullptr) {
        OH_CryptoKeyPair_Destroy(keyPair);
        return CRYPTO_INVALID_PARAMS;
    }

    ret = OH_CryptoPubKey_GetParam(pubKey, CRYPTO_DH_PK_DATABLOB, &new_pk);
    if (ret != CRYPTO_SUCCESS) {
        goto CLEANUP;
    }

    ret = OH_CryptoPrivKey_GetParam(privKey, CRYPTO_DH_SK_DATABLOB, &new_sk);
    if (ret != CRYPTO_SUCCESS) {
        goto CLEANUP;
    }

    if (new_pk.len != params.orig_pk.len || memcmp(new_pk.data, params.orig_pk.data, new_pk.len) != 0) {
        ret = CRYPTO_INVALID_PARAMS;
        goto CLEANUP;
    }
    if (new_sk.len != params.orig_sk.len || memcmp(new_sk.data, params.orig_sk.data, new_sk.len) != 0) {
        ret = CRYPTO_INVALID_PARAMS;
        goto CLEANUP;
    }

CLEANUP:
    OH_Crypto_FreeDataBlob(&new_sk);
    OH_Crypto_FreeDataBlob(&new_pk);
    OH_CryptoKeyPair_Destroy(keyPair);
    return ret;
}

int SubCryptoFrameworkNapiAsymKey2Test0200()
{
    DhKeySpecGeneratorParams specParams;
    uint8_t skData[] = {
        0xc1, 0xef, 0x9c, 0xd1, 0xb0, 0xd7, 0xf3, 0xcc,
        0x99, 0xf7, 0x6d, 0x93, 0x07, 0x26, 0x9e, 0xcc,
        0xa9, 0x39, 0x09, 0x4f, 0x8a, 0x59, 0xbb, 0x1d,
        0xb8, 0x61, 0xf6, 0xc1, 0x2f, 0x95, 0x6b, 0x60,
        0x61, 0xf9, 0x62, 0xaa, 0x3e, 0x22, 0x94, 0xee,
        0x3d, 0x0a, 0x19, 0x46, 0x39, 0x96, 0xdf, 0x94,
        0x24, 0x10, 0xdf, 0x0a, 0x1c, 0x40, 0x55, 0x10,
        0x05, 0xe8, 0x1a, 0x99, 0x13, 0x1d
    };

    uint8_t pkData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e,
        0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f
    };
    specParams.sk = { .data = skData, .len = sizeof(skData) };
    specParams.pk = { .data = pkData, .len = sizeof(pkData) };

    OH_Crypto_ErrCode ret = CreateDhKeySpecAndGenerator(specParams);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);

    DhKeyPairVerifyParams verifyParams;
    verifyParams.generator = specParams.generator;
    verifyParams.orig_sk = specParams.sk;
    verifyParams.orig_pk = specParams.pk;

    ret = GenerateDhKeyPairAndVerify(verifyParams);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);

    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(specParams.generator);
    OH_CryptoAsymKeySpec_Destroy(specParams.specCtx);
    OH_CryptoAsymKeySpec_Destroy(specParams.commonSpec);

    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0300()
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    uint8_t pkData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    uint8_t skData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    Crypto_DataBlob pk = { .data = pkData, .len = sizeof(pkData)};
    Crypto_DataBlob sk = { .data = skData, .len = sizeof(skData)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ED25519_PK_DATABLOB, &pk), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_X25519_SK_DATABLOB, &sk), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoAsymKeySpec_Destroy(specCtx);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0400()
{
    OH_CryptoAsymKeySpec *specCtx1 = nullptr;
    OH_CryptoAsymKeySpec *specCtx2 = nullptr;
    uint8_t pkXData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    uint8_t skData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a
    };
    Crypto_DataBlob pkX = { .data = pkXData, .len = sizeof(pkXData)};
    Crypto_DataBlob sk = { .data = skData, .len = sizeof(skData)};
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PUBLIC_KEY_SPEC, &specCtx1), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx2), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx1 != nullptr && specCtx2 != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx1, CRYPTO_ECC_SK_DATABLOB, &sk), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoAsymKeySpec_SetParam(specCtx2, CRYPTO_ECC_PK_X_DATABLOB, &pkX), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoAsymKeySpec_Destroy(specCtx1);
    OH_CryptoAsymKeySpec_Destroy(specCtx2);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0500()
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t pkData[] = {
        0x09, 0x0a, 0xf6, 0x16, 0x5e, 0x80, 0x54, 0x1e, 0x61, 0x83, 0xeb, 0xb4, 0x1e, 0xb9, 0x7d, 0x5a,
        0x65, 0xac, 0x7b, 0x57, 0x7d, 0x4d, 0xeb, 0x3f, 0x45
    };
    Crypto_DataBlob pk = { .data = pkData, .len = sizeof(pkData)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_PUBLIC_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(VALUE_1536, VALUE_200, &commonSpec), CRYPTO_SUCCESS);
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
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0600()
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t skData[] = {
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
    Crypto_DataBlob sk = { .data = skData, .len = sizeof(skData)};

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx), CRYPTO_SUCCESS);
    EXPECT_TRUE(specCtx != nullptr);
    EXPECT_EQ(OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(VALUE_1536, VALUE_200, &commonSpec), CRYPTO_SUCCESS);
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
    return 0;
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

int SubCryptoFrameworkNapiAsymKey2Test0700()
{
    const int ecPointSpecCount = sizeof(g_ecPointSpec) / sizeof(g_ecPointSpec[0]);
    for (int i = 0; i < ecPointSpecCount; i++) {
        ECPointSpec asymInfo = g_ecPointSpec[i];
        OH_CryptoAsymKeyGenerator *ctx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoEcPoint *point = nullptr;
        Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
        Crypto_DataBlob pkX = { .data = nullptr, .len = 0};
        Crypto_DataBlob pkY = { .data = nullptr, .len = 0};
        Crypto_DataBlob newPkX = { .data = nullptr, .len = 0};
        Crypto_DataBlob newPkY = { .data = nullptr, .len = 0};

        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(asymInfo.curve, &ctx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
        EXPECT_TRUE(keyPair != nullptr);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(pubKey != nullptr);
        EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_X_DATABLOB, &pkX), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_ECC_PK_Y_DATABLOB, &pkY), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoEcPoint_Create(asymInfo.curveNid, nullptr, &point), CRYPTO_SUCCESS);
        EXPECT_TRUE(point != nullptr);
        EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pkX, &pkY), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoEcPoint_Encode(point, asymInfo.format, &ecKeyData), CRYPTO_SUCCESS);
        OH_CryptoEcPoint_Destroy(point);
        point = nullptr;
        EXPECT_EQ(OH_CryptoEcPoint_Create(asymInfo.curveNid, &ecKeyData, &point), CRYPTO_SUCCESS);
        EXPECT_TRUE(point != nullptr);
        EXPECT_EQ(OH_CryptoEcPoint_GetCoordinate(point, &newPkX, &newPkY), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(newPkY.data, pkY.data, newPkY.len) == 0);
        EXPECT_TRUE(memcmp(newPkX.data, newPkX.data, newPkX.len) == 0);
        EXPECT_EQ(newPkX.len, pkX.len);
        EXPECT_EQ(pkY.len, newPkY.len);

        OH_CryptoAsymKeyGenerator_Destroy(ctx);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_CryptoEcPoint_Destroy(point);
        OH_Crypto_FreeDataBlob(&newPkX);
        OH_Crypto_FreeDataBlob(&newPkY);
        OH_Crypto_FreeDataBlob(&pkX);
        OH_Crypto_FreeDataBlob(&pkY);
        OH_Crypto_FreeDataBlob(&ecKeyData);
    }
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0800()
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
    Crypto_DataBlob pkX = { .data = x, .len = sizeof(x)};
    Crypto_DataBlob pkY = { .data = y, .len = sizeof(y)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pkX, &pkY), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test0900()
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
    Crypto_DataBlob pkX = { .data = x, .len = sizeof(x)};
    Crypto_DataBlob pkY = { .data = y, .len = sizeof(y)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pkX, &pkY), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1000()
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
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1100()
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
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1200()
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
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1300()
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ecGe[] = {
        0x03, 0x42, 0x7f, 0x6a, 0xa1, 0x6e, 0x39, 0x89, 0xb7, 0x78, 0x77, 0x2f, 0xcc, 0xcb, 0x43, 0x65,
        0x8f, 0x77, 0xe8, 0xef, 0x26, 0xad, 0x76, 0x25, 0x0d, 0x12, 0x5e, 0xcf, 0x26, 0xf1, 0xfd, 0x0b,
    };
    uint8_t ecLe[] = {
        0x03, 0x42, 0x7f, 0x6a, 0xa1, 0x6e, 0x39, 0x89, 0xb7, 0x78, 0x77, 0x2f, 0xcc, 0xcb, 0x43, 0x65,
        0x8f, 0x77, 0xe8, 0xef, 0x26, 0xad, 0x76, 0x25, 0x0d, 0x12, 0x5e, 0xcf, 0x26, 0xf1, 0xfd, 0x0b,
        0x6f, 0x6f
    };
    uint8_t infinityPoint[] = {
        0x00
    };
    Crypto_DataBlob ecKeyDataGe = { .data = ecGe, .len = sizeof(ecGe)};
    Crypto_DataBlob ecKeyDataLe = { .data = ecLe, .len = sizeof(ecLe)};
    Crypto_DataBlob ecKeyData = { .data = infinityPoint, .len = sizeof(infinityPoint)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyDataGe, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyDataLe, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point), CRYPTO_OPERTION_ERROR);
    EXPECT_TRUE(point == nullptr);
    
    OH_CryptoEcPoint_Destroy(point);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1400()
{
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob ecKeyData = { .data = nullptr, .len = 0};
    uint8_t xLe[] = {
        0xce, 0x9f, 0xee, 0x1b, 0xca, 0x74, 0x09, 0x8c, 0xef, 0x35, 0x01, 0x57, 0x0c, 0xb5, 0x16, 0x3a,
        0x73, 0x95, 0xb5, 0x94, 0x41, 0xc7, 0xc5, 0x81, 0xd4, 0x56, 0x8f, 0xa7, 0x29, 0xfe, 0x21, 0xc1,
        0xc1
    };
    uint8_t yLe[] = {
        0x94, 0x73, 0x65, 0x53, 0x8b, 0xeb, 0x1f, 0x06, 0x80, 0x17, 0xc1, 0x08, 0xf6, 0x94, 0x7c, 0xf2,
        0x5a, 0x3e, 0x5e, 0x08, 0x2e, 0x6e, 0x42, 0xb2, 0x15, 0x18, 0x8d, 0x1f, 0x69, 0xac, 0xdf, 0x12,
        0x12
    };
    uint8_t xGe[] = {
        0xce, 0x9f, 0xee, 0x1b, 0xca, 0x74, 0x09, 0x8c, 0xef, 0x35, 0x01, 0x57, 0x0c, 0xb5, 0x16, 0x3a,
        0x73, 0x95, 0xb5, 0x94, 0x41, 0xc7, 0xc5, 0x81, 0xd4, 0x56, 0x8f, 0xa7, 0x29, 0xfe, 0x21,
    };
    uint8_t yGe[] = {
        0x94, 0x73, 0x65, 0x53, 0x8b, 0xeb, 0x1f, 0x06, 0x80, 0x17, 0xc1, 0x08, 0xf6, 0x94, 0x7c, 0xf2,
        0x5a, 0x3e, 0x5e, 0x08, 0x2e, 0x6e, 0x42, 0xb2, 0x15, 0x18, 0x8d, 0x1f, 0x69, 0xac, 0xdf,
    };
    Crypto_DataBlob pkXLe = { .data = xLe, .len = sizeof(xLe)};
    Crypto_DataBlob pkYLe = { .data = yLe, .len = sizeof(yLe)};
    Crypto_DataBlob pkXGe = { .data = xGe, .len = sizeof(xGe)};
    Crypto_DataBlob pkYGe = { .data = yGe, .len = sizeof(yGe)};

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pkXLe, &pkYLe), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    OH_CryptoEcPoint_Destroy(point);
    point = nullptr;
    EXPECT_EQ(OH_CryptoEcPoint_Create(curveNid, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_TRUE(point != nullptr);
    EXPECT_EQ(OH_CryptoEcPoint_SetCoordinate(point, &pkXGe, &pkYGe), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEcPoint_Encode(point, "COMPRESSED", &ecKeyData), CRYPTO_OPERTION_ERROR);

    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1500()
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = static_cast<size_t>(asymInfo.pwLen)};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = static_cast<size_t>(asymInfo.cipherLen)};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    uint8_t newPassword[] = "9876543210";

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        reinterpret_cast<const char*>(asymInfo.algKeyName));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        EXPECT_TRUE(params != nullptr);
    }
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding,
        reinterpret_cast<const char*>(asymInfo.type), params, &out), CRYPTO_SUCCESS);
    pwBlob.data = newPassword;
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        asymInfo.encoding, &out, nullptr, &pwBlob);
    EXPECT_TRUE(new_keyPair == nullptr);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1600()
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = static_cast<size_t>(asymInfo.pwLen)};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = static_cast<size_t>(asymInfo.cipherLen)};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        reinterpret_cast<const char*>(asymInfo.algKeyName));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        EXPECT_TRUE(params != nullptr);
    }
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding,
        reinterpret_cast<const char*>(asymInfo.type), params, &out), CRYPTO_SUCCESS);
    OH_CryptoKeyPair *new_keyPair = OHTEST_ConvertKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        asymInfo.encoding, &out, nullptr, nullptr);
    EXPECT_TRUE(new_keyPair == nullptr);
    
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1700()
{
    AsymPrivKeySpec asymInfo = {
        "PKCS1", reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("RSA512|PRIMES_2")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
        10, reinterpret_cast<uint8_t*>(const_cast<char*>("AES-128-CBC")),
        11, reinterpret_cast<uint8_t*>(const_cast<char*>("PKCS8")), CRYPTO_PEM
    };
    Crypto_DataBlob pwBlob = {.data = asymInfo.password, .len = static_cast<size_t>(asymInfo.pwLen)};
    Crypto_DataBlob cipherBlob = {.data = asymInfo.cipher, .len = static_cast<size_t>(asymInfo.cipherLen)};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoKeyPair *keyPair = OHTEST_GenerateKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        reinterpret_cast<const char*>(asymInfo.algKeyName));
    EXPECT_TRUE(keyPair != nullptr);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    if (asymInfo.password != nullptr) {
        params = OHTEST_SetParam(&pwBlob, &cipherBlob);
        EXPECT_TRUE(params != nullptr);
    }
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, asymInfo.encoding, reinterpret_cast<const char*>(asymInfo.type),
        params, &out), CRYPTO_SUCCESS);
    out.data[0]++;
    OH_CryptoKeyPair *new_keyPair1 = OHTEST_ConvertKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        asymInfo.encoding, &out, nullptr, &pwBlob);
    EXPECT_TRUE(new_keyPair1 == nullptr);
    out.data[0]--;
    out.data[VALUE_160]++;
    OH_CryptoKeyPair *new_keyPair2 = OHTEST_ConvertKeyPair(reinterpret_cast<const char*>(asymInfo.algName),
        asymInfo.encoding, &out, nullptr, &pwBlob);
    EXPECT_TRUE(new_keyPair2 == nullptr);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1800()
{
    uint8_t password[] = "123456";
    const char *algoName = "RSA512";
    uint32_t passLen = 6;

    uint8_t privData[PRIV_DER_DATA_LEN];
    SafeMemcpy(privData, sizeof(privData), PRIV_DER_DATA, PRIV_DER_DATA_LEN);

    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    Crypto_DataBlob privBlob = { .data = privData, .len = PRIV_DER_DATA_LEN };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_SetPassword(ctx, password, passLen), CRYPTO_SUCCESS);
 
    SafeMemset(password, sizeof(password), &VALUE_0, sizeof(password));
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_PEM, nullptr, &privBlob, &keyPair),
        CRYPTO_OPERTION_ERROR);
    SafeMemset(privData, sizeof(privData), &VALUE_0, sizeof(privData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test1900()
{
    const char *algoName = "RSA512";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob privBlob = { .data = const_cast<uint8_t*>(PRIV_DER_DATA),
        .len = PRIV_DER_DATA_LEN };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, nullptr, &privBlob,
        &keyPair), CRYPTO_SUCCESS);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2000()
{
    const char *algoName = "RSA512";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    Crypto_DataBlob privBlob = { .data = const_cast<uint8_t*>(PRIV_DER_DATA),
        .len = PRIV_DER_DATA_LEN };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_PEM, nullptr, &privBlob,
        &keyPair), CRYPTO_OPERTION_ERROR);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2100()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2200()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);

    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2300()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2400()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA512", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2500()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("Ed25519", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2600()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("X25519", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
    return 0;
}

static void TestDhConvertCore(OH_CryptoAsymKeyGenerator **ctx, OH_CryptoKeyPair **keyPair,
    const Crypto_DataBlob *privBlob, const uint8_t *expectedPub, size_t expectedLen)
{
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Convert(*ctx, CRYPTO_DER, nullptr,
        const_cast<Crypto_DataBlob*>(privBlob), keyPair);
    
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(*keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPub, expectedLen) == 0);
    EXPECT_EQ(pubData.len, expectedLen);
    OH_Crypto_FreeDataBlob(&pubData);
}

static const uint8_t* GetDhPrivData(size_t* outLen)
{
    static const uint8_t privData[] = {
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
    *outLen = sizeof(privData);
    return privData;
}

static const uint8_t* GetDhExpectedPubData(size_t* outLen)
{
    static const uint8_t expectedPubData[] = {
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
    *outLen = sizeof(expectedPubData);
    return expectedPubData;
}

int SubCryptoFrameworkNapiAsymKey2Test2700()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    size_t privLen = 0;
    size_t pubLen = 0;
    const uint8_t *privData = GetDhPrivData(&privLen);
    const uint8_t *expectedPubData = GetDhExpectedPubData(&pubLen);
    Crypto_DataBlob dataBlob = { .data = (uint8_t*)privData, .len = privLen };

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("DH_modp1536", &ctx);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    TestDhConvertCore(&ctx, &keyPair, &dataBlob, expectedPubData, pubLen);

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiAsymKey2Test2800()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("SM2_256", &ctx);
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
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_NE(pubKey, nullptr);
    Crypto_DataBlob pubData = { .data = nullptr, .len = 0 };
    ret = OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &pubData);
    EXPECT_EQ(ret, CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(pubData.data, expectedPubData, sizeof(expectedPubData)) == 0);
    EXPECT_EQ(pubData.len, sizeof(expectedPubData));

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&pubData);
    return 0;
}

} //Unittest::CryptoFramework

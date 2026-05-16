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
#include <unistd.h>
 
#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_asym_cipher.h>
#include <CryptoArchitectureKit/crypto_asym_key.h>
#include <CryptoArchitectureKit/crypto_digest.h>
#include <CryptoArchitectureKit/crypto_kdf.h>
#include <CryptoArchitectureKit/crypto_key_agreement.h>
#include <CryptoArchitectureKit/crypto_mac.h>
#include <CryptoArchitectureKit/crypto_rand.h>
#include <CryptoArchitectureKit/crypto_signature.h>
#include <CryptoArchitectureKit/crypto_sym_cipher.h>
#include <CryptoArchitectureKit/crypto_sym_key.h>
#include "include/CommonToolTest.h"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkReinforcementTest {
public:
    static void SetUpTestCase() {};
    static void TearDownTestCase() {};
    void SetUp() {};
    void TearDown() {};
};

int SubCryptoFrameworkNapiReinforcementTest0100()
{
    const char *algoName = "";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0200()
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0300()
{
    const char *algoName = OH_CryptoAsymKeyGenerator_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0400()
{
    const char *curveName = "";
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(curveName, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0500()
{
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(nullptr, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0600()
{
    const char *algoName = "";
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(algoName, CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &spec),
        CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0700()
{
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(nullptr, CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &spec),
        CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0800()
{
    const char *curveName = "";
    OH_CryptoEcPoint *point = nullptr;

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveName, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_NE(point, nullptr);
    OH_CryptoEcPoint_Destroy(point);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest0900()
{
    OH_CryptoEcPoint *point = nullptr;

    EXPECT_EQ(OH_CryptoEcPoint_Create(nullptr, nullptr, &point), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(point, nullptr);
    OH_CryptoEcPoint_Destroy(point);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1000()
{
    const char *algoName = "";
    OH_CryptoDigest *ctx = nullptr;

    EXPECT_EQ(OH_CryptoDigest_Create(algoName, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_DigestCrypto_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1100()
{
    OH_CryptoDigest *ctx = nullptr;

    EXPECT_EQ(OH_CryptoDigest_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_DigestCrypto_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1200()
{
    const char *algoName = OH_CryptoDigest_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1300()
{
    const char *algoName = "";
    OH_CryptoKdfParams *params = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(algoName, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(params, nullptr);
    OH_CryptoKdfParams_Destroy(params);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1400()
{
    OH_CryptoKdfParams *params = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(nullptr, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(params, nullptr);
    OH_CryptoKdfParams_Destroy(params);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1500()
{
    const char *algoName = "";
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKdf_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1600()
{
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdf_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKdf_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1700()
{
    const char *algoName = "";
    OH_CryptoKeyAgreement *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKeyAgreement_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1800()
{
    OH_CryptoKeyAgreement *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKeyAgreement_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKeyAgreement_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest1900()
{
    const char *algoName = "";
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoMac_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2000()
{
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoMac_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2100()
{
    const char *algoName = OH_CryptoRand_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2200()
{
    const char *algoName = "";
    OH_CryptoVerify *verify = nullptr;

    EXPECT_EQ(OH_CryptoVerify_Create(algoName, &verify), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(verify, nullptr);
    OH_CryptoVerify_Destroy(verify);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2300()
{
    OH_CryptoVerify *verify = nullptr;

    EXPECT_EQ(OH_CryptoVerify_Create(nullptr, &verify), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(verify, nullptr);
    OH_CryptoVerify_Destroy(verify);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2400()
{
    const char *algoName = OH_CryptoVerify_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2500()
{
    const char *algoName = "";
    OH_CryptoSign *sign = nullptr;

    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(sign, nullptr);
    OH_CryptoSign_Destroy(sign);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2600()
{
    OH_CryptoSign *sign = nullptr;

    EXPECT_EQ(OH_CryptoSign_Create(nullptr, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(sign, nullptr);
    OH_CryptoSign_Destroy(sign);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2700()
{
    const char *algoName = OH_CryptoSign_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2800()
{
    const char *algoName = "";
    OH_CryptoSymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymCipher_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest2900()
{
    OH_CryptoSymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymCipher_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3000()
{
    const char *algoName = OH_CryptoSymCipher_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3100()
{
    const char *algoName = "";
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3200()
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3300()
{
    const char *algoName = OH_CryptoSymKeyGenerator_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3400()
{
    const char *algoName = OH_CryptoSymKey_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3500()
{
    const char *algoName = "";
    OH_CryptoAsymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymCipher_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymCipher_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3600()
{
    OH_CryptoAsymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymCipher_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymCipher_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3700()
{
    OH_CryptoMac *ctx = nullptr;
    const char *emptyStr = "";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoMac_Create("HMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3800()
{
    OH_CryptoMac *ctx = nullptr;
    const char *emptyStr = "";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoMac_Create("CMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest3900()
{
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create("HMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, nullptr), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4000()
{
    const char *digestName = "SHA256";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(digestName)),
        .len = strlen(digestName)
    };

    EXPECT_EQ(OH_CryptoMac_SetParam(nullptr, CRYPTO_MAC_DIGEST_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4100()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4200()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4300()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4400()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4500()
{
    const char *mdName = "SHA256";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(mdName)),
        .len = strlen(mdName)
    };

    EXPECT_EQ(OH_CryptoVerify_SetParam(nullptr, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_INVALID_PARAMS);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4600()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4700()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4800()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest4900()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, nullptr), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5000()
{
    const char *mdName = "SHA256";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(mdName)),
        .len = strlen(mdName)
    };

    EXPECT_EQ(OH_CryptoSign_SetParam(nullptr, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5100()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyEncodingStandard = "";

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, emptyEncodingStandard, &out), CRYPTO_INVALID_PARAMS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5200()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &out), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5300()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyEncodingStandard = "";

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, emptyEncodingStandard, nullptr, &out),
        CRYPTO_PARAMETER_CHECK_FAILED);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5400()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, nullptr, nullptr, &out), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5500()
{
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyFormat = "";

    EXPECT_EQ(OH_CryptoEcPoint_Create("ECC256", nullptr, &point), CRYPTO_SUCCESS);
    if (point != nullptr) {
        EXPECT_EQ(OH_CryptoEcPoint_Encode(point, emptyFormat, &out), CRYPTO_PARAMETER_CHECK_FAILED);
        OH_CryptoEcPoint_Destroy(point);
    }
    OH_Crypto_FreeDataBlob(&out);
    return 0;
}

int SubCryptoFrameworkNapiReinforcementTest5600()
{
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoEcPoint_Create("ECC256", nullptr, &point), CRYPTO_SUCCESS);
    if (point != nullptr) {
        EXPECT_EQ(OH_CryptoEcPoint_Encode(point, nullptr, &out), CRYPTO_PARAMETER_CHECK_FAILED);
        OH_CryptoEcPoint_Destroy(point);
    }
    OH_Crypto_FreeDataBlob(&out);
    return 0;
}

}
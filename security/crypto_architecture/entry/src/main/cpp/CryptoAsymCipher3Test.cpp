/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "CryptoArchitectureTest.h"
#include "CryptoArchitectureKit/crypto_asym_key.h"
#include "CryptoArchitectureKit/crypto_signature.h"
#include "CryptoArchitectureKit/crypto_rand.h"
#include "CryptoArchitectureKit/crypto_sym_cipher.h"

namespace {
    static const int DEFAULT_CODE = -1;
}

napi_value OHCryptoVerifySetParamNotSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoVerify *verify = nullptr;
    uint8_t MdName[] = "MD5";
    Crypto_DataBlob inBlob = {
        .data = reinterpret_cast<uint8_t *>(MdName),
        .len = sizeof(MdName)
    };

    OH_CryptoAsymKeyGenerator_Create("RSA768", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    OH_CryptoVerify_Create("RSA1024|PKCS1|SHA256", &verify);
    OH_Crypto_ErrCode ret = OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, &inBlob);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoVerify_Destroy(verify);
    return result;
}

napi_value OHCryptoSignInitOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA768", &ctx);
    OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Create("RSA768|NoPadding|SHA256|OnlySign", &sign);
    OH_Crypto_ErrCode ret = OH_CryptoSign_Init(sign, privKey);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoSign_Destroy(sign);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoSignUpdateOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t randomLength = 16;
    OH_CryptoRand_GenerateRandom(randCtx, randomLength, &out);

    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA768", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);

    OH_CryptoSign *sign = nullptr;
    OH_CryptoSign_Create("RSA768|PKCS1|SHA256|OnlySign", &sign);
    OH_CryptoSign_Init(sign, privKey);
    OH_Crypto_ErrCode ret = OH_CryptoSign_Update(sign, &out);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoVerifyRecoverOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t randomLength = 16;
    OH_CryptoRand_GenerateRandom(randCtx, randomLength, &out);

    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA512", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);

    OH_CryptoSign *signCtx = nullptr;
    OH_CryptoSign_Create("RSA512|PKCS1|MD5|OnlySign", &signCtx);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Init(signCtx, privKey);
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoSign_Final(signCtx, &out, &signData);
    signData.data[signData.len-1]--;

    OH_CryptoVerify *verify = nullptr;
    OH_CryptoVerify_Create("RSA512|PKCS1|MD5|Recover", &verify);
    OH_CryptoVerify_Init(verify, pubKey);
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Recover(verify, &signData, &rawSignData);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoSign_Destroy(signCtx);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoSignFinalOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t randomLength = 16;
    OH_CryptoRand_GenerateRandom(randCtx, randomLength, &out);

    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA512", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);

    OH_CryptoSign *signCtx = nullptr;
    OH_CryptoSign_Create("RSA512|PSS|SHA256|MGF1_SHA256", &signCtx);

    int32_t saltText = 32;
    Crypto_DataBlob saltBlob = {
        .data = (uint8_t *)&saltText,
        .len = sizeof(int32_t)
    };
    int32_t trailerText = 1;
    Crypto_DataBlob trailerBlob = {
        .data = (uint8_t *)&trailerText,
        .len = sizeof(int32_t)
    };
    OH_CryptoSign_SetParam(signCtx, CRYPTO_PSS_SALT_LEN_INT, &saltBlob);
    OH_CryptoSign_SetParam(signCtx, CRYPTO_PSS_TRAILER_FIELD_INT, &trailerBlob);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Init(signCtx, privKey);
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoSign_Final(signCtx, &out, &signData);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoSign_Destroy(signCtx);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoSignSetParamNotSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t randomLength = 16;
    OH_CryptoRand_GenerateRandom(randCtx, randomLength, &out);

    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA512", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);

    OH_CryptoSign *signCtx = nullptr;
    OH_CryptoSign_Create("RSA512|PSS|SHA256|MGF1_SHA256", &signCtx);

    uint8_t mdText[] = "MD5";
    Crypto_DataBlob mdBlob = {
        .data = reinterpret_cast<uint8_t *>(mdText),
        .len = sizeof(mdText)
    };
    OH_Crypto_ErrCode ret = OH_CryptoSign_SetParam(signCtx, CRYPTO_PSS_MD_NAME_STR, &mdBlob);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoSign_Destroy(signCtx);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoSignGetParamOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t randomLength = 16;
    OH_CryptoRand_GenerateRandom(randCtx, randomLength, &out);

    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA512", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);

    OH_CryptoSign *signCtx = nullptr;
    OH_CryptoSign_Create("RSA512|PSS|SHA256|MGF1_SHA256", &signCtx);

    uint8_t mdText[] = "MD5";
    Crypto_DataBlob mdBlob = {
        .data = reinterpret_cast<uint8_t *>(mdText),
        .len = sizeof(mdText)
    };
    OH_CryptoSign_SetParam(signCtx, CRYPTO_PSS_MD_NAME_STR, &mdBlob);
    OH_CryptoSign_Init(signCtx, privKey);
    Crypto_DataBlob SaltLenData = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoSign_GetParam(signCtx, CRYPTO_PSS_SALT_LEN_INT, &SaltLenData);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoSign_Destroy(signCtx);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoEccSignatureSpecCreateOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    uint8_t sm2_asn1[] = {
        0x30, 0xff, 0x23, 0x1c, 0x53, 0x99, 0xa4, 0xd7, 0xf5, 0x0f, 0x25, 0xe2, 0xe1, 0x88, 0xcb, 0xe2,
        0x81, 0xfe, 0x1e, 0xc5, 0x1a, 0xc2, 0xac, 0xee, 0xc6, 0xf6, 0x80, 0xbd, 0xf3, 0xb8, 0x20, 0xcf,
        0x12, 0x1c, 0x39, 0xf1, 0xe0, 0x93, 0xe1, 0xef, 0x10, 0x39, 0x07, 0xd0, 0xa8, 0x88, 0x7d, 0x36,
        0xa6, 0x29, 0x6b, 0x45, 0x19, 0xd4, 0x7b, 0x42, 0xa3, 0xf4, 0xa0, 0x39, 0xee, 0xa4
    };
    size_t len = sizeof(sm2_asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2_asn1,
        .len = len
    };
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return result;
}

napi_value OHCryptoSymCipherCreateNotSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Create("AES128|XTS|NoPadding", &encCtx);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }

    return result;
}

napi_value OHCryptoSymCipherUpdateOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    uint8_t kekData[] = {
        0x17, 0x94, 0x52, 0x19, 0x76, 0xff, 0xbe, 0x3f, 0xa9, 0xda, 0x73, 0x6c, 0xae, 0xc3, 0x02, 0x18
    };
    uint8_t keyData[] = {
        0xb7, 0x8a, 0xc9, 0xec, 0xc3, 0xdc, 0xb9, 0xba, 0x31, 0xf3, 0x60, 0x29, 0x54, 0x13, 0x7c, 0x43
    };
    Crypto_DataBlob kekBlob = {.data = kekData, .len = sizeof(kekData)};
    Crypto_DataBlob keyBlob = {.data = keyData, .len = sizeof(keyData)};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};

    OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx);
    OH_CryptoSymKeyGenerator_Convert(genCtx, (Crypto_DataBlob *)&kekBlob, &keyCtx);
    OH_CryptoSymCipher_Create((const char *)"AES128-WRAP", &encCtx);
    OH_CryptoSymCipherParams_Create(&params);
    OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&keyBlob, &outUpdate);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSymCipherFinalOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    int32_t randomLen = 17;
    int32_t ivLen = 8;
    OH_CryptoRand_GenerateRandom(randCtx, randomLen, &msgBlob);
    OH_CryptoRand_GenerateRandom(randCtx, ivLen, &ivBlob);

    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES256", &genCtx);
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymCipherParams_Create(&params);
    OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, &ivBlob);
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher_Create("AES256-WRAP", &encCtx);
    OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Final(encCtx, &msgBlob, &outUpdate);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_CryptoRand_Destroy(randCtx);
    return result;
}

napi_value OHCryptoSymKeyGeneratorCreateNotSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Create("RC4", &ctx);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }

    return result;
}
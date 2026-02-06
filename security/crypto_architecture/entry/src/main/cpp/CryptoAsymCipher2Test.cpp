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
#include "CryptoArchitectureKit/crypto_asym_cipher.h"
#include "CryptoArchitectureKit/crypto_asym_key.h"
#include "CryptoArchitectureKit/crypto_rand.h"
#include "CryptoArchitectureKit/crypto_digest.h"
#include "CryptoArchitectureKit/crypto_kdf.h"
#include "CryptoArchitectureKit/crypto_key_agreement.h"
#include "CryptoArchitectureKit/crypto_mac.h"
#include "CryptoArchitectureKit/crypto_signature.h"
#include "CryptoArchitectureKit/crypto_sym_cipher.h"
#include <cstring>
uint8_t plainText[] = {
    0x43, 0x31, 0x7d, 0xb5, 0x85, 0x2e, 0xd4, 0xef, 0x08, 0x7a, 0x17, 0x96, 0xbc, 0x7c, 0x8f, 0x80,
    0x8c, 0xa7, 0x63, 0x7f, 0x26, 0x89, 0x8f, 0xf0, 0xfa, 0xa7, 0x51, 0xbd, 0x9c, 0x69, 0x17, 0xf3,
    0xd1, 0xb5, 0xc7, 0x12, 0xbf, 0xcf, 0x91, 0x25, 0x82, 0x23, 0x6b, 0xd6, 0x64, 0x52, 0x77, 0x93,
    0x01, 0x9d, 0x70, 0xa3, 0xf4, 0x92, 0x16, 0xec, 0x3f, 0xa7, 0x3c, 0x83, 0x8d, 0x40, 0x41, 0xfc,
};

uint8_t pubKeyText[] = {
    0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x42, 0x45, 0x47, 0x49, 0x4e, 0x20, 0x52, 0x53, 0x41, 0x20, 0x50,
    0x55, 0x42, 0x4c, 0x49, 0x43, 0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x4d,
    0x49, 0x47, 0x4a, 0x41, 0x6f, 0x47, 0x42, 0x41, 0x4d, 0x78, 0x63, 0x44, 0x4d, 0x6f, 0x61, 0x59,
    0x52, 0x58, 0x6f, 0x78, 0x65, 0x69, 0x33, 0x49, 0x6d, 0x33, 0x33, 0x78, 0x4a, 0x76, 0x61, 0x73,
    0x63, 0x43, 0x62, 0x77, 0x31, 0x6f, 0x73, 0x63, 0x32, 0x56, 0x56, 0x69, 0x47, 0x6a, 0x56, 0x47,
    0x47, 0x4a, 0x37, 0x6c, 0x75, 0x4e, 0x41, 0x58, 0x6b, 0x6a, 0x73, 0x56, 0x46, 0x64, 0x35, 0x0a,
    0x58, 0x37, 0x4c, 0x4d, 0x6c, 0x46, 0x34, 0x63, 0x35, 0x5a, 0x75, 0x59, 0x2f, 0x61, 0x69, 0x57,
    0x77, 0x70, 0x54, 0x69, 0x63, 0x62, 0x67, 0x49, 0x33, 0x43, 0x66, 0x50, 0x6f, 0x32, 0x6a, 0x6c,
    0x52, 0x74, 0x67, 0x41, 0x46, 0x6b, 0x44, 0x71, 0x7a, 0x4b, 0x53, 0x46, 0x62, 0x46, 0x47, 0x51,
    0x6b, 0x43, 0x6e, 0x64, 0x63, 0x2b, 0x54, 0x59, 0x6b, 0x5a, 0x42, 0x32, 0x70, 0x45, 0x6f, 0x72,
    0x0a, 0x7a, 0x73, 0x61, 0x56, 0x58, 0x77, 0x5a, 0x47, 0x45, 0x34, 0x41, 0x43, 0x70, 0x59, 0x35,
    0x79, 0x65, 0x66, 0x49, 0x44, 0x6c, 0x45, 0x57, 0x49, 0x51, 0x4f, 0x6a, 0x59, 0x4b, 0x2f, 0x6c,
    0x58, 0x71, 0x7a, 0x48, 0x47, 0x69, 0x4f, 0x69, 0x32, 0x75, 0x4a, 0x45, 0x75, 0x44, 0x43, 0x50,
    0x6a, 0x51, 0x64, 0x6a, 0x54, 0x41, 0x67, 0x4d, 0x42, 0x41, 0x41, 0x45, 0x3d, 0x0a, 0x2d, 0x2d,
    0x2d, 0x2d, 0x2d, 0x45, 0x4e, 0x44, 0x20, 0x52, 0x53, 0x41, 0x20, 0x50, 0x55, 0x42, 0x4c, 0x49,
    0x43, 0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a,
};

uint8_t pubKeyText_1[] = {
    0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x42, 0x45, 0x47, 0x49, 0x4e, 0x20, 0x52, 0x53, 0x41, 0x20, 0x50,
    0x55, 0x42, 0x4c, 0x49, 0x43, 0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x4d,
    0x49, 0x47, 0x4a, 0x41, 0x6f, 0x47, 0x42, 0x41, 0x4b, 0x72, 0x55, 0x74, 0x74, 0x64, 0x76, 0x73,
    0x2b, 0x62, 0x6e, 0x4d, 0x2f, 0x6f, 0x4e, 0x75, 0x39, 0x45, 0x42, 0x78, 0x35, 0x64, 0x49, 0x6d,
    0x61, 0x70, 0x52, 0x67, 0x4d, 0x6a, 0x4b, 0x41, 0x38, 0x51, 0x48, 0x4b, 0x61, 0x75, 0x2f, 0x6c,
    0x58, 0x50, 0x50, 0x68, 0x76, 0x38, 0x30, 0x69, 0x59, 0x4c, 0x46, 0x2b, 0x79, 0x35, 0x35, 0x0a,
    0x6d, 0x42, 0x2f, 0x38, 0x2b, 0x4b, 0x68, 0x34, 0x34, 0x43, 0x2b, 0x5a, 0x76, 0x6f, 0x78, 0x5a,
    0x66, 0x38, 0x78, 0x34, 0x6e, 0x78, 0x6f, 0x71, 0x76, 0x4f, 0x6f, 0x73, 0x32, 0x44, 0x55, 0x69,
    0x51, 0x44, 0x4f, 0x4a, 0x35, 0x63, 0x57, 0x68, 0x5a, 0x62, 0x4d, 0x71, 0x4d, 0x42, 0x71, 0x62,
    0x39, 0x30, 0x4e, 0x39, 0x63, 0x2f, 0x44, 0x51, 0x67, 0x39, 0x34, 0x63, 0x52, 0x7a, 0x35, 0x66,
    0x0a, 0x68, 0x55, 0x66, 0x6d, 0x66, 0x6d, 0x54, 0x41, 0x46, 0x6a, 0x5a, 0x53, 0x33, 0x78, 0x6c,
    0x78, 0x77, 0x6e, 0x50, 0x77, 0x66, 0x66, 0x39, 0x71, 0x44, 0x79, 0x4c, 0x63, 0x5a, 0x55, 0x6b,
    0x6e, 0x64, 0x43, 0x30, 0x50, 0x77, 0x72, 0x6c, 0x38, 0x72, 0x70, 0x4b, 0x7a, 0x50, 0x47, 0x63,
    0x71, 0x4e, 0x67, 0x33, 0x5a, 0x41, 0x67, 0x4d, 0x42, 0x41, 0x41, 0x45, 0x3d, 0x0a, 0x2d, 0x2d,
    0x2d, 0x2d, 0x2d, 0x45, 0x4e, 0x44, 0x20, 0x52, 0x53, 0x41, 0x20, 0x50, 0x55, 0x42, 0x4c, 0x49,
    0x43, 0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a,
};

napi_value OHCryptoRandCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoRand *rand = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoRand_Create(&rand);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoRand_Destroy(rand);
    return result;
}

napi_value OHCryptoRandCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoRand_Create(nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoRandGenerateRandom0100(napi_env env, napi_callback_info info)
{
    OH_CryptoRand *rand = nullptr;
    OH_CryptoRand_Create(&rand);
    Crypto_DataBlob out = {0};
    uint32_t randomLength = 24;
    OH_Crypto_ErrCode ret = OH_CryptoRand_GenerateRandom(rand, randomLength, &out);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoRand_Destroy(rand);
    OH_Crypto_FreeDataBlob(&out);
    return result;
}

napi_value OHCryptoRandGenerateRandom0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoRand_GenerateRandom(nullptr, 0, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoRandSetSeed0100(napi_env env, napi_callback_info info)
{
    OH_CryptoRand *rand = nullptr;
    OH_CryptoRand_Create(&rand);
    uint8_t seedData[12] = {0x25, 0x65, 0x58, 0x89, 0x85, 0x55, 0x66, 0x77, 0x88, 0x99, 0x11, 0x22};
    Crypto_DataBlob seed = {
        .data = seedData,
        .len = sizeof(seedData)
    };
    OH_Crypto_ErrCode ret = OH_CryptoRand_SetSeed(rand, &seed);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoRand_Destroy(rand);
    return result;
}

napi_value OHCryptoRandSetSeed0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoRand_SetSeed(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifyCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoVerify *verify = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Create("ECC256|SHA256", &verify);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    return result;
}

napi_value OHCryptoVerifyCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Create("ECC256|SHA256", nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifyInit0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;
    uint8_t pubKeyText[] = {
        0x30, 0x39, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x22, 0x00, 0x03, 0x4d, 0xe4, 0xbb, 0x11, 0x10,
        0x1a, 0xd2, 0x05, 0x74, 0xf1, 0x0b, 0xb4, 0x75, 0x57, 0xf4, 0x3e, 0x55, 0x14, 0x17, 0x05, 0x4a,
        0xb2, 0xfb, 0x8c, 0x84, 0x64, 0x38, 0x02, 0xa0, 0x2a, 0xa6, 0xf0
    };
    Crypto_DataBlob keyBlob = {
        .data = reinterpret_cast<uint8_t *>(pubKeyText),
        .len = sizeof(pubKeyText)
    };
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    ret = OH_CryptoAsymKeyGenerator_Create("ECC256", &keyCtx);
    ret = OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &keyBlob, nullptr, &keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ret = OH_CryptoVerify_Create("ECC256|SHA256", &verify);
    ret = OH_CryptoVerify_Init(verify, pubKey);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoVerifyInit0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Init(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifyUpdate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(plainText),
        .len = sizeof(plainText)
    };
    Crypto_DataBlob keyBlob = {
        .data = reinterpret_cast<uint8_t *>(pubKeyText),
        .len = sizeof(pubKeyText)
    };
    OH_CryptoAsymKeyGenerator_Create("RSA2048", &keyCtx);
    OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_PEM, &keyBlob, nullptr, &keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    OH_CryptoVerify_Create("RSA1024|PKCS1|SHA256", &verify);
    int blockSize = 20;
    OH_CryptoVerify_Init(verify, pubKey);
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Update(verify, (Crypto_DataBlob *)&msgBlob);
    msgBlob.data += blockSize;
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoVerifyUpdate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Update(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifyRecover0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob keyBlob = {
        .data = reinterpret_cast<uint8_t *>(pubKeyText_1),
        .len = sizeof(pubKeyText_1)
    };
    uint8_t signText[] = {
        0x1f, 0xe3, 0xcf, 0x8d, 0x94, 0xb4, 0xa0, 0x9e, 0xf1, 0x0c, 0x38, 0x59, 0xcb, 0x5b, 0x89, 0xc9,
        0x66, 0x8b, 0xfd, 0x8d, 0x1e, 0x37, 0xfa, 0x5e, 0x1b, 0xb1, 0x51, 0x07, 0xf1, 0xb0, 0x7d, 0x18,
        0x2d, 0x82, 0x2a, 0x04, 0xa4, 0x4e, 0x94, 0x7e, 0x76, 0xb8, 0xa4, 0x78, 0x90, 0x2f, 0x43, 0x1d,
        0x95, 0x80, 0xd7, 0xb3, 0x46, 0x4d, 0x58, 0x4b, 0xcd, 0x1f, 0x1d, 0xb3, 0x1f, 0x6b, 0x15, 0xd8,
        0x33, 0x51, 0x1d, 0x36, 0x12, 0x39, 0x92, 0xb4, 0x4d, 0xe2, 0x89, 0x26, 0x01, 0xe9, 0x1f, 0xc0,
        0x9c, 0x7c, 0xd8, 0xeb, 0x47, 0xff, 0xfb, 0x5d, 0x98, 0x9a, 0x02, 0x6a, 0x16, 0x37, 0xb1, 0xf5,
        0x08, 0x4d, 0xd7, 0xa0, 0xf2, 0x9e, 0xbe, 0x4b, 0x54, 0x77, 0x94, 0x95, 0x4b, 0x97, 0x10, 0x22,
        0x49, 0xa5, 0x2e, 0x05, 0x86, 0xfd, 0x6f, 0x9a, 0x40, 0xe6, 0x43, 0xab, 0xc5, 0xbc, 0xac, 0x21,
    };
    Crypto_DataBlob signBlob = {
        .data = reinterpret_cast<uint8_t *>(signText),
        .len = sizeof(signText)
    };
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA2048", &keyCtx);
    ret = OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_PEM, &keyBlob, nullptr, &keyPair);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    ret = OH_CryptoVerify_Create("RSA1024|PKCS1|SHA256|Recover", &verify);
    ret = OH_CryptoVerify_Init(verify, pubKey);
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};
    ret = OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signBlob, &rawSignData);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoVerifyRecover0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_Recover(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifySetParam0100(napi_env env, napi_callback_info info)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoVerify_Create("RSA512|PSS|SHA1|MGF1_MD5", &verify);
    int32_t saltText1 = 32;
    Crypto_DataBlob saltBlob1 = {
        .data = (uint8_t *)&saltText1,
        .len = sizeof(int32_t)
    };
    OH_Crypto_ErrCode ret = OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_SALT_LEN_INT, &saltBlob1);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    return result;
}

napi_value OHCryptoVerifySetParam0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_SetParam(nullptr, CRYPTO_PSS_SALT_LEN_INT, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoVerifyGetParam0100(napi_env env, napi_callback_info info)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoVerify_Create("RSA512|PSS|SHA1|MGF1_MD5", &verify);
    Crypto_DataBlob outMdBlob = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MD_NAME_STR, &outMdBlob);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoVerify_Destroy(verify);
    OH_Crypto_FreeDataBlob(&outMdBlob);
    return result;
}

napi_value OHCryptoVerifyGetParam0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoVerify_GetParam(nullptr, CRYPTO_PSS_MD_NAME_STR, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator_Create("ECC256", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_Crypto_ErrCode ret = OH_CryptoSign_Create("ECC256|SHA256", &sign);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return result;
}

napi_value OHCryptoSignCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_Create(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignInit0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator_Create("ECC256", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Create("ECC256|SHA256", &sign);
    OH_Crypto_ErrCode ret = OH_CryptoSign_Init(sign, privKey);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSign_Destroy(sign);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSignInit0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_Init(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignUpdate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    uint8_t plainText[] = {
        0xe4, 0x2b, 0xcc, 0x08, 0x11, 0x79, 0x16, 0x1b, 0x35, 0x7f, 0xb3, 0xaf, 0x40, 0x3b, 0x3f, 0x7c
    };
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(plainText),
        .len = sizeof(plainText)
    };
    OH_CryptoAsymKeyGenerator_Create("ECC256", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Create("ECC256|SHA256", &sign);
    OH_CryptoSign_Init(sign, privKey);
    OH_Crypto_ErrCode ret = OH_CryptoSign_Update(sign, &msgBlob);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSign_Destroy(sign);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSignUpdate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_Update(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignFinal0100(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoSign *sign = nullptr;
    uint8_t plainText[] = {
        0x96, 0x46, 0x2e, 0xde, 0x3f, 0x47, 0xbf, 0xd6, 0x87, 0x48, 0x36, 0x1d, 0x75, 0x35, 0xbd, 0xbc,
        0x6b, 0x06, 0xe8, 0xb3, 0x68, 0x91, 0x53, 0xce, 0x76, 0x5d, 0x24, 0xda, 0xdc, 0xc4, 0x9f, 0x94,
    };
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(plainText),
        .len = sizeof(plainText)};
    OH_CryptoAsymKeyGenerator_Create("SM2_256", &keyCtx);
    OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoSign_Create("SM2_256|SM3", &sign);
    OH_CryptoSign_Init(sign, privKey);
    OH_CryptoSign_Update(sign, &msgBlob);
    Crypto_DataBlob signBlob = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoSign_Final(sign, nullptr, &signBlob);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signBlob);
    return result;
}

napi_value OHCryptoSignFinal0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_Final(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignSetParam0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = "RSA512|PSS|SHA256|MGF1_SHA256";
    int32_t saltText1 = 30;
    Crypto_DataBlob saltBlob1 = {
        .data = (uint8_t *)&saltText1,
        .len = sizeof(int32_t)
    };
    OH_CryptoSign_Create(algoName, &sign);
    OH_Crypto_ErrCode ret = OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &saltBlob1);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSign_Destroy(sign);
    return result;
}

napi_value OHCryptoSignSetParam0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_SetParam(nullptr, CRYPTO_PSS_TRAILER_FIELD_INT, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSignGetParam0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = "RSA512|PSS|SHA256|MGF1_SHA256";
    Crypto_DataBlob TarilerData = {.data = nullptr, .len = 0};
    OH_CryptoSign_Create(algoName, &sign);
    OH_Crypto_ErrCode ret = OH_CryptoSign_GetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &TarilerData);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSign_Destroy(sign);
    OH_Crypto_FreeDataBlob(&TarilerData);
    return result;
}

napi_value OHCryptoSignGetParam0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSign_GetParam(nullptr, CRYPTO_PSS_TRAILER_FIELD_INT, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEccSignatureSpecCreate0100(napi_env env, napi_callback_info info)
{
    static unsigned char rCoordinate[] = {
        107, 93,  198, 247, 119, 18,  40,  110, 90,  156, 193,
        158, 205, 113, 170, 128, 146, 109, 75,  17,  181, 109,
        110, 91,  149, 5,   110, 233, 209, 78,  229, 96};
    static unsigned char sCoordinate[] = {
        45,  153, 88,  82,  104, 221, 226, 43,  174, 21,  122,
        248, 5,   232, 105, 41,  92,  95,  102, 224, 216, 149,
        85,  236, 110, 6,   64,  188, 149, 70,  70,  183};
    OH_CryptoEccSignatureSpec *spec = NULL;
    Crypto_DataBlob r = {0};
    Crypto_DataBlob s = {0};
    r.data = rCoordinate;
    r.len = sizeof(rCoordinate);
    s.data = sCoordinate;
    s.len = sizeof(sCoordinate);
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_Create(NULL, &spec);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoEccSignatureSpec_Destroy(spec);
    spec = NULL;
    return result;
}

napi_value OHCryptoEccSignatureSpecCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_Create(NULL, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEccSignatureSpecGetRAndS0100(napi_env env, napi_callback_info info)
{
    uint8_t signText[] = {
        0x30, 0x45, 0x02, 0x21, 0x00, 0xab, 0xf8, 0xe2, 0x96, 0x7d, 0x5b, 0x28, 0xfb, 0x9a, 0xbd, 0x05, 0xa6,
        0x81, 0xd6, 0xb1, 0x55, 0x69, 0x22, 0x25, 0xd2, 0xa3, 0x5d, 0xa8, 0xc0, 0x96, 0xe0, 0x1d, 0x38, 0x74,
        0xa0, 0xc9, 0x4f, 0x02, 0x20, 0x20, 0x27, 0x04, 0x7a, 0x31, 0x94, 0xe7, 0x32, 0x61, 0xc3, 0x55, 0xa6,
        0x5e, 0x1e, 0xdd, 0x3d, 0x04, 0x1c, 0x1e, 0x2d, 0x8d, 0x8d, 0x45, 0xca, 0xd9, 0x40, 0xe8, 0x97, 0xcd,
        0x01, 0x18, 0xc5,
    };
    Crypto_DataBlob signBlob = {
        .data = reinterpret_cast<uint8_t *>(signText),
        .len = sizeof(signText)};
    OH_CryptoEccSignatureSpec *eccSignSpec = nullptr;
    OH_CryptoEccSignatureSpec_Create(&signBlob, &eccSignSpec);
    Crypto_DataBlob r = {.data = nullptr, .len = 0};
    Crypto_DataBlob s = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_GetRAndS(eccSignSpec, &r, &s);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_Crypto_FreeDataBlob(&r);
    OH_Crypto_FreeDataBlob(&s);
    OH_CryptoEccSignatureSpec_Destroy(eccSignSpec);
    return result;
}

napi_value OHCryptoEccSignatureSpecGetRAndS0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_GetRAndS(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEccSignatureSpecSetRAndS0100(napi_env env, napi_callback_info info)
{
    static unsigned char rCoordinate[] = {
        107, 93,  198, 247, 119, 18,  40,  110, 90,  156, 193,
        158, 205, 113, 170, 128, 146, 109, 75,  17,  181, 109,
        110, 91,  149, 5,   110, 233, 209, 78,  229, 96};
    static unsigned char sCoordinate[] = {
        45,  153, 88,  82,  104, 221, 226, 43,  174, 21,  122,
        248, 5,   232, 105, 41,  92,  95,  102, 224, 216, 149,
        85,  236, 110, 6,   64,  188, 149, 70,  70,  183};
    OH_CryptoEccSignatureSpec *spec = NULL;
    Crypto_DataBlob r = {0};
    Crypto_DataBlob s = {0};
    r.data = rCoordinate;
    r.len = sizeof(rCoordinate);
    s.data = sCoordinate;
    s.len = sizeof(sCoordinate);
    OH_CryptoEccSignatureSpec_Create(NULL, &spec);
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_SetRAndS(spec, &r, &s);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoEccSignatureSpec_Destroy(spec);
    spec = NULL;
    return result;
}

napi_value OHCryptoEccSignatureSpecSetRAndS0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_SetRAndS(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEccSignatureSpecEncode0100(napi_env env, napi_callback_info info)
{
    static unsigned char rCoordinate[] = {
        107, 93,  198, 247, 119, 18,  40,  110, 90,  156, 193,
        158, 205, 113, 170, 128, 146, 109, 75,  17,  181, 109,
        110, 91,  149, 5,   110, 233, 209, 78,  229, 96};
    static unsigned char sCoordinate[] = {
        45,  153, 88,  82,  104, 221, 226, 43,  174, 21,  122,
        248, 5,   232, 105, 41,  92,  95,  102, 224, 216, 149,
        85,  236, 110, 6,   64,  188, 149, 70,  70,  183};
    OH_CryptoEccSignatureSpec *spec = NULL;
    Crypto_DataBlob r = {0};
    Crypto_DataBlob s = {0};
    r.data = rCoordinate;
    r.len = sizeof(rCoordinate);
    s.data = sCoordinate;
    s.len = sizeof(sCoordinate);
    OH_CryptoEccSignatureSpec_Create(NULL, &spec);
    OH_CryptoEccSignatureSpec_SetRAndS(spec, &r, &s);
    Crypto_DataBlob sig = {0};
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_Encode(spec, &sig);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_Crypto_FreeDataBlob(&sig);
    OH_CryptoEccSignatureSpec_Destroy(spec);
    spec = NULL;
    return result;
}

napi_value OHCryptoEccSignatureSpecEncode0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoEccSignatureSpec_Encode(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherParamsCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymCipherParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSymCipherParams_Create(&params);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipherParams_Destroy(params);
    return result;
}

napi_value OHCryptoSymCipherParamsCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipherParams_Create(nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherParamsSetParam0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    uint8_t iv[12] = {1, 2, 4, 12, 3, 4, 2, 3, 3, 2, 0, 4};
    Crypto_DataBlob ivData = {.data = iv, .len = sizeof(iv)};
    OH_CryptoSymKeyGenerator_Create("SM4_128", &genCtx);
    OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    OH_CryptoSymCipherParams_Create(&params);
    OH_Crypto_ErrCode ret = OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, &ivData);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSymCipherParamsSetParam0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipherParams_SetParam(nullptr, CRYPTO_IV_DATABLOB, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Create("SM4_128|ECB|PKCS7", &encCtx);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipher_Destroy(encCtx);
    return result;
}

napi_value OHCryptoSymCipherCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Create("SM4_128|ECB|PKCS7", nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherInit0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymKeyGenerator_Create("SM4_128", &genCtx);
    OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    OH_CryptoSymCipherParams_Create(&params);
    OH_CryptoSymCipher_Create("SM4_128|ECB|PKCS7", &encCtx);
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSymCipherInit0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Init(nullptr, CRYPTO_ENCRYPT_MODE, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherUpdate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    uint8_t aad[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    uint8_t tag[16] = {0};
    uint8_t iv[12] = {1, 2, 4, 12, 3, 4, 2, 3, 3, 2, 0, 4}; // iv使用安全随机数生成。
    Crypto_DataBlob ivData = {.data = iv, .len = sizeof(iv)};
    Crypto_DataBlob aadData = {.data = aad, .len = sizeof(aad)};
    Crypto_DataBlob tagData = {.data = tag, .len = sizeof(tag)};
    char *plainText = const_cast<char *>("this is test!");
    Crypto_DataBlob msgBlob = {.data = (uint8_t *)(plainText), .len = strlen(plainText)};
    OH_CryptoSymKeyGenerator_Create("SM4_128", &genCtx);
    OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    OH_CryptoSymCipherParams_Create(&params);
    OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, &ivData);
    OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB, &aadData);
    OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagData);
    OH_CryptoSymCipher_Create("SM4_128|GCM|PKCS7", &encCtx);
    OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Update(encCtx, &msgBlob, &outUpdate);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_Crypto_FreeDataBlob(&outUpdate);
    return result;
}

napi_value OHCryptoSymCipherUpdate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Update(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymCipherFinale0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    char *plainText = const_cast<char *>("this is test!");
    Crypto_DataBlob input = {.data = (uint8_t *)(plainText), .len = strlen(plainText)};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    OH_CryptoSymKeyGenerator_Create("SM4_128", &genCtx);
    OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    OH_CryptoSymCipherParams_Create(&params);
    OH_CryptoSymCipher_Create("SM4_128|ECB|PKCS7", &encCtx);
    OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Final(encCtx, &input, &outUpdate);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_Crypto_FreeDataBlob(&outUpdate);
    OH_Crypto_FreeDataBlob(&decUpdate);
    return result;
}

napi_value OHCryptoSymCipherFinale0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymCipher_Final(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymKeyGeneratorCreate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Create("AES256", &ctx);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return result;
}

napi_value OHCryptoSymKeyGeneratorCreate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Create("AES256", nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymKeyGeneratorGenerate0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES256", &ctx);
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoSymKeyGeneratorGenerate0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Generate(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymKeyGeneratorConvert0100(napi_env env, napi_callback_info info)
{
    const char *algName = "3DES192";
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *convertKeyCtx = nullptr;
    uint8_t arr[] = {
        0xba, 0x3d, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c, 0xba, 0x3b,
        0xc2, 0x71, 0xab, 0xa0, 0x30, 0x72
    };
    Crypto_DataBlob convertBlob = {.data = arr, .len = sizeof(arr)};
    OH_CryptoSymKeyGenerator_Create(algName, &ctx);
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Convert(ctx, &convertBlob, &convertKeyCtx);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(convertKeyCtx);
    return result;
}

napi_value OHCryptoSymKeyGeneratorConvert0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymKeyGenerator_Convert(nullptr, nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSymKeyGetKeyData0100(napi_env env, napi_callback_info info)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    OH_CryptoSymKeyGenerator_Create("AES256", &ctx);
    OH_CryptoSymKeyGenerator_Generate(ctx, &keyCtx);
    OH_Crypto_ErrCode ret = OH_CryptoSymKey_GetKeyData(keyCtx, &out);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_Crypto_FreeDataBlob(&out);
    return result;
}

napi_value OHCryptoSymKeyGetKeyData0200(napi_env env, napi_callback_info info)
{
    OH_Crypto_ErrCode ret = OH_CryptoSymKey_GetKeyData(nullptr, nullptr);
    napi_value result;
    napi_create_int32(env, -1, &result);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

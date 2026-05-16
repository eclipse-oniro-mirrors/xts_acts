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
#include "CryptoArchitectureKit/crypto_rand.h"
#include <cstring>
#include <string>
#include <sstream>

namespace {
    static const int DEFAULT_CODE = -1;
    static const int DOUBLE = 2;
    static const int NUM_128 = 128;
    static const int NUM_256 = 256;
    static const int NUM_32 = 32;
    static const int NUM_2 = 2;
    static const int NUM_3 = 3;
    static const int NUM_4 = 4;
    static const int OHTEST_RSA_512_KEYSIZE = 64;
}

Crypto_DataBlob GenDataBlob(std::string str, uint8_t (*dest)[256])
{
    std::istringstream iss(str);
    size_t i = 0;

    while (iss && i < NUM_256) {
        char byteChars[NUM_3] = {0};
        iss.read(byteChars, NUM_2);
        if (iss.gcount() < NUM_2) {
            break;
        }
        std::istringstream byteStream(byteChars);
        int value;
        if (!(byteStream >> std::hex >> value)) {
            break;
        }

        (*dest)[i] = static_cast<uint8_t>(value);
        i++;
    }

    Crypto_DataBlob ret = {.data = *dest, .len = i};
    return ret;
}

napi_value OHCryptoAsymCipherCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymCipher *ctx = nullptr;
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *rsaAlgo = "RSA1024|PKCS1";
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Create(rsaAlgo, &ctx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherCreateNotSupport(napi_env env, napi_callback_info info)
{
    OH_CryptoAsymCipher *ctx = nullptr;
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *rsaAlgo = "INVALID_NAME";
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Create(rsaAlgo, &ctx);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherInitSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoAsymKeyGenerator *keyGen = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyGen);
    OH_CryptoKeyPair *keyPair = nullptr;
    ret = OH_CryptoAsymKeyGenerator_Generate(keyGen, &keyPair);
    OH_CryptoAsymCipher *cipher = nullptr;
    ret = OH_CryptoAsymCipher_Create("RSA1024|PKCS1", &cipher);
    ret = OH_CryptoAsymCipher_Init(cipher, CRYPTO_ENCRYPT_MODE, keyPair);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherInitParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Init(nullptr, CRYPTO_ENCRYPT_MODE, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherFinalSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoAsymKeyGenerator *keyGen = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyGen);
    OH_CryptoKeyPair *keyPair = nullptr;
    ret = OH_CryptoAsymKeyGenerator_Generate(keyGen, &keyPair);
    OH_CryptoAsymCipher *cipher = nullptr;
    ret = OH_CryptoAsymCipher_Create("RSA1024|PKCS1", &cipher);
    ret = OH_CryptoAsymCipher_Init(cipher, CRYPTO_ENCRYPT_MODE, keyPair);

    const char *testData = "Hello, RSA!";
    Crypto_DataBlob in = {
        .data = (uint8_t *)testData,
        .len = strlen(testData)
    };

    Crypto_DataBlob out = { 0 };
    ret = OH_CryptoAsymCipher_Final(cipher, &in, &out);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoAsymCipher_Destroy(cipher);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyGen);
    return result;
}

napi_value OHCryptoAsymCipherFinalParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Final(nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSm2CiphertextSpec *sm2CipherSpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Create(nullptr, &sm2CipherSpec);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecGetItemSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    static uint8_t cipherTextArray[] = {48, 118, 2, 32, 45, 153, 88, 82, 104, 221, 226, 43, 174, 21, 122, 248, 5, 232,
        105, 41, 92, 95, 102, 224, 216, 149, 85, 236, 110, 6, 64, 188, 149, 70, 70, 183, 2, 32, 107, 93, 198, 247, 119,
        18, 40, 110, 90, 156, 193, 158, 205, 113, 170, 128, 146, 109, 75, 17, 181, 109, 110, 91, 149, 5, 110, 233, 209,
        78, 229, 96, 4, 32, 87, 167, 167, 247, 88, 146, 203, 234, 83, 126, 117, 129, 52, 142, 82, 54, 152, 226, 201,
        111, 143, 115, 169, 125, 128, 42, 157, 31, 114, 198, 109, 244, 4, 14, 100, 227, 78, 195, 249, 179, 43, 70, 242,
        69, 169, 10, 65, 123};
    Crypto_DataBlob cipherText = {cipherTextArray, sizeof(cipherTextArray)};
    OH_CryptoSm2CiphertextSpec *sm2CipherSpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Create(&cipherText, &sm2CipherSpec);

    Crypto_DataBlob c1x = { 0 };
    ret = OH_CryptoSm2CiphertextSpec_GetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C1_X, &c1x);
    OH_Crypto_FreeDataBlob(&c1x);
    OH_CryptoSm2CiphertextSpec_Destroy(sm2CipherSpec);

    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecGetItemParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_GetItem(nullptr, CRYPTO_SM2_CIPHERTEXT_C1_X, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecSetItemSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    static uint8_t c1x[] = {45, 153, 88, 82, 104, 221, 226, 43, 174, 21, 122, 248, 5, 232, 105, 41, 92, 95, 102, 224,
        216, 149, 85, 236, 110, 6, 64, 188, 149, 70, 70, 183};

    OH_CryptoSm2CiphertextSpec *sm2CipherSpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Create(nullptr, &sm2CipherSpec);
    Crypto_DataBlob c1xBlob = {c1x, sizeof(c1x)};

    ret = OH_CryptoSm2CiphertextSpec_SetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C1_X, &c1xBlob);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecSetItemParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_SetItem(nullptr, CRYPTO_SM2_CIPHERTEXT_C1_X, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecEncodeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    static uint8_t c1x[] = {45, 153, 88, 82, 104, 221, 226, 43, 174, 21, 122, 248, 5, 232, 105, 41, 92, 95, 102, 224,
        216, 149, 85, 236, 110, 6, 64, 188, 149, 70, 70, 183};
    static uint8_t c1y[] = {107, 93, 198, 247, 119, 18, 40, 110, 90, 156, 193, 158, 205, 113, 170, 128, 146, 109, 75,
        17, 181, 109, 110, 91, 149, 5, 110, 233, 209, 78, 229, 96};
    static uint8_t c2[] = {100, 227, 78, 195, 249, 179, 43, 70, 242, 69, 169, 10, 65, 123};
    static uint8_t c3[] = {87, 167, 167, 247, 88, 146, 203, 234, 83, 126, 117, 129, 52, 142, 82, 54, 152, 226, 201,
        111, 143, 115, 169, 125, 128, 42, 157, 31, 114, 198, 109, 244};

    OH_CryptoSm2CiphertextSpec *sm2CipherSpec = nullptr;
    OH_CryptoSm2CiphertextSpec_Create(nullptr, &sm2CipherSpec);
    Crypto_DataBlob c1xBlob = {c1x, sizeof(c1x)};
    Crypto_DataBlob c1yBlob = {c1y, sizeof(c1y)};
    Crypto_DataBlob c2Blob = {c2, sizeof(c2)};
    Crypto_DataBlob c3Blob = {c3, sizeof(c3)};
    OH_CryptoSm2CiphertextSpec_SetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C1_X, &c1xBlob);
    OH_CryptoSm2CiphertextSpec_SetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C1_Y, &c1yBlob);
    OH_CryptoSm2CiphertextSpec_SetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C2, &c2Blob);
    OH_CryptoSm2CiphertextSpec_SetItem(sm2CipherSpec, CRYPTO_SM2_CIPHERTEXT_C3, &c3Blob);
    Crypto_DataBlob encoded = { 0 };
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Encode(sm2CipherSpec, &encoded);

    OH_Crypto_FreeDataBlob(&encoded);
    OH_CryptoSm2CiphertextSpec_Destroy(sm2CipherSpec);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecEncodeParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Encode(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorCreateInvalidParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create(nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorGenerateInvalidParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Generate(nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorConvertInvalidParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Convert(nullptr, CRYPTO_DER, nullptr, nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPubKeyEncodeInvalidParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoPubKey_Encode(nullptr, CRYPTO_PEM, nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPubKeyGetParamInvalidParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoPubKey_GetParam(nullptr, CRYPTO_RSA_E_DATABLOB, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorSetPasswordSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    std::string priKeyPkcs1EncodingStr = "-----BEGIN RSA PRIVATE KEY-----\n"
                                         "Proc-Type: 4,ENCRYPTED\n"
                                         "DEK-Info: AES-128-CBC,815A066131BF05CF87CE610A59CC69AE\n\n"
                                         "7Jd0vmOmYGFZ2yRY8fqRl3+6rQlFtNcMILvcb5KWHDSrxA0ULmJE7CW0DSRikHoA\n"
                                         "t0KgafhYXeQXh0dRy9lvVRAFSLHCLJVjchx90V7ZSivBFEq7+iTozVp4AlbgYsJP\n"
                                         "vx/1sfZD2WAcyMJ7IDmJyft7xnpVSXsyWGTT4f3eaHJIh1dqjwrso7ucAW0FK6rp\n"
                                         "/TONyOoXNfXtRbVtxNyCWBxt4HCSclDZFvS9y8fz9ZwmCUV7jei/YdzyQI2wnE13\n"
                                         "W8cKlpzRFL6BWi8XPrUtAw5MWeHBAPUgPWMfcmiaeyi5BJFhQCrHLi+Gj4EEJvp7\n"
                                         "mP5cbnQAx6+paV5z9m71SKrI/WSc4ixsYYdVmlL/qwAK9YliFfoPl030YJWW6rFf\n"
                                         "T7J9BUlHGUJ0RB2lURNNLakM+UZRkeE9TByzCzgTxuQtyv5Lwsh2mAk3ia5x0kUO\n"
                                         "LHg3Eoabhdh+YZA5hHaxnpF7VjspB78E0F9Btq+A41rSJ6zDOdToHey4MJ2nxdey\n"
                                         "Z3bi81TZ6Fp4IuROrvZ2B/Xl3uNKR7n+AHRKnaAO87ywzyltvjwSh2y3xhJueiRs\n"
                                         "BiYkyL3/fnocD3pexTdN6h3JgQGgO5GV8zw/NrxA85mw8o9im0HreuFObmNj36T9\n"
                                         "k5N+R/QIXW83cIQOLaWK1ThYcluytf0tDRiMoKqULiaA6HvDMigExLxuhCtnoF8I\n"
                                         "iOLN1cPdEVQjzwDHLqXP2DbWW1z9iRepLZlEm1hLRLEmOrTGKezYupVv306SSa6J\n"
                                         "OA55lAeXMbyjFaYCr54HWrpt4NwNBX1efMUURc+1LcHpzFrBTTLbfjIyq6as49pH\n"
                                         "-----END RSA PRIVATE KEY-----\n";

    OH_CryptoAsymKeyGenerator *keyGen = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA2048", &keyGen);

    Crypto_DataBlob priKeyPkcs1EncodingData = {};
    priKeyPkcs1EncodingData.data = reinterpret_cast<uint8_t *>(const_cast<char *>(priKeyPkcs1EncodingStr.c_str()));
    priKeyPkcs1EncodingData.len = strlen(priKeyPkcs1EncodingStr.c_str());
    std::string password = "123456";
    ret = OH_CryptoAsymKeyGenerator_SetPassword(keyGen, reinterpret_cast<const unsigned char *>(password.c_str()),
        password.size());
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorSetPasswordParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_SetPassword(nullptr, nullptr, 0);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodingParamsCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoPrivKeyEncodingParams_Create(&params);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodingParamsCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoPrivKeyEncodingParams_Create(nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodingParamsSetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoPrivKeyEncodingParams_Create(&params);

    Crypto_DataBlob password = {(uint8_t *)"1234567890", 10};
    ret = OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodingParamsSetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoPrivKeyEncodingParams_SetParam(nullptr, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR,
                                                                    nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoAsymKeyGenerator *keyGen = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("RSA2048", &keyGen);

    OH_CryptoKeyPair *keyPair = nullptr;
    ret = OH_CryptoAsymKeyGenerator_Generate(keyGen, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoPrivKeyEncodingParams *params = nullptr;
    ret = OH_CryptoPrivKeyEncodingParams_Create(&params);
    Crypto_DataBlob password = {(uint8_t *)"1234567890", 10};
    Crypto_DataBlob cipher = {(uint8_t *)"AES-128-CBC", 11};
    ret = OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password);
    ret = OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher);
    Crypto_DataBlob pemData = {0};
    ret = OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, "PKCS1", params, &pemData);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }

    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyGen);
    return result;
}

napi_value OHCryptoPrivKeyEncodeParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoPrivKey_Encode(nullptr, CRYPTO_PEM, nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyEncodeOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    Crypto_DataBlob password = {.data = (uint8_t *)"", .len = 0};
    Crypto_DataBlob cipher = {.data = (uint8_t *)"AES-128-CBC", .len = 11};
    Crypto_DataBlob out = { .data = nullptr, .len = 0 };
    OH_CryptoPrivKeyEncodingParams *params = nullptr;

    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator_Create("RSA512", &ctx);
    OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    OH_CryptoPrivKeyEncodingParams_Create(&params);
    OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_PASSWORD_STR, &password);
    OH_CryptoPrivKeyEncodingParams_SetParam(params, CRYPTO_PRIVATE_KEY_ENCODING_SYMMETRIC_CIPHER_STR, &cipher);
    OH_Crypto_ErrCode ret = OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, (const char *)"PKCS8", params, &out);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoPrivKeyEncodingParams_Destroy(params);
    OH_CryptoKeyPair_Destroy(keyPair);

    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymCipherFinalOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *algoName = "RSA512";
    const char *cipherName = "RSA512|NoPadding";
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoAsymCipher *ctx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob cipherData = {.data = nullptr, .len = 0};
    size_t msgLen = 64 - 1;

    OH_CryptoAsymKeyGenerator *genCtx = nullptr;
    OH_CryptoAsymKeyGenerator_Create(algoName, &genCtx);
    OH_CryptoAsymKeyGenerator_Generate(genCtx, &keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(genCtx);
    OH_CryptoRand_Create(&randCtx);
    OH_CryptoRand_GenerateRandom(randCtx, msgLen, &msgBlob);
    OH_CryptoAsymCipher_Create(cipherName, &ctx);
    OH_CryptoAsymCipher_Init(ctx, CRYPTO_ENCRYPT_MODE, keyPair);
    OH_Crypto_ErrCode ret = OH_CryptoAsymCipher_Final(ctx, &msgBlob, &cipherData);
    msgBlob.data[0] = 0x00;

    OH_CryptoAsymCipher_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoRand_Destroy(randCtx);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_Crypto_FreeDataBlob(&cipherData);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoSm2CiphertextSpecCreateOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoSm2CiphertextSpec *sm2CipherSpec = nullptr;
    uint8_t data[] = {
        0x30, 0x79, 0x02, 0x20, 0x9b, 0x17, 0xa5, 0xd3, 0xac, 0xcc, 0xf3, 0x3c, 0x2e, 0x36, 0x23,
        0x99, 0x78, 0x17, 0x50, 0xc9, 0xdc, 0x3e, 0x1b, 0x57, 0x0e, 0xc9, 0x0b, 0x04, 0x1c, 0x18, 0x24,
        0x5e, 0x71, 0xe9, 0x02, 0x8c, 0x02, 0x20, 0x78, 0xc6, 0x6f, 0xda, 0x59, 0x82, 0xae, 0x5e, 0xb3,
        0x17, 0xd2, 0xe1, 0x9b, 0x73, 0xf6, 0x77, 0xed, 0x57, 0xd5, 0xe3, 0x46, 0xde, 0x6c, 0xc4, 0x19,
        0x38, 0x80, 0x96, 0x4c, 0x13, 0x6d, 0x2c, 0x04, 0x20, 0xf0, 0xb2, 0x80, 0xed, 0x0b, 0xbe, 0xac,
        0xac, 0x80, 0x1c, 0x3c, 0xe0, 0xaa, 0x9f, 0x01, 0x47, 0xfc, 0xd7, 0x86, 0x1d, 0x33, 0x21, 0x2b,
        0x36, 0xeb, 0x8f, 0x16, 0x36, 0x94, 0x1a, 0x4d, 0xaf, 0x04, 0x10, 0xf5, 0x89, 0xc8, 0xb5, 0xdf,
        0xc6, 0x5e, 0x12, 0xc8, 0x55, 0x6a, 0x1c, 0xe4, 0x6f, 0x47, 0x32
    };
    Crypto_DataBlob sm2Ciphertext1 = {.data = data, .len = sizeof(data)/sizeof(data[0])};
    OH_Crypto_ErrCode ret = OH_CryptoSm2CiphertextSpec_Create(&sm2Ciphertext1, &sm2CipherSpec);
    OH_CryptoSm2CiphertextSpec_Destroy(sm2CipherSpec);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoPrivKeyGetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    uint8_t p[256] = {};
    uint8_t gx[256] = {};
    uint8_t gy[256] = {};
    uint8_t a[256] = {};
    uint8_t b[256] = {};
    uint8_t n[256] = {};
    uint8_t h[] = {0x00, 0x00, 0x00, 0x01};
    Crypto_DataBlob pData = GenDataBlob("ffffffffffffffffffffffffffffffff000000000000000000000001", &p);
    Crypto_DataBlob gxData = GenDataBlob("b70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21", &gx);
    Crypto_DataBlob gyData = GenDataBlob("bd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34", &gy);
    Crypto_DataBlob aData = GenDataBlob("fffffffffffffffffffffffffffffffefffffffffffffffffffffffe", &a);
    Crypto_DataBlob bData = GenDataBlob("b4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4", &b);
    Crypto_DataBlob nData = GenDataBlob("ffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d", &n);
    Crypto_DataBlob hData = {.data = h, .len = sizeof(h)};
    OH_CryptoAsymKeySpec *keySpec = nullptr;
    OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &keySpec);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_FP_P_DATABLOB, &pData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_A_DATABLOB, &aData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_B_DATABLOB, &bData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_X_DATABLOB, &gxData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_Y_DATABLOB, &gyData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_N_DATABLOB, &nData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_H_INT, &hData);

    OH_CryptoAsymKeyGeneratorWithSpec *generatorSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec_Create(keySpec, &generatorSpec);
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generatorSpec, &keyPair);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    Crypto_DataBlob dataSk = {.data = nullptr, .len = 0};
    OH_Crypto_ErrCode ret = OH_CryptoPrivKey_GetParam(privKey, CRYPTO_ECC_SK_DATABLOB, &dataSk);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoAsymKeySpec_Destroy(keySpec);
    return result;
}

napi_value OHCryptoPrivKeyGetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoPrivKey_GetParam(nullptr, CRYPTO_DH_SK_DATABLOB, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecGenEcCommonParamsSpecSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoAsymKeySpec *ecCommonSpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_GenEcCommonParamsSpec("NID_brainpoolP384r1", &ecCommonSpec);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecGenEcCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_GenEcCommonParamsSpec("NID_brainpoolP384r1", nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecGenDhCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_GenDhCommonParamsSpec(1536, 200, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, &specCtx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_Create(nullptr, CRYPTO_ASYM_KEY_PRIVATE_KEY_SPEC, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecSetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    std::string pStr = "ffffffffffffffffffffffffffffffff000000000000000000000001";
    uint8_t p[256] = {};
    uint8_t h[] = {0x00, 0x00, 0x00, 0x01};
    Crypto_DataBlob pData = GenDataBlob(pStr, &p);

    OH_CryptoAsymKeySpec *keySpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &keySpec);
    ret = OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_FP_P_DATABLOB, &pData);
    OH_Crypto_FreeDataBlob(&pData);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecSetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_SetParam(nullptr, CRYPTO_ECC_FP_P_DATABLOB, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecSetCommonParamsSpecSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoAsymKeySpec *keySpec = nullptr;
    OH_CryptoAsymKeySpec *sm2CommonSpec = nullptr;
    OH_CryptoAsymKeySpec_Create("SM2", CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &keySpec);
    OH_CryptoAsymKeySpec_GenEcCommonParamsSpec("NID_sm2", &sm2CommonSpec);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_SetCommonParamsSpec(keySpec, sm2CommonSpec);
    OH_CryptoAsymKeySpec_Destroy(keySpec);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecSetCommonParamsSpecParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_SetCommonParamsSpec(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecGetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    Crypto_DataBlob gh = { .data = nullptr, .len = 0};
    OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &specCtx);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_GetParam(specCtx, CRYPTO_ECC_H_INT, &gh);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeySpecGetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeySpec_GetParam(nullptr, CRYPTO_ECC_H_INT, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorWithSpecCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    std::string pStr = "ffffffffffffffffffffffffffffffff000000000000000000000001";
    std::string gxStr = "b70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21";
    std::string gyStr = "bd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34";
    std::string aStr = "fffffffffffffffffffffffffffffffefffffffffffffffffffffffe";
    std::string bStr = "b4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4";
    std::string nStr = "ffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d";
    uint8_t p[256] = {};
    uint8_t gx[256] = {};
    uint8_t gy[256] = {};
    uint8_t a[256] = {};
    uint8_t b[256] = {};
    uint8_t n[256] = {};
    uint8_t h[] = {0x00, 0x00, 0x00, 0x01};
    Crypto_DataBlob pData = GenDataBlob(pStr, &p);
    Crypto_DataBlob aData = GenDataBlob(gxStr, &gx);
    Crypto_DataBlob bData = GenDataBlob(gyStr, &gy);
    Crypto_DataBlob gxData = GenDataBlob(aStr, &a);
    Crypto_DataBlob gyData = GenDataBlob(bStr, &b);
    Crypto_DataBlob nData = GenDataBlob(nStr, &n);
    Crypto_DataBlob hData = {.data = h, .len = sizeof(h)};

    OH_CryptoAsymKeySpec *keySpec = nullptr;
    OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &keySpec);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_FP_P_DATABLOB, &pData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_A_DATABLOB, &aData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_B_DATABLOB, &bData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_X_DATABLOB, &gxData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_Y_DATABLOB, &gyData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_N_DATABLOB, &nData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_H_INT, &hData);

    OH_CryptoAsymKeyGeneratorWithSpec *generatorSpec = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGeneratorWithSpec_Create(keySpec, &generatorSpec);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoAsymKeySpec_Destroy(keySpec);
    return result;
}

napi_value OHCryptoAsymKeyGeneratorWithSpecCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGeneratorWithSpec_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoAsymKeyGeneratorWithSpecGenKeyPairSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    std::string pStr = "ffffffffffffffffffffffffffffffff000000000000000000000001";
    std::string gxStr = "b70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21";
    std::string gyStr = "bd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34";
    std::string aStr = "fffffffffffffffffffffffffffffffefffffffffffffffffffffffe";
    std::string bStr = "b4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4";
    std::string nStr = "ffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d";
    uint8_t p[256] = {};
    uint8_t gx[256] = {};
    uint8_t gy[256] = {};
    uint8_t a[256] = {};
    uint8_t b[256] = {};
    uint8_t n[256] = {};
    uint8_t h[] = {0x00, 0x00, 0x00, 0x01};

    Crypto_DataBlob pData = GenDataBlob(pStr, &p);
    Crypto_DataBlob gxData = GenDataBlob(gxStr, &gx);
    Crypto_DataBlob gyData = GenDataBlob(gyStr, &gy);
    Crypto_DataBlob aData = GenDataBlob(aStr, &a);
    Crypto_DataBlob bData = GenDataBlob(bStr, &b);
    Crypto_DataBlob nData = GenDataBlob(nStr, &n);
    Crypto_DataBlob hData = {.data = h, .len = sizeof(h)};

    OH_CryptoAsymKeySpec *keySpec = nullptr;
    OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &keySpec);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_FP_P_DATABLOB, &pData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_A_DATABLOB, &aData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_B_DATABLOB, &bData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_X_DATABLOB, &gxData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_G_Y_DATABLOB, &gyData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_N_DATABLOB, &nData);
    OH_CryptoAsymKeySpec_SetParam(keySpec, CRYPTO_ECC_H_INT, &hData);

    OH_CryptoAsymKeyGeneratorWithSpec *generatorSpec = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec_Create(keySpec, &generatorSpec);
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generatorSpec, &keyPair);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generatorSpec);
    OH_CryptoAsymKeySpec_Destroy(keySpec);
    return result;
}

napi_value OHCryptoAsymKeyGeneratorWithSpecGenKeyPairParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_Create(curveNid, nullptr, &point);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_Create(nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointGetCoordinateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    uint8_t prime256v1PointBlobData[] = {
        4, 153, 228, 156, 119, 184, 185, 120, 237, 233, 181, 77, 70, 183, 30, 68, 2, 70, 37, 251, 5, 22, 199, 84, 87,
        222, 65, 103, 8, 26, 255, 137, 206, 80, 159, 163, 46, 22, 104, 156, 169, 14, 149, 199, 35, 201, 3, 160, 81, 251,
        235, 236, 75, 137, 196, 253, 200, 116, 167, 59, 153, 241, 99, 90, 90
    };
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob prime256v1PointBlob = {prime256v1PointBlobData, sizeof(prime256v1PointBlobData)};
    OH_CryptoEcPoint_Create("NID_X9_62_prime256v1", &prime256v1PointBlob, &point);

    Crypto_DataBlob ecPubKeyX = {0};
    Crypto_DataBlob ecPubKeyY = {0};
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_GetCoordinate(point, &ecPubKeyX, &ecPubKeyY);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointGetCoordinateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_GetCoordinate(nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointSetCoordinateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *curveNid = "NID_X9_62_prime256v1";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t x[] = {
        0x59, 0xfb, 0xf8, 0xce, 0xe6, 0xd1, 0xf3, 0xd6, 0xe0, 0x20, 0x9e, 0x88, 0xa9, 0x59, 0x22, 0xa4, 0xd4, 0x23,
        0xe2, 0x93, 0xfd, 0xd3, 0xcd, 0x11, 0xf1, 0x11, 0xa1, 0x9e, 0x9c, 0x81, 0x78, 0x27
    };
    uint8_t y[] = {
        0x03, 0xb0, 0x17, 0x54, 0x62, 0xb9, 0x38, 0x88, 0xc4, 0xca, 0x7e, 0x55, 0x50, 0xa7, 0x6d, 0xe6, 0x0c, 0xc2,
        0xd7, 0xd5, 0x07, 0x57, 0xa4, 0x4b, 0x22, 0x8e, 0xc5, 0x54, 0xbd, 0x24, 0xc4, 0x8a
    };
    Crypto_DataBlob pk_x = {.data = x, .len = sizeof(x)};
    Crypto_DataBlob pk_y = {.data = y, .len = sizeof(y)};

    OH_CryptoEcPoint_Create(curveNid, nullptr, &point);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_SetCoordinate(point, &pk_x, &pk_y);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointSetCoordinateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_SetCoordinate(nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointEncodeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *curveNid = "NID_sm2";
    OH_CryptoEcPoint *point = nullptr;
    uint8_t ec[] = {
        0x03, 0x64, 0xaf, 0x65, 0x68, 0x6c, 0x49, 0xd6, 0xe3, 0x3d, 0x4e, 0x15, 0x74, 0xda, 0xc1, 0xbf, 0xeb, 0x60,
        0xc5, 0x03, 0x51, 0xd8, 0xd9, 0x96, 0xbf, 0xdc, 0x7d, 0xb2, 0xe8, 0x15, 0x65, 0xcc, 0x05
    };
    Crypto_DataBlob ecKeyData = {.data = ec, .len = sizeof(ec)};
    Crypto_DataBlob new_ecKeyData = {.data = nullptr, .len = 0};

    OH_CryptoEcPoint_Create(curveNid, &ecKeyData, &point);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_Encode(point, "COMPRESSED", &new_ecKeyData);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointEncodeParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_Encode(nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoEcPointEncodeOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
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
    Crypto_DataBlob pk_x = {.data = x, .len = sizeof(x)};
    Crypto_DataBlob pk_y = {.data = y, .len = sizeof(y)};

    OH_CryptoEcPoint_Create(curveNid, nullptr, &point);
    OH_CryptoEcPoint_SetCoordinate(point, &pk_x, &pk_y);
    OH_Crypto_ErrCode ret = OH_CryptoEcPoint_Encode(point, "UNCOMPRESSED", &ecKeyData);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoEcPoint_Destroy(point);
    OH_Crypto_FreeDataBlob(&ecKeyData);
    return result;
}

napi_value OHCryptoDigestCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoDigest *ctx = nullptr;
    
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Create("SHA1", &ctx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoDigestCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Create(nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoDigestUpdateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";

    Crypto_DataBlob inBlob = {.data = reinterpret_cast<uint8_t *>(testData), .len = sizeof(testData)};
    OH_CryptoDigest_Create("SHA1", &ctx);
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Update(ctx, &inBlob);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoDigestUpdateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Update(nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoDigestFinalSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoDigest *ctx = nullptr;
    uint8_t testData[] = "0123456789";

    Crypto_DataBlob inBlob = {.data = reinterpret_cast<uint8_t *>(testData), .len = sizeof(testData)};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    OH_CryptoDigest_Create("SHA1", &ctx);
    OH_CryptoDigest_Update(ctx, &inBlob);
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Final(ctx, &out);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoDigestFinalParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoDigest_Final(nullptr, nullptr);
    if (ret == CRYPTO_INVALID_PARAMS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKdfParamsCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoKdfParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_Create("HKDF", &params);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoKdfParams_Destroy(params);
    return result;
}

napi_value OHCryptoKdfParamsCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKdfParamsSetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdfParams_Create("HKDF", &params);
    const char *keyData = "012345678901234567890123456789";
    Crypto_DataBlob key = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(keyData)),
        .len = strlen(keyData)
    };
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_KEY_DATABLOB, &key);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoKdfParams_Destroy(params);
    return result;
}

napi_value OHCryptoKdfParamsSetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_SetParam(nullptr, CRYPTO_KDF_KEY_DATABLOB, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKdfCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoKdf *kdfCtx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKdf_Create("HKDF|SHA256|EXTRACT_AND_EXPAND", &kdfCtx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoKdf_Destroy(kdfCtx);
    return result;
}

napi_value OHCryptoKdfCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKdf_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKdfDeriveSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoKdfParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_Create("HKDF", &params);
    const char *keyData = "012345678901234567890123456789";
    Crypto_DataBlob key = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(keyData)),
        .len = strlen(keyData)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_KEY_DATABLOB, &key);

    const char *saltData = "saltstring";
    Crypto_DataBlob salt = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(saltData)),
        .len = strlen(saltData)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SALT_DATABLOB, &salt);

    const char *infoData = "infostring";
    Crypto_DataBlob data = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(infoData)),
        .len = strlen(infoData)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_INFO_DATABLOB, &data);

    OH_CryptoKdf *kdfCtx = nullptr;
    ret = OH_CryptoKdf_Create("HKDF|SHA256|EXTRACT_AND_EXPAND", &kdfCtx);

    Crypto_DataBlob out = {0};
    uint32_t keyLength = 32;
    ret = OH_CryptoKdf_Derive(kdfCtx, params, keyLength, &out);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(kdfCtx);
    return result;
}

napi_value OHCryptoKdfDeriveParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKdf_Derive(nullptr, nullptr, 0, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKdfDeriveOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    int keySize = 64;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    const char *keyInfo = "0123456789";
    Crypto_DataBlob passphrase = {.data = reinterpret_cast<uint8_t *>(const_cast<char *>(keyInfo)), .len = 10};
    const char *saltInfo = "abcdef";
    Crypto_DataBlob salt = {.data = reinterpret_cast<uint8_t *>(const_cast<char *>(saltInfo)), .len = 6};
    uint64_t n = 1024;
    uint64_t p = 1;
    uint64_t r = 8;
    uint64_t maxMem = p * NUM_128 * r + NUM_32 * r * (n + NUM_2) * NUM_4 - 1;
    Crypto_DataBlob nData = {.data = (uint8_t *)&(n), sizeof(uint64_t)};
    Crypto_DataBlob pData = {.data = (uint8_t *)&(p), sizeof(uint64_t)};
    Crypto_DataBlob rData = {.data = (uint8_t *)&(r), sizeof(uint64_t)};
    Crypto_DataBlob maxMemData = {.data = (uint8_t *)&(maxMem), sizeof(uint64_t)};
    OH_CryptoKdfParams_Create("SCRYPT", &params);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_KEY_DATABLOB, &passphrase);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SALT_DATABLOB, &salt);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_N_UINT64, &nData);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_P_UINT64, &pData);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_R_UINT64, &rData);
    OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_MAX_MEM_UINT64, &maxMemData);
    OH_CryptoKdf_Create("SCRYPT", &ctx);
    OH_Crypto_ErrCode ret = OH_CryptoKdf_Derive(ctx, params, keySize, &key);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKeyAgreementCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *algoNameA = "ECC224";
    OH_CryptoKeyAgreement *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKeyAgreement_Create(algoNameA, &ctx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKeyAgreementCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKeyAgreement_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKeyAgreementCreateNotSupport(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    const char *algoName = "SM2";
    OH_CryptoKeyAgreement *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKeyAgreement_Create(algoName, &ctx);
    if (ret == CRYPTO_NOT_SUPPORTED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKeyAgreementGenerateSecretSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    uint8_t pubKeyArray[] = {48, 42, 48, 5, 6, 3, 43, 101, 110, 3, 33, 0, 36, 98, 216, 106, 74, 99, 179, 203, 81, 145,
        147, 101, 139, 57, 74, 225, 119, 196, 207, 0, 50, 232, 93, 147, 188, 21, 225, 228, 54, 251, 230, 52};
    uint8_t priKeyArray[] = {48, 46, 2, 1, 0, 48, 5, 6, 3, 43, 101, 110, 4, 34, 4, 32, 112, 65, 156, 73, 65, 89, 183,
        39, 119, 229, 110, 12, 192, 237, 186, 153, 21, 122, 28, 176, 248, 108, 22, 242, 239, 179, 106, 175, 85, 65, 214,
        90};
    OH_CryptoAsymKeyGenerator *x25519Gen = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoAsymKeyGenerator_Create("X25519", &x25519Gen);

    Crypto_DataBlob pubKeyBlob = {pubKeyArray, sizeof(pubKeyArray)};
    Crypto_DataBlob priKeyBlob = {priKeyArray, sizeof(priKeyArray)};
    OH_CryptoKeyPair *keyPairA = nullptr;
    ret = OH_CryptoAsymKeyGenerator_Convert(x25519Gen, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, &keyPairA);
    OH_CryptoKeyPair *keyPairB = nullptr;
    ret = OH_CryptoAsymKeyGenerator_Generate(x25519Gen, &keyPairB);
    OH_CryptoKeyAgreement *x25519KeyAgreement = nullptr;
    ret = OH_CryptoKeyAgreement_Create("X25519", &x25519KeyAgreement);
    OH_CryptoPrivKey *privKeyB = OH_CryptoKeyPair_GetPrivKey(keyPairB);
    OH_CryptoPubKey *pubKeyA = OH_CryptoKeyPair_GetPubKey(keyPairA);
    Crypto_DataBlob secret1 = {0};
    ret = OH_CryptoKeyAgreement_GenerateSecret(x25519KeyAgreement, privKeyB, pubKeyA, &secret1);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoKeyAgreement_Destroy(x25519KeyAgreement);
    OH_CryptoKeyPair_Destroy(keyPairA);
    OH_CryptoKeyPair_Destroy(keyPairB);
    OH_CryptoAsymKeyGenerator_Destroy(x25519Gen);
    return result;
}

napi_value OHCryptoKeyAgreementGenerateSecretParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoKeyAgreement_GenerateSecret(nullptr, nullptr, nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoKeyAgreementGenerateSecretOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    const char *algoNameA = "ECC224";
    const char *algoNameB = "ECC256";
    OH_CryptoAsymKeyGenerator *ctxA = nullptr;
    OH_CryptoAsymKeyGenerator *ctxB = nullptr;
    OH_CryptoKeyPair *keyPairA = nullptr;
    OH_CryptoKeyPair *keyPairB = nullptr;
    OH_CryptoPrivKey *privkeyA = nullptr;
    OH_CryptoPubKey *pubkeyA = nullptr;
    OH_CryptoPrivKey *privkeyB = nullptr;
    OH_CryptoPubKey *pubkeyB = nullptr;
    OH_CryptoKeyAgreement *ctx = nullptr;
    Crypto_DataBlob secretA = {.data = nullptr, .len = 0};
    Crypto_DataBlob secretB = {.data = nullptr, .len = 0};

    OH_CryptoAsymKeyGenerator_Create(algoNameA, &ctxA);
    OH_CryptoAsymKeyGenerator_Create(algoNameB, &ctxB);
    OH_CryptoAsymKeyGenerator_Generate(ctxA, &keyPairA);
    OH_CryptoAsymKeyGenerator_Generate(ctxB, &keyPairB);
    privkeyA = OH_CryptoKeyPair_GetPrivKey(keyPairA);
    pubkeyA = OH_CryptoKeyPair_GetPubKey(keyPairA);
    privkeyB = OH_CryptoKeyPair_GetPrivKey(keyPairB);
    pubkeyB = OH_CryptoKeyPair_GetPubKey(keyPairB);
    OH_CryptoKeyAgreement_Create(algoNameA, &ctx);
    OH_Crypto_ErrCode ret = OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyA, pubkeyB, &secretA);
    ret = OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyB, pubkeyA, &secretB);

    OH_CryptoAsymKeyGenerator_Destroy(ctxA);
    OH_CryptoAsymKeyGenerator_Destroy(ctxB);
    OH_CryptoKeyAgreement_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&secretA);
    OH_Crypto_FreeDataBlob(&secretB);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoMac_Create("HMAC", &ctx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacCreateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoMac_Create(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacSetParamSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    Crypto_DataBlob cipherNameData = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(cipherName)),
        .len = strlen(cipherName)
    };
    OH_Crypto_ErrCode ret = OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &cipherNameData);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacSetParamParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoMac_SetParam(nullptr, CRYPTO_MAC_DIGEST_NAME_STR, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacInitSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    Crypto_DataBlob cipherNameData = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(cipherName)),
        .len = strlen(cipherName)
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &cipherNameData);
    OH_CryptoSymKeyGenerator *keyGen = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES128", &keyGen);
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Generate(keyGen, &keyCtx);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Init(ctx, keyCtx);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoSymKeyGenerator_Destroy(keyGen);
    OH_CryptoMac_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoMacInitParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Init(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacUpdateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoSymKeyGenerator *keyGen = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES128", &keyGen);
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Generate(keyGen, &keyCtx);
    OH_CryptoSymKeyGenerator_Destroy(keyGen);

    OH_CryptoMac *ctx = nullptr;
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    Crypto_DataBlob cipherNameData = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(cipherName)),
        .len = strlen(cipherName)
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &cipherNameData);
    OH_CryptoMac_Init(ctx, keyCtx);
    const char *message = "cmacTestMessage";
    Crypto_DataBlob input = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(message)),
        .len = strlen(message)
    };
    OH_Crypto_ErrCode ret = OH_CryptoMac_Update(ctx, &input);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoMac_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoMacUpdateParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Update(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacUpdateOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    OH_CryptoRand_GenerateRandom(randCtx, msgLen, &msgBlob);
    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    const Crypto_DataBlob value = {
        .data = (uint8_t *)cipherName,
        .len = strlen(cipherName)
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &value);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Update(ctx, &msgBlob);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacFinalSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoSymKeyGenerator *keyGen = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES128", &keyGen);
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Generate(keyGen, &keyCtx);
    OH_CryptoSymKeyGenerator_Destroy(keyGen);

    OH_CryptoMac *ctx = nullptr;
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    Crypto_DataBlob cipherNameData = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(cipherName)),
        .len = strlen(cipherName)
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &cipherNameData);
    OH_CryptoMac_Init(ctx, keyCtx);
    const char *message = "cmacTestMessage";
    Crypto_DataBlob input = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(message)),
        .len = strlen(message)
    };
    OH_CryptoMac_Update(ctx, &input);
    Crypto_DataBlob out = {0};
    OH_Crypto_ErrCode ret = OH_CryptoMac_Final(ctx, &out);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoMac_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoMacFinalParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Final(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value OHCryptoMacFinalOpertionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;

    OH_CryptoRand *randCtx = nullptr;
    OH_CryptoRand_Create(&randCtx);
    OH_CryptoRand_GenerateRandom(randCtx, msgLen, &msgBlob);
    OH_CryptoRand_Destroy(randCtx);
    OH_CryptoMac_Create("HMAC", &ctx);

    const Crypto_DataBlob value = {
        .data = (uint8_t *)"SHA1",
        .len = strlen("SHA1")
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, &value);
    OH_CryptoMac_Update(ctx, &msgBlob);
    OH_Crypto_ErrCode ret = OH_CryptoMac_Final(ctx, &out);
    if (ret == CRYPTO_OPERTION_ERROR) {
        napi_create_int32(env, 0, &result);
    }
    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_CryptoMac_Destroy(ctx);
    return result;
}

napi_value OHCryptoMacGetLengthSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);

    OH_CryptoSymKeyGenerator *keyGen = nullptr;
    OH_CryptoSymKeyGenerator_Create("AES128", &keyGen);
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymKeyGenerator_Generate(keyGen, &keyCtx);
    OH_CryptoSymKeyGenerator_Destroy(keyGen);

    OH_CryptoMac *ctx = nullptr;
    OH_CryptoMac_Create("CMAC", &ctx);
    const char *cipherName = "AES128";
    Crypto_DataBlob cipherNameData = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(cipherName)),
        .len = strlen(cipherName)
    };
    OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &cipherNameData);
    OH_CryptoMac_Init(ctx, keyCtx);
    const char *message = "cmacTestMessage";
    Crypto_DataBlob input = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(message)),
        .len = strlen(message)
    };
    OH_CryptoMac_Update(ctx, &input);
    Crypto_DataBlob out = {0};
    OH_CryptoMac_Final(ctx, &out);
    uint32_t macLen = 0;
    OH_Crypto_ErrCode ret = OH_CryptoMac_GetLength(ctx, &macLen);
    if (ret == CRYPTO_SUCCESS) {
        napi_create_int32(env, 0, &result);
    }
    OH_CryptoMac_Destroy(ctx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return result;
}

napi_value OHCryptoMacGetLengthParameterCheckFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, DEFAULT_CODE, &result);
    OH_Crypto_ErrCode ret = OH_CryptoMac_GetLength(nullptr, nullptr);
    if (ret == CRYPTO_PARAMETER_CHECK_FAILED) {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

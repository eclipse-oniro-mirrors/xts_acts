/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "huks_cipher_rsa_test_common.h"

#include <gtest/gtest.h>

OH_Huks_Result Unittest::RsaCipher::HksRsaCipherTestEncryptAbnormal(const struct OH_Huks_Blob *keyAlias,
                                                                    const struct OH_Huks_ParamSet *encryptParamSet,
                                                                    const struct OH_Huks_Blob *inData,
                                                                    struct OH_Huks_Blob *cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleEncrypt = {sizeof(uint64_t), handleE};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handleEncrypt, encryptParamSet, OH_HUKS_KEY_PURPOSE_ENCRYPT, inData, cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT) << "TestUpdateFinish should failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_Result abortRet = OH_Huks_AbortSession(&handleEncrypt, encryptParamSet);
        EXPECT_EQ(abortRet.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Abort failed.";
        return ret;
    }
    int32_t ret1 = HksMemCmp(inData->data, cipherText->data, inData->size);
    EXPECT_NE(ret1, (int32_t)OH_HUKS_SUCCESS) << "cipherText equals inData";

    return ret;
}

OH_Huks_Result Unittest::RsaCipher::HksRsaCipherTestEncrypt(const struct OH_Huks_Blob *keyAlias,
                                                            const struct OH_Huks_ParamSet *encryptParamSet,
                                                            const struct OH_Huks_Blob *inData,
                                                            struct OH_Huks_Blob *cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleEncrypt = {sizeof(uint64_t), handleE};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handleEncrypt, encryptParamSet, OH_HUKS_KEY_PURPOSE_ENCRYPT, inData, cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "TestUpdateFinish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    int32_t ret1 = HksMemCmp(inData->data, cipherText->data, inData->size);
    EXPECT_NE(ret1, (int32_t)OH_HUKS_SUCCESS) << "cipherText equals inData";
    return ret;
}

OH_Huks_Result Unittest::RsaCipher::HksRsaCipherTestDecrypt(const struct OH_Huks_Blob *keyAlias,
                                                            const struct OH_Huks_ParamSet *decryptParamSet,
                                                            const struct OH_Huks_Blob *cipherText,
                                                            struct OH_Huks_Blob *plainText,
                                                            const struct OH_Huks_Blob *inData)
{
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDecrypt = {sizeof(uint64_t), handleD};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handleDecrypt, decryptParamSet, OH_HUKS_KEY_PURPOSE_DECRYPT, cipherText, plainText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "TestUpdateFinish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    int32_t ret1 = HksMemCmp(inData->data, plainText->data, inData->size);
    EXPECT_EQ(ret1, (int32_t)OH_HUKS_SUCCESS) << "plainText not equals inData";
    return ret;
}

OH_Huks_Result Unittest::RsaCipher::HksRsaCipherTestCase(const struct OH_Huks_Blob *keyAlias,
                                                         struct OH_Huks_ParamSet *genParamSet,
                                                         struct OH_Huks_ParamSet *encryptParamSet,
                                                         struct OH_Huks_ParamSet *decryptParamSet,
                                                         const struct OH_Huks_Blob *inData)
{
    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Export Public Key */
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, &publicKey);

    /* 3. Import Key */
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = strlen(tmpKey), .data = (uint8_t *)tmpKey};
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, encryptParamSet, &publicKey);

    /* 4. Encrypt Three Stage */
    uint8_t cipher[Unittest::RsaCipher::RSA_COMMON_SIZE] = {0};
    struct OH_Huks_Blob cipherText = {Unittest::RsaCipher::RSA_COMMON_SIZE, cipher};
    ret = HksRsaCipherTestEncrypt(&newKeyAlias, encryptParamSet, inData, &cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksRsaCipherTestEncrypt failed.";

    /* 5. Decrypt Three Stage */
    uint8_t plain[Unittest::RsaCipher::RSA_COMMON_SIZE] = {0};
    struct OH_Huks_Blob plainText = {Unittest::RsaCipher::RSA_COMMON_SIZE, plain};
    ret = HksRsaCipherTestDecrypt(keyAlias, decryptParamSet, &cipherText, &plainText, inData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksRsaCipherTestDecrypt failed.";

    /* 6. Delete Key */
    EXPECT_EQ(OH_Huks_DeleteKeyItem(keyAlias, genParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    EXPECT_EQ(OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Delete ImportKey failed.";
    return ret;
}

OH_Huks_Result Unittest::RsaCipher::HksRsaCipherTestCaseAbnormal(const struct OH_Huks_Blob *keyAlias,
                                                                 struct OH_Huks_ParamSet *genParamSet,
                                                                 struct OH_Huks_ParamSet *encryptParamSet,
                                                                 struct OH_Huks_ParamSet *decryptParamSet,
                                                                 const struct OH_Huks_Blob *inData)
{
    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Export Public Key */
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, &publicKey);

    /* 3. Import Key */
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = strlen(tmpKey), .data = (uint8_t *)tmpKey};
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, encryptParamSet, &publicKey);

    /* 4. Encrypt Three Stage */
    uint8_t cipher[Unittest::RsaCipher::RSA_COMMON_SIZE] = {0};
    struct OH_Huks_Blob cipherText = {Unittest::RsaCipher::RSA_COMMON_SIZE, cipher};
    ret = HksRsaCipherTestEncryptAbnormal(&newKeyAlias, encryptParamSet, inData, &cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT) << "HksRsaCipherTestEncrypt should failed.";

    /* 6. Delete Key */
    EXPECT_EQ(OH_Huks_DeleteKeyItem(keyAlias, genParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    EXPECT_EQ(OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Delete ImportKey failed.";
    return ret;
}
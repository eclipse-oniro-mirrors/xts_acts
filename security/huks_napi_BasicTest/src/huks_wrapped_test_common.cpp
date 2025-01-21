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

#include <gtest/gtest.h>

#include "huks_three_stage_test_common.h"
#include "huks_wrapped_test_common.h"

using namespace testing::ext;
namespace Unittest::ImportWrapped
{
    static struct OH_Huks_Param g_aesKekEncryptParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = {.size = Unittest::ImportWrapped::AAD_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::AAD}},
        {.tag = OH_HUKS_TAG_NONCE, .blob = {.size = Unittest::ImportWrapped::NONCE_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::NONCE}}};

    static struct OH_Huks_Param g_importAgreeKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_IV, .blob = {.size = Unittest::ImportWrapped::IV_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::IV}}};

    static OH_Huks_Result BuildWrappedKeyData(struct OH_Huks_Blob **blobArray, uint32_t size, struct OH_Huks_Blob *outData)
    {
        uint32_t totalLength = size * sizeof(uint32_t);
        struct OH_Huks_Result ret;
        ret.errorCode = OH_HUKS_SUCCESS;

        /* counter size */
        for (uint32_t i = 0; i < size; ++i)
        {
            totalLength += blobArray[i]->size;
        }

        struct OH_Huks_Blob outBlob = {0, nullptr};
        outBlob.size = totalLength;
        (void)MallocAndCheckBlobData(&outBlob, outBlob.size);

        uint32_t offset = 0;

        /* copy data */
        for (uint32_t i = 0; i < size; ++i)
        {
            if (memcpy_s(outBlob.data + offset, totalLength - offset, reinterpret_cast<uint8_t *>(&blobArray[i]->size),
                         sizeof(blobArray[i]->size)) != EOK)
            {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
            offset += sizeof(blobArray[i]->size);

            if (memcpy_s(outBlob.data + offset, totalLength - offset, blobArray[i]->data,
                         blobArray[i]->size) != EOK)
            {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
            offset += blobArray[i]->size;
        }

        outData->size = outBlob.size;
        outData->data = outBlob.data;
        return ret;
    }

    static OH_Huks_Result CheckParamsValid(const struct HksImportWrappedKeyTestParams *params)
    {
        struct OH_Huks_Result ret;
        ret.errorCode = OH_HUKS_SUCCESS;
        if (params == nullptr)
        {
            ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
            return ret;
        }

        if (params->wrappingKeyAlias == nullptr || params->genWrappingKeyParamSet == nullptr ||
            params->agreeKeyAlgName == nullptr || params->callerKeyAlias == nullptr ||
            params->genCallerKeyParamSet == nullptr || params->callerKekAlias == nullptr ||
            params->callerKek == nullptr || params->importCallerKekParamSet == nullptr ||
            params->callerAgreeKeyAlias == nullptr || params->agreeParamSet == nullptr ||
            params->importWrappedKeyParamSet == nullptr || params->importedKeyAlias == nullptr ||
            params->importedPlainKey == nullptr)
        {
            ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
            return ret;
        }
        return ret;
    }

    static void GenerateAndExportHuksPublicKey(const struct HksImportWrappedKeyTestParams *params,
                                               struct OH_Huks_Blob *huksPublicKey)
    {
        OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->wrappingKeyAlias, params->genWrappingKeyParamSet, nullptr);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Generate huks key failed.";
        huksPublicKey->size = params->publicKeySize;

        EXPECT_EQ(MallocAndCheckBlobData(huksPublicKey, huksPublicKey->size).errorCode,
                  (int32_t)OH_HUKS_SUCCESS)
            << "Malloc pub key failed.";
        ret = OH_Huks_ExportPublicKeyItem(params->wrappingKeyAlias, nullptr, huksPublicKey);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Export huks public key failed.";
    }

    static void GenerateAndExportCallerPublicKey(const struct HksImportWrappedKeyTestParams *params,
                                                 struct OH_Huks_Blob *callerSelfPublicKey)
    {
        OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->callerKeyAlias, params->genCallerKeyParamSet, nullptr);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Generate caller key failed.";

        callerSelfPublicKey->size = params->publicKeySize;
        EXPECT_EQ(MallocAndCheckBlobData(callerSelfPublicKey, callerSelfPublicKey->size).errorCode,
                  (int32_t)OH_HUKS_SUCCESS)
            << "malloc fail";
        ret = OH_Huks_ExportPublicKeyItem(params->callerKeyAlias, params->genWrappingKeyParamSet, callerSelfPublicKey);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Export caller public key failed.";
    }

    static void ImportKekAndAgreeSharedSecret(const struct HksImportWrappedKeyTestParams *params,
                                              const struct OH_Huks_Blob *huksPublicKey, struct OH_Huks_Blob *outSharedKey)
    {
        OH_Huks_Result ret = OH_Huks_ImportKeyItem(params->callerKekAlias,
                                                   params->importCallerKekParamSet, params->callerKek);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ImportCallerSelfKek failed.";
        EXPECT_EQ(MallocAndCheckBlobData(outSharedKey, outSharedKey->size).errorCode,
                  (int32_t)OH_HUKS_SUCCESS)
            << "Malloc sharedKey failed.";

        ret = HuksAgreeKey(params->agreeParamSet, params->callerKeyAlias, huksPublicKey, outSharedKey);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS)
            << "HuksAgreeKey with huks public key and caller private key failed.";

        struct OH_Huks_ParamSet *importAgreeKeyParams = nullptr;
        ret = InitParamSet(&importAgreeKeyParams, g_importAgreeKeyParams,
                           sizeof(g_importAgreeKeyParams) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(importAgreeKey) failed.";

        ret = OH_Huks_ImportKeyItem(params->callerAgreeKeyAlias, importAgreeKeyParams, outSharedKey);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "import agree shared key failed.";
        OH_Huks_FreeParamSet(&importAgreeKeyParams);
    }

    static void EncryptImportedPlainKeyAndKek(const struct HksImportWrappedKeyTestParams *params,
                                              struct OH_Huks_Blob *plainCipherText, struct OH_Huks_Blob *kekCipherText)
    {
        struct OH_Huks_ParamSet *encryptParamSet = nullptr;
        OH_Huks_Result ret = InitParamSet(&encryptParamSet, g_aesKekEncryptParams,
                                   sizeof(g_aesKekEncryptParams) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(aesKekEnc) failed.";
        ret = HuksEncrypt(params->callerKekAlias, encryptParamSet, params->importedPlainKey, plainCipherText);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HuksEncrypt plain key to be imported failed.";

        ret = HuksEncrypt(params->callerAgreeKeyAlias, encryptParamSet, params->callerKek, kekCipherText);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Kek encrypt failed.";
        OH_Huks_FreeParamSet(&encryptParamSet);
    }

    static void ImportWrappedKey(const struct HksImportWrappedKeyTestParams *params, struct OH_Huks_Blob *plainCipher,
                                 struct OH_Huks_Blob *kekCipherText, struct OH_Huks_Blob *peerPublicKey, struct OH_Huks_Blob *wrappedKeyData)
    {
        struct OH_Huks_Blob commonAad = {.size = Unittest::ImportWrapped::AAD_SIZE,
                                         .data = reinterpret_cast<uint8_t *>(Unittest::ImportWrapped::AAD)};
        struct OH_Huks_Blob commonNonce = {.size = Unittest::ImportWrapped::NONCE_SIZE,
                                           .data = reinterpret_cast<uint8_t *>(Unittest::ImportWrapped::NONCE)};
        struct OH_Huks_Blob keyMaterialLen = {.size = sizeof(uint32_t), .data = (uint8_t *)&params->keyMaterialLen};

        /* copy AEAD tag from cipher text and decrease its size */
        const uint32_t tagSize = Unittest::ImportWrapped::AEAD_TAG_SIZE;
        uint8_t kekTagBuf[tagSize] = {0};
        struct OH_Huks_Blob kekTag = {.size = tagSize, .data = kekTagBuf};
        if (memcpy_s(kekTag.data, tagSize, plainCipher->data + (plainCipher->size - tagSize), tagSize) != EOK)
        {
            EXPECT_EQ(OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT, EOK) << "memcpy kek tag failed.";
        }
        plainCipher->size -= tagSize;

        /* copy AEAD tag from kek cipher text and decrease its size */
        uint8_t agreeKeyTagBuf[tagSize] = {0};
        struct OH_Huks_Blob agreeKeyTag = {.size = tagSize, .data = agreeKeyTagBuf};
        if (memcpy_s(agreeKeyTagBuf, tagSize, kekCipherText->data + (kekCipherText->size - tagSize), tagSize) != EOK)
        {
            EXPECT_EQ(OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT, EOK) << "memcpy agreekey tag failed.";
        }
        kekCipherText->size -= tagSize;

        struct OH_Huks_Blob *blobArray[] = {peerPublicKey, &commonAad, &commonNonce, &agreeKeyTag, kekCipherText,
                                            &commonAad, &commonNonce, &kekTag, &keyMaterialLen, plainCipher};
        OH_Huks_Result ret = BuildWrappedKeyData(blobArray, OH_HUKS_IMPORT_WRAPPED_KEY_TOTAL_BLOBS, wrappedKeyData);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "BuildWrappedKeyData failed.";

        struct OH_Huks_Param *purpose = nullptr;
        ret = OH_Huks_GetParam(params->importWrappedKeyParamSet, OH_HUKS_TAG_PURPOSE, &purpose);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Get wrapped purpose param failed.";

        ret = OH_Huks_ImportWrappedKeyItem(params->importedKeyAlias, params->wrappingKeyAlias,
                                  params->importWrappedKeyParamSet, wrappedKeyData);

        if (purpose->uint32Param == (uint32_t)OH_HUKS_KEY_PURPOSE_UNWRAP)
        {
            EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT) << "Import unwrap purpose wrapped key shouldn't be success.";
        }
        else
        {
            EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "OH_Huks_ImportWrappedKeyItem failed.";
        }
    }

    void HksImportWrappedKeyTestCommonCase(const struct HksImportWrappedKeyTestParams *params)
    {
        OH_Huks_Result ret = CheckParamsValid(params);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "CheckParamsValid failed.";
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS)
        {
            return;
        }

        struct OH_Huks_Blob huksPublicKey = {0, nullptr};
        struct OH_Huks_Blob callerSelfPublicKey = {0, nullptr};
        struct OH_Huks_Blob outSharedKey = {.size = OH_HUKS_KEY_BYTES(OH_HUKS_AES_KEY_SIZE_256), .data = nullptr};
        struct OH_Huks_Blob wrappedKeyData = {0, nullptr};
        uint8_t plainKeyCipherBuffer[OH_HUKS_MAX_KEY_SIZE] = {0};
        struct OH_Huks_Blob plainCipherText = {OH_HUKS_MAX_KEY_SIZE, plainKeyCipherBuffer};
        uint8_t kekCipherTextBuffer[OH_HUKS_MAX_KEY_SIZE] = {0};
        struct OH_Huks_Blob kekCipherText = {OH_HUKS_MAX_KEY_SIZE, kekCipherTextBuffer};

        GenerateAndExportHuksPublicKey(params, &huksPublicKey);
        GenerateAndExportCallerPublicKey(params, &callerSelfPublicKey);
        ImportKekAndAgreeSharedSecret(params, &huksPublicKey, &outSharedKey);
        EncryptImportedPlainKeyAndKek(params, &plainCipherText, &kekCipherText);
        ImportWrappedKey(params, &plainCipherText, &kekCipherText, &callerSelfPublicKey, &wrappedKeyData);

        HUKS_FREE_BLOB(huksPublicKey);
        HUKS_FREE_BLOB(callerSelfPublicKey);
        HUKS_FREE_BLOB(outSharedKey);
        HUKS_FREE_BLOB(wrappedKeyData);
    }

    void HksClearKeysForWrappedKeyTest(const struct HksImportWrappedKeyTestParams *params)
    {
        OH_Huks_Result ret = CheckParamsValid(params);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "CheckParamsValid failed.";
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS)
        {
            return;
        }
        (void)OH_Huks_DeleteKeyItem(params->wrappingKeyAlias, nullptr);
        (void)OH_Huks_DeleteKeyItem(params->callerKeyAlias, nullptr);
        (void)OH_Huks_DeleteKeyItem(params->callerKekAlias, nullptr);
        (void)OH_Huks_DeleteKeyItem(params->callerAgreeKeyAlias, nullptr);
        (void)OH_Huks_DeleteKeyItem(params->importedKeyAlias, nullptr);
    }
}

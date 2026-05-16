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

#include "huks_cipher_sm4_test_common.h"

#include <gtest/gtest.h>
using namespace testing::ext;
namespace Unittest::Sm4Cipher
{
static OH_Huks_Result HksSm4CipherTestEncrypt(const struct OH_Huks_Blob *keyAlias,
                                              const struct OH_Huks_ParamSet *encryptParamSet,
                                              const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleEncrypt = {sizeof(uint64_t), handleE};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleEncrypt, encryptParamSet, inData, cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "TestUpdateLoopFinish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    EXPECT_NE(HksMemCmp(inData->data, cipherText->data, inData->size), (int32_t)OH_HUKS_SUCCESS)
        << "cipherText equals inData";

    return ret;
}

static OH_Huks_Result HksSm4CipherTestDecrypt(const struct OH_Huks_Blob *keyAlias,
                                              const struct OH_Huks_ParamSet *decryptParamSet,
                                              const struct OH_Huks_Blob *cipherText, struct OH_Huks_Blob *plainText,
                                              const struct OH_Huks_Blob *inData)
{
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDecrypt = {sizeof(uint64_t), handleD};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleDecrypt, decryptParamSet, cipherText, plainText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "TestUpdateLoopFinish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    EXPECT_EQ(HksMemCmp(inData->data, plainText->data, inData->size), (int32_t)OH_HUKS_SUCCESS)
        << "plainText not equals inData";

    return ret;
}
OH_Huks_Result HksSm4CipherTestCaseOther(const struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *genParamSet,
                                         struct OH_Huks_ParamSet *encryptParamSet,
                                         struct OH_Huks_ParamSet *decryptParamSet)
{
    char tmpInData[] = "SM4_ECB_INDATA_1";
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    struct OH_Huks_Param *modeParam = nullptr;
    OH_Huks_GetParam(genParamSet, OH_HUKS_TAG_BLOCK_MODE, &modeParam);
    if (modeParam->uint32Param == OH_HUKS_MODE_ECB) {
        inData.size = strlen(tmpInData);
        inData.data = (uint8_t *)tmpInData;
    }

    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Encrypt */
    uint8_t cipher[SM4_COMMON_SIZE] = {0};
    struct OH_Huks_Blob cipherText = {SM4_COMMON_SIZE, cipher};
    ret = HksSm4CipherTestEncrypt(keyAlias, encryptParamSet, &inData, &cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksAesCipherTestEncrypt failed.";

    /* 3. Decrypt Three Stage */
    uint8_t plain[SM4_COMMON_SIZE] = {0};
    struct OH_Huks_Blob plainText = {SM4_COMMON_SIZE, plain};
    ret = HksSm4CipherTestDecrypt(keyAlias, decryptParamSet, &cipherText, &plainText, &inData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksAesCipherTestDecrypt failed.";

    /* 3. Delete Key */
    EXPECT_EQ(OH_Huks_DeleteKeyItem(keyAlias, genParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    return ret;
}
}  // namespace Unittest::Sm4Cipher

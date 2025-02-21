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

#include "huks_signverify_ecc_test_common.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::EccSifnVerify {
OH_Huks_Result HksTestSignVerify(struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *paramSet,
    const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData, bool isSign)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Param *tmpParam = NULL;
    ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "TestUpdateFinish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

OH_Huks_Result HksEccSignVerifyTestNormalCase(struct OH_Huks_Blob keyAlias,
    struct OH_Huks_ParamSet *genParamSet, struct OH_Huks_ParamSet *signParamSet, struct OH_Huks_ParamSet *verifyParamSet)
{
    struct OH_Huks_Blob inData = {
        g_inData.length(),
        (uint8_t *)g_inData.c_str()
    };

    /* 1. Generate Key */
    // Generate Key
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Sign Three Stage */
    uint8_t outDataS[ECC_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataSign = { ECC_COMMON_SIZE, outDataS };
    ret = HksTestSignVerify(&keyAlias, signParamSet, &inData, &outDataSign, true);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Sign failed.";

    /* 3. Export Public Key */
    uint8_t pubKey[OH_HUKS_ECC_KEY_SIZE_521] = {0};
    struct OH_Huks_Blob publicKey = { OH_HUKS_ECC_KEY_SIZE_521, pubKey };
    ret = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportPublicKey failed.";

    /* 4. Import Key */
    char newKey[] = "ECC_Sign_Verify_Import_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = { .size = strlen(newKey), .data = (uint8_t *)newKey };
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ImportKey failed";

    /* 5. Verify Three Stage */
    ret = HksTestSignVerify(&newKeyAlias, verifyParamSet, &inData, &outDataSign, false);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Verify failed.";

    /* 6. Delete New Key */
    ret = OH_Huks_DeleteKeyItem(&newKeyAlias, verifyParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Delete ImportKey failed.";

    return ret;
}
}
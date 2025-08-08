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

#include "huks_signverify_ed25519_test.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::Ed25519
{
class HuksSignVerifyED25519Test : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksSignVerifyED25519Test::SetUpTestCase(void) {}

void HuksSignVerifyED25519Test::TearDownTestCase(void) {}

void HuksSignVerifyED25519Test::SetUp() {}

void HuksSignVerifyED25519Test::TearDown() {}

void HksTestFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
                         struct OH_Huks_ParamSet *paramSet3)
{
    OH_Huks_FreeParamSet(&paramSet1);
    OH_Huks_FreeParamSet(&paramSet2);
    OH_Huks_FreeParamSet(&paramSet3);
}

OH_Huks_Result HksTestSignVerify(struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *paramSet,
                                 const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData, bool isSign)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
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

/**
 * @tc.name: HuksSignVerifyED25519Test.Security_HUKS_NAPI_SignVerify_ED25519_0100
 * @tc.desc: alg-ED25519 pur-Sign.
 * @tc.type: FUNC
 */
HWTEST_F(HuksSignVerifyED25519Test, Security_HUKS_NAPI_SignVerify_ED25519_0100, TestSize.Level0)
{
    const char *keyAliasString = "HksED25519SignVerifyKeyAliasTest001";
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;

    OH_Huks_Result ret =
        InitParamSet(&genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    ret = InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    ret = InitParamSet(&verifyParamSet, g_verifyParamsTest001, sizeof(g_verifyParamsTest001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    struct OH_Huks_Blob keyAlias = {strlen(keyAliasString), (uint8_t *)keyAliasString};

    /* 1. Generate Key */
    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Sign Three Stage */
    uint8_t outDataS[ED25519_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataSign = {ED25519_COMMON_SIZE, outDataS};
    ret = HksTestSignVerify(&keyAlias, signParamSet, &g_inData, &outDataSign, true);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Sign failed.";

    /* 3. Export Public Key */
    uint8_t pubKey[OH_HUKS_CURVE25519_KEY_SIZE_256] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_CURVE25519_KEY_SIZE_256, pubKey};
    ret = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportPublicKey failed.";

    /* 4. Import Key */
    char newKey[] = "ECC_Sign_Verify_Import_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = strlen(newKey), .data = (uint8_t *)newKey};
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ImportKey failed";

    /* 5. Verify Three Stage */
    ret = HksTestSignVerify(&newKeyAlias, verifyParamSet, &g_inData, &outDataSign, false);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Verify failed.";

    /* 5. Delete Key */
    EXPECT_EQ(OH_Huks_DeleteKeyItem(&keyAlias, genParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    EXPECT_EQ(OH_Huks_DeleteKeyItem(&newKeyAlias, verifyParamSet).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Delete ImportKey failed.";

    HksTestFreeParamSet(genParamSet, signParamSet, verifyParamSet);
}
}  // namespace Unittest::Ed25519
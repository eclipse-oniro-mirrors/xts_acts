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

#include "huks_signverify_sm2_test.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::Sm2SignVerify
{
class HuksSignVerifySM2Test : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksSignVerifySM2Test::SetUpTestCase(void) {}

void HuksSignVerifySM2Test::TearDownTestCase(void) {}

void HuksSignVerifySM2Test::SetUp() {}

void HuksSignVerifySM2Test::TearDown() {}
const uint32_t SUCCESS_RETURN_INDEX = 0;

static const struct GenerateKeyCaseParam g_genParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};
static const struct GenerateKeyCaseParam g_signParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};
static const struct GenerateKeyCaseParam g_verifyParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};

static OH_Huks_Result HksTestSignVerify(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_ParamSet *paramSet,
                                        const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    OH_Huks_Result ret;

    do {
        ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        struct OH_Huks_Param *tmpParam = NULL;
        ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
    } while (0);

    (void)OH_Huks_AbortSession(&handle, paramSet);
    return ret;
}

static OH_Huks_Result CreateImportKeyAlias(struct OH_Huks_Blob *importKeyAlias, const struct OH_Huks_Blob *keyAlias)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    const char *tmp = "new";
    importKeyAlias->size = keyAlias->size + strlen(tmp);
    importKeyAlias->data = (uint8_t *)HksMalloc(importKeyAlias->size);
    if (importKeyAlias->data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (memcpy_s(importKeyAlias->data, importKeyAlias->size, keyAlias->data, keyAlias->size) != EOK) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (memcpy_s(importKeyAlias->data + keyAlias->size, importKeyAlias->size - keyAlias->size, tmp, strlen(tmp)) !=
        EOK) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    return ret;
}

void static FreeBuffAndDeleteKey(struct OH_Huks_ParamSet **paramSet1, struct OH_Huks_ParamSet **paramSet2,
                                 struct OH_Huks_ParamSet **paramSet3, const struct OH_Huks_Blob *keyAlias1,
                                 const struct OH_Huks_Blob *keyAlias2)
{
    (void)OH_Huks_DeleteKeyItem(keyAlias1, *paramSet1);
    (void)OH_Huks_DeleteKeyItem(keyAlias2, *paramSet1);
    OH_Huks_FreeParamSet(paramSet1);
    OH_Huks_FreeParamSet(paramSet2);
    OH_Huks_FreeParamSet(paramSet3);
}

static OH_Huks_Result HksSm2SignVerifyTestRun(const struct OH_Huks_Blob *keyAlias, const uint32_t genIndex,
                                              const uint32_t signIndex, const uint32_t verifyIndex,
                                              const bool isTestSignData)
{
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;

    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};
    uint8_t outDataS[SM2_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataSign = {SM2_COMMON_SIZE, outDataS};

    uint8_t pubKey[OH_HUKS_MAX_KEY_SIZE] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_MAX_KEY_SIZE, pubKey};

    struct OH_Huks_Blob importKeyAlias;
    OH_Huks_Result ret = CreateImportKeyAlias(&importKeyAlias, keyAlias);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "createImportKeyAlias failed.";

    do {
        /* 1. Generate Key */
        ret = InitParamSet(&genParamSet, g_genParamsTest[genIndex].params,
                           sizeof(g_genParamsTest[genIndex].params) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitGenParamSet failed.";
        ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode =
                ((ret.errorCode == g_genParamsTest[genIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
            break;
        }

        ret = OH_Huks_IsKeyItemExist(keyAlias, genParamSet);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "isKeyExist failed.";

        /* 2. Sign Three Stage */
        ret = InitParamSet(&signParamSet, g_signParamsTest[signIndex].params,
                           sizeof(g_signParamsTest[signIndex].params) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitSignParamSet failed.";
        ret = HksTestSignVerify(keyAlias, signParamSet, &inData, &outDataSign);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode =
                ((ret.errorCode == g_signParamsTest[signIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
            break;
        }

        /* 3. Export Public Key */
        ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, &publicKey);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportPublicKey failed.";

        /* 4. Import Key */
        ret = InitParamSet(&verifyParamSet, g_verifyParamsTest[verifyIndex].params,
                           sizeof(g_verifyParamsTest[verifyIndex].params) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitVerifyParamSet failed.";
        ret = OH_Huks_ImportKeyItem(&importKeyAlias, verifyParamSet, &publicKey);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode =
                ((ret.errorCode == g_verifyParamsTest[verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
            break;
        }

        /* 5. Verify Three Stage */
        if (isTestSignData) {
            (void)memset_s(outDataSign.data, outDataSign.size, 0, outDataSign.size);
        }
        ret = HksTestSignVerify(&importKeyAlias, verifyParamSet, &inData, &outDataSign);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode =
                ((ret.errorCode == g_verifyParamsTest[verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
        }
    } while (0);

    FreeBuffAndDeleteKey(&genParamSet, &signParamSet, &verifyParamSet, keyAlias, &importKeyAlias);
    HksFree(importKeyAlias.data);
    return ret;
}

/**
 * @tc.name   Security_HUKS_NAPI_SignVerify_SM2_0100
 * @tc.number Security_HUKS_NAPI_SignVerify_SM2_0100
 * @tc.desc   normal parameter test case : alg-SM2, pur-Sign/Verify, keySize-256 and dig-SM3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(HuksSignVerifySM2Test, Security_HUKS_NAPI_SignVerify_SM2_0100, TestSize.Level0)
{
    const char *keyAliasString = "HksSM2SignVerifyKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = {strlen(keyAliasString), (uint8_t *)keyAliasString};
    OH_Huks_Result ret =
        HksSm2SignVerifyTestRun(&keyAlias, SUCCESS_RETURN_INDEX, SUCCESS_RETURN_INDEX, SUCCESS_RETURN_INDEX, false);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "sm2SignVerifyTest001 failed.";
}
}  // namespace Unittest::Sm2SignVerify

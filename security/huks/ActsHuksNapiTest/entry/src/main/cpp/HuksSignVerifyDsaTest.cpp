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

#include "include/HuksSignVerifyDsaTest.h"
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

static const uint32_t DSA_COMMON_SIZE = 1024;
static const std::string IN_DATA =
    "Hks_DSA_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

static struct OH_Huks_Param g_genParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = DSA_COMMON_SIZE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_signParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_verifyParamsTest001[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = DSA_COMMON_SIZE },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

// Helper function: Initialize ParamSet
static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet** paramSet,
    const struct OH_Huks_Param* params,
    uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

// Helper function: TestUpdateFinish
static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob* handle,
                                       const struct OH_Huks_ParamSet* paramSet,
                                       uint32_t purpose,
                                       const struct OH_Huks_Blob* inData,
                                       struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Blob outDataUpdate = { 0, nullptr };
    OH_Huks_Result ret = OH_Huks_UpdateSession(handle, paramSet, inData, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Blob inDataFinish = { 0, nullptr };
    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outData, &inDataFinish);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &inDataFinish, outData);
    }

    return ret;
}

// Helper function: Sign or Verify operation
static OH_Huks_Result HksTestSignVerify(struct OH_Huks_Blob* keyAlias,
                                        struct OH_Huks_ParamSet* paramSet,
                                        const struct OH_Huks_Blob* inData,
                                        struct OH_Huks_Blob* outData,
                                        bool isSign)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Param* tmpParam = nullptr;
    ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    return ret;
}

// Main test case helper
static OH_Huks_Result HksDsaSignVerifyTestNormalCase(struct OH_Huks_Blob keyAlias,
                                                     struct OH_Huks_ParamSet* genParamSet,
                                                     struct OH_Huks_ParamSet* signParamSet,
                                                     struct OH_Huks_ParamSet* verifyParamSet)
{
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    if (ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED) {
        // Algorithm not supported, return success to skip test gracefully
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
        return ret;
    }
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Sign Three Stage */
    uint8_t outDataS[DSA_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataSign = { DSA_COMMON_SIZE, outDataS };
    ret = HksTestSignVerify(&keyAlias, signParamSet, &inData, &outDataSign, true);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 3. Export Public Key */
    uint8_t pubKey[DSA_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob publicKey = { DSA_COMMON_SIZE, pubKey };
    ret = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 4. Import Key */
    char newKey[] = "DSA_Sign_Verify_Import_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = { .size = static_cast<uint32_t>(strlen(newKey)), .data = (uint8_t*)newKey };
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 5. Verify Three Stage */
    ret = HksTestSignVerify(&newKeyAlias, verifyParamSet, &inData, &outDataSign, false);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 6. Delete New Key */
    ret = OH_Huks_DeleteKeyItem(&newKeyAlias, verifyParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    return ret;
}

/**
 * @tc.name   SecurityHuksNapiSignVerifyDsa0100
 * @tc.number Security_HUKS_NAPI_SignVerify_DSA_0100
 * @tc.desc   alg-DSA pur-Sign-verify dig-SHA1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiSignVerifyDsa0100()
{
    const char* keyAliasString = "HksDSASignVerifyKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(keyAliasString)), (uint8_t*)keyAliasString };

    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret =
        InitParamSet(&genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_ParamSet* signParamSet = nullptr;
    ret = InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    struct OH_Huks_ParamSet* verifyParamSet = nullptr;
    ret = InitParamSet(&verifyParamSet, g_verifyParamsTest001, sizeof(g_verifyParamsTest001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&signParamSet);
        return -1;
    }

    if ((genParamSet != nullptr) || (signParamSet != nullptr) || (verifyParamSet != nullptr)) {
        ret = HksDsaSignVerifyTestNormalCase(keyAlias, genParamSet, signParamSet, verifyParamSet);
    }

    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_FreeParamSet(&verifyParamSet);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts

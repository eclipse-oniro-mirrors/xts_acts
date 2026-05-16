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

#include "include/HuksSignVerifyRsaTest.h"
#include <cstring>
#include <hilog/log.h>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "HUKS_TEST"

namespace Acts {
namespace Huks {

static const uint32_t RSA_COMMON_SIZE = 1024;
static const uint32_t MAX_UPDATE_SIZE = 102400;
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE;

static const std::string IN_DATA =
    "Hks_RSA_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

static struct OH_Huks_Param g_genParamsTest071[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE },
    { .tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_DIGEST }
};

static struct OH_Huks_Param g_signParamsTest071[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE },
    { .tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_DIGEST }
};

static struct OH_Huks_Param g_verifyParamsTest071[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE },
    { .tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_DIGEST }
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

// Helper function: HksTestUpdate
static OH_Huks_Result HksTestUpdate(const struct OH_Huks_Blob* handle,
                                    const struct OH_Huks_ParamSet* paramSet,
                                    const struct OH_Huks_Blob* inData)
{
    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    uint8_t* lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = { .size = MAX_OUTDATA_SIZE, .data = nullptr };

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            outDataSeg.size = inDataSeg.size + MAX_UPDATE_SIZE;
        }

        outDataSeg.data = static_cast<uint8_t*>(malloc(outDataSeg.size));
        if (outDataSeg.data == nullptr) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }

        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        free(outDataSeg.data);
        outDataSeg.data = nullptr;

        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }

        if ((isFinished == false) && (inDataSeg.data + MAX_UPDATE_SIZE > lastPtr)) {
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }
    return ret;
}

// Helper function: Perform sign operation (Init-Update-Finish)
static OH_Huks_Result PerformSignOperation(struct OH_Huks_Blob keyAlias,
                                           struct OH_Huks_ParamSet* signParamSet,
                                           const struct OH_Huks_Blob* inData,
                                           const struct OH_Huks_Blob* finishInData,
                                           struct OH_Huks_Blob* outDataSign)
{
    OH_LOG_INFO(LOG_APP, "[Step 2/6] Starting Sign operation (Init-Update-Finish)...");

    // Init
    uint8_t handleS[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleSign = { sizeof(uint64_t), handleS };
    OH_Huks_Result ret = OH_Huks_InitSession(&keyAlias, signParamSet, &handleSign, nullptr);
    OH_LOG_INFO(LOG_APP, "[Step 2/6] Sign InitSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 2/6] Sign InitSession FAILED, returning");
        return ret;
    }

    // Update loop
    ret = HksTestUpdate(&handleSign, signParamSet, inData);
    OH_LOG_INFO(LOG_APP, "[Step 2/6] Sign UpdateSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 2/6] Sign UpdateSession FAILED, returning");
        return ret;
    }

    // Finish
    ret = OH_Huks_FinishSession(&handleSign, signParamSet, finishInData, outDataSign);
    OH_LOG_INFO(LOG_APP, "[Step 2/6] Sign FinishSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 2/6] Sign FinishSession FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 2/6] Sign operation SUCCEEDED");

    return ret;
}

// Helper function: Export and import public key
static OH_Huks_Result ExportAndImportPublicKey(struct OH_Huks_Blob keyAlias,
                                               struct OH_Huks_ParamSet* genParamSet,
                                               struct OH_Huks_ParamSet* verifyParamSet,
                                               struct OH_Huks_Blob* publicKey,
                                               struct OH_Huks_Blob* newKeyAlias)
{
    // Export Public Key
    OH_LOG_INFO(LOG_APP, "[Step 3/6] Exporting public key...");
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, publicKey);
    OH_LOG_INFO(LOG_APP, "[Step 3/6] ExportPublicKeyItem: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 3/6] ExportPublicKeyItem FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 3/6] ExportPublicKeyItem SUCCEEDED");

    // Import Key
    OH_LOG_INFO(LOG_APP, "[Step 4/6] Importing public key...");
    static const char newKey[] = "RSA_Sign_Verify_Import_KeyAlias";
    newKeyAlias->size = static_cast<uint32_t>(strlen(newKey));
    newKeyAlias->data = reinterpret_cast<uint8_t*>(const_cast<char*>(newKey));
    ret = OH_Huks_ImportKeyItem(newKeyAlias, verifyParamSet, publicKey);
    OH_LOG_INFO(LOG_APP, "[Step 4/6] ImportKeyItem: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 4/6] ImportKeyItem FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 4/6] ImportKeyItem SUCCEEDED");

    return ret;
}

// Helper function: Perform verify operation (Init-Update-Finish)
static OH_Huks_Result PerformVerifyOperation(struct OH_Huks_Blob keyAlias,
                                             struct OH_Huks_ParamSet* verifyParamSet,
                                             const struct OH_Huks_Blob* inData,
                                             const struct OH_Huks_Blob* outDataSign)
{
    OH_LOG_INFO(LOG_APP, "[Step 5/6] Starting Verify operation (Init-Update-Finish)...");

    // Init
    uint8_t handleV[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleVerify = { sizeof(uint64_t), handleV };
    OH_Huks_Result ret = OH_Huks_InitSession(&keyAlias, verifyParamSet, &handleVerify, nullptr);
    OH_LOG_INFO(LOG_APP, "[Step 5/6] Verify InitSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 5/6] Verify InitSession FAILED, returning");
        return ret;
    }

    // Update loop
    ret = HksTestUpdate(&handleVerify, verifyParamSet, inData);
    OH_LOG_INFO(LOG_APP, "[Step 5/6] Verify UpdateSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 5/6] Verify UpdateSession FAILED, returning");
        return ret;
    }

    // Finish
    uint8_t temp[] = "out";
    struct OH_Huks_Blob verifyOut = { sizeof(temp), temp };
    ret = OH_Huks_FinishSession(&handleVerify, verifyParamSet, outDataSign, &verifyOut);
    OH_LOG_INFO(LOG_APP, "[Step 5/6] Verify FinishSession: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 5/6] Verify FinishSession FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 5/6] Verify operation SUCCEEDED");

    return ret;
}

// Main test case helper
static OH_Huks_Result HksRsaSignVerifyTestNormalCase(struct OH_Huks_Blob keyAlias,
                                                     struct OH_Huks_ParamSet* genParamSet,
                                                     struct OH_Huks_ParamSet* signParamSet,
                                                     struct OH_Huks_ParamSet* verifyParamSet)
{
    OH_LOG_INFO(LOG_APP, "HksRsaSignVerifyTestNormalCase: Started");

    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()),
                                   reinterpret_cast<uint8_t*>(const_cast<char*>(IN_DATA.c_str())) };
    uint8_t tmpIn[] = "tempIn";
    struct OH_Huks_Blob finishInData = { 0, tmpIn };

    /* 1. Generate Key */
    OH_LOG_INFO(LOG_APP, "[Step 1/6] Generating RSA-2048 key...");
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    OH_LOG_INFO(LOG_APP, "[Step 1/6] GenerateKeyItem completed: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 1/6] GenerateKeyItem FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 1/6] GenerateKeyItem SUCCEEDED");

    /* 2. Sign Three Stage */
    uint8_t outDataS[RSA_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataSign = { RSA_COMMON_SIZE, outDataS };
    ret = PerformSignOperation(keyAlias, signParamSet, &inData, &finishInData, &outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 3 & 4. Export and Import Public Key */
    uint8_t pubKey[OH_HUKS_RSA_KEY_SIZE_1024] = { 0 };
    struct OH_Huks_Blob publicKey = { OH_HUKS_RSA_KEY_SIZE_1024, pubKey };
    struct OH_Huks_Blob newKeyAlias;
    ret = ExportAndImportPublicKey(keyAlias, genParamSet, verifyParamSet, &publicKey, &newKeyAlias);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 5. Verify Three Stage */
    ret = PerformVerifyOperation(newKeyAlias, verifyParamSet, &inData, &outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 6. Delete New Key */
    OH_LOG_INFO(LOG_APP, "[Step 6/6] Deleting imported key...");
    ret = OH_Huks_DeleteKeyItem(&newKeyAlias, verifyParamSet);
    OH_LOG_INFO(LOG_APP, "[Step 6/6] DeleteKeyItem: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 6/6] DeleteKeyItem FAILED, returning");
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[Step 6/6] DeleteKeyItem SUCCEEDED");

    OH_LOG_INFO(LOG_APP, "HksRsaSignVerifyTestNormalCase: All steps completed successfully");

    return ret;
}

// Helper function: Initialize RSA sign/verify parameter sets
static int InitRsaSignVerifyParamSets(struct OH_Huks_ParamSet** genParamSet,
                                      struct OH_Huks_ParamSet** signParamSet,
                                      struct OH_Huks_ParamSet** verifyParamSet)
{
    OH_LOG_INFO(LOG_APP, "[Init] Initializing parameter sets...");
    OH_Huks_Result ret =
        InitParamSet(genParamSet, g_genParamsTest071, sizeof(g_genParamsTest071) / sizeof(OH_Huks_Param));
    OH_LOG_INFO(LOG_APP, "[Init] InitParamSet(gen): errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Init] InitParamSet(gen) FAILED, returning -1");
        return -1;
    }

    ret = InitParamSet(signParamSet, g_signParamsTest071, sizeof(g_signParamsTest071) / sizeof(OH_Huks_Param));
    OH_LOG_INFO(LOG_APP, "[Init] InitParamSet(sign): errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Init] InitParamSet(sign) FAILED, cleaning up and returning -1");
        OH_Huks_FreeParamSet(genParamSet);
        return -1;
    }

    ret = InitParamSet(verifyParamSet, g_verifyParamsTest071, sizeof(g_verifyParamsTest071) / sizeof(OH_Huks_Param));
    OH_LOG_INFO(LOG_APP, "[Init] InitParamSet(verify): errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Init] InitParamSet(verify) FAILED, cleaning up and returning -1");
        OH_Huks_FreeParamSet(genParamSet);
        OH_Huks_FreeParamSet(signParamSet);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Init] All parameter sets initialized successfully");

    return 0;
}

// Helper function: Execute RSA sign/verify test with cleanup
static int ExecuteRsaSignVerifyTestWithCleanup(const char* keyAliasString,
                                               struct OH_Huks_ParamSet* genParamSet,
                                               struct OH_Huks_ParamSet* signParamSet,
                                               struct OH_Huks_ParamSet* verifyParamSet)
{
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(keyAliasString)),
                                     reinterpret_cast<uint8_t*>(const_cast<char*>(keyAliasString)) };

    if ((genParamSet != nullptr) || (signParamSet != nullptr) || (verifyParamSet != nullptr)) {
        OH_LOG_INFO(LOG_APP, "[Execute] Calling HksRsaSignVerifyTestNormalCase...");
        OH_Huks_Result ret = HksRsaSignVerifyTestNormalCase(keyAlias, genParamSet, signParamSet, verifyParamSet);
        OH_LOG_INFO(LOG_APP, "[Execute] HksRsaSignVerifyTestNormalCase completed: errorCode=%{public}d", ret.errorCode);

        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[Execute] HksRsaSignVerifyTestNormalCase FAILED, cleaning up and returning -1");
            OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
            OH_Huks_FreeParamSet(&genParamSet);
            OH_Huks_FreeParamSet(&signParamSet);
            OH_Huks_FreeParamSet(&verifyParamSet);
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[Execute] HksRsaSignVerifyTestNormalCase SUCCEEDED");
    } else {
        OH_LOG_ERROR(LOG_APP, "[Execute] Parameter sets are null, skipping test");
    }

    OH_LOG_INFO(LOG_APP, "[Cleanup] Deleting original key...");
    OH_Huks_Result ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    OH_LOG_INFO(LOG_APP, "[Cleanup] DeleteKeyItem: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Cleanup] DeleteKeyItem FAILED, cleaning up and returning -1");
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&signParamSet);
        OH_Huks_FreeParamSet(&verifyParamSet);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Cleanup] DeleteKeyItem SUCCEEDED");

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_FreeParamSet(&verifyParamSet);

    return 0;
}

/**
 * @tc.name   SecurityHuksNapiSignVerifyRsa0100
 * @tc.number Security_HUKS_NAPI_SignVerify_RSA_0100
 * @tc.desc   alg-RSA pur-Sign pad-PKCS1_V1_5 digest-MD5
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiSignVerifyRsa0100()
{
    OH_LOG_INFO(LOG_APP, "========== SecurityHuksNapiSignVerifyRsa0100: Test started ==========");
    OH_LOG_INFO(LOG_APP, "Test configuration: RSA-4096, PADDING_PSS, DIGEST_SHA384");
    OH_LOG_WARN(LOG_APP, "WARNING: RSA-4096 key generation may take 5-60 seconds on development board");

    const char* keyAliasString = "HksRSASignVerifyKeyAliasTest071";
    struct OH_Huks_ParamSet* genParamSet = nullptr;
    struct OH_Huks_ParamSet* signParamSet = nullptr;
    struct OH_Huks_ParamSet* verifyParamSet = nullptr;

    if (InitRsaSignVerifyParamSets(&genParamSet, &signParamSet, &verifyParamSet) != 0) {
        return -1;
    }

    int result = ExecuteRsaSignVerifyTestWithCleanup(keyAliasString, genParamSet, signParamSet, verifyParamSet);

    OH_LOG_INFO(
        LOG_APP, "========== SecurityHuksNapiSignVerifyRsa0100: completed, result=%{public}d ==========", result);
    return result;
}

} // namespace Huks
} // namespace Acts

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

#include "HuksApiTest.h"

namespace HuksApiTest {
OH_Huks_Result InitParamSet3(
    struct OH_Huks_ParamSet **paramSet,
    const struct OH_Huks_Param *params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    return ret;
}
napi_value UserAuthTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_TYPE_FINGERPRINT
    const char *alias = "test_generate_FINGERPRINT_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_AUTH_TIMEOUT, .uint32Param = 0},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UserAuthTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_TYPE_FACE
    const char *alias = "test_generate_FACE_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FACE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UserAuthTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_TYPE_PIN
    const char *alias = "test_generate_PIN_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_PIN},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UserAuthTypeTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_TYPE_TUI_PIN
    const char *alias = "test_generate_TUI_PIN_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_TUI_PIN},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_ALWAYS_VALID},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    int result = 1;
    if (ohResult1.errorCode == OH_HUKS_SUCCESS || ohResult1.errorCode == OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED) {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value AuthAccessTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD
    const char *alias = "test_generate_PASSWORD_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value AuthAccessTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL
    const char *alias = "test_generate_ENROLL_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value AuthAccessTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AUTH_ACCESS_ALWAYS_VALID
    const char *alias = "test_generate_VALID_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_ALWAYS_VALID},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UserAuthModeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_MODE_LOCAL
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_USER_AUTH_MODE, .uint32Param = OH_HUKS_USER_AUTH_MODE_LOCAL}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UserAuthModeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_USER_AUTH_MODE_COAUTH
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_MODE, .uint32Param = OH_HUKS_USER_AUTH_MODE_COAUTH},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_012(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_NO_AUTH_REQUIRED
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_PIN},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_013(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_USER_AUTH_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_014(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AUTH_TIMEOUT
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_PIN},
        {.tag = OH_HUKS_TAG_AUTH_TIMEOUT, .uint32Param = 0},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_015(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AUTH_TOKEN
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t tokenData[256] = {0};
    struct OH_Huks_Blob tokenBlob = {sizeof(tokenData), tokenData};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_PIN},
        {.tag = OH_HUKS_TAG_AUTH_TOKEN, .blob  = tokenBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_016(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_ALWAYS_VALID},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_021(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_USER_AUTH_MODE
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_USER_AUTH_MODE, .uint32Param = OH_HUKS_USER_AUTH_MODE_LOCAL}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_026(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_AUTH_ID
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    const char *authId = "user_pin_12345";
    struct OH_Huks_Blob authIdBlob = {
        .size = (uint32_t)strlen(authId),
        .data = (uint8_t *)authId
    };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ID, .blob = authIdBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet3(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

}
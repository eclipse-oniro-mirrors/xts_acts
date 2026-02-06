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
OH_Huks_Result InitParamSet2(
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

napi_value ChallengeTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_TYPE_NORMAL
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_NORMAL}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengeTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_TYPE_CUSTOM
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengeTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_TYPE_NONE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengePositionTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_POS_0
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_0}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengePositionTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_POS_1
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_1}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengePositionTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_POS_2
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_2}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ChallengePositionTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_CHALLENGE_POS_3
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value SecureSignTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_SECURE_SIGN_WITH_AUTHINFO
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE, .uint32Param = OH_HUKS_SECURE_SIGN_WITH_AUTHINFO}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_KEY_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_INFO
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t infoData[] = {0x74, 0x65, 0x73, 0x74, 0x5F, 0x69, 0x6E, 0x66, 0x6F};
    struct OH_Huks_Blob infoBlob = {
        .size = sizeof(infoData),
        .data = infoData
    };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_ONLY_USED_IN_HUKS},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
        {.tag = OH_HUKS_TAG_INFO, .blob = infoBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AGREE_ALG
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_AGREE_ALG, .uint32Param = OH_HUKS_ALG_ECDH},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS, .boolParam = false},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_005(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    const char *alias1 = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob1 = { .size = (uint32_t)strlen(alias1), .data = (uint8_t *)alias1 };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS, .blob = aliasBlob1},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_006(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AGREE_PUBLIC_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    const char *alias1 = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob1 = { .size = (uint32_t)strlen(alias1), .data = (uint8_t *)alias1 };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_AGREE_PUBLIC_KEY, .blob = aliasBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_007(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_IMPORT_KEY_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_IMPORT_KEY_TYPE, .uint32Param = OH_HUKS_KEY_TYPE_PUBLIC_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
        {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_008(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_TEMP},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_009(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
        {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
        {.tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_DIGEST},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_010(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_ALL_USERS
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALL_USERS, .boolParam = false},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_011(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_USER_ID
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_USER_ID, .uint32Param = 1000},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_017(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE, .uint32Param = OH_HUKS_SECURE_SIGN_WITH_AUTHINFO}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_018(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_CHALLENGE_TYPE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_019(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_CHALLENGE_POS
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_CHALLENGE_TYPE, .uint32Param = OH_HUKS_CHALLENGE_TYPE_CUSTOM},
        {.tag = OH_HUKS_TAG_CHALLENGE_POS, .uint32Param = OH_HUKS_CHALLENGE_POS_3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_020(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_AUTH_PURPOSE
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE},
        {.tag = OH_HUKS_TAG_KEY_AUTH_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}


napi_value TagTest_022(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_ATTESTATION_APPLICATION_ID
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    const char *appId = "com.acts.actshuksapi20ndktest";
    struct OH_Huks_Blob applicationIdBlob = {
        .size = (uint32_t)strlen(appId),
        .data = (uint8_t *)appId
    };
    uint8_t challenge[] = {0x01, 0x02, 0x03, 0x04, 0x05};
    struct OH_Huks_Blob challengeBlob = {
        .size = sizeof(challenge),
        .data = challenge
    };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
        {.tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = challengeBlob},
        {.tag = OH_HUKS_TAG_ATTESTATION_APPLICATION_ID, .blob = applicationIdBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_023(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_OVERRIDE
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = false}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_024(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_IS_KEY_ALIAS
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = false},
        {.tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = false}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_025(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_IS_ALLOWED_WRAP
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = false},
        {.tag = OH_HUKS_TAG_IS_ALLOWED_WRAP, .boolParam = true}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}


napi_value TagTest_027(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_ROLE
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_KEY_ROLE, .uint32Param = OH_HUKS_DIGEST_NONE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_028(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_FLAG
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_FLAG, .uint32Param = OH_HUKS_KEY_FLAG_IMPORT_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_029(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_IS_ASYNCHRONIZED
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_IS_ASYNCHRONIZED, .boolParam = true}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_030(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_KEY_DOMAIN
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_031(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET, .boolParam = false}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_032(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_AE_TAG
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t authTag[16] = {0};
    struct OH_Huks_Blob authTagBlob = {sizeof(authTag), authTag};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_AE_TAG, .blob = authTagBlob}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_033(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_SYMMETRIC_KEY_DATA
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t externalKey[32] = {
        0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
        0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10,
        0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
        0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x00
    };
    struct OH_Huks_Blob keyDataBlob  = {sizeof(externalKey), externalKey};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
        {.tag = OH_HUKS_TAG_SYMMETRIC_KEY_DATA, .blob = keyDataBlob}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_034(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t pubKeyBuffer[1024] = {0};
    struct OH_Huks_Blob keyDataBlob  = {.size = sizeof(pubKeyBuffer), .data = pubKeyBuffer};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
        {.tag = OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA, .blob = keyDataBlob},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TagTest_035(napi_env env, napi_callback_info info)
{
    // OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA
    const char *alias = "test_generate_invalid_param1";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Blob publicKeyBlob = {.size = 0, .data = NULL};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
        {.tag = OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA, .blob = publicKeyBlob}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet2(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
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
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
OH_Huks_Result InitParamSet1(
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

napi_value KeyPurposeTest_001(napi_env env, napi_callback_info info)
{
    //OH_HUKS_KEY_PURPOSE_WRAP
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_WRAP | OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyPurposeTest_002(napi_env env, napi_callback_info info)
{
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyDigestTest_001(napi_env env, napi_callback_info info)
{
    //OH_HUKS_DIGEST_MD5
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_192},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_MD5},
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyDigestTest_002(napi_env env, napi_callback_info info)
{
    //OH_HUKS_DIGEST_SM3
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyDigestTest_003(napi_env env, napi_callback_info info)
{
    //OH_HUKS_DIGEST_SHA224
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        // 算法类型：HMAC
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        // 密钥大小：SHA-224推荐224位或256位密钥
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        // 用途：消息认证码
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        // 摘要算法：SHA-224（224位输出）
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA224},
        // 填充模式：无填充
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        // 块模式：CBC（默认值）
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyDigestTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_DIGEST_SHA512
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        // 算法类型：HMAC
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        // 密钥大小：SHA-512推荐512位密钥以获得最佳安全性
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
        // 用途：消息认证码
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        // 摘要算法：SHA-512（512位输出，高安全性）
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA512},
        // 填充模式：无填充
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        // 块模式：CBC（默认值）
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
        InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyPaddingTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_PADDING_PKCS1_V1_5
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyPaddingTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_PADDING_PKCS5
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS5},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyPaddingTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_PADDING_PKCS7
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyPaddingTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_ISO_IEC_9796_2},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyPaddingTest_004",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : ohResult1.errorCode, &retValue);
    return retValue;
}

napi_value KeyPaddingTest_005(napi_env env, napi_callback_info info)
{
    // OH_HUKS_PADDING_ISO_IEC_9797_1
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t IV[IV_SIZE] = { 0 };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA512},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_ISO_IEC_9797_1},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CipherModeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_MODE_CBC
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA512},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CipherModeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_MODE_CTR
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CipherModeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_MODE_OFB
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_OFB},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CipherModeTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_MODE_CFB
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CFB},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CipherModeTest_005(napi_env env, napi_callback_info info)
{
    // OH_HUKS_MODE_CCM
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CCM},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_RSA_KEY_SIZE_512
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_512] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_512, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&aliasBlob, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_RSA_KEY_SIZE_768
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_768] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_768, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&aliasBlob, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_RSA_KEY_SIZE_3072
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_3072] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_3072, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&aliasBlob, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ECC_KEY_SIZE_224
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_224},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeySizeTest_004",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : ohResult1.errorCode, &retValue);
    return retValue;
}

napi_value KeySizeTest_005(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ECC_KEY_SIZE_256
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_006(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ECC_KEY_SIZE_384
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_384},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_007(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ECC_KEY_SIZE_521
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_521},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_008(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AES_KEY_SIZE_128
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_009(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AES_KEY_SIZE_192
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_192},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_010(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AES_KEY_SIZE_512
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_011(napi_env env, napi_callback_info info)
{
    // OH_HUKS_DH_KEY_SIZE_2048
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DH},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DH_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_012(napi_env env, napi_callback_info info)
{
    // OH_HUKS_DH_KEY_SIZE_3072
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DH},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DH_KEY_SIZE_3072},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeySizeTest_012",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_013(napi_env env, napi_callback_info info)
{
    // OH_HUKS_DH_KEY_SIZE_4096
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DH},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DH_KEY_SIZE_4096},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeySizeTest_013",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_014(napi_env env, napi_callback_info info)
{
    // OH_HUKS_SM2_KEY_SIZE_256
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_015(napi_env env, napi_callback_info info)
{
    // OH_HUKS_SM4_KEY_SIZE_128
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t desIv[] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM4},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM4_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
        {.tag = OH_HUKS_TAG_IV, .blob = {.size = PARAM_16, .data = desIv}}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_016(napi_env env, napi_callback_info info)
{
    // OH_HUKS_DES_KEY_SIZE_64
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DES_KEY_SIZE_64},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeySizeTest_016",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : ohResult1.errorCode, &retValue);
    return retValue;
}

napi_value KeySizeTest_017(napi_env env, napi_callback_info info)
{
    // OH_HUKS_3DES_KEY_SIZE_128
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    uint8_t triDesIv[PARAM_8] = {0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27};
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_3DES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_3DES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeySizeTest_018(napi_env env, napi_callback_info info)
{
    // OH_HUKS_3DES_KEY_SIZE_192
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_3DES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_3DES_KEY_SIZE_192},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeySizeTest_018",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_ECC
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_HMAC
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_ECDH
    const char *alias = "test_generate_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECDH},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_ED25519
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_005(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_DH
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DH},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DH_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_006(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_SM2
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_007(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_SM3
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM3},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_008(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_SM4
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM4},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM4_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_009(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_DES
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DES_KEY_SIZE_64},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyAlgTest_009",
                 "InitParamSet failed: %{public}s", ohResult1.errorMsg);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_010(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_3DES
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_3DES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_3DES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyAlgTest_011(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ALG_CMAC
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_CMAC},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_3DES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_ISO_IEC_9797_1},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value AlgSuiteTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
        {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyGenerateTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_GENERATE_TYPE_DERIVE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HKDF},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
        {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DERIVE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyGenerateTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_GENERATE_TYPE_AGREE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_AGREE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyFlagTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_FLAG_IMPORT_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_FLAG, .uint32Param = OH_HUKS_KEY_FLAG_IMPORT_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyFlagTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_FLAG_GENERATE_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_FLAG, .uint32Param = OH_HUKS_KEY_FLAG_GENERATE_KEY},
        // 密钥算法和属
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        // 可选：密钥访问控制
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_FINGERPRINT},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyFlagTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_FLAG_AGREE_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_FLAG, .uint32Param = OH_HUKS_KEY_FLAG_GENERATE_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DH},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_DH_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyFlagTypeTest_004(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_FLAG_DERIVE_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_FLAG, .uint32Param = OH_HUKS_KEY_FLAG_GENERATE_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_OFB},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyStorageTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_STORAGE_TEMP
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
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyStorageTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_STORAGE_ONLY_USED_IN_HUKS
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_ONLY_USED_IN_HUKS},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value KeyStorageTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_STORAGE_KEY_EXPORT_ALLOWED
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_KEY_EXPORT_ALLOWED},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_128},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS7},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_TYPE_PUBLIC_KEY
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
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_TYPE_PRIVATE_KEY
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_IMPORT_KEY_TYPE, .uint32Param = OH_HUKS_KEY_TYPE_PRIVATE_KEY},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
        {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyTypeTest_003(napi_env env, napi_callback_info info)
{
    // OH_HUKS_KEY_TYPE_KEY_PAIR
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_IMPORT_KEY_TYPE, .uint32Param = OH_HUKS_KEY_TYPE_KEY_PAIR},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
        {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value RsaPssSaltLenTypeTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_RSA_PSS_SALT_LEN_DIGEST
    const char *alias = "test_generate_DIGEST_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
        {.tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_DIGEST},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value RsaPssSaltLenTypeTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_RSA_PSS_SALT_LEN_MAX
    const char *alias = "test_generate_MAX_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
        {.tag = OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE, .uint32Param = OH_HUKS_RSA_PSS_SALT_LEN_MAX},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_001(napi_env env, napi_callback_info info)
{
    //OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT
    const char *alias = "test_key_insufficient_memory";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult = OH_Huks_InitParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    struct OH_Huks_Param hugeParam = {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = g_size1
    };
    ohResult = OH_Huks_AddParams(paramSet, &hugeParam, 1);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111",
                 "GenerateKeyItem result: %{public}d", ohResult.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

struct OH_Huks_Param g_testerrcodeParam[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = false}
};

napi_value ErrCodeTest_002(napi_env env, napi_callback_info info)
{
    //OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    auto ohResult = InitParamSet1(&paramSet, g_testerrcodeParam,
                                  sizeof(g_testerrcodeParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    struct OH_Huks_Param invalidParams[] = {
        {
            .tag = OH_HUKS_TAG_ALGORITHM,
            .uint32Param = INVALID_Param
        },
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5
        },
        {
            .tag = OH_HUKS_TAG_DIGEST,
            .uint32Param = OH_HUKS_DIGEST_SHA256
        }
    };
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;
    InitParamSet1(&verifyParamSet, invalidParams, sizeof(invalidParams) / sizeof(OH_Huks_Param));
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = (uint32_t)strlen(tmpKey), .data = (uint8_t *)tmpKey};
    auto ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_003(napi_env env, napi_callback_info info)
{
    //OH_HUKS_ERR_CODE_ITEM_NOT_EXIST
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    char tmpKeyAlias1[] = "HksRSACipherKeyAliasTest0001";
    OH_Huks_Blob wrappingKeyAlias = {sizeof(tmpKeyAlias1),
        reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias1))};
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&wrappingKeyAlias, nullptr, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret1 Export %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_004(napi_env env, napi_callback_info info)
{
    const char *alias = "test_key_require_device_password";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET, .boolParam = true}
    };
    auto ohResult = OH_Huks_InitParamSet(&paramSet);
    ohResult = OH_Huks_AddParams(paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_BuildParamSet(&paramSet);
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111",
                 "GenerateKeyItem result: %{public}d, expected: %{public}d", ohResult.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_005(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    auto ohResult = InitParamSet1(&paramSet, g_testerrcodeParam,
                                  sizeof(g_testerrcodeParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111",
                 "First GenerateKey success: %{public}d", ohResult.errorCode);
    struct OH_Huks_Result ohResult2 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111",
                 "Second GenerateKey result: %{public}d", ohResult2.errorCode);
    OH_Huks_IsKeyItemExist(&aliasBlob, nullptr);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult2.errorCode == OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_006(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_WrapKey(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ErrCodeTest_007(napi_env env, napi_callback_info info)
{
    // OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
        {.tag = OH_HUKS_TAG_NO_AUTH_REQUIRED, .boolParam = true},
        {.tag = OH_HUKS_TAG_USER_AUTH_TYPE, .uint32Param = OH_HUKS_USER_AUTH_TYPE_TUI_PIN},
        {.tag = OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE, .uint32Param = OH_HUKS_AUTH_ACCESS_ALWAYS_VALID},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    auto ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
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

napi_value AuthStorageLevelTest_001(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AUTH_STORAGE_LEVEL_CE
    const char *alias = "test_generate_CE_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_CE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value AuthStorageLevelTest_002(napi_env env, napi_callback_info info)
{
    // OH_HUKS_AUTH_STORAGE_LEVEL_ECE
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param testParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ED25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_ECE}
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet1(&paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult1 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111111",
                 "InitParamSet failed: %{public}d", ohResult1.errorCode);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult1.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

}
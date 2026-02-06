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

#include <nativehuks/OHHuksTest.h>

namespace OHHuksStructTest {
struct OH_Huks_Param g_testexistKeyParam[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = true}
};

uint8_t testAad[] = {0xAA, 0xBB, 0xCC, 0xDD};
struct OH_Huks_Blob keyDataBlob  = {.size = sizeof(testAad), .data = testAad};
struct OH_Huks_Param g_testParam[] = {
    {.tag = OH_HUKS_TAG_KEY_OVERRIDE, .boolParam = true},
    {.tag = OH_HUKS_TAG_PADDING, .int32Param = OH_HUKS_PADDING_PKCS7},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_DERIVE_KEY_SIZE, .uint64Param = OH_HUKS_TAG_TYPE_UINT},
    {.tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = keyDataBlob},
};

OH_Huks_Result InitParamSet(
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

napi_value GetOHHuksResult0100(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testexistKeyParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    struct OH_Huks_Result ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    napi_value Value;
    int ret = PARAM_NEGATIVE_1;
    if (ohResult.errorMsg) {
        ret = 0;
    }
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_create_int32(env, ret, &Value);
    return Value;
}

napi_value GetOHHuksResult0200(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testexistKeyParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    OH_Huks_Result ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    int ret = PARAM_NEGATIVE_1;
    if (ohResult.data == 0) {
        ret = 0;
    }
    napi_create_int32(env, ret, &Value);
    return Value;
}

napi_value GetOHHuksParamSet0100(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testexistKeyParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    uint32_t cnt = paramSet->paramsCnt;
    int ret = PARAM_NEGATIVE_1;
    if (cnt != 0) {
        ret = 0;
    }
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, ret, &Value);
    return Value;
}

napi_value GetOHHuksParamSet0200(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testexistKeyParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    int ret = PARAM_NEGATIVE_1;
    if (paramSet->params) {
        ret = 0;
    }
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, ret, &Value);
    return Value;
}

napi_value GetOHHuksParam0100(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    bool res = paramSet->params[0].boolParam;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetOHHuksParam0100", "GetOHHuksParam0100: %{public}d", res);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, res == true ? 0 : 1, &Value);
    return Value;
}

napi_value GetOHHuksParam0200(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    int32_t res = paramSet->params[1].int32Param;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetOHHuksParam0200", "GetOHHuksParam0200: %{public}d", res);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, res == PARAM_5 ? 0 : 1, &Value);
    return Value;
}

napi_value GetOHHuksParam0300(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    int32_t res = paramSet->params[PARAM_2].uint32Param;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetOHHuksParam0300", "GetOHHuksParam0300: %{public}d", res);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, res == PARAM_256 ? 0 : 1, &Value);
    return Value;
}

napi_value GetOHHuksParam0400(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    auto res = paramSet->params[PARAM_3].uint64Param;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetOHHuksParam0400", "GetOHHuksParam0400: %{public}d", res);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, res == OH_HUKS_TAG_TYPE_UINT ? 0 : 1, &Value);
    return Value;
}

napi_value GetOHHuksParam0500(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    InitParamSet(&paramSet, g_testParam, sizeof(g_testexistKeyParam) / sizeof(OH_Huks_Param));
    auto res = paramSet->params[PARAM_4].blob;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetOHHuksParam0500", "GetOHHuksParam0500: %{public}d", res);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value Value;
    napi_create_int32(env, res.data[0] == 0xAA ? 0 : 1, &Value);
    return Value;
}

}

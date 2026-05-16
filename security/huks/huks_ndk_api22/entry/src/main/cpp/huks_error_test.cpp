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

#include "testcase_utils.h"
#include "huks_error_test.h"
#include "huks_utils.h"
#include <cstring>

static struct OH_Huks_Blob g_abilityName = {
    (uint32_t)strlen("testAbility"),
    (uint8_t *)"testAbility"
};

struct OH_Huks_Blob g_providerName = {
    (uint32_t)strlen("testProviderName"),
    (uint8_t *)"testProviderName"
};

static struct OH_Huks_ExternalCryptoParam g_abilityParams[] = {
    {
        .tag = OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
        .blob = g_abilityName
    },
};

const char *g_resourceId =
    "{\"providerName\":\"testProviderName\",\"abilityName\":\"CryptoExtension\",\"bundleName\":\"com.example"
    ".cryptoapplication\",\"userid\":100,\"index\":{\"key\":\"testKey\"}}";

napi_value OHHuksNativeApi22Err0100(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_ExternalCryptoParamSet *providerParamSet = nullptr;
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&providerParamSet, g_abilityParams,
        sizeof(g_abilityParams) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS || providerParamSet->paramSetSize == 0 ||
        providerParamSet->paramsCnt == 0 || providerParamSet->params == nullptr) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_RegisterProvider(&g_providerName, providerParamSet);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_PERMISSION_FAIL) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&providerParamSet);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Err0200(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_ExternalCryptoParamSet *providerParamSet = nullptr;
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&providerParamSet, g_abilityParams,
        sizeof(g_abilityParams) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_UnregisterProvider(&g_providerName, providerParamSet);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_PERMISSION_FAIL) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&providerParamSet);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Err0300(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(g_resourceId),
        (uint8_t *)g_resourceId
    };
    struct OH_Huks_ExternalCryptoParamSet *openResourceParamSet = nullptr;
    struct OH_Huks_ExternalCryptoParam g_openResourceParamsTest[] = {};
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&openResourceParamSet, g_openResourceParamsTest,
        sizeof(g_openResourceParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_OpenResource(&resourceId, openResourceParamSet);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&openResourceParamSet);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Err0400(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(g_resourceId),
        (uint8_t *)g_resourceId
    };
    struct OH_Huks_ExternalCryptoParamSet *openResourceParamSet = nullptr;
    struct OH_Huks_ExternalCryptoParam g_openResourceParamsTest[] = {};
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&openResourceParamSet, g_openResourceParamsTest,
        sizeof(g_openResourceParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_CloseResource(&resourceId, openResourceParamSet);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&openResourceParamSet);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Err0500(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(g_resourceId),
        (uint8_t *)g_resourceId
    };
    struct OH_Huks_ExternalCryptoParamSet *pinStateParamSet = nullptr;
    struct OH_Huks_ExternalCryptoParam g_getPinStateParamsTest[] = {};
    OH_Huks_ExternalPinAuthState authState = OH_HUKS_EXT_CRYPTO_PIN_NO_AUTH;
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&pinStateParamSet, g_getPinStateParamsTest,
        sizeof(g_getPinStateParamsTest) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_GetUkeyPinAuthState(&resourceId, pinStateParamSet, &authState);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&pinStateParamSet);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Err0600(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    const char *resourceIdStr = "testResourceId";
    const char *propertyIdStr = "SKF_GetDevInfo";
    struct OH_Huks_Blob resourceId = {
        (uint32_t)strlen(resourceIdStr),
        (uint8_t *)resourceIdStr
    };
    struct OH_Huks_Blob propertyId = {
        (uint32_t)strlen(propertyIdStr),
        (uint8_t *)propertyIdStr
    };
    OH_Huks_ExternalCryptoParam params[] = {};
    OH_Huks_ExternalCryptoParamSet *paramSetIn = nullptr;
    OH_Huks_ExternalCryptoParamSet *paramSetOut = nullptr;
    OH_Huks_Result ohResult = InitExternalCryptoParamSet(&paramSetIn, params,
        sizeof(params) / sizeof(OH_Huks_ExternalCryptoParam));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_GetProperty(&resourceId, &propertyId, paramSetIn, &paramSetOut);
    if (ohResult.errorCode != OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        res = TEST_FAIL;
    }
    OH_Huks_FreeExternalCryptoParamSet(&paramSetIn);
    OH_Huks_FreeExternalCryptoParamSet(&paramSetOut);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}
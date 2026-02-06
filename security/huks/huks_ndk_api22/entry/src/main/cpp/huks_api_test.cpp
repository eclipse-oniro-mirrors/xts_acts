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

#include "huks_api_test.h"
#include "testcase_utils.h"
#include "huks/native_huks_api.h"
#include "huks/native_huks_type.h"
#include "huks/native_huks_param.h"
#include "huks/native_huks_external_crypto_api.h"
#include <cstring>

napi_value OHHuksNativeApi22Type0100(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_EXT_CRYPTO_TAG_UKEY_PIN == (OH_HUKS_TAG_TYPE_BYTES | 200001)) &
        (OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME == (OH_HUKS_TAG_TYPE_BYTES | 200002)) &
        (OH_HUKS_EXT_CRYPTO_TAG_EXTRA_DATA == (OH_HUKS_TAG_TYPE_BYTES | 200003)) &
        (OH_HUKS_EXT_CRYPTO_TAG_UID == (OH_HUKS_TAG_TYPE_INT | 200004)) &
        (OH_HUKS_EXT_CRYPTO_TAG_PURPOSE == (OH_HUKS_TAG_TYPE_INT | 200005)) &
        (OH_HUKS_EXT_CRYPTO_TAG_TIMEOUT == (OH_HUKS_TAG_TYPE_UINT | 200006))) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Type0200(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_EXT_CRYPTO_PIN_NO_AUTH == 0) & (OH_HUKS_EXT_CRYPTO_PIN_AUTH_SUCCEEDED == 1) &
        (OH_HUKS_EXT_CRYPTO_PIN_LOCKED == 2)) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}


napi_value OHHuksNativeApi22Utils0100(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_Blob g_abilityName = {
        (uint32_t)strlen("testAbility"),
        (uint8_t *)"testAbility"
    };
    struct OH_Huks_Blob g_uid = {
        (uint32_t)strlen("12345678"),
        (uint8_t *)"12345678"
    };
    struct OH_Huks_ExternalCryptoParam params[] = {
        {
            .tag = OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
            .blob = g_abilityName
        },
        {
            .tag = OH_HUKS_EXT_CRYPTO_TAG_UID,
            .blob = g_uid
        },
    };
    struct OH_Huks_ExternalCryptoParamSet *paramSet = nullptr;
    struct OH_Huks_ExternalCryptoParam *paramGot = nullptr;
    OH_Huks_Result ohResult = OH_Huks_InitExternalCryptoParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_AddExternalCryptoParams(paramSet, params, 2);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(&paramSet);
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_BuildExternalCryptoParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_GetExternalCryptoParam(paramSet, OH_HUKS_EXT_CRYPTO_TAG_UID, &paramGot);
    if (ohResult.errorCode != OH_HUKS_SUCCESS || paramGot == nullptr) {
        res = TEST_FAIL;
    }
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(&paramSet);
        res = TEST_FAIL;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}
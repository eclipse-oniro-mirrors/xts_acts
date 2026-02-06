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

#include "InputmethodTextAvoidInfoCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_text_avoid_info_capi.h>
#include <napi/native_api.h>

void AddInputmethodTextAvoidInfoCapiTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhTextAvoidInfoSetPositionYNullPointer", nullptr,
                        TestOhTextAvoidInfoSetPositionYNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoSetPositionYOk", nullptr, TestOhTextAvoidInfoSetPositionYOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoSetHeightNullPointer", nullptr, TestOhTextAvoidInfoSetHeightNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoSetHeightOk", nullptr, TestOhTextAvoidInfoSetHeightOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoGetPositionYNullPointer", nullptr,
                        TestOhTextAvoidInfoGetPositionYNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoGetPositionYOk", nullptr, TestOhTextAvoidInfoGetPositionYOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoGetHeightNullPointer", nullptr, TestOhTextAvoidInfoGetHeightNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhTextAvoidInfoGetHeightOk", nullptr, TestOhTextAvoidInfoGetHeightOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

napi_value TestOhTextAvoidInfoSetPositionYNullPointer(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    int ret = OH_TextAvoidInfo_SetPositionY(nullptr, expPositionY);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoSetPositionYOk(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    int ret = OH_TextAvoidInfo_SetPositionY(textAvoidInfo, expPositionY);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoSetHeightNullPointer(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    int ret = OH_TextAvoidInfo_SetHeight(nullptr, expHeight);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoSetHeightOk(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    int ret = OH_TextAvoidInfo_SetHeight(textAvoidInfo, expHeight);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoGetPositionYNullPointer(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    OH_TextAvoidInfo_SetPositionY(textAvoidInfo, expPositionY);
    double actPositionY = 0.0;
    int ret = OH_TextAvoidInfo_GetPositionY(nullptr, &actPositionY);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoGetPositionYOk(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    OH_TextAvoidInfo_SetPositionY(textAvoidInfo, expPositionY);
    double actPositionY = 0.0;
    int ret = OH_TextAvoidInfo_GetPositionY(textAvoidInfo, &actPositionY);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoGetHeightNullPointer(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    double actHeight = 0.0;
    OH_TextAvoidInfo_SetHeight(textAvoidInfo, expHeight);
    int ret = OH_TextAvoidInfo_GetHeight(nullptr, &actHeight);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhTextAvoidInfoGetHeightOk(napi_env env, napi_callback_info info)
{
    double expPositionY = 20;
    double expHeight = 20;
    InputMethod_TextAvoidInfo *textAvoidInfo = OH_TextAvoidInfo_Create(expPositionY, expHeight);
    double actHeight = 0.0;
    OH_TextAvoidInfo_SetHeight(textAvoidInfo, expHeight);
    int ret = OH_TextAvoidInfo_GetHeight(textAvoidInfo, &actHeight);
    OH_TextAvoidInfo_Destroy(textAvoidInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}
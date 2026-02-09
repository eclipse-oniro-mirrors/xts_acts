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

#include "InputmethodCursorInfoCapiTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <napi/native_api.h>

void AddInputMethodCursorInfoCapiTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhCursorInfoSetRectNullPointer", nullptr,
                        TestOhCursorInfoSetRectNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhCursorInfoSetRectOk", nullptr,
                        TestOhCursorInfoSetRectOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhCursorInfoGetRectNullPointer", nullptr,
                        TestOhCursorInfoGetRectNullPointer, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testOhCursorInfoGetRectOk", nullptr,
                        TestOhCursorInfoGetRectOk, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
}

napi_value TestOhCursorInfoSetRectNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_CursorInfo *cursorInfo = nullptr;
    double left = 0;
    double top = 0;
    double width = 0;
    double height = 0;
    int ret = OH_CursorInfo_SetRect(cursorInfo, left, top, width, height);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhCursorInfoSetRectOk(napi_env env, napi_callback_info info)
{
    double left = 1.1;
    double top = 2.2;
    double width = 3.3;
    double height = 4.4;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    double left1 = 0;
    double top1 = 0;
    double width1 = 0;
    double height1 = 0;
    int ret = OH_CursorInfo_SetRect(cursorInfo, left1, top1, width1, height1);
    OH_CursorInfo_Destroy(cursorInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhCursorInfoGetRectNullPointer(napi_env env, napi_callback_info info)
{
    InputMethod_CursorInfo *cursorInfo = nullptr;
    double left = 0;
    double top = 0;
    double width = 0;
    double height = 0;
    int ret = OH_CursorInfo_GetRect(cursorInfo, &left, &top, &width, &height);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhCursorInfoGetRectOk(napi_env env, napi_callback_info info)
{
    double left = 1.1;
    double top = 2.2;
    double width = 3.3;
    double height = 4.4;
    InputMethod_CursorInfo *cursorInfo = OH_CursorInfo_Create(left, top, width, height);
    double left1 = 0;
    double top1 = 0;
    double width1 = 0;
    double height1 = 0;
    OH_CursorInfo_SetRect(cursorInfo, left1, top1, width1, height1);
    int ret = OH_CursorInfo_GetRect(cursorInfo, &left1, &top1, &width1, &height1);
    OH_CursorInfo_Destroy(cursorInfo);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}
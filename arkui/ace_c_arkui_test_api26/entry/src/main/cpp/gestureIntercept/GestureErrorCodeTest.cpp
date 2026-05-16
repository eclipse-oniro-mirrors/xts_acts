/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <hilog/log.h>
#include <arkui/native_gesture.h>

namespace ArkUICapiTest {
static napi_value GestureInterceptErrorCode001(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_GestureCollectInterceptInfo_GetResponseRecognizers(nullptr, nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value GestureInterceptErrorCode002(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_GestureCollectInterceptInfo_GetTouchRecognizers(nullptr, nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value GestureInterceptErrorCode003(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_GetGestureBindNodeUniqueId(nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value GestureInterceptErrorCode004(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_GestureCollectInterceptInfo_SetGestureCollectIntervention(nullptr, OH_ARKUI_GESTURE_COLLECT_INTERVENTION_CONTINUE);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value GestureInterceptNullTest001(napi_env env, napi_callback_info info)
{
    auto resultTest = 0;
    auto result = OH_ArkUI_NodeEvent_GetGestureCollectInterceptInfo(nullptr);
    if (result == nullptr) {
        resultTest = 1;
    }
    {
        napi_value assertEqErr = EqFailed(env, (resultTest), (1));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}
}
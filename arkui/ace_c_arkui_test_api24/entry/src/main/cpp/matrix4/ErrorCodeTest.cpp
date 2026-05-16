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

namespace ArkUICapiTest {

static napi_value TestErrorCode001(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Invert(nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode002(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Combine(nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode003(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Translate(nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode004(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Scale(nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode005(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Rotate(nullptr, nullptr);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode006(napi_env env, napi_callback_info info)
{
    auto error = OH_ArkUI_Matrix4_Skew(nullptr, PARAM_1, PARAM_1);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode007(napi_env env, napi_callback_info info)
{
    ArkUI_PointF originPoint = {SIZE_50, SIZE_50};
    ArkUI_PointF resultPoint = {PARAM_0, PARAM_0};
    auto error = OH_ArkUI_Matrix4_TransformPoint(nullptr, &originPoint, &resultPoint);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode008(napi_env env, napi_callback_info info)
{
    ArkUI_PointF src1[PARAM_4] = {
        {PARAM_0, PARAM_0}, {PARAM_100, PARAM_0}, {PARAM_0, PARAM_100}, {PARAM_100, PARAM_100}};
    ArkUI_PointF dst1[PARAM_4] = {{SIZE_50, PARAM_0}, {SIZE_150, PARAM_0}, {SIZE_50, PARAM_100}, {SIZE_150, PARAM_100}};
    auto error = OH_ArkUI_Matrix4_SetPolyToPoly(nullptr, src1, dst1, PARAM_0);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode009(napi_env env, napi_callback_info info)
{
    float result[PARAM_16] = {
        1.0f, 0.0f, 0.0f, 0.0f,
        0.0f, 1.0f, 0.0f, 0.0f,
        0.0f, 0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 0.0f, 1.0f
    };
    auto error = OH_ArkUI_Matrix4_GetElements(nullptr, result);
    {
        napi_value assertEqErr = EqFailed(env, (error), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode010(napi_env env, napi_callback_info info)
{
    auto error1 = OH_ArkUI_Matrix4TranslationOptions_SetX(nullptr, 1);
    auto error2 = OH_ArkUI_Matrix4TranslationOptions_SetY(nullptr, 1);
    auto error3 = OH_ArkUI_Matrix4TranslationOptions_SetZ(nullptr, 1);
    auto error4 = OH_ArkUI_Matrix4TranslationOptions_GetX(nullptr, nullptr);
    auto error5 = OH_ArkUI_Matrix4TranslationOptions_GetY(nullptr, nullptr);
    auto error6 = OH_ArkUI_Matrix4TranslationOptions_GetZ(nullptr, nullptr);
    for (auto err : {error1, error2, error3, error4, error5, error6}) {
        napi_value assertEqErr = EqFailed(env, (err), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode011(napi_env env, napi_callback_info info)
{
    auto error1 = OH_ArkUI_Matrix4ScaleOptions_SetX(nullptr, PARAM_1);
    auto error2 = OH_ArkUI_Matrix4ScaleOptions_SetY(nullptr, PARAM_1);
    auto error3 = OH_ArkUI_Matrix4ScaleOptions_SetZ(nullptr, PARAM_1);
    auto error4 = OH_ArkUI_Matrix4ScaleOptions_SetCenterX(nullptr, PARAM_1);
    auto error5 = OH_ArkUI_Matrix4ScaleOptions_SetCenterY(nullptr, PARAM_1);
    auto error6 = OH_ArkUI_Matrix4ScaleOptions_GetX(nullptr, nullptr);
    auto error7 = OH_ArkUI_Matrix4ScaleOptions_GetY(nullptr, nullptr);
    auto error8 = OH_ArkUI_Matrix4ScaleOptions_GetZ(nullptr, nullptr);
    auto error9 = OH_ArkUI_Matrix4ScaleOptions_GetCenterX(nullptr, nullptr);
    auto error10 = OH_ArkUI_Matrix4ScaleOptions_GetCenterY(nullptr, nullptr);
    for (auto err : {error1, error2, error3, error4, error5, error6, error7, error8, error9, error10}) {
        napi_value assertEqErr = EqFailed(env, (err), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}

static napi_value TestErrorCode012(napi_env env, napi_callback_info info)
{
    auto error1 = OH_ArkUI_Matrix4RotationOptions_SetX(nullptr, PARAM_1);
    auto error2 = OH_ArkUI_Matrix4RotationOptions_SetY(nullptr, PARAM_1);
    auto error3 = OH_ArkUI_Matrix4RotationOptions_SetZ(nullptr, PARAM_1);
    auto error4 = OH_ArkUI_Matrix4RotationOptions_SetCenterX(nullptr, PARAM_1);
    auto error5 = OH_ArkUI_Matrix4RotationOptions_SetCenterY(nullptr, PARAM_1);
    auto error6 = OH_ArkUI_Matrix4RotationOptions_SetAngle(nullptr, PARAM_1);
    auto error7 = OH_ArkUI_Matrix4RotationOptions_GetX(nullptr, nullptr);
    auto error8 = OH_ArkUI_Matrix4RotationOptions_GetY(nullptr, nullptr);
    auto error9 = OH_ArkUI_Matrix4RotationOptions_GetZ(nullptr, nullptr);
    auto error10 = OH_ArkUI_Matrix4RotationOptions_GetCenterX(nullptr, nullptr);
    auto error11 = OH_ArkUI_Matrix4RotationOptions_GetCenterY(nullptr, nullptr);
    auto error12 = OH_ArkUI_Matrix4RotationOptions_GetAngle(nullptr, nullptr);
    for (auto err : {error1, error2, error3, error4, error5, error6, error7, error8, error9, error10, error11,
            error12}) {
        napi_value assertEqErr = EqFailed(env, (err), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (assertEqErr != nullptr) {
            return assertEqErr;
        }
    }
    return NapiReturnSuccessInt32(env);
}
} // namespace ArkUICapiTest

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

#include "AnimatorOptionTest.h"
#include <arkui/native_animate.h>
#include "common/Common.h"

namespace AnimatorOptionTest {

napi_value AnimatorOptionSetCurve0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_AnimatorOption_SetCurve(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetCurve0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_AnimatorOption_SetCurve(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetBegin0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    float value = 0.0f;
    int32_t result = OH_ArkUI_AnimatorOption_SetBegin(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetBegin0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    float value = 0.0f;
    int32_t result = OH_ArkUI_AnimatorOption_SetBegin(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetEnd0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    float value = 1.0f;
    int32_t result = OH_ArkUI_AnimatorOption_SetEnd(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetEnd0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    float value = 1.0f;
    int32_t result = OH_ArkUI_AnimatorOption_SetEnd(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetExpectedFrameRateRange0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_ExpectedFrameRateRange Range = {
        .min = 0,
        .max = 100,
        .expected = 50
    };
    ArkUI_ExpectedFrameRateRange* value = static_cast<ArkUI_ExpectedFrameRateRange*>(&Range);
    int32_t result = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetExpectedFrameRateRange0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    ArkUI_ExpectedFrameRateRange Range = {
        .min = 0,
        .max = 100,
        .expected = 50
    };
    ArkUI_ExpectedFrameRateRange* value = static_cast<ArkUI_ExpectedFrameRateRange*>(&Range);
    int32_t result = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetExpectedFrameRateRange0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_ExpectedFrameRateRange* value = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframe0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframe(option, 0.5f, 0.0f, 0);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframe0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframe(option, 0.5f, 0.0f, 0);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframe0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframe(option, -1.0f, 0.0f, 0);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframe0400(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframe(option, 2.0f, 0.0f, 0);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframe0500(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframe(option, 0.5f, 0.0f, 0);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframeCurve0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframeCurve(option, value, 0);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframeCurve0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframeCurve(option, value, 0);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframeCurve0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_CurveHandle value = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframeCurve(option, value, 1);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetKeyframeCurve0400(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_CurveHandle value = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_SetKeyframeCurve(option, value, -1);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

void AnimatorOnFrameEventCallback(ArkUI_AnimatorOnFrameEvent* event) {}

napi_value AnimatorOptionRegisterOnFrameCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorEvent* event = reinterpret_cast<ArkUI_AnimatorEvent*>(&env);
    void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(option, userData, AnimatorOnFrameEventCallback);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnFrameCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(option, userData, AnimatorOnFrameEventCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnFrameCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(option, userData, nullptr);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

void AnimatorEventCallback(ArkUI_AnimatorEvent* event)
{
}

napi_value AnimatorOptionRegisterOnFinishCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorEvent* event = reinterpret_cast<ArkUI_AnimatorEvent*>(&env);
    void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(option, userData, AnimatorEventCallback);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnFinishCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(option, userData, AnimatorEventCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnFinishCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(option, userData, nullptr);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}


napi_value AnimatorOptionRegisterOnCancelCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorEvent* event = reinterpret_cast<ArkUI_AnimatorEvent*>(&env);
    void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(option, userData, AnimatorEventCallback);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnCancelCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(option, userData, AnimatorEventCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnCancelCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(option, userData, nullptr);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnRepeatCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorEvent* event = reinterpret_cast<ArkUI_AnimatorEvent*>(&env);
    void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(option, userData, AnimatorEventCallback);
    napi_value retValue = 0;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnRepeatCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(option, userData, AnimatorEventCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionRegisterOnRepeatCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    void* userData = nullptr;
    int32_t result = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(option, userData, nullptr);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

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
napi_value KeyframeSetDelay0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t value = 1;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDelay(option, value);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDelay0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    int32_t value = 1;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDelay(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetIterations0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t value = 1;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetIterations(option, value);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetIterations0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    int32_t value = 1;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetIterations(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetIterations0300(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t value = -2;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetIterations(option, value);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

void OnFinish(void* userData) {}

napi_value KeyframeRegisterOnFinishCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int customData = 42;
    void* userData = &customData;
    
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(option, userData, OnFinish);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeRegisterOnFinishCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    void* userData = nullptr;
    void (*onFinish)(void* userData) = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(option, userData, onFinish);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetExpectedFrameRate0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    ArkUI_ExpectedFrameRateRange *frameRate = new ArkUI_ExpectedFrameRateRange;
        frameRate->max = PARAM_100;
        frameRate->expected = PARAM_100;
        frameRate->min = PARAM_100;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate(option, frameRate);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetExpectedFrameRate0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    ArkUI_ExpectedFrameRateRange* frameRate = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate(option, frameRate);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetExpectedFrameRate0300(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    ArkUI_ExpectedFrameRateRange* frameRate = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate(option, frameRate);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDuration0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 1, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDuration0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDuration(option, -1, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDuration0300(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 1, 1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDuration0400(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 1, -1);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetDuration0500(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 1, 1);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetCurve0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetCurve(option, value, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetCurve0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateCurveByType(ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetCurve(option, value, 0);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetCurve0300(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    ArkUI_CurveHandle value = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetCurve(option, value, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeSetCurve0400(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    ArkUI_CurveHandle value = OH_ArkUI_Curve_CreateSpringMotion(0.5f, 0.5f, 0.5f);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_SetCurve(option, value, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

void AnimationCallback(void* userData) {}
napi_value KeyframeRegisterOnEventCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, AnimationCallback, 0);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeRegisterOnEventCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = nullptr;
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, AnimationCallback, 0);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeRegisterOnEventCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, AnimationCallback, -1);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value KeyframeRegisterOnEventCallback0400(napi_env env, napi_callback_info info)
{
    ArkUI_KeyframeAnimateOption* option = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    int32_t result = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, AnimationCallback, 1);
    OH_ArkUI_KeyframeAnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

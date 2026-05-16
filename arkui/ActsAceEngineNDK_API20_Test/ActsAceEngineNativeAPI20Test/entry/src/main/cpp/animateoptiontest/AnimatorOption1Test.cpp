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

#include "arkui/native_animate.h"
#include "AnimatorOptionTest.h"
#include "common/Common.h"

namespace AnimatorOptionTest {
napi_value AnimatorOptionSetDuration0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetDuration(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDuration0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetDuration(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDuration0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t value = -1;
    int32_t result = OH_ArkUI_AnimatorOption_SetDuration(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDelay0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetDelay(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDelay0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetDelay(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetIterations0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetIterations(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetIterations0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    int32_t value = -2;
    int32_t result = OH_ArkUI_AnimatorOption_SetIterations(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetIterations0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    int32_t value = 1;
    int32_t result = OH_ArkUI_AnimatorOption_SetIterations(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetFill0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_AnimationFillMode value = ARKUI_ANIMATION_FILL_MODE_NONE;
    int32_t result = OH_ArkUI_AnimatorOption_SetFill(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetFill0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_AnimationFillMode value = static_cast<ArkUI_AnimationFillMode>(-1);
    int32_t result = OH_ArkUI_AnimatorOption_SetFill(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetFill0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_AnimationFillMode value = static_cast<ArkUI_AnimationFillMode>(1000);
    int32_t result = OH_ArkUI_AnimatorOption_SetFill(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetFill0400(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    ArkUI_AnimationFillMode value = ARKUI_ANIMATION_FILL_MODE_NONE;
    int32_t result = OH_ArkUI_AnimatorOption_SetFill(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDirection0100(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_AnimationDirection value = ARKUI_ANIMATION_DIRECTION_REVERSE;
    int32_t result = OH_ArkUI_AnimatorOption_SetDirection(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDirection0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = nullptr;
    ArkUI_AnimationDirection value = ARKUI_ANIMATION_DIRECTION_REVERSE;
    int32_t result = OH_ArkUI_AnimatorOption_SetDirection(option, value);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorOptionSetDirection0300(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    ArkUI_AnimationDirection value = static_cast<ArkUI_AnimationDirection>(-1);
    int32_t result = OH_ArkUI_AnimatorOption_SetDirection(option, value);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
}

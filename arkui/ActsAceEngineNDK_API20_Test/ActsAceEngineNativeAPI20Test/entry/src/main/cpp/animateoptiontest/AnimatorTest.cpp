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
#include "arkui/native_interface.h"

namespace AnimatorOptionTest {

ArkUI_ContextHandle g_context = nullptr;

napi_value GetArkUIContext(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_ArkUI_GetContextFromNapiValue(env, args[0], &g_context);
    return nullptr;
}

napi_value AnimatorResetAnimatorOption0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_ResetAnimatorOption(animatorHandle, option);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorResetAnimatorOption0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_ResetAnimatorOption(animatorHandle, option);
    OH_ArkUI_AnimatorOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorResetAnimatorOption0300(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
        if (animatorHandle == nullptr) {
        napi_value ret;
        napi_create_int32(env, PARAM_101, &ret);
        return ret;
    }
    int32_t result = OH_ArkUI_Animator_ResetAnimatorOption(animatorHandle, nullptr);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorPlay0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_Play(animatorHandle);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorPlay0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_Play(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorFinish0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_Finish(animatorHandle);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorFinish0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_Finish(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorPause0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_Pause(animatorHandle);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorPause0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_Pause(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorCancel0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_Cancel(animatorHandle);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorCancel0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_Cancel(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorReverse0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    int32_t result = OH_ArkUI_Animator_Reverse(animatorHandle);
    OH_ArkUI_AnimatorOption_Dispose(option);
    animateAPI->disposeAnimator(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value AnimatorReverse0200(napi_env env, napi_callback_info info)
{
    ArkUI_AnimatorHandle animatorHandle = nullptr;
    int32_t result = OH_ArkUI_Animator_Reverse(animatorHandle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value TransitionEffectCombine0100(napi_env env, napi_callback_info info)
{
    ArkUI_TransitionEffect* firstEffect = OH_ArkUI_CreateOpacityTransitionEffect(0.0f);
    ArkUI_TransitionEffect* secondEffect = OH_ArkUI_CreateOpacityTransitionEffect(0.0f);
    int32_t result = OH_ArkUI_TransitionEffect_Combine(firstEffect, secondEffect);
    OH_ArkUI_TransitionEffect_Dispose(firstEffect);
    OH_ArkUI_TransitionEffect_Dispose(secondEffect);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value TransitionEffectCombine0200(napi_env env, napi_callback_info info)
{
    ArkUI_TransitionEffect* firstEffect = nullptr;
    ArkUI_TransitionEffect* secondEffect = OH_ArkUI_CreateOpacityTransitionEffect(0.0f);
    int32_t result = OH_ArkUI_TransitionEffect_Combine(firstEffect, secondEffect);
    OH_ArkUI_TransitionEffect_Dispose(secondEffect);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value TransitionEffectSetAnimation0100(napi_env env, napi_callback_info info)
{
    ArkUI_TransitionEffect* effect = OH_ArkUI_CreateOpacityTransitionEffect(0.0f);
    ArkUI_AnimateOption* option = OH_ArkUI_AnimateOption_Create();
    int32_t result = OH_ArkUI_TransitionEffect_SetAnimation(effect, option);
    OH_ArkUI_TransitionEffect_Dispose(effect);
    OH_ArkUI_AnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value TransitionEffectSetAnimation0200(napi_env env, napi_callback_info info)
{
    ArkUI_TransitionEffect* effect = nullptr;
    ArkUI_AnimateOption* option = OH_ArkUI_AnimateOption_Create();
    int32_t result = OH_ArkUI_TransitionEffect_SetAnimation(effect, option);
    OH_ArkUI_AnimateOption_Dispose(option);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value disposeAnimator0100(napi_env env, napi_callback_info info)
{
    auto animateAPI = reinterpret_cast<ArkUI_NativeAnimateAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1"));
    ArkUI_AnimatorOption* option = OH_ArkUI_AnimatorOption_Create(PARAM_1);
    ArkUI_AnimatorHandle animatorHandle = animateAPI->createAnimator(g_context, option);
    animateAPI->disposeAnimator(animatorHandle);
    animatorHandle = nullptr;
    napi_value retValue;
    if (animatorHandle == nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    return retValue;
}

}
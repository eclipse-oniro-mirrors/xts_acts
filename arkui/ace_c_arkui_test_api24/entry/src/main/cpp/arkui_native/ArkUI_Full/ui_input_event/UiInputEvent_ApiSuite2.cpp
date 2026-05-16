/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "../../../common/common.h"
#include <arkui/ui_input_event.h>

namespace ArkUICapiTest {

static napi_value TestArkUICapi_501(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 1);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_502(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 2);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_503(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 3);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_504(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 4);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_505(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 5);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_508(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 1);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_509(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 2);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_510(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 3);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_511(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 4);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

static napi_value TestArkUICapi_512(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (baseEvt == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    if (cloneEvt == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 5);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return napiAssertErr;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
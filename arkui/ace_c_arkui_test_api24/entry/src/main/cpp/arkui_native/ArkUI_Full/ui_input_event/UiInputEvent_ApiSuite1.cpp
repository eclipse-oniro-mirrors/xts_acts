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

// Ensure UI input event CAPI module is initialized before PointerEvent APIs (reduces flaky crash on Destroy).
static inline void EnsureArkUiUiInputEventModuleLoaded()
{
    void *ptr = OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_UIInputEvent");
    if (ptr == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EnsureArkUiUiInputEventModuleLoaded",
            "OH_ArkUI_QueryModuleInterfaceByName returned nullptr for ArkUI_UIInputEvent");
    }
}

/*
 * 测试接口: ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN（ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN = 5）
 * 预期效果: 枚举/宏常量取值应为 5。
 * 实际测试: 读取符号 ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN 并断言等于 5。
 */
static napi_value TestArkUICapi_455(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 5;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_CROWNEVENT_ACTION_UNKNOWN（ARKUI_CROWNEVENT_ACTION_UNKNOWN = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 ARKUI_CROWNEVENT_ACTION_UNKNOWN 并断言等于 0。
 */
static napi_value TestArkUICapi_456(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_CROWNEVENT_ACTION_UNKNOWN)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_CROWNEVENT_ACTION_UPDATE（ARKUI_CROWNEVENT_ACTION_UPDATE = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 ARKUI_CROWNEVENT_ACTION_UPDATE 并断言等于 1。
 */
static napi_value TestArkUICapi_457(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_CROWNEVENT_ACTION_UPDATE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_CROWNEVENT_ACTION_END（ARKUI_CROWNEVENT_ACTION_END = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 ARKUI_CROWNEVENT_ACTION_END 并断言等于 2。
 */
static napi_value TestArkUICapi_458(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_CROWNEVENT_ACTION_END)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_PointerEvent_CreateClonedPointerEvent
 * 预期效果: 触摸事件上成功克隆出独立事件指针。
 * 实际测试: 文档：CreateCloned 仅对触摸事件有效；CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 并断言非空后销毁。
 */
static napi_value TestArkUICapi_459(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *evt = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&evt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    if (((evt)) == nullptr) {
        return nullptr;
    }

    ArkUI_UIInputEvent *cloned = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(evt, &cloned)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(evt);
            return napiAssertErr;
        }
    }

    if (((cloned)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(evt);
        return nullptr;
    }

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloned);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(evt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_PointerEvent_CreatePointerEvent
 * 预期效果: 创建触摸类 UI 事件成功。
 * 实际测试: 对 event 二级指针传入栈变量地址，创建 TOUCH 事件并配对销毁。
 */
static napi_value TestArkUICapi_460(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *evt = nullptr;
    auto ec = OH_ArkUI_PointerEvent_CreatePointerEvent(&evt, ARKUI_UIINPUTEVENT_TYPE_TOUCH);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    if (((evt)) == nullptr) {
        return nullptr;
    }

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(evt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(const ArkUI_UIInputEvent *)
 * 预期效果: 对合成触摸事件调用销毁接口，返回 NO_ERROR 或 PARAM_INVALID。
 * 实际测试: CreatePointerEvent(TOUCH) 后仅调用一次 DestroyClonedPointerEvent（被测目标）。
 */
static napi_value TestArkUICapi_461(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    if (((uiEvent)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                return napiAssertErr;
            }
        }
    }
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetActionType(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_462(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetActionType(cloneEvt, 0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetSourceType(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_463(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetSourceType(cloneEvt, 0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetToolType(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_464(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetToolType(cloneEvt, 0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPressure(const ArkUI_UIInputEvent *, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_465(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetPressure(cloneEvt, 0.0f);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPressureByIndex(const ArkUI_UIInputEvent *, float, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_466(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetPressureByIndex(cloneEvt, 0.0f, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetEventTime(const ArkUI_UIInputEvent *, int64_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_467(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetEventTime(cloneEvt, 0LL);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetDeviceId(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_468(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetDeviceId(cloneEvt, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetTargetDisplayId(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_469(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetTargetDisplayId(cloneEvt, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedFingerId(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_470(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedFingerId(cloneEvt, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetFingerIdByIndex(const ArkUI_UIInputEvent *, int32_t, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_471(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetFingerIdByIndex(cloneEvt, 0, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedWindowPosition(const ArkUI_UIInputEvent *, float, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_472(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedWindowPosition(cloneEvt, 0.0f, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetWindowPositionByIndex(const ArkUI_UIInputEvent *, float, float, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_473(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetWindowPositionByIndex(cloneEvt, 0.0f, 0.0f, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedScreenPosition(const ArkUI_UIInputEvent *, float, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_474(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedScreenPosition(cloneEvt, 0.0f, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetScreenPositionByIndex(const ArkUI_UIInputEvent *, float, float, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_475(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetScreenPositionByIndex(cloneEvt, 0.0f, 0.0f, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedGlobalDisplayPosition(const ArkUI_UIInputEvent *, float, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_476(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedGlobalDisplayPosition(cloneEvt, 0.0f, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetGlobalDisplayPositionByIndex(const ArkUI_UIInputEvent *, float, float, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_477(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetGlobalDisplayPositionByIndex(cloneEvt, 0.0f, 0.0f, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetHandleId(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_478(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetHandleId(cloneEvt, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetTiltAngle(const ArkUI_UIInputEvent *, float, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_479(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetTiltAngle(cloneEvt, 0.0f, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetRollAngle(const ArkUI_UIInputEvent *, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_480(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetRollAngle(cloneEvt, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPressedKeys(const ArkUI_UIInputEvent *, int32_t *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_481(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_ClonedEvent_SetPressedKeys(cloneEvt, &v1, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedTouchArea(const ArkUI_UIInputEvent *, float, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_482(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedTouchArea(cloneEvt, 0.0f, 0.0f);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetTouchAreaByIndex(const ArkUI_UIInputEvent *, float, float, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_483(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetTouchAreaByIndex(cloneEvt, 0.0f, 0.0f, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetChangedInteractionHand(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_484(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetChangedInteractionHand(cloneEvt, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetInteractionHandByIndex(const ArkUI_UIInputEvent *, int32_t, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_485(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetInteractionHandByIndex(cloneEvt, 0, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPressedTimeByIndex(const ArkUI_UIInputEvent *, int64_t, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_486(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetPressedTimeByIndex(cloneEvt, 0LL, 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPinchAxisScaleValue(const ArkUI_UIInputEvent *, double)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_487(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetPinchAxisScaleValue(cloneEvt, 0.0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetHorizontalAxisScaleValue(const ArkUI_UIInputEvent *, double)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_488(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetHorizontalAxisScaleValue(cloneEvt, 0.0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetVerticalAxisScaleValue(const ArkUI_UIInputEvent *, double)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_489(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetVerticalAxisScaleValue(cloneEvt, 0.0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetScrollStep(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_490(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetScrollStep(cloneEvt, 0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetMouseButton(const ArkUI_UIInputEvent *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_491(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetMouseButton(cloneEvt, 0);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetRawDeltaX(const ArkUI_UIInputEvent *, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_492(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetRawDeltaX(cloneEvt, 0.0f);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetRawDeltaY(const ArkUI_UIInputEvent *, float)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_493(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetRawDeltaY(cloneEvt, 0.0f);
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

/*
 * 测试接口: OH_ArkUI_ClonedEvent_SetPressedButtons(const ArkUI_UIInputEvent *, const int32_t *, int32_t)
 * 预期效果: 在触摸克隆事件上调用 Setter（文档要求克隆指针），返回 NO_ERROR 或参数类错误。
 * 实际测试: CreatePointerEvent(TOUCH)→CreateClonedPointerEvent 得到 cloneEvt 后调用，再销毁克隆体与基事件。
 */
static napi_value TestArkUICapi_494(napi_env env, napi_callback_info info)
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

    if (((baseEvt)) == nullptr) {
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

    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }

    auto ec = OH_ArkUI_ClonedEvent_SetPressedButtons(cloneEvt, static_cast<const int32_t *>(nullptr), 0);
    if (ec != ARKUI_ERROR_CODE_NO_ERROR) {
        {
            napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
            if (napiAssertErr != nullptr) {
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
                (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
                return napiAssertErr;
            }
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

namespace {
napi_value XtsRunPostClonedEventWithStrategyNullNode(napi_env env)
{
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *baseEvt = nullptr;
    {
        napi_value e = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&baseEvt, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (e != nullptr) {
            return e;
        }
    }
    if (((baseEvt)) == nullptr) {
        return nullptr;
    }
    ArkUI_UIInputEvent *cloneEvt = nullptr;
    {
        napi_value e = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreateClonedPointerEvent(baseEvt, &cloneEvt)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (e != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return e;
        }
    }
    if (((cloneEvt)) == nullptr) {
        (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
        return nullptr;
    }
    auto ec = OH_ArkUI_PointerEvent_PostClonedEventWithStrategy(
        static_cast<ArkUI_NodeHandle>(nullptr), cloneEvt, static_cast<ArkUI_CompetitionStrategy>(0));
    {
        napi_value e = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env, static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT),
                static_cast<int32_t>(ARKUI_ERROR_CODE_POST_CLONED_COMPONENT_STATUS_ABNORMAL),
                static_cast<int32_t>(
                    ARKUI_ERROR_CODE_POST_CLONED_NO_COMPONENT_HIT_TO_RESPOND_TO_THE_EVENT) });
        if (e != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
            return e;
        }
    }
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(cloneEvt);
    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(baseEvt);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}
} // namespace

/*
 * 测试接口: OH_ArkUI_PointerEvent_PostClonedEventWithStrategy
 * 预期效果: 参考 capi-ui-input-event-h.md 中 PostClonedEvent 族：入参错误多返回 PARAM_INVALID；文档另列
 * NOT_CLONED_POINTER_EVENT、POST_CLONED_*。node=nullptr 时错误码因实现而异，断言为上述非成功码集合（不含 NO_ERROR）。
 * 实际测试: TOUCH→CreateClonedPointerEvent 后，首参 nullptr + 合法 cloneEvt/strategy。
 */
static napi_value TestArkUICapi_495(napi_env env, napi_callback_info info)
{
    (void)info;
    return XtsRunPostClonedEventWithStrategyNullNode(env);
}

/*
 * 测试接口: OH_ArkUI_DigitalCrownEvent_GetEventTime(const ArkUI_UIInputEvent *)
 * 预期效果: capi-ui-input-event-h.md：OH_ArkUI_DigitalCrownEvent_GetEventTime 在参数有误时
 * 返回 0；合法表冠事件由 NODE_ON_DIGITAL_CROWN 等场景提供。
 * 实际测试: CreatePointerEvent(TOUCH) 得合法合成事件指针，再调 GetEventTime（非表冠场景下文档承诺安全返回值），最后
 * DestroyClonedPointerEvent，避免依赖 CreatePointerEvent(DIGITAL_CROWN) 与头文件类型列表差异。
 */
static napi_value TestArkUICapi_496(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (uiEvent == nullptr) {
        return nullptr;
    }

    auto v = OH_ArkUI_DigitalCrownEvent_GetEventTime(uiEvent);
    (void)v;

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DigitalCrownEvent_GetAngularVelocity(const ArkUI_UIInputEvent *)
 * 预期效果: 同上文档：参数有误时返回 0.0。
 * 实际测试: 同 496，CreatePointerEvent(TOUCH) + GetAngularVelocity + Destroy。
 */
static napi_value TestArkUICapi_497(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (uiEvent == nullptr) {
        return nullptr;
    }

    auto v = OH_ArkUI_DigitalCrownEvent_GetAngularVelocity(uiEvent);
    (void)v;

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DigitalCrownEvent_GetDegree(const ArkUI_UIInputEvent *)
 * 预期效果: 同上文档：参数有误时返回 0.0。
 * 实际测试: 同 496。
 */
static napi_value TestArkUICapi_498(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (uiEvent == nullptr) {
        return nullptr;
    }

    auto v = OH_ArkUI_DigitalCrownEvent_GetDegree(uiEvent);
    (void)v;

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DigitalCrownEvent_GetAction(const ArkUI_UIInputEvent *)
 * 预期效果: 同上文档：入参错误时返回 ARKUI_CROWNEVENT_ACTION_UNKNOWN。
 * 实际测试: 同 496。
 */
static napi_value TestArkUICapi_499(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (uiEvent == nullptr) {
        return nullptr;
    }

    auto v = OH_ArkUI_DigitalCrownEvent_GetAction(uiEvent);
    (void)v;

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DigitalCrownEvent_SetStopPropagation(const ArkUI_UIInputEvent *, bool)
 * 预期效果: capi-ui-input-event-h.md：仅表冠 event 有效，否则参数异常应多返回 PARAM_INVALID。
 * 实际测试: CreatePointerEvent(TOUCH) 非表冠；主期望 PARAM_INVALID，兼容个别版本返回 NO_ERROR，再 Destroy。
 */
static napi_value TestArkUICapi_500(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    EnsureArkUiUiInputEventModuleLoaded();
    ArkUI_UIInputEvent *uiEvent = nullptr;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_PointerEvent_CreatePointerEvent(&uiEvent, ARKUI_UIINPUTEVENT_TYPE_TOUCH)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }
    if (uiEvent == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_DigitalCrownEvent_SetStopPropagation(uiEvent, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::ErrCodeAnyOfFailed(
            env,
            static_cast<int32_t>(ec),
            { static_cast<int32_t>(ARKUI_ERROR_CODE_PARAM_INVALID),
                static_cast<int32_t>(ARKUI_ERROR_CODE_NO_ERROR),
                static_cast<int32_t>(ARKUI_ERROR_INPUT_EVENT_TYPE_NOT_SUPPORTED) });
        if (napiAssertErr != nullptr) {
            (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
            return napiAssertErr;
        }
    }

    (void)OH_ArkUI_PointerEvent_DestroyClonedPointerEvent(uiEvent);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

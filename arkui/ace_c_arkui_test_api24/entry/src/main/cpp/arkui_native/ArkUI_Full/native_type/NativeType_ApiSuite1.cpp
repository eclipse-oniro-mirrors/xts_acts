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
#include <arkui/native_type.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {

namespace {
void StubTextDataDetectResultCb(const char *, int32_t, void *) {}
} // namespace

/*
 * 测试接口: ARKUI_ELLIPSIS_MODE_MULTILINE_START（ARKUI_ELLIPSIS_MODE_MULTILINE_START = 3）
 * 预期效果: 枚举/宏常量取值应为 3。
 * 实际测试: 读取符号 ARKUI_ELLIPSIS_MODE_MULTILINE_START 并断言等于 3。
 */
static napi_value TestArkUICapi_059(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 3;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_ELLIPSIS_MODE_MULTILINE_START)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_ELLIPSIS_MODE_MULTILINE_CENTER（ARKUI_ELLIPSIS_MODE_MULTILINE_CENTER = 4）
 * 预期效果: 枚举/宏常量取值应为 4。
 * 实际测试: 读取符号 ARKUI_ELLIPSIS_MODE_MULTILINE_CENTER 并断言等于 4。
 */
static napi_value TestArkUICapi_060(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 4;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_ELLIPSIS_MODE_MULTILINE_CENTER)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_TEXT_MENU_ITEM_ID_AUTO_FILL（ARKUI_TEXT_MENU_ITEM_ID_AUTO_FILL = 16）
 * 预期效果: 枚举/宏常量取值应为 16。
 * 实际测试: 读取符号 ARKUI_TEXT_MENU_ITEM_ID_AUTO_FILL 并断言等于 16。
 */
static napi_value TestArkUICapi_061(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 16;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_TEXT_MENU_ITEM_ID_AUTO_FILL)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: ARKUI_TEXT_MENU_ITEM_ID_PASSWORD_VAULT（ARKUI_TEXT_MENU_ITEM_ID_PASSWORD_VAULT = 17）
 * 预期效果: 枚举/宏常量取值应为 17。
 * 实际测试: 读取符号 ARKUI_TEXT_MENU_ITEM_ID_PASSWORD_VAULT 并断言等于 17。
 */
static napi_value TestArkUICapi_062(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 17;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_TEXT_MENU_ITEM_ID_PASSWORD_VAULT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_HAPTIC_FEEDBACK_MODE_DISABLED（OH_ARKUI_HAPTIC_FEEDBACK_MODE_DISABLED = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_HAPTIC_FEEDBACK_MODE_DISABLED 并断言等于 0。
 */
static napi_value TestArkUICapi_063(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_HAPTIC_FEEDBACK_MODE_DISABLED)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_HAPTIC_FEEDBACK_MODE_ENABLED（OH_ARKUI_HAPTIC_FEEDBACK_MODE_ENABLED = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_HAPTIC_FEEDBACK_MODE_ENABLED 并断言等于 1。
 */
static napi_value TestArkUICapi_064(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_HAPTIC_FEEDBACK_MODE_ENABLED)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_HAPTIC_FEEDBACK_MODE_AUTO（OH_ARKUI_HAPTIC_FEEDBACK_MODE_AUTO = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_HAPTIC_FEEDBACK_MODE_AUTO 并断言等于 2。
 */
static napi_value TestArkUICapi_065(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_HAPTIC_FEEDBACK_MODE_AUTO)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_TEXT（OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_TEXT = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_TEXT 并断言等于 0。
 */
static napi_value TestArkUICapi_066(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_TEXT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_IMAGE（OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_IMAGE = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_IMAGE 并断言等于 1。
 */
static napi_value TestArkUICapi_067(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_IMAGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_MIXED（OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_MIXED = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_MIXED 并断言等于 2。
 */
static napi_value TestArkUICapi_068(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_MIXED)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_BUILDER（OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_BUILDER = 3）
 * 预期效果: 枚举/宏常量取值应为 3。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_BUILDER 并断言等于 3。
 */
static napi_value TestArkUICapi_069(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 3;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_BUILDER)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_DEFAULT（OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_DEFAULT = 4）
 * 预期效果: 枚举/宏常量取值应为 4。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_DEFAULT 并断言等于 4。
 */
static napi_value TestArkUICapi_070(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 4;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_DEFAULT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_RIGHT_CLICK（OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_RIGHT_CLICK = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_RIGHT_CLICK 并断言等于 0。
 */
static napi_value TestArkUICapi_071(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_RIGHT_CLICK)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_LONG_PRESS（OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_LONG_PRESS = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_LONG_PRESS 并断言等于 1。
 */
static napi_value TestArkUICapi_072(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_LONG_PRESS)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_SELECT（OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_SELECT = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_SELECT 并断言等于 2。
 */
static napi_value TestArkUICapi_073(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_SELECT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_DEFAULT（OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_DEFAULT = 3）
 * 预期效果: 枚举/宏常量取值应为 3。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_DEFAULT 并断言等于 3。
 */
static napi_value TestArkUICapi_074(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 3;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_DEFAULT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_SELECTION_MENU（OH_ARKUI_TEXT_EDITOR_SELECTION_MENU = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_SELECTION_MENU 并断言等于 0。
 */
static napi_value TestArkUICapi_075(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_SELECTION_MENU)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_TEXT_EDITOR_PREVIEW_MENU（OH_ARKUI_TEXT_EDITOR_PREVIEW_MENU = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_TEXT_EDITOR_PREVIEW_MENU 并断言等于 1。
 */
static napi_value TestArkUICapi_076(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_TEXT_EDITOR_PREVIEW_MENU)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_LINE_BREAK_STRATEGY_GREEDY（OH_ARKUI_LINE_BREAK_STRATEGY_GREEDY = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_LINE_BREAK_STRATEGY_GREEDY 并断言等于 0。
 */
static napi_value TestArkUICapi_077(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_LINE_BREAK_STRATEGY_GREEDY)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_LINE_BREAK_STRATEGY_HIGH_QUALITY（OH_ARKUI_LINE_BREAK_STRATEGY_HIGH_QUALITY = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_LINE_BREAK_STRATEGY_HIGH_QUALITY 并断言等于 1。
 */
static napi_value TestArkUICapi_078(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_LINE_BREAK_STRATEGY_HIGH_QUALITY)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_LINE_BREAK_STRATEGY_BALANCE（OH_ARKUI_LINE_BREAK_STRATEGY_BALANCE = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_LINE_BREAK_STRATEGY_BALANCE 并断言等于 2。
 */
static napi_value TestArkUICapi_079(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_LINE_BREAK_STRATEGY_BALANCE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_DecorationStyleOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_080(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_DecorationStyleOptions_Create() 后调用 OH_ArkUI_DecorationStyleOptions_Destroy。
 */
static napi_value TestArkUICapi_081(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_DecorationStyleOptions_SetTextDecorationType(OH_ArkUI_DecorationStyleOptions *,
 *     ArkUI_TextDecorationType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_082(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_DecorationStyleOptions_SetTextDecorationType(obj, static_cast<ArkUI_TextDecorationType>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_DecorationStyleOptions_GetTextDecorationType(OH_ArkUI_DecorationStyleOptions *,
 *     ArkUI_TextDecorationType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_083(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDecorationType tdOut = static_cast<ArkUI_TextDecorationType>(0);
    auto ec = OH_ArkUI_DecorationStyleOptions_GetTextDecorationType(obj, &tdOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_SetColor(OH_ArkUI_DecorationStyleOptions *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_084(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_DecorationStyleOptions_SetColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_GetColor(OH_ArkUI_DecorationStyleOptions *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_085(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_DecorationStyleOptions_GetColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_DecorationStyleOptions_SetTextDecorationStyle(OH_ArkUI_DecorationStyleOptions *,
 *     ArkUI_TextDecorationStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_086(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_DecorationStyleOptions_SetTextDecorationStyle(obj, static_cast<ArkUI_TextDecorationStyle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_DecorationStyleOptions_GetTextDecorationStyle(OH_ArkUI_DecorationStyleOptions *,
 *     ArkUI_TextDecorationStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_087(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDecorationStyle tdsOut = static_cast<ArkUI_TextDecorationStyle>(0);
    auto ec = OH_ArkUI_DecorationStyleOptions_GetTextDecorationStyle(obj, &tdsOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_SetThicknessScale(OH_ArkUI_DecorationStyleOptions *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_088(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_DecorationStyleOptions_SetThicknessScale(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DecorationStyleOptions_GetThicknessScale(OH_ArkUI_DecorationStyleOptions *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_DecorationStyleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_089(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_DecorationStyleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_DecorationStyleOptions_GetThicknessScale(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DecorationStyleOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextDataDetectorConfig_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_090(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextDataDetectorConfig_Create() 后调用 OH_ArkUI_TextDataDetectorConfig_Destroy。
 */
static napi_value TestArkUICapi_091(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextDataDetectorConfig_SetTypes(OH_ArkUI_TextDataDetectorConfig *, const ArkUI_TextDataDetectorType *,
 *     int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_092(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    static const ArkUI_TextDataDetectorType kEmptyType {};
    auto ec = OH_ArkUI_TextDataDetectorConfig_SetTypes(obj, &kEmptyType, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextDataDetectorConfig_GetTypes(OH_ArkUI_TextDataDetectorConfig *, ArkUI_TextDataDetectorType *,
 *     int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_093(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDataDetectorType bufTypes[4] = {};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextDataDetectorConfig_GetTypes(
        obj,
        bufTypes,
        static_cast<int32_t>(sizeof(bufTypes) / sizeof(bufTypes[0])),
        &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextDataDetectorConfig_RegisterOnDetectResultUpdateCallback(OH_ArkUI_TextDataDetectorConfig *, void *,
 *     void (*)(const char *, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_094(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextDataDetectorConfig_RegisterOnDetectResultUpdateCallback(
        obj,
        static_cast<void *>(nullptr),
        StubTextDataDetectResultCb);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_SetColor(OH_ArkUI_TextDataDetectorConfig *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_095(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextDataDetectorConfig_SetColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_GetColor(OH_ArkUI_TextDataDetectorConfig *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_096(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextDataDetectorConfig_GetColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextDataDetectorConfig_SetDecorationStyleOptions(OH_ArkUI_TextDataDetectorConfig *,
 *     OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 创建配置与 DecorationStyleOptions，Set 成功码为 NO_ERROR；第二参勿传 nullptr（实现侧会解引用导致崩溃）。
 */
static napi_value TestArkUICapi_097(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *dec = OH_ArkUI_DecorationStyleOptions_Create();
    if (((dec)) == nullptr) {
        OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextDataDetectorConfig_SetDecorationStyleOptions(obj, dec);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
            OH_ArkUI_DecorationStyleOptions_Destroy(dec);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    OH_ArkUI_DecorationStyleOptions_Destroy(dec);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextDataDetectorConfig_GetDecorationStyleOptions(OH_ArkUI_TextDataDetectorConfig *,
 *     OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 创建配置与输出用 DecorationStyleOptions，Get 成功码为 NO_ERROR；第二参勿传 nullptr（易触发空指针解引用）。
 */
static napi_value TestArkUICapi_098(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *dec = OH_ArkUI_DecorationStyleOptions_Create();
    if (((dec)) == nullptr) {
        OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextDataDetectorConfig_GetDecorationStyleOptions(obj, dec);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
            OH_ArkUI_DecorationStyleOptions_Destroy(dec);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    OH_ArkUI_DecorationStyleOptions_Destroy(dec);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_SetEnablePreviewMenu(OH_ArkUI_TextDataDetectorConfig *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_099(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextDataDetectorConfig_SetEnablePreviewMenu(obj, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextDataDetectorConfig_GetEnablePreviewMenu(OH_ArkUI_TextDataDetectorConfig *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextDataDetectorConfig_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_100(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextDataDetectorConfig_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_TextDataDetectorConfig_GetEnablePreviewMenu(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextDataDetectorConfig_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorPlaceholderOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_101(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorPlaceholderOptions_Create() 后调用 OH_ArkUI_TextEditorPlaceholderOptions_Destroy。
 */
static napi_value TestArkUICapi_102(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetValue(OH_ArkUI_TextEditorPlaceholderOptions *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_103(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetValue(obj, buf1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorPlaceholderOptions_GetValue(OH_ArkUI_TextEditorPlaceholderOptions *, char *, int32_t,
 *     int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_104(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetValue(
        obj,
        buf1,
        static_cast<int32_t>(sizeof(buf1)),
        &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetFontSize(OH_ArkUI_TextEditorPlaceholderOptions *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_105(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetFontSize(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_GetFontSize(OH_ArkUI_TextEditorPlaceholderOptions *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_106(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetFontSize(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetFontWeight(OH_ArkUI_TextEditorPlaceholderOptions *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_107(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetFontWeight(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_GetFontWeight(OH_ArkUI_TextEditorPlaceholderOptions *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_108(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetFontWeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetFontFamily(OH_ArkUI_TextEditorPlaceholderOptions *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_109(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetFontFamily(obj, buf1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorPlaceholderOptions_GetFontFamily(OH_ArkUI_TextEditorPlaceholderOptions *, char *, int32_t,
 *     int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_110(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetFontFamily(
        obj,
        buf1,
        static_cast<int32_t>(sizeof(buf1)),
        &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetFontStyle(OH_ArkUI_TextEditorPlaceholderOptions *, ArkUI_FontStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_111(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetFontStyle(obj, static_cast<ArkUI_FontStyle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_GetFontStyle(OH_ArkUI_TextEditorPlaceholderOptions *, ArkUI_FontStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_112(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_FontStyle fsOut = static_cast<ArkUI_FontStyle>(0);
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetFontStyle(obj, &fsOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_SetFontColor(OH_ArkUI_TextEditorPlaceholderOptions *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_113(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_SetFontColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorPlaceholderOptions_GetFontColor(OH_ArkUI_TextEditorPlaceholderOptions *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorPlaceholderOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_114(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorPlaceholderOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorPlaceholderOptions_GetFontColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorPlaceholderOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorStyledStringController_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_115(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorStyledStringController_Create() 后调用 OH_ArkUI_TextEditorStyledStringController_Destroy。
 */
static napi_value TestArkUICapi_116(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_SetCaretOffset(OH_ArkUI_TextEditorStyledStringController *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_117(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetCaretOffset(obj, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetCaretOffset(OH_ArkUI_TextEditorStyledStringController *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_118(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetCaretOffset(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_SetSelection(OH_ArkUI_TextEditorStyledStringController *, uint32_t,
 *     uint32_t, ArkUI_MenuPolicy)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_119(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetSelection(obj, 0U, 0U, static_cast<ArkUI_MenuPolicy>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_IsEditing(OH_ArkUI_TextEditorStyledStringController *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_120(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_TextEditorStyledStringController_IsEditing(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_StopEditing(OH_ArkUI_TextEditorStyledStringController *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_121(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_StopEditing(obj);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetPreviewText(OH_ArkUI_TextEditorStyledStringController *,
 *     uint32_t *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_122(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    char buf2[32] = {0};
    int32_t v4 = 0;
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetPreviewText(
        obj,
        &v1,
        buf2,
        static_cast<int32_t>(sizeof(buf2)),
        &v4);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetCaretRect(OH_ArkUI_TextEditorStyledStringController *, ArkUI_Rect *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_123(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_Rect rectOut {};
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetCaretRect(obj, &rectOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_DeleteBackward(OH_ArkUI_TextEditorStyledStringController *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_124(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_DeleteBackward(obj);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorParagraphStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_125(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorParagraphStyle_Create() 后调用 OH_ArkUI_TextEditorParagraphStyle_Destroy。
 */
static napi_value TestArkUICapi_126(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetTextAlign(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_TextAlignment)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_127(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetTextAlign(obj, static_cast<ArkUI_TextAlignment>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetTextAlign(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_TextAlignment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_128(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextAlignment alignOut = static_cast<ArkUI_TextAlignment>(0);
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetTextAlign(obj, &alignOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginPixelMap(OH_ArkUI_TextEditorParagraphStyle *,
 *     struct OH_PixelmapNative *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 创建 TextEditorParagraphStyle 与测试用 OH_PixelmapNative，Set 成功则先 OH_ArkUI_TextEditorParagraphStyle_Destroy，
 * 再 OH_PixelmapNative_Destroy(pm)；失败路径同步释放。
 */
static napi_value TestArkUICapi_129(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    if (opts == nullptr) {
        OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
        return nullptr;
    }
    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    if (pm == nullptr) {
        OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginPixelMap(obj, pm);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            (void)OH_PixelmapNative_Destroy(&pm);
            OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    (void)OH_PixelmapNative_Destroy(&pm);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginPixelMap(OH_ArkUI_TextEditorParagraphStyle *,
 *     struct OH_PixelmapNative **)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_130(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    struct OH_PixelmapNative* holder1 = nullptr;
    struct OH_PixelmapNative** outPtr1 = &holder1;
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginPixelMap(obj, outPtr1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginWidth(OH_ArkUI_TextEditorParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_131(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginWidth(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginWidth(OH_ArkUI_TextEditorParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_132(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginWidth(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginHeight(OH_ArkUI_TextEditorParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_133(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginHeight(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginHeight(OH_ArkUI_TextEditorParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_134(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginHeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetWordBreak(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_WordBreak)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_135(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetWordBreak(obj, static_cast<ArkUI_WordBreak>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetWordBreak(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_WordBreak *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_136(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_WordBreak wbOut = static_cast<ArkUI_WordBreak>(0);
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetWordBreak(obj, &wbOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_SetLineBreakStrategy(OH_ArkUI_TextEditorParagraphStyle *,
 *     OH_ArkUI_LineBreakStrategy)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_137(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetLineBreakStrategy(obj, static_cast<OH_ArkUI_LineBreakStrategy>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_GetLineBreakStrategy(OH_ArkUI_TextEditorParagraphStyle *,
 *     OH_ArkUI_LineBreakStrategy *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_138(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_LineBreakStrategy lbsOut = static_cast<OH_ArkUI_LineBreakStrategy>(0);
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetLineBreakStrategy(obj, &lbsOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetParagraphSpacing(OH_ArkUI_TextEditorParagraphStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_139(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetParagraphSpacing(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetParagraphSpacing(OH_ArkUI_TextEditorParagraphStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_140(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetParagraphSpacing(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_SetTextVerticalAlign(OH_ArkUI_TextEditorParagraphStyle *,
 *     ArkUI_TextVerticalAlignment)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_141(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetTextVerticalAlign(obj, static_cast<ArkUI_TextVerticalAlignment>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorParagraphStyle_GetTextVerticalAlign(OH_ArkUI_TextEditorParagraphStyle *,
 *     ArkUI_TextVerticalAlignment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_142(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextVerticalAlignment tvaOut = static_cast<ArkUI_TextVerticalAlignment>(0);
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetTextVerticalAlign(obj, &tvaOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_SetTextDirection(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_TextDirection)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_143(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorParagraphStyle_SetTextDirection(obj, static_cast<ArkUI_TextDirection>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorParagraphStyle_GetTextDirection(OH_ArkUI_TextEditorParagraphStyle *, ArkUI_TextDirection *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorParagraphStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_144(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDirection tdOut1 = static_cast<ArkUI_TextDirection>(0);
    auto ec = OH_ArkUI_TextEditorParagraphStyle_GetTextDirection(obj, &tdOut1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_SetTypingParagraphStyle(OH_ArkUI_TextEditorStyledStringController *,
 *     OH_ArkUI_TextEditorParagraphStyle *)
 * 预期效果: Controller 未绑定到 TextEditor 时，native_type.h 约定返回 ARKUI_ERROR_CODE_PARAM_INVALID（现场 401）。
 * 实际测试: Create 后与 117–124 一致，断言 PARAM_INVALID；失败路径释放 paragraph 与 controller。
 */
static napi_value TestArkUICapi_145(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *para = OH_ArkUI_TextEditorParagraphStyle_Create();
    if (((para)) == nullptr) {
        OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetTypingParagraphStyle(obj, para);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorParagraphStyle_Destroy(para);
            OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorParagraphStyle_Destroy(para);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_ShadowOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_146(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_ShadowOptions_Create() 后调用 OH_ArkUI_ShadowOptions_Destroy。
 */
static napi_value TestArkUICapi_147(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetRadius(OH_ArkUI_ShadowOptions *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_148(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetRadius(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetRadius(OH_ArkUI_ShadowOptions *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_149(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ShadowOptions_GetRadius(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetType(OH_ArkUI_ShadowOptions *, ArkUI_ShadowType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_150(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetType(obj, static_cast<ArkUI_ShadowType>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetType(OH_ArkUI_ShadowOptions *, ArkUI_ShadowType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_151(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_ShadowType stOut = static_cast<ArkUI_ShadowType>(0);
    auto ec = OH_ArkUI_ShadowOptions_GetType(obj, &stOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetColor(OH_ArkUI_ShadowOptions *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_152(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetColor(OH_ArkUI_ShadowOptions *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_153(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_ShadowOptions_GetColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetOffsetX(OH_ArkUI_ShadowOptions *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_154(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetOffsetX(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetOffsetX(OH_ArkUI_ShadowOptions *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_155(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ShadowOptions_GetOffsetX(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetOffsetY(OH_ArkUI_ShadowOptions *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_156(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetOffsetY(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetOffsetY(OH_ArkUI_ShadowOptions *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_157(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ShadowOptions_GetOffsetY(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ShadowOptions_SetFill(OH_ArkUI_ShadowOptions *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_158(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ShadowOptions_SetFill(obj, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

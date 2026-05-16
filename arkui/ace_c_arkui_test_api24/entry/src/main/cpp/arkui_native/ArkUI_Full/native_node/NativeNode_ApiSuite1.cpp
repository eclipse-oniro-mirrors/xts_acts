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
#include <arkui/native_node.h>

namespace ArkUICapiTest {

/*
 * 测试接口: ARKUI_NODE_TEXT_EDITOR（ARKUI_NODE_TEXT_EDITOR = 22）
 * 预期效果: 枚举/宏常量取值应为 22。
 * 实际测试: 读取符号 ARKUI_NODE_TEXT_EDITOR 并断言等于 22。
 */
static napi_value TestArkUICapi_008(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(ARKUI_NODE_TEXT_EDITOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_SPAN_FONT（NODE_SPAN_FONT = 2003）
 * 预期效果: 枚举/宏常量取值应为 2003。
 * 实际测试: 读取符号 NODE_SPAN_FONT 并断言等于 2003。
 */
static napi_value TestArkUICapi_009(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2003;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_SPAN_FONT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_SPAN_FONT_WEIGHT（NODE_SPAN_FONT_WEIGHT = 2004）
 * 预期效果: 枚举/宏常量取值应为 2004。
 * 实际测试: 读取符号 NODE_SPAN_FONT_WEIGHT 并断言等于 2004。
 */
static napi_value TestArkUICapi_010(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2004;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_SPAN_FONT_WEIGHT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_INPUT_ELLIPSIS_MODE（NODE_TEXT_INPUT_ELLIPSIS_MODE = 7042）
 * 预期效果: 枚举/宏常量取值应为 7042。
 * 实际测试: 读取符号 NODE_TEXT_INPUT_ELLIPSIS_MODE 并断言等于 7042。
 */
static napi_value TestArkUICapi_011(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 7042;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_INPUT_ELLIPSIS_MODE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_INPUT_TEXT_OVERFLOW（NODE_TEXT_INPUT_TEXT_OVERFLOW = 7049）
 * 预期效果: 枚举/宏常量取值应为 7049。
 * 实际测试: 读取符号 NODE_TEXT_INPUT_TEXT_OVERFLOW 并断言等于 7049。
 */
static napi_value TestArkUICapi_012(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 7049;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_INPUT_TEXT_OVERFLOW)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_AREA_ELLIPSIS_MODE（NODE_TEXT_AREA_ELLIPSIS_MODE = 8038）
 * 预期效果: 枚举/宏常量取值应为 8038。
 * 实际测试: 读取符号 NODE_TEXT_AREA_ELLIPSIS_MODE 并断言等于 8038。
 */
static napi_value TestArkUICapi_013(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 8038;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_AREA_ELLIPSIS_MODE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_AREA_HORIZONTAL_SCROLLING（NODE_TEXT_AREA_HORIZONTAL_SCROLLING = 8043）
 * 预期效果: 枚举/宏常量取值应为 8043。
 * 实际测试: 读取符号 NODE_TEXT_AREA_HORIZONTAL_SCROLLING 并断言等于 8043。
 */
static napi_value TestArkUICapi_014(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 8043;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_AREA_HORIZONTAL_SCROLLING)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_AREA_TEXT_OVERFLOW（NODE_TEXT_AREA_TEXT_OVERFLOW = 8046）
 * 预期效果: 枚举/宏常量取值应为 8046。
 * 实际测试: 读取符号 NODE_TEXT_AREA_TEXT_OVERFLOW 并断言等于 8046。
 */
static napi_value TestArkUICapi_015(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 8046;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_AREA_TEXT_OVERFLOW)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENTER_KEY_TYPE（NODE_TEXT_EDITOR_ENTER_KEY_TYPE = 22000）
 * 预期效果: 枚举/宏常量取值应为 22000。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENTER_KEY_TYPE 并断言等于 22000。
 */
static napi_value TestArkUICapi_016(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22000;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENTER_KEY_TYPE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_CARET_COLOR（NODE_TEXT_EDITOR_CARET_COLOR = 22001）
 * 预期效果: 枚举/宏常量取值应为 22001。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_CARET_COLOR 并断言等于 22001。
 */
static napi_value TestArkUICapi_017(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22001;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_CARET_COLOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_SCROLL_BAR_COLOR（NODE_TEXT_EDITOR_SCROLL_BAR_COLOR = 22002）
 * 预期效果: 枚举/宏常量取值应为 22002。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_SCROLL_BAR_COLOR 并断言等于 22002。
 */
static napi_value TestArkUICapi_018(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22002;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_SCROLL_BAR_COLOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_BAR_STATE（NODE_TEXT_EDITOR_BAR_STATE = 22003）
 * 预期效果: 枚举/宏常量取值应为 22003。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_BAR_STATE 并断言等于 22003。
 */
static napi_value TestArkUICapi_019(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22003;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_BAR_STATE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_DATA_DETECTOR（NODE_TEXT_EDITOR_ENABLE_DATA_DETECTOR = 22004）
 * 预期效果: 枚举/宏常量取值应为 22004。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_DATA_DETECTOR 并断言等于 22004。
 */
static napi_value TestArkUICapi_020(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22004;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_DATA_DETECTOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_DATA_DETECTOR_CONFIG（NODE_TEXT_EDITOR_DATA_DETECTOR_CONFIG = 22005）
 * 预期效果: 枚举/宏常量取值应为 22005。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_DATA_DETECTOR_CONFIG 并断言等于 22005。
 */
static napi_value TestArkUICapi_021(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22005;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_DATA_DETECTOR_CONFIG)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_EDIT_MENU_OPTIONS（NODE_TEXT_EDITOR_EDIT_MENU_OPTIONS = 22006）
 * 预期效果: 枚举/宏常量取值应为 22006。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_EDIT_MENU_OPTIONS 并断言等于 22006。
 */
static napi_value TestArkUICapi_022(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22006;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_EDIT_MENU_OPTIONS)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_PLACEHOLDER（NODE_TEXT_EDITOR_PLACEHOLDER = 22007）
 * 预期效果: 枚举/宏常量取值应为 22007。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_PLACEHOLDER 并断言等于 22007。
 */
static napi_value TestArkUICapi_023(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22007;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_PLACEHOLDER)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER（NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER = 22008）
 * 预期效果: 枚举/宏常量取值应为 22008。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER 并断言等于 22008。
 */
static napi_value TestArkUICapi_024(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22008;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_PREVIEW_TEXT（NODE_TEXT_EDITOR_ENABLE_PREVIEW_TEXT = 22009）
 * 预期效果: 枚举/宏常量取值应为 22009。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_PREVIEW_TEXT 并断言等于 22009。
 */
static napi_value TestArkUICapi_025(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22009;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_PREVIEW_TEXT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_LAYOUT_MANAGER（NODE_TEXT_EDITOR_LAYOUT_MANAGER = 22010）
 * 预期效果: 枚举/宏常量取值应为 22010。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_LAYOUT_MANAGER 并断言等于 22010。
 */
static napi_value TestArkUICapi_026(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22010;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_LAYOUT_MANAGER)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_SELECTED_DATA_DETECTOR（NODE_TEXT_EDITOR_ENABLE_SELECTED_DATA_DETECTOR = 22011）
 * 预期效果: 枚举/宏常量取值应为 22011。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_SELECTED_DATA_DETECTOR 并断言等于 22011。
 */
static napi_value TestArkUICapi_027(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22011;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_SELECTED_DATA_DETECTOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_SELECTED_BACKGROUND_COLOR（NODE_TEXT_EDITOR_SELECTED_BACKGROUND_COLOR = 22012）
 * 预期效果: 枚举/宏常量取值应为 22012。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_SELECTED_BACKGROUND_COLOR 并断言等于 22012。
 */
static napi_value TestArkUICapi_028(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22012;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_SELECTED_BACKGROUND_COLOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_KEYBOARD_ON_FOCUS（NODE_TEXT_EDITOR_ENABLE_KEYBOARD_ON_FOCUS = 22013）
 * 预期效果: 枚举/宏常量取值应为 22013。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_KEYBOARD_ON_FOCUS 并断言等于 22013。
 */
static napi_value TestArkUICapi_029(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22013;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_KEYBOARD_ON_FOCUS)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_MAX_LENGTH（NODE_TEXT_EDITOR_MAX_LENGTH = 22014）
 * 预期效果: 枚举/宏常量取值应为 22014。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_MAX_LENGTH 并断言等于 22014。
 */
static napi_value TestArkUICapi_030(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22014;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_MAX_LENGTH)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_MAX_LINES（NODE_TEXT_EDITOR_MAX_LINES = 22015）
 * 预期效果: 枚举/宏常量取值应为 22015。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_MAX_LINES 并断言等于 22015。
 */
static napi_value TestArkUICapi_031(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22015;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_MAX_LINES)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_HAPTIC_FEEDBACK（NODE_TEXT_EDITOR_ENABLE_HAPTIC_FEEDBACK = 22016）
 * 预期效果: 枚举/宏常量取值应为 22016。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_HAPTIC_FEEDBACK 并断言等于 22016。
 */
static napi_value TestArkUICapi_032(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22016;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_HAPTIC_FEEDBACK)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_COPY_OPTIONS（NODE_TEXT_EDITOR_COPY_OPTIONS = 22017）
 * 预期效果: 枚举/宏常量取值应为 22017。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_COPY_OPTIONS 并断言等于 22017。
 */
static napi_value TestArkUICapi_033(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22017;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_COPY_OPTIONS)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_KEYBOARD_APPEARANCE（NODE_TEXT_EDITOR_KEYBOARD_APPEARANCE = 22018）
 * 预期效果: 枚举/宏常量取值应为 22018。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_KEYBOARD_APPEARANCE 并断言等于 22018。
 */
static napi_value TestArkUICapi_034(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22018;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_KEYBOARD_APPEARANCE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_STOP_BACK_PRESS（NODE_TEXT_EDITOR_STOP_BACK_PRESS = 22019）
 * 预期效果: 枚举/宏常量取值应为 22019。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_STOP_BACK_PRESS 并断言等于 22019。
 */
static napi_value TestArkUICapi_035(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22019;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_STOP_BACK_PRESS)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ENABLE_AUTO_SPACING（NODE_TEXT_EDITOR_ENABLE_AUTO_SPACING = 22020）
 * 预期效果: 枚举/宏常量取值应为 22020。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ENABLE_AUTO_SPACING 并断言等于 22020。
 */
static napi_value TestArkUICapi_036(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22020;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ENABLE_AUTO_SPACING)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_CUSTOM_KEYBOARD（NODE_TEXT_EDITOR_CUSTOM_KEYBOARD = 22021）
 * 预期效果: 枚举/宏常量取值应为 22021。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_CUSTOM_KEYBOARD 并断言等于 22021。
 */
static napi_value TestArkUICapi_037(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22021;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_CUSTOM_KEYBOARD)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_BIND_SELECTION_MENU（NODE_TEXT_EDITOR_BIND_SELECTION_MENU = 22022）
 * 预期效果: 枚举/宏常量取值应为 22022。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_BIND_SELECTION_MENU 并断言等于 22022。
 */
static napi_value TestArkUICapi_038(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22022;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_BIND_SELECTION_MENU)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_INCLUDE_FONT_PADDING（NODE_TEXT_EDITOR_INCLUDE_FONT_PADDING = 22023）
 * 预期效果: 枚举/宏常量取值应为 22023。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_INCLUDE_FONT_PADDING 并断言等于 22023。
 */
static napi_value TestArkUICapi_039(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22023;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_INCLUDE_FONT_PADDING)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_FALLBACK_LINE_SPACING（NODE_TEXT_EDITOR_FALLBACK_LINE_SPACING = 22024）
 * 预期效果: 枚举/宏常量取值应为 22024。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_FALLBACK_LINE_SPACING 并断言等于 22024。
 */
static napi_value TestArkUICapi_040(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22024;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_FALLBACK_LINE_SPACING)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_COMPRESS_LEADING_PUNCTUATION（NODE_TEXT_EDITOR_COMPRESS_LEADING_PUNCTUATION = 22025）
 * 预期效果: 枚举/宏常量取值应为 22025。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_COMPRESS_LEADING_PUNCTUATION 并断言等于 22025。
 */
static napi_value TestArkUICapi_041(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22025;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_COMPRESS_LEADING_PUNCTUATION)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_SELECTED_DRAG_PREVIEW_STYLE（NODE_TEXT_EDITOR_SELECTED_DRAG_PREVIEW_STYLE = 22026）
 * 预期效果: 枚举/宏常量取值应为 22026。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_SELECTED_DRAG_PREVIEW_STYLE 并断言等于 22026。
 */
static napi_value TestArkUICapi_042(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22026;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_SELECTED_DRAG_PREVIEW_STYLE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_SINGLE_LINE（NODE_TEXT_EDITOR_SINGLE_LINE = 22027）
 * 预期效果: 枚举/宏常量取值应为 22027。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_SINGLE_LINE 并断言等于 22027。
 */
static napi_value TestArkUICapi_043(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22027;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_SINGLE_LINE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_ON_DIGITAL_CROWN（NODE_ON_DIGITAL_CROWN = 33）
 * 预期效果: 枚举/宏常量取值应为 33。
 * 实际测试: 读取符号 NODE_ON_DIGITAL_CROWN 并断言等于 33。
 */
static napi_value TestArkUICapi_044(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 33;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_ON_DIGITAL_CROWN)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_ON_CUSTOM_OVERFLOW_SCROLL（NODE_ON_CUSTOM_OVERFLOW_SCROLL = 34）
 * 预期效果: 枚举/宏常量取值应为 34。
 * 实际测试: 读取符号 NODE_ON_CUSTOM_OVERFLOW_SCROLL 并断言等于 34。
 */
static napi_value TestArkUICapi_045(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 34;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_ON_CUSTOM_OVERFLOW_SCROLL)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_ON_STACK_OVERFLOW_SCROLL（NODE_ON_STACK_OVERFLOW_SCROLL = 35）
 * 预期效果: 枚举/宏常量取值应为 35。
 * 实际测试: 读取符号 NODE_ON_STACK_OVERFLOW_SCROLL 并断言等于 35。
 */
static napi_value TestArkUICapi_046(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 35;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_ON_STACK_OVERFLOW_SCROLL)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_ON_NEED_SOFTKEYBOARD（NODE_ON_NEED_SOFTKEYBOARD = 36）
 * 预期效果: 枚举/宏常量取值应为 36。
 * 实际测试: 读取符号 NODE_ON_NEED_SOFTKEYBOARD 并断言等于 36。
 */
static napi_value TestArkUICapi_047(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 36;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_ON_NEED_SOFTKEYBOARD)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_SELECTION_CHANGE（NODE_TEXT_EDITOR_ON_SELECTION_CHANGE = 22000）
 * 预期效果: 枚举/宏常量取值应为 22000。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_SELECTION_CHANGE 并断言等于 22000。
 */
static napi_value TestArkUICapi_048(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22000;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_SELECTION_CHANGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_READY（NODE_TEXT_EDITOR_ON_READY = 22001）
 * 预期效果: 枚举/宏常量取值应为 22001。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_READY 并断言等于 22001。
 */
static napi_value TestArkUICapi_049(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22001;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_READY)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_PASTE（NODE_TEXT_EDITOR_ON_PASTE = 22002）
 * 预期效果: 枚举/宏常量取值应为 22002。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_PASTE 并断言等于 22002。
 */
static napi_value TestArkUICapi_050(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22002;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_PASTE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_EDITING_CHANGE（NODE_TEXT_EDITOR_ON_EDITING_CHANGE = 22003）
 * 预期效果: 枚举/宏常量取值应为 22003。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_EDITING_CHANGE 并断言等于 22003。
 */
static napi_value TestArkUICapi_051(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22003;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_EDITING_CHANGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_SUBMIT（NODE_TEXT_EDITOR_ON_SUBMIT = 22004）
 * 预期效果: 枚举/宏常量取值应为 22004。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_SUBMIT 并断言等于 22004。
 */
static napi_value TestArkUICapi_052(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22004;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_SUBMIT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_CUT（NODE_TEXT_EDITOR_ON_CUT = 22005）
 * 预期效果: 枚举/宏常量取值应为 22005。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_CUT 并断言等于 22005。
 */
static napi_value TestArkUICapi_053(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22005;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_CUT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_COPY（NODE_TEXT_EDITOR_ON_COPY = 22006）
 * 预期效果: 枚举/宏常量取值应为 22006。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_COPY 并断言等于 22006。
 */
static napi_value TestArkUICapi_054(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22006;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_COPY)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_WILL_CHANGE（NODE_TEXT_EDITOR_ON_WILL_CHANGE = 22007）
 * 预期效果: 枚举/宏常量取值应为 22007。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_WILL_CHANGE 并断言等于 22007。
 */
static napi_value TestArkUICapi_055(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22007;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_WILL_CHANGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: NODE_TEXT_EDITOR_ON_DID_CHANGE（NODE_TEXT_EDITOR_ON_DID_CHANGE = 22008）
 * 预期效果: 枚举/宏常量取值应为 22008。
 * 实际测试: 读取符号 NODE_TEXT_EDITOR_ON_DID_CHANGE 并断言等于 22008。
 */
static napi_value TestArkUICapi_056(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 22008;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(NODE_TEXT_EDITOR_ON_DID_CHANGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_NodeEvent_GetTextEditorOnWillChangeEvent
 * 预期效果: 空事件时返回 nullptr。
 * 实际测试: 传 nullptr 校验返回。
 */
static napi_value TestArkUICapi_057(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *p = OH_ArkUI_NodeEvent_GetTextEditorOnWillChangeEvent(nullptr);
    if (((p)) != ((nullptr))) {
        return nullptr;
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_NativeModule_GetPageRootNodeHandleByContext
 * 预期效果: context 为 nullptr 时返回 PARAM_INVALID / UI_CONTEXT_INVALID / CAPI_INIT_ERROR 之一且 root 仍为 nullptr。
 * 实际测试: 按 native_node.h 对非法 UI 实例传参，扩展白名单含 CAPI_INIT_ERROR，并校验 root 未写入句柄。
 */
static napi_value TestArkUICapi_058(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    ArkUI_NodeHandle root = nullptr;
    auto rc = OH_ArkUI_NativeModule_GetPageRootNodeHandleByContext(
        static_cast<ArkUI_ContextHandle>(nullptr), &root);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::TrueFailed(env, (rc == ARKUI_ERROR_CODE_PARAM_INVALID ||
        rc == ARKUI_ERROR_CODE_UI_CONTEXT_INVALID ||
        rc == ARKUI_ERROR_CODE_CAPI_INIT_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    if (((root)) != ((nullptr))) {
        return nullptr;
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

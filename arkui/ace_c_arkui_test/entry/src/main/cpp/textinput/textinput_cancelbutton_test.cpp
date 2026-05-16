/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"

#define COLOR_RED 0xFFFF0000
#define BUTTON_ICON_SIZE 16
#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define BUTTON_ICON_SIZE_DEFAULT 16
namespace ArkUICapiTest {

static napi_value TestTextInputCancelButton001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CANCELBUTTON_STYLE_CONSTANT }, { .f32 = BUTTON_ICON_SIZE },
        { .u32 = COLOR_RED } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    value_item.string = FIRST_MIDDLE_VALUE;
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
        ARKUI_CANCELBUTTON_STYLE_CONSTANT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, BUTTON_ICON_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_2].u32, COLOR_RED);
    NAPI_END;
}
static napi_value TestTextInputCancelButton002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char* src = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CANCELBUTTON_STYLE_CONSTANT }, { .f32 = -1.0 }, { .u32 = COLOR_RED } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
        ARKUI_CANCELBUTTON_STYLE_CONSTANT);
    ASSERT_EQ(
        nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, BUTTON_ICON_SIZE_DEFAULT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_2].u32, COLOR_RED);
    NAPI_END;
}
static napi_value TestTextInputCancelButton003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CANCELBUTTON_STYLE_INVISIBLE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
        ARKUI_CANCELBUTTON_STYLE_INVISIBLE);
    NAPI_END;
}
static napi_value TestTextInputCancelButton004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char* src = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CANCELBUTTON_STYLE_INPUT }, { .f32 = BUTTON_ICON_SIZE },
        { .u32 = COLOR_RED } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
        ARKUI_CANCELBUTTON_STYLE_INPUT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_1].f32, BUTTON_ICON_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_2].u32, COLOR_RED);
    NAPI_END;
}
static napi_value TestTextInputCancelButton005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char* src = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = { { .i32 = -1 }, { .f32 = BUTTON_ICON_SIZE }, { .u32 = COLOR_RED } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestTextInputCancelButton006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char* src = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = { { .i32 = 3 }, { .f32 = BUTTON_ICON_SIZE }, { .u32 = COLOR_RED } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestTextInputCancelButton007(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = ARKUI_CANCELBUTTON_STYLE_CONSTANT }};
    ArkUI_AttributeItem valueItem = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON, &valueItem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputCancelButton",
        "TestTextInputCancelButton007 ret: %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputCancelButton",
        "TestTextInputCancelButton007 ret1: %{public}d", ret1);
    ASSERT_EQ(ret1, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputCancelButton",
        "TestTextInputCancelButton007 tmp: %{public}d", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_CANCEL_BUTTON)->value[PARAM_0].i32,
        ARKUI_CANCELBUTTON_STYLE_INPUT);
}
} // namespace ArkUICapiTest
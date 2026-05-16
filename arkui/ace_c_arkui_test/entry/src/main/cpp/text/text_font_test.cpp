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

namespace ArkUICapiTest {

static napi_value TestTextFont001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_NORMAL);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_2].i32, ARKUI_FONT_STYLE_NORMAL);
    NAPI_END;
}

static napi_value TestTextFont002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W100}, {.i32 = ARKUI_FONT_STYLE_NORMAL}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "HarmonyOS Sans";
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W100);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_2].i32, ARKUI_FONT_STYLE_NORMAL);
    if (nodeAPI->getAttribute(text, NODE_TEXT_FONT)->string == nullptr) {
        ASSERT_STREQ("", "HarmonyOS Sans");
    } else {
        ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->string, "HarmonyOS Sans");
    }
    NAPI_END;
}

static napi_value TestTextFont003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W200}, {.i32 = ARKUI_FONT_STYLE_ITALIC}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W200);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_2].i32, ARKUI_FONT_STYLE_ITALIC);
    NAPI_END;
}

static napi_value TestTextFont004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W300}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W300);
    NAPI_END;
}

static napi_value TestTextFont005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W400}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W400);
    NAPI_END;
}

static napi_value TestTextFont006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W500}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W500);
    NAPI_END;
}

static napi_value TestTextFont007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W600}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W600);
    NAPI_END;
}

static napi_value TestTextFont008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W700}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W700);
    NAPI_END;
}

static napi_value TestTextFont009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W800}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W800);
    NAPI_END;
}

static napi_value TestTextFont010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_W900}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_W900);
    NAPI_END;
}

static napi_value TestTextFont011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_BOLD);
    NAPI_END;
}

static napi_value TestTextFont012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value TestTextFont013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_BOLDER}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_BOLDER);
    NAPI_END;
}

static napi_value TestTextFont014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_LIGHTER}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_LIGHTER);
    NAPI_END;
}

static napi_value TestTextFont015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_MEDIUM}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

static napi_value TestTextFont016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = ARKUI_FONT_WEIGHT_REGULAR}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, ARKUI_FONT_WEIGHT_REGULAR);
    NAPI_END;
}

static napi_value TestTextFont017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = -20;
    int32_t exceptionValue = -1;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}, {.i32 = exceptionValue}, {.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(text, NODE_TEXT_FONT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_1].i32, exceptionValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_2].i32, exceptionValue);
    };
    NAPI_END;
}

static napi_value TestTextFont018(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float sizeValue = 100;
    ArkUI_NumberValue value[] = {{.f32 = sizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_FONT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(text, NODE_TEXT_FONT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_FONT)->value[PARAM_0].f32, sizeValue);
    };
    NAPI_END;
}
} // namespace ArkUICapiTest

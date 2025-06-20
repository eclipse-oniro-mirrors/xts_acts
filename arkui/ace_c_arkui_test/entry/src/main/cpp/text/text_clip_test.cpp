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

static napi_value TestTextClip001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t clipValue = 0;
    ArkUI_NumberValue value[] = {{.i32 = clipValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP)->value[PARAM_0].i32, clipValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t clipValue = 1;
    ArkUI_NumberValue value[] = {{.i32 = clipValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP)->value[PARAM_0].i32, clipValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t clipValue = -1;
    ArkUI_NumberValue value[] = {{.i32 = clipValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP)->value[PARAM_0].i32, clipValue);
    };

    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextClip004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = 40;
    float heightValue = 40;
    float filletWidthValue = 10;
    float filletHeightValue = 10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE},
                                 {.f32 = widthValue},
                                 {.f32 = heightValue},
                                 {.f32 = filletWidthValue},
                                 {.f32 = filletHeightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_3].f32, filletWidthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_4].f32, filletHeightValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = 40;
    float heightValue = 40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = 40;
    float heightValue = 40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = 40;
    float heightValue = 40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M0 10 L80 0";
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->string, "M0 10 L80 0");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextClip008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exception = -1;
    float widthValue = 40;
    float heightValue = 40;
    ArkUI_NumberValue value[] = {{.i32 = exception}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_0].i32, exception);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextClip009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = -40;
    float heightValue = -40;
    float filletWidthValue = -10;
    float filletHeightValue = -10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE},
                                 {.f32 = widthValue},
                                 {.f32 = heightValue},
                                 {.f32 = filletWidthValue},
                                 {.f32 = filletHeightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_3].f32, filletWidthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_4].f32, filletHeightValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextClip010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = -40;
    float heightValue = -40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextClip011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = -40;
    float heightValue = -40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextClip012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float widthValue = -40;
    float heightValue = -40;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = widthValue}, {.f32 = heightValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M0 10 L80 0";
    auto ret = nodeAPI->setAttribute(text, NODE_CLIP_SHAPE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_1].f32, widthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_CLIP_SHAPE)->value[PARAM_2].f32, heightValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest

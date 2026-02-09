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

static napi_value TestCommonAttrsClipShape001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_3].f32, radiusWidth);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_4].f32, radiusHeight);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_90;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_3].f32, radiusWidth);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_4].f32, radiusHeight);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = PARAM_NEGATIVE_1;
    float radiusHeight = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_110;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_NEGATIVE_1;
    float height = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_NEGATIVE_1;
    float height = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape009(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_110;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape010(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M60 0 L120 100 L0 100 Z";
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->string, "M60 0 L120 100 L0 100 Z");
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape011(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_NEGATIVE_1;
    float height = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M60 0 L120 100 L0 100 Z";
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape012(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_110;
    float height = SIZE_110;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "";
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->string, "");
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape013(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_10;
    float radiusHeight = SIZE_10;
    float leftTop = PARAM_NEGATIVE_2;
    float rightTop = SIZE_10;
    float rightBottom = SIZE_10;
    float leftBottom = SIZE_10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}, {.f32 = leftTop},
                                 {.f32 = rightTop}, {.f32 = rightBottom}, {.f32 = leftBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape014(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    float leftTop = SIZE_10;
    float rightTop = SIZE_0;
    float rightBottom = SIZE_0;
    float leftBottom = PARAM_NEGATIVE_2;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}, {.f32 = leftTop},
                                 {.f32 = rightTop}, {.f32 = rightBottom}, {.f32 = leftBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape015(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    float leftTop = PARAM_NEGATIVE_1;
    float rightTop = PARAM_NEGATIVE_1;
    float rightBottom = PARAM_NEGATIVE_1;
    float leftBottom = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}, {.f32 = leftTop},
                                 {.f32 = rightTop}, {.f32 = rightBottom}, {.f32 = leftBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape016(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float clipType = PARAM_NEGATIVE_1;
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    ArkUI_NumberValue value[] = {{.f32 = clipType}, {.f32 = width}, {.f32 = height}, {.f32 = radiusWidth},
                                 {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape017(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float clipType = PARAM_4;
    float width = SIZE_130;
    float height = SIZE_110;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    ArkUI_NumberValue value[] = {{.f32 = clipType}, {.f32 = width}, {.f32 = height}, {.f32 = radiusWidth},
                                 {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape018(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_500;
    float height = SIZE_300;
    float radiusWidth = SIZE_30;
    float radiusHeight = SIZE_10;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height},
                                 {.f32 = radiusWidth}, {.f32 = radiusHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_3].f32, radiusWidth);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_4].f32, radiusHeight);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape019(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_500;
    float height = SIZE_300;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape020(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_500;
    float height = SIZE_300;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestCommonAttrsClipShape021(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = SIZE_500;
    float height = SIZE_300;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M60 0 L120 100 L0 100 Z";
    auto ret = nodeAPI->setAttribute(column, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_CLIP_SHAPE)->string, "M60 0 L120 100 L0 100 Z");
    NAPI_END;
}
} // namespace ArkUICapiTest
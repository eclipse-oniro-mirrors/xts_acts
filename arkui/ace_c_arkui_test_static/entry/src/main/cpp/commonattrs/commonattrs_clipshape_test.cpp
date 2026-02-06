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

#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestCommonAttrsClipShape001(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape002(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape003(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape004(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape005(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape006(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape007(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape008(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape009(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape010(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape011(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape012(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape013(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape014(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape015(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape016(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape017(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape018(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape019(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape020(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsClipShape021(ani_env* env, ani_object info)
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
} // namespace ArkUIAniTest
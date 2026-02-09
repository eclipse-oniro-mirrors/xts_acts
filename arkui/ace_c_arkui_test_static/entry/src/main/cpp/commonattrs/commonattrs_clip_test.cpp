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

static ani_double TestCommonAttrsClip001(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t clip = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = clip}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP)->value[PARAM_0].i32, clip);
    NAPI_END;
}

static ani_double TestCommonAttrsClip002(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t clip = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = clip}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP)->value[PARAM_0].i32, clip);
    NAPI_END;
}

static ani_double TestCommonAttrsClip003(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t clip = PARAM_2;
    ArkUI_NumberValue value[] = {{.i32 = clip}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(imageSpan, NODE_CLIP)->value[PARAM_0].i32, clip);
    NAPI_END;
}

static ani_double TestCommonAttrsClip004(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float width = SIZE_300;
    float height = SIZE_200;
    float filleWidth = SIZE_10;
    float filleHeight = SIZE_10;
    ArkUI_NumberValue value[] = {
        {.i32 = ARKUI_CLIP_TYPE_RECTANGLE}, {.f32 = width}, {.f32 = height}, {.f32 = filleWidth}, {.f32 = filleHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_3].f32, filleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_4].f32, filleWidth);
    NAPI_END;
}

static ani_double TestCommonAttrsClip005(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float width = SIZE_300;
    float height = SIZE_300;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static ani_double TestCommonAttrsClip006(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float width = SIZE_300;
    float height = SIZE_200;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static ani_double TestCommonAttrsClip007(ani_env* env, ani_object info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float width = SIZE_300;
    float height = SIZE_200;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M100 0 L200 300 L0 300 Z";
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_CLIP_SHAPE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_STREQ(nodeAPI->getAttribute(imageSpan, NODE_CLIP_SHAPE)->string, "M100 0 L200 300 L0 300 Z");
    NAPI_END;
}

} // namespace ArkUIAniTest

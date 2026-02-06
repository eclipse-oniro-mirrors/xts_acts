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

#define DEFAULT_VALUE 0
#define MIN_VALUE 1
#define MAX_VALUE 2
#define OUTER_WIDTH_VALUE 300.0
#define OUTER_HEIGHT_VALUE 200.0
#define FILE_WIDTH_VALUE 10.0
#define FILE_HEIGHT_VALUE 10.0
#define TYPE_VALUE "M100 0 L200 300 L0 300 Z"

namespace ArkUICapiTest {

static napi_value TestImageClip001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t clip = MIN_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = clip}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP, &value_item);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP)->value[PARAM_0].i32, clip);
    NAPI_END;
}

static napi_value TestImageClip002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t clip = DEFAULT_VALUE;
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP)->value[PARAM_0].i32, clip);
    NAPI_END;
}

static napi_value TestImageClip003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t clip = MAX_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = clip}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_CLIP) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_CLIP)->value[PARAM_0].i32, clip);
    }

    NAPI_END;
}

static napi_value TestImageClip004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float width = OUTER_WIDTH_VALUE;
    float height = OUTER_HEIGHT_VALUE;
    float filleWidth = FILE_WIDTH_VALUE;
    float filleHeight = FILE_HEIGHT_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = ArkUI_ClipType::ARKUI_CLIP_TYPE_RECTANGLE},
                                 {.f32 = width},
                                 {.f32 = height},
                                 {.f32 = filleWidth},
                                 {.f32 = filleHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP_SHAPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_3].f32, filleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_4].f32, filleWidth);
    NAPI_END;
}

static napi_value TestImageClip005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float width = OUTER_WIDTH_VALUE;
    float height = OUTER_HEIGHT_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP_SHAPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_0].i32,
              ArkUI_ClipType::ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestImageClip006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float width = OUTER_WIDTH_VALUE;
    float height = OUTER_HEIGHT_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP_SHAPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_0].i32,
              ArkUI_ClipType::ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    NAPI_END;
}

static napi_value TestImageClip007(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float width = OUTER_WIDTH_VALUE;
    float height = OUTER_HEIGHT_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = TYPE_VALUE;
    auto ret = nodeAPI->setAttribute(image, NODE_CLIP_SHAPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ArkUI_ClipType::ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->value[PARAM_2].f32, height);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_CLIP_SHAPE)->string, TYPE_VALUE);
    NAPI_END;
}

} // namespace ArkUICapiTest

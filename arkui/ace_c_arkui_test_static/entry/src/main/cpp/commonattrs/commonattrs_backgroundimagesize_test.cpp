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

#define ARKUI_IMAGE_SIZE_FILL 3

namespace ArkUIAniTest {

static ani_double TestCommonAttrsBackgroundImageSize001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_100;
    float height = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, height);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_100;
    float height = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_NEGATIVE_100;
    float height = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_NEGATIVE_100;
    float height = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.f32 = width}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_0;
    float height = PARAM_100;
    ArkUI_NumberValue value[] = {{}, {.f32 = height}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, height);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_100;
    float height = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = width}, {}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_300;
    float height = PARAM_300;
    ArkUI_NumberValue value[] = {{}, {}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize008(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = ARKUI_IMAGE_SIZE_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize009(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = ARKUI_IMAGE_SIZE_COVER;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE)->value[PARAM_0].i32, imageSize);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize010(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = ARKUI_IMAGE_SIZE_CONTAIN;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize011(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = ARKUI_IMAGE_SIZE_FILL;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize012(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize013(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageSize = PARAM_4;
    ArkUI_NumberValue value[] = {{.i32 = imageSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsBackgroundImageSize014(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float width = PARAM_100;
    float height = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = width}, {}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    auto ret = nodeAPI->resetAttribute(column, NODE_BACKGROUND_IMAGE_SIZE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest

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


static ani_double TestCommonAttrsTransformCenter001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_50;
    float y = PARAM_50;
    float z = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_50;
    float y = PARAM_50;
    float z = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_50;
    float y = PARAM_NEGATIVE_50;
    float z = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_50;
    float y = PARAM_50;
    float z = PARAM_50;
    float xPercentage = PARAM_0_POINT_2;
    float yPercentage = PARAM_0_POINT_2;
    float zPercentage = PARAM_0_POINT_2;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = xPercentage}, {.f32 = yPercentage},
                                 {.f32 = zPercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_50;
    float y = PARAM_50;
    float z = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {}, {}, {}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_50;
    float y = PARAM_50;
    float z = PARAM_50;
    float xPercentage = PARAM_0_POINT_2;
    float yPercentage = PARAM_NEGATIVE_0_POINT_8;
    float zPercentage = PARAM_0_POINT_2;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = xPercentage}, {.f32 = yPercentage},
                                 {.f32 = zPercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransformCenter007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_50;
    float y = PARAM_NEGATIVE_50;
    float z = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_TRANSFORM_CENTER, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_TRANSFORM_CENTER);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSFORM_CENTER)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance scale the License.
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

static ani_double TestCommonAttrsScale001(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_0_POINT_5;
    float scaleY = PARAM_0_POINT_5;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale002(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_0_POINT_5;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale003(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_2;
    float scaleY = PARAM_2;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale004(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_2;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale005(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_1;
    float scaleY = PARAM_1;
    auto flexDefault = nodeAPI->createNode(ARKUI_NODE_FLEX);
    ASSERT_EQ(nodeAPI->getAttribute(flexDefault, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flexDefault, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale006(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_NEGATIVE_1;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale007(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_1;
    float scaleY = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale008(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_0;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale009(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_1;
    float scaleY = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static ani_double TestCommonAttrsScale010(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float scaleX = PARAM_0_POINT_5;
    float scaleY = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(flex, NODE_SCALE, &valueItem);
    auto ret = nodeAPI->resetAttribute(flex, NODE_SCALE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_0].f32, PARAM_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SCALE)->value[PARAM_1].f32, PARAM_1);
    NAPI_END;
}
} // namespace ArkUIAniTest

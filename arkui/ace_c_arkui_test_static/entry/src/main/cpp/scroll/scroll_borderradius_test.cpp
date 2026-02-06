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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000
#define BORDER_RADIUS 40
#define RADIUS_TEN 10
#define ABNORMAL_RADIUS_TEN (-10)
#define RADIUS_FIFTY 50
#define ARRAY_LENGTH 4

namespace ArkUIAniTest {

static ani_double TestScrollBorderRadius001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = BORDER_RADIUS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_0].f32, BORDER_RADIUS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_1].f32, BORDER_RADIUS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_2].f32, BORDER_RADIUS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_3].f32, BORDER_RADIUS);
    NAPI_END;
}

static ani_double TestScrollBorderRadius002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[ARRAY_LENGTH] = {
        {.f32 = ABNORMAL_RADIUS_TEN}, {.f32 = RADIUS_FIFTY}, {.f32 = RADIUS_TEN}, {.f32 = RADIUS_FIFTY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_0].f32, ABNORMAL_RADIUS_TEN);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_1].f32, RADIUS_FIFTY);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_2].f32, RADIUS_TEN);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_3].f32, RADIUS_FIFTY);
    }
    NAPI_END;
}

static ani_double TestScrollBorderRadius003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[ARRAY_LENGTH] = {
        {.f32 = RADIUS_TEN}, {.f32 = RADIUS_FIFTY}, {.f32 = RADIUS_TEN}, {.f32 = RADIUS_FIFTY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_0].f32, RADIUS_TEN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_1].f32, RADIUS_FIFTY);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_2].f32, RADIUS_TEN);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_RADIUS)->value[PARAM_3].f32, RADIUS_FIFTY);
    NAPI_END;
}
} // namespace ArkUIAniTest

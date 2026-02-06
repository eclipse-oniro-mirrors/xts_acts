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

#include <arkui/native_animate.h>

#include "common/common.h"
#include "ani/ani.h"
namespace ArkUIAniTest {

static ani_double TestGeometryTransition001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem item = { .string = "pic" };
    auto ret1 = nodeAPI->setAttribute(column, NODE_GEOMETRY_TRANSITION, &item);
    auto ret2 = nodeAPI->getAttribute(column, NODE_GEOMETRY_TRANSITION);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2->value[0].i32, PARAM_0);
    ASSERT_EQ(strcmp(ret2->string, "pic"), PARAM_0);
    NAPI_END;
}

static ani_double TestGeometryTransition002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue geometry_transition_value[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem item = { geometry_transition_value, PARAM_1 };
    item.string = "";
    auto ret1 = nodeAPI->setAttribute(column, NODE_GEOMETRY_TRANSITION, &item);
    auto ret2 = nodeAPI->getAttribute(column, NODE_GEOMETRY_TRANSITION);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2->value[0].i32, PARAM_0);
    ASSERT_EQ(strcmp(ret2->string, ""), PARAM_0);
    NAPI_END;
}

static ani_double TestGeometryTransition003(ani_env* env, ani_object info)
{
    NAPI_START(column1, ARKUI_NODE_COLUMN);
    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue geometry_transition_value1[] = { { .i32 = PARAM_0 } };
    ArkUI_NumberValue geometry_transition_value2[] = { { .i32 = PARAM_1 } };
    ArkUI_AttributeItem item1 = { geometry_transition_value1, PARAM_1 };
    ArkUI_AttributeItem item2 = { geometry_transition_value2, PARAM_1 };
    item1.string = "pic";
    item2.string = "pic";
    auto ret1 = nodeAPI->setAttribute(column1, NODE_GEOMETRY_TRANSITION, &item1);
    auto ret2 = nodeAPI->setAttribute(column2, NODE_GEOMETRY_TRANSITION, &item2);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestGeometryTransition004(ani_env* env, ani_object info)
{
    NAPI_START(column1, ARKUI_NODE_COLUMN);
    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue geometry_transition_value[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem item = { geometry_transition_value, PARAM_1 };
    item.string = "pic";
    nodeAPI->setAttribute(column1, NODE_GEOMETRY_TRANSITION, &item);
    nodeAPI->setAttribute(column2, NODE_GEOMETRY_TRANSITION, &item);
    auto ret1 = nodeAPI->setAttribute(column3, NODE_GEOMETRY_TRANSITION, &item);
    auto ret2 = nodeAPI->getAttribute(column1, NODE_GEOMETRY_TRANSITION);
    auto ret3 = nodeAPI->getAttribute(column3, NODE_GEOMETRY_TRANSITION);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(strcmp(ret2->string, "pic"), PARAM_0);
    ASSERT_EQ(strcmp(ret3->string, "pic"), PARAM_0);
    NAPI_END;
}

static ani_double TestGeometryTransition005(ani_env* env, ani_object info)
{
    NAPI_START(column1, ARKUI_NODE_COLUMN);
    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue geometry_transition_value1[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem item1 = { geometry_transition_value1, PARAM_1 };
    item1.string = "pic1";
    ArkUI_NumberValue geometry_transition_value2[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem item2 = { geometry_transition_value2, PARAM_1 };
    item2.string = "pic2";
    nodeAPI->setAttribute(column1, NODE_GEOMETRY_TRANSITION, &item1);
    nodeAPI->setAttribute(column2, NODE_GEOMETRY_TRANSITION, &item2);
    nodeAPI->setAttribute(column3, NODE_GEOMETRY_TRANSITION, &item2);
    auto ret1 = nodeAPI->setAttribute(column1, NODE_GEOMETRY_TRANSITION, &item2);
    auto ret2 = nodeAPI->getAttribute(column1, NODE_GEOMETRY_TRANSITION);
    auto ret3 = nodeAPI->getAttribute(column3, NODE_GEOMETRY_TRANSITION);
    ASSERT_EQ(ret1, PARAM_0);
    ASSERT_EQ(strcmp(ret2->string, "pic2"), PARAM_0);
    ASSERT_EQ(strcmp(ret3->string, "pic2"), PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest
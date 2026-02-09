/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <arkui/native_interface.h>


#include "arkui/native_node.h"
#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {
#define SIZE_1000 1000

static auto SetDivider(ArkUI_NodeHandle list, uint32_t color, float width, float begin, float end)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = begin }, { .f32 = end } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_DIVIDER, &item);
    return ret;
}

static ani_double TestListDivider001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_1;
    float begin = PARAM_1;
    float end = PARAM_1;
    auto ret = SetDivider(list, color, width, begin, end);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_2].f32, begin);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_3].f32, end);
    NAPI_END;
}

static ani_double TestListDivider002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_0;
    float begin = PARAM_0;
    float end = PARAM_0;
    auto ret = SetDivider(list, color, width, begin, end);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_2].f32, begin);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_3].f32, end);
    NAPI_END;
}

static ani_double TestListDivider003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_NEGATIVE_1;
    float begin = PARAM_NEGATIVE_1;
    float end = PARAM_NEGATIVE_1;
    auto ret = SetDivider(list, color, width, begin, end);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_0].u32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_3].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestListDivider004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    uint32_t color = COLOR_YELLOW;
    float width = SIZE_1000;
    float begin = SIZE_1000;
    float end = SIZE_1000;
    auto ret = SetDivider(list, color, width, begin, end);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_1].f32, width);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_2].f32, begin);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_3].f32, end);
    NAPI_END;
}

static ani_double TestListDivider005(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_DIVIDER);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_0].u32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_1].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_2].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIVIDER)->value[PARAM_3].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest
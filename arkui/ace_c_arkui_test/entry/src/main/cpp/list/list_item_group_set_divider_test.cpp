/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
using namespace std;
#define SIZE_1000 1000

static auto SetItemGroupDivider(ArkUI_NodeHandle list, uint32_t color, float width, float begin, float end)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = begin }, { .f32 = end } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_ITEM_GROUP_SET_DIVIDER, &item);
    return ret;
}

static auto CreateGroupWithDivider(ArkUI_NodeHandle list)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto group = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM_GROUP);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item2 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item3 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item4 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item5 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    nodeAPI->addChild(list, group);
    nodeAPI->addChild(group, item1);
    nodeAPI->addChild(group, item2);
    nodeAPI->addChild(group, item3);
    nodeAPI->addChild(group, item4);
    nodeAPI->addChild(group, item5);
    return group;
}

static napi_value TestListItemGroupSetDivider001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithDivider(list);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_1;
    float begin = PARAM_1;
    float end = PARAM_1;
    auto ret = SetItemGroupDivider(group, color, width, begin, end);
    auto log1 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_0].u32;
    auto log2 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_1].f32;
    auto log3 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_2].f32;
    auto log4 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log1 = %{public}u", log1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log2 = %{public}f", log2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log3 = %{public}f", log3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log4 = %{public}f", log4);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(log1, color);
    ASSERT_EQ(log2, width);
    ASSERT_EQ(log3, begin);
    ASSERT_EQ(log4, end);
    NAPI_END;
}

static napi_value TestListItemGroupSetDivider002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithDivider(list);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_0;
    float begin = PARAM_0;
    float end = PARAM_0;
    auto ret = SetItemGroupDivider(group, color, width, begin, end);
    auto log1 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_0].u32;
    auto log2 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_1].f32;
    auto log3 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_2].f32;
    auto log4 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log1 = %{public}u", log1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log2 = %{public}f", log2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log3 = %{public}f", log3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log4 = %{public}f", log4);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(log1, color);
    ASSERT_EQ(log2, width);
    ASSERT_EQ(log3, begin);
    ASSERT_EQ(log4, end);
    NAPI_END;
}

static napi_value TestListItemGroupSetDivider003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithDivider(list);
    uint32_t color = COLOR_YELLOW;
    float width = PARAM_NEGATIVE_1;
    float begin = PARAM_NEGATIVE_1;
    float end = PARAM_NEGATIVE_1;
    auto ret = SetItemGroupDivider(group, color, width, begin, end);
    auto log1 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_0].u32;
    auto log2 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_1].f32;
    auto log3 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_2].f32;
    auto log4 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider003", "log1 = %{public}u", log1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider003", "log2 = %{public}f", log2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider003", "log3 = %{public}f", log3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider003", "log4 = %{public}f", log4);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(log1, PARAM_0);
    ASSERT_EQ(log2, PARAM_0);
    ASSERT_EQ(log3, PARAM_0);
    ASSERT_EQ(log4, PARAM_0);
    NAPI_END;
}

static napi_value TestListItemGroupSetDivider004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithDivider(list);
    uint32_t color = COLOR_YELLOW;
    float width = SIZE_1000;
    float begin = SIZE_1000;
    float end = SIZE_1000;
    auto ret = SetItemGroupDivider(group, color, width, begin, end);
    auto log1 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_0].u32;
    auto log2 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_1].f32;
    auto log3 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_2].f32;
    auto log4 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log1 = %{public}u", log1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log2 = %{public}f", log2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log3 = %{public}f", log3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider001", "log4 = %{public}f", log4);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(log1, color);
    ASSERT_EQ(log2, width);
    ASSERT_EQ(log3, begin);
    ASSERT_EQ(log4, end);
    NAPI_END;
}

static napi_value TestListItemGroupSetDivider005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto group = CreateGroupWithDivider(list);
    auto ret = nodeAPI->resetAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER);
    auto log1 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_0].u32;
    auto log2 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_1].f32;
    auto log3 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_2].f32;
    auto log4 = nodeAPI->getAttribute(group, NODE_LIST_ITEM_GROUP_SET_DIVIDER)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider005", "log1 = %{public}u", log1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider005", "log2 = %{public}f", log2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider005", "log3 = %{public}f", log3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListItemGroupSetDivider005", "log4 = %{public}f", log4);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(log1, PARAM_0);
    ASSERT_EQ(log2, PARAM_0);
    ASSERT_EQ(log3, PARAM_0);
    ASSERT_EQ(log4, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest
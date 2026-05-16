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

static auto SetItemSwipeAction(ArkUI_NodeHandle list, ArkUI_ListItemSwipeActionOption* option)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_AttributeItem item = {};
    item.object = option;
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_ITEM_SWIPE_ACTION, &item);
    return ret;
}

static auto CreateSwipeAction()
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto option = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto item1 = OH_ArkUI_ListItemSwipeActionItem_Create();
    auto item2 = OH_ArkUI_ListItemSwipeActionItem_Create();
    auto col1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto col2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, col1);
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item2, col2);
    OH_ArkUI_ListItemSwipeActionOption_SetStart(option, item1);
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(option, item2);
    return option;
}

static napi_value TestListItemSwipeAction001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto option = CreateSwipeAction();
    auto ret = SetItemSwipeAction(list, option);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestListItemSwipeAction002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto option = nullptr;
    auto ret = SetItemSwipeAction(list, option);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestListItemSwipeAction003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_ITEM_SWIPE_ACTION);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestListItemSwipeAction004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto option = CreateSwipeAction();
    OH_ArkUI_ListItemSwipeActionOption_Dispose(option);
    option = nullptr;
    auto ret = SetItemSwipeAction(list, option);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_OBJ(option, nullptr);
    NAPI_END;
}

static napi_value TestListItemSwipeAction005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto option = CreateSwipeAction();
    OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect(option, ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_SPRING);
    auto ret1 = OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect(option);
    auto ret = SetItemSwipeAction(list, option);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_SPRING);
    NAPI_END;
}

static napi_value TestListItemSwipeAction006(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto option = CreateSwipeAction();
    OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect(option, ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_NONE);
    auto ret1 = OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect(option);
    auto ret = SetItemSwipeAction(list, option);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_NONE);
    NAPI_END;
}

} // namespace ArkUICapiTest
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance rotate the License.
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
#include <functional>
#include <string>

namespace ArkUICapiTest {

static bool OnAttachToNode(ArkUI_NodeAdapterEvent *event)
{
    // 获取使用该适配器的滚动类容器节点
    ArkUI_NodeHandle nodeHandle = OH_ArkUI_NodeAdapterEvent_GetHostNode(event);
    if (nodeHandle == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListNodeAdapterEvent", "OnAttachToNode failed");
        return false;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestListNodeAdapterEvent", "OnAttachToNode OK");
    return true;
}

static bool OnDetachFromNode(ArkUI_NodeAdapterEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestListNodeAdapterEvent", "OnDetachFromNode OK");
    return true;
}

static int32_t OnGetNodeId(ArkUI_NodeAdapterEvent *event)
{
    // 获取适配器事件时需要操作的元素序号
    auto index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
    std::hash<std::string> hash_func;
    auto componentId = hash_func("new change data");
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "TestListNodeAdapterEvent",
        "OnGetNodeId index:%{public}d, %lu",
        index,
        componentId);
    // 设置生成的组件标识
    int32_t ret = OH_ArkUI_NodeAdapterEvent_SetNodeId(event, componentId);
    return ret;
}

static int32_t OnAddNodeToAdapter(ArkUI_NativeNodeAPI_1 *nodeApi, ArkUI_NodeAdapterEvent *event)
{
    auto listItem = nodeApi->createNode(ARKUI_NODE_LIST_ITEM);
    ArkUI_NumberValue value[] = {20};
    ArkUI_AttributeItem height{value, 1};
    nodeApi->setAttribute(listItem, NODE_HEIGHT, &height);
    // 设置需要新增到Adapter中的组件
    int32_t ret = OH_ArkUI_NodeAdapterEvent_SetItem(event, listItem);
    return ret;
}

static bool OnRemoveNodeFromAdapter(ArkUI_NodeAdapterEvent *event)
{
    // 获取需要销毁的事件中待销毁的元素
    auto *node = OH_ArkUI_NodeAdapterEvent_GetRemovedNode(event);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "TestListNodeAdapterEvent",
        "OnRemoveNodeFromAdapter node:%{public}p",
        node);
    return true;
}

// 回调函数
static void CallBack(ArkUI_NodeAdapterEvent *event)
{
    // 获取组件事件中的用户自定义数据
    auto *userData = OH_ArkUI_NodeAdapterEvent_GetUserData(event);
    if (userData == nullptr) {
        // 用户传入的是空指针
    }
    ArkUI_NativeNodeAPI_1 *nodeApi = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(userData);

    // 获取事件类型
    auto type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    switch (type) {
        // 组件和适配器关联时发生
        case NODE_ADAPTER_EVENT_WILL_ATTACH_TO_NODE:
            OnAttachToNode(event);
            break;
        // 组件和适配器取消关联时产生该事件
        case NODE_ADAPTER_EVENT_WILL_DETACH_FROM_NODE:
            OnDetachFromNode(event);
            break;
        // 适配器需要添加新元素时获取新元素的唯一标识符时产生该事件
        case NODE_ADAPTER_EVENT_ON_GET_NODE_ID:
            OnGetNodeId(event);
            break;
        // 适配器需要添加新元素时获取新元素的内容时产生该事件
        case NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER:
            OnAddNodeToAdapter(nodeApi, event);
            break;
        // 适配器将元素移除时产生该事件
        case NODE_ADAPTER_EVENT_ON_REMOVE_NODE_FROM_ADAPTER:
            OnRemoveNodeFromAdapter(event);
            break;
        default:
            break;
    }
}

static napi_value TestListNodeAdapterEvent001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);

    // 创建适配器
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();

    // 注册事件回调函数
    int ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nodeAPI, CallBack);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    // 把adapter挂载到list上
    ArkUI_AttributeItem item{nullptr, 0, nullptr, adapter};
    ret = nodeAPI->setAttribute(list, NODE_LIST_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);

    NAPI_END;
}

}  // namespace ArkUICapiTest

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <hilog/log.h>
#include <vector>
#include "list/NodeXtsListTest.h"

namespace ArkUICapiTest {
namespace {
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
}

struct MyAsyncData {
    ArkUI_NodeHandle root =
        nullptr; // 框架创建的已上树的节点，所有开发者创建的根组件（无父组件的组件）都会作为root的子节点来绘制
    std::vector<ArkUI_NodeHandle> nodeList; // 保存开发者创建的组件
    void (*RunOnUIThreadList)(ArkUI_NativeNodeAPI_1 *nodeAPI,
                          std::vector<ArkUI_NodeHandle> &nodeList); // 在UI线程执行的开发者回调
    void (*RunOnSubThreadList)(ArkUI_NativeNodeAPI_1 *nodeAPI,
                           std::vector<ArkUI_NodeHandle> &nodeList); // 在子线程执行的开发者回调
};

void OnCreateNodeList(void *asyncUITaskData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNodeList begin");
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNodeList get nodeAPI failed");
        return ;
    }
    auto data = static_cast<MyAsyncData *>(asyncUITaskData);
    if (!data) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk",
                     "OnCreateNodeList get ArkUI_AsyncNativeNodeAPI_1 failed");
        return ;
    }
    std::vector<ArkUI_NodeHandle> nodeList;
    if (data->RunOnSubThreadList) {
        data->RunOnSubThreadList(nodeAPI, nodeList);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "invalid RunOnSubThreadList Func");
    }
    data->nodeList = nodeList;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNodeList end");
}

void OnAttachTreeList(void *asyncUITaskData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTreeList begin");
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTreeList get nodeAPI failed");
        return ;
    }
    auto data = static_cast<MyAsyncData *>(asyncUITaskData);
    if (!data) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk",
                     "OnAttachTreeList get ArkUI_AsyncNativeNodeAPI_1 failed");
        return ;
    }
    auto nodeList = data->nodeList;
    auto root = data->root;
    for (auto node : nodeList) {
        auto parent = nodeAPI->getParent(node);
        if (!parent) {
            nodeAPI->addChild(root, node);
        }
    }
    if (data->RunOnUIThreadList) {
        data->RunOnUIThreadList(nodeAPI, nodeList);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "invalid RunOnUIThreadList Func");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTreeList end");
}

MyAsyncData *g_listAsyncData = nullptr;
napi_value NodeXTSListTest::CreateCNodeTreeList(napi_env env, napi_callback_info info,
                           void (RunOnUIThreadList)(ArkUI_NativeNodeAPI_1 *nodeAPI,
                                               std::vector<ArkUI_NodeHandle> &nodeList),
                           void (RunOnSubThreadList)(ArkUI_NativeNodeAPI_1 *nodeAPI,
                                                std::vector<ArkUI_NodeHandle> &nodeList)) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "CreateCNodeTreeList begin");
    if (g_listAsyncData) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "g_listAsyncData not nullptr");
        return nullptr;
    }
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取NodeContent
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle);
    ArkUI_ContextHandle contextHandle;
    OH_ArkUI_GetContextFromNapiValue(env, args[1], &contextHandle);

    // 创建root节点
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto root = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue width_value[] = {{.f32 = 300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(root, NODE_WIDTH, &width_item);

    // 添加root节点到NodeContent上用于挂载显示
    if (OH_ArkUI_NodeContent_AddNode(contentHandle, root) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OH_ArkUI_NodeContent_AddNode failed");
        delete contextHandle;
        return nullptr;
    }

    g_listAsyncData = new MyAsyncData();
    g_listAsyncData->root = root;
    g_listAsyncData->RunOnUIThreadList = RunOnUIThreadList;
    g_listAsyncData->RunOnSubThreadList = RunOnSubThreadList;

    if (OH_ArkUI_PostAsyncUITask(contextHandle, g_listAsyncData, (void (*)(void *))OnCreateNodeList, (void (*)(void *))OnAttachTreeList) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OH_ArkUI_PostAsyncUITask failed");
    }
    delete contextHandle;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "CreateCNodeTreeList end");
    return nullptr;
}

napi_value NodeXTSListTest::DisposeCNodeTreeList(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "DisposeCNodeTreeList begin");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取NodeContent
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle);
    if (!g_listAsyncData) {
        return nullptr;
    }
    auto root = g_listAsyncData->root;
    auto nodeList = g_listAsyncData->nodeList;
    if (!root) {
        delete g_listAsyncData;
        g_listAsyncData = nullptr;
        return nullptr;
    }
    OH_ArkUI_NodeContent_RemoveNode(contentHandle, root);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk",
                     "get ArkUI_AsyncNativeNodeAPI_1 failed");
        delete g_listAsyncData;
        g_listAsyncData = nullptr;
        return nullptr;
    }
    for (auto node : nodeList) {
        auto parent = nodeAPI->getParent(node);
        if (parent) {
            nodeAPI->removeChild(parent, node);
        }
    }
    for (auto node : nodeList) {
        nodeAPI->disposeNode(node);
    }
    nodeAPI->disposeNode(root);
    delete g_listAsyncData;
    g_listAsyncData = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "DisposeCNodeTreeList end");
    return nullptr;
}
} // namespace ArkUICapiTest
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
#include "common/common.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <hilog/log.h>
#include "xcomponent/NodeXtsTest.h"

namespace ArkUICapiTest {
namespace ArkUIXComponentCApiDemo {
namespace {
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
}
void OnCreateNode(void *asyncUITaskData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNode begin");
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNode get nodeAPI failed");
        return;
    }
    auto data = static_cast<MyAsyncData *>(asyncUITaskData);
    if (!data) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNode get ArkUI_AsyncNativeNodeAPI_1 failed");
        return;
    }
    std::vector<ArkUI_NodeHandle> nodeList;
    if (data->RunOnSubThread) {
        data->RunOnSubThread(nodeAPI,nodeList);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "invalid RunOnSubThread Func");
    }
    data->nodeList = nodeList;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnCreateNode end");
}

void OnAttachTree(void *asyncUITaskData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTree begin");
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTree get nodeAPI failed");
        return;
    }
    auto data = static_cast<MyAsyncData *>(asyncUITaskData);
    if (!data) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTree get ArkUI_AsyncNativeNodeAPI_1 failed");
        return;
    }
    auto nodeList = data->nodeList;
    auto root = data->root;
    for (auto node : nodeList) {
        auto parent = nodeAPI->getParent(node);
        if (!parent) {
            nodeAPI->addChild(root, node);
        }
    }
    if (data->RunOnUIThread) {
        data->RunOnUIThread(nodeAPI,nodeList);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "invalid RunOnUIThread Func");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OnAttachTree end");
}

napi_value NodeXTSTest::CreateCNodeTree(napi_env env, napi_callback_info info,
    void (RunOnUIThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList),
    void (RunOnSubThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList))
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "CreateCNodeTree begin");
    if (g_asyncData) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "g_asyncData not nullptr");
        return nullptr;
    }
    size_t argc = 2;
    napi_value args[PARAM_2] = { nullptr, nullptr };
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
    ArkUI_NumberValue width_value[] = { { .f32 = 300 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(root, NODE_WIDTH, &width_item);

    // 添加root节点到NodeContent上用于挂载显示
    if (OH_ArkUI_NodeContent_AddNode(contentHandle, root) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OH_ArkUI_NodeContent_AddNode failed");
        delete contextHandle;
        return nullptr;
    }
    
    g_asyncData = new MyAsyncData();
    g_asyncData->root = root;
    g_asyncData->RunOnUIThread = RunOnUIThread;
    g_asyncData->RunOnSubThread = RunOnSubThread;
    
    if (OH_ArkUI_PostAsyncUITask(contextHandle, g_asyncData, OnCreateNode, OnAttachTree) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "OH_ArkUI_PostAsyncUITask failed");
    }
    delete contextHandle;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "CreateCNodeTree end");
    return nullptr;
}

napi_value NodeXTSTest::DisposeCNodeTree(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "DisposeCNodeTree begin");
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取NodeContent
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle);
    if (!g_asyncData) {
        return nullptr;
    }
    auto root = g_asyncData->root;
    auto nodeList = g_asyncData->nodeList;
    if (!root) {
        delete g_asyncData;
        g_asyncData = nullptr;
        return nullptr;
    }
    OH_ArkUI_NodeContent_RemoveNode(contentHandle, root);
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "get ArkUI_AsyncNativeNodeAPI_1 failed");
        delete g_asyncData;
        g_asyncData = nullptr;
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
    delete g_asyncData;
    g_asyncData = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MultiThreadTestFwk", "DisposeCNodeTree end");
    return nullptr;
}
}
}  // namespace ArkUICApiDemo


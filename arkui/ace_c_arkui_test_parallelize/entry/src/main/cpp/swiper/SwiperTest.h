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

#ifndef ARKUI_CAPI_DEMO_COMMON_TEST_H
#define ARKUI_CAPI_DEMO_COMMON_TEST_H

#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <vector>
#include <map>

namespace ArkUICapiTest {
/**
 * Log print domain.
 */

#define TEST_CHILD_COMPONENT_NUMBER 10
#define TEST_CACHE_NODE_NUMBER 1000
#define TEST_THREAD_COUNT 10
#define TEST_NODE_API_COUNT 100

using func = void (*)(int);

struct AsyncData {
    ArkUI_NodeHandle parent = nullptr;
    std::vector<ArkUI_NodeHandle> childList;
    bool withReset = false;
    std::map<ArkUI_NodeHandle, ArkUI_NodeHandle> mapParent;   // <child, parent>
    // case
    std::function<void(ArkUI_NativeNodeAPI_1*)>  beforeThreadTasks;   // 子线程1 task
    std::function<void(ArkUI_NativeNodeAPI_1*)>  beforeMainTasks;     // 主线程1 task
    std::function<void(ArkUI_NativeNodeAPI_1*)>  afterThreadTasks;    // 子线程2 task
    std::function<void(ArkUI_NativeNodeAPI_1*)>  afterMainTasks;      // 主线程2 task
    ArkUI_NodeHandle cache[TEST_CACHE_NODE_NUMBER] = {nullptr};
};

struct CbData {
    explicit CbData(ArkUI_NodeHandle handle, void(* cb)(ArkUI_NodeHandle) )
        :parent(handle), callback(cb) {
    }
    ArkUI_NodeHandle parent = nullptr;
    void(* callback)(ArkUI_NodeHandle) = nullptr;
};

struct NodeData {
    ArkUI_NodeHandle nodeHandle = nullptr;
    std::vector<NodeData*> children;
};

struct AllNode {
    // async node
    std::vector<AsyncData*> vtAsyncData;
    // sync node
    ArkUI_NodeHandle itemParent = nullptr;
    ArkUI_NodeHandle itemBuf[TEST_CHILD_COMPONENT_NUMBER] = {nullptr};
};

class SwiperCreateNativeNodeTest {
public:
    ~SwiperCreateNativeNodeTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
};

} // namespace ArkUICApiDemo
#endif // ARKUI_CAPI_DEMO_COMMON_TEST_H

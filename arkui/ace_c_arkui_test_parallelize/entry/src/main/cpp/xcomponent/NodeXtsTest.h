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

#ifndef CAPIHAP_NODE_XTS_TEST_H
#define CAPIHAP_NODE_XTS_TEST_H

#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <js_native_api.h>
#include <vector>

namespace ArkUICapiTest {
namespace ArkUIXComponentCApiDemo {
struct MyAsyncData {
    ArkUI_NodeHandle root = nullptr; //框架创建的已上树的节点，所有开发者创建的根组件（无父组件的组件）都会作为root的子节点来绘制
    std::vector<ArkUI_NodeHandle> nodeList; //保存开发者创建的Surface组件
    void (*RunOnUIThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList); // 在UI线程执行的开发者回调
    void (*RunOnSubThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList); // 在子线程执行的开发者回调
};
class NodeXTSTest {
public:
    napi_value DisposeCNodeTree(napi_env env, napi_callback_info info);
    napi_value CreateCNodeTree(napi_env env, napi_callback_info info, 
        void (RunOnUIThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList),
        void (RunOnSubThread)(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList));
    MyAsyncData* g_asyncData = nullptr;
};
}
}
#endif //CAPIHAP_NODE_XTS_TEST_H

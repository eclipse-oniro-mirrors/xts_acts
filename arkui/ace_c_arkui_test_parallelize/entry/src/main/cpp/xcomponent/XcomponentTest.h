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
#ifndef CAPIHAP_XCOMPONENT_TEST_H
#define CAPIHAP_XCOMPONENT_TEST_H

#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <js_native_api.h>
#include <string>

namespace ArkUICapiTest {
namespace ArkUIXComponentCApiDemo {

void SetNodeId(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle handle, std::string id);

class XComponentTest {
public:
    static napi_value DisposeNativeNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
};

class XComponentTextureTest {
public:    
    static napi_value DisposeNativeNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
};
}
}
#endif //CAPIHAP_XCOMPONENT_TEST_H
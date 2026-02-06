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

#include "hybird_getnodehandle_test.h"

#include <arkui/native_node_napi.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {
napi_value HybirdGetNodeHandleTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(
        LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "HybirdGetNodeHandleTest CreateNativeNode");

    size_t argc = 3;
    napi_value args[3] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "GetContext env or info is null");
        return nullptr;
    }
    napi_ref refer;
    // 创建引用之后保存，防止释放。
    napi_create_reference(env, args[1], 1, &refer);

    napi_value result = nullptr;
    napi_value createRow = nullptr;
    // 调用ArkTS的Create函数创建ArkTS的ComponentContent。
    napi_get_reference_value(env, refer, &createRow);
    napi_call_function(env, nullptr, createRow, 1, &args[PARAM_2], &result);
    // 获取ArkTS的Row组件。
    ArkUI_NodeHandle rowHandle;
    OH_ArkUI_GetNodeHandleFromNapiValue(env, result, &rowHandle);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // set parent node
    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(parentColumn, rowHandle);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest

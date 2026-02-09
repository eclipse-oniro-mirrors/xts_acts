/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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
#include "manager/PluginManagerTest.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <cstdint>
#include <string>

namespace ArkUICapiTest {

static napi_value TestContainerPickerSubComponent001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = nodeAPI->addChild(containerPicker, text);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
static napi_value TestContainerPickerSubComponent002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto ret = nodeAPI->addChild(containerPicker, image);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
static napi_value TestContainerPickerSubComponent003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(row, text);
    nodeAPI->addChild(row, image);
    auto ret = nodeAPI->addChild(containerPicker, row);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
static napi_value TestContainerPickerSubComponent004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    auto ret = nodeAPI->addChild(containerPicker, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestContainerPickerSubComponent005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_PICKER);
    int result = OH_ArkUI_NodeUtils_GetNodeType(g_handle);
    napi_create_int32(env, result == ARKUI_NODE_PICKER ? 0 : 1, &retValue);
    return retValue;
}
} // namespace ArkUICapiTest

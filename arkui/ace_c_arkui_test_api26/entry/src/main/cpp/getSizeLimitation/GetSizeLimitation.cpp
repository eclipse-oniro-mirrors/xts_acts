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
#include "GetSizeLimitation.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/ui_input_event.h>
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>
#include <arkui/native_gesture.h>

namespace ArkUICapiTest {
napi_value GetSizeLimitationTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    float mHeight = PARAM_100;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
     OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string id1 = "buttonSnapshotSizeLimitation";
    ArkUI_AttributeItem idValue;
    idValue.string = id1.c_str();
    nodeAPI->setAttribute(Button, NODE_ID, &idValue);
    int32_t maxWidth = 0;
    int32_t maxHeight = 0;
    int32_t limitation = OH_ArkUI_GetNodeSnapshotSizeLimitation(&maxWidth, &maxHeight);
    ArkUI_AttributeItem LABEL_Item = {.string = ""};
    if (limitation == ARKUI_ERROR_CODE_NO_ERROR && maxWidth > 0 && maxHeight > 0) {
        LABEL_Item = {.string = "SUCCESS"};
    } else {
        LABEL_Item = {.string = "ERROR"};
    }
    nodeAPI->setAttribute(Button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->addChild(column, Button);
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}

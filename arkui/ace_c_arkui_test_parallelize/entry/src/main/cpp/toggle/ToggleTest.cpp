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

#include "ToggleTest.h"
#include <arkui/native_interface.h>
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#define TEST_TOGGLE_COMPONENT_NUMBER 5

namespace ArkUICapiTest {
napi_value ToggleTest::toggleTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ToggleTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ToggleTest",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue columnPercentWith[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentWithItem = { columnPercentWith,
        sizeof(columnPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &columnPercentWithItem);
    ArkUI_NumberValue columnPercentHeight[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentHeightItem = { columnPercentHeight,
        sizeof(columnPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &columnPercentHeightItem);

    auto toggle1 = nodeAPI->createNode(ARKUI_NODE_TOGGLE);
    ArkUI_AttributeItem textId1 = {.string = "toggle001"};
    nodeAPI->setAttribute(toggle1, NODE_ID, &textId1);
    // Toggle组件属性--selectedColor
    ArkUI_NumberValue selectedColor_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem selectedColor_item = { selectedColor_value, 1 };
    nodeAPI->setAttribute(toggle1, NODE_TOGGLE_SELECTED_COLOR, &selectedColor_item);

    // Toggle组件属性--switchPointColor
    ArkUI_NumberValue switchPointColor_value[] = { { .u32 = 0xFFFF0000 } };
    ArkUI_AttributeItem switchPointColor_item = { switchPointColor_value, 1 };
    nodeAPI->setAttribute(toggle1, NODE_TOGGLE_SWITCH_POINT_COLOR, &switchPointColor_item);

    // Toggle组件属性--toggleValue
    ArkUI_NumberValue toggleValue_value[] = { { .i32 = true } };
    ArkUI_AttributeItem toggleValue_item = { toggleValue_value, sizeof(toggleValue_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(toggle1, NODE_TOGGLE_VALUE, &toggleValue_item);

    // Toggle组件属性--unselectedColor
    ArkUI_NumberValue unselectedColor_value[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem unselectedColor_item = { unselectedColor_value, 1 };
    nodeAPI->setAttribute(toggle1, NODE_TOGGLE_UNSELECTED_COLOR, &unselectedColor_item);

    const int TOGGLE_TARGET_ID = 27123;
    nodeAPI->registerNodeEvent(toggle1, NODE_TOGGLE_ON_CHANGE, NODE_TOGGLE_ON_CHANGE, nullptr);
    nodeAPI->addNodeEventReceiver(toggle1, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == TOGGLE_TARGET_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "Node_Event: onToggleChange");
        }
    });

    nodeAPI->addChild(column, toggle1);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ToggleTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}  // namespace ArkUICapiTest
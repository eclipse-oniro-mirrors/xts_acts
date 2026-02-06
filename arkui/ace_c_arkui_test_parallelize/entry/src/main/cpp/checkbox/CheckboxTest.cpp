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

#include "CheckboxTest.h"
#include <arkui/native_interface.h>
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>

#define TEST_CHECKBOX_COMPONENT_NUMBER 5

namespace ArkUICapiTest {
napi_value CheckBoxTest::checkBoxTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckBoxTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckBoxTest",
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

    auto checkBox1 = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);
    ArkUI_AttributeItem textId1 = {.string = "checkBox001"};
    nodeAPI->setAttribute(checkBox1, NODE_ID, &textId1);
    // 设置checkbox组件select属性
    ArkUI_NumberValue checkbox_select_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem checkbox_select_item = { checkbox_select_value,
                                                 sizeof(checkbox_select_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_SELECT, &checkbox_select_item);

    // 设置checkbox组件selectedColor属性
    ArkUI_NumberValue checkbox_selectColor_value[] = { { .u32 = 0xFF112233 } };
    ArkUI_AttributeItem checkbox_selectColor_item = { checkbox_selectColor_value,
                                                      sizeof(checkbox_selectColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_SELECT_COLOR, &checkbox_selectColor_item);

    // 设置checkbox组件unselectedColor属性
    ArkUI_NumberValue checkbox_unselectedColor_value[] = { { .u32 = 0xFF445566 } };
    ArkUI_AttributeItem checkbox_unselectedColor_item = {
        checkbox_unselectedColor_value, sizeof(checkbox_unselectedColor_value) / sizeof(ArkUI_NumberValue)
    };
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_UNSELECT_COLOR, &checkbox_unselectedColor_item);

    // 设置checkbox组件shape属性
    ArkUI_NumberValue checkbox_shape_value[] = { { .i32 = ArkUI_CHECKBOX_SHAPE_ROUNDED_SQUARE } };
    ArkUI_AttributeItem checkbox_shape_item = { checkbox_shape_value,
                                                sizeof(checkbox_shape_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_SHAPE, &checkbox_shape_item);

    // 设置checkbox组件name属性
    ArkUI_AttributeItem name_item = {.string = "checkbox1"};
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_NAME, &name_item);

    // 设置checkbox组件group属性
    ArkUI_AttributeItem group_item = {.string = "group1"};
    nodeAPI->setAttribute(checkBox1, NODE_CHECKBOX_GROUP, &group_item);

    const int CHECKBOX_TARGET_ID = 27123;
    nodeAPI->registerNodeEvent(checkBox1, NODE_CHECKBOX_EVENT_ON_CHANGE, NODE_CHECKBOX_EVENT_ON_CHANGE, nullptr);
    nodeAPI->addNodeEventReceiver(checkBox1, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == CHECKBOX_TARGET_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "Node_Event: onCheckboxChange");
        }
    });

    nodeAPI->addChild(column, checkBox1);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckBoxTest",
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


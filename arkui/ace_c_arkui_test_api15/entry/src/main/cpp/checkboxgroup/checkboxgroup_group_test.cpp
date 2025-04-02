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

#include "checkboxgroup_group_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, const char* group)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX_GROUP);
    
    // set width
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    // set height
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    // set group
    ArkUI_AttributeItem group_item = {};
    group_item.string = group;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP_NAME, &group_item);
    
    return nodeHandle;
}

napi_value CheckboxGroupGroupTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxGroupGroupTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxGroupGroupTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto checkboxgroup = createChildNode(nodeAPI, "checkboxgroup");
    ArkUI_AttributeItem textId1 = {.string = "checkboxgroup"};
    nodeAPI->setAttribute(checkboxgroup, NODE_ID, &textId1);
    
    auto textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    
    nodeAPI->addChild(column, checkboxgroup);
    nodeAPI->addChild(column, button);
    
    auto result1 = nodeAPI->getAttribute(checkboxgroup, NODE_CHECKBOX_GROUP_NAME);
    ArkUI_AttributeItem name1_item = {};
    name1_item.string = result1->string;
    nodeAPI->setAttribute(textinput, NODE_TEXT_AREA_TEXT, &name1_item);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxGroupGroupTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

} // namespace ArkUICapiTest
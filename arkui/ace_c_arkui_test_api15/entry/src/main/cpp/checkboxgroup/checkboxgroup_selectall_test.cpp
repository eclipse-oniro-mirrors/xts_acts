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

#include "checkboxgroup_selectall_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static auto createDefaultChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t select, const char* group)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX_GROUP);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue select_value[] = {{.i32 = select}};
    ArkUI_AttributeItem select_item = {select_value, sizeof(select_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP_SELECT_ALL, &select_item);
    
    ArkUI_AttributeItem group_item = {};
    group_item.string = group;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP_NAME, &group_item);

    return nodeHandle;
}

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, const char* group)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_AttributeItem group_item = {};
    group_item.string = group;
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_GROUP, &group_item);

    return nodeHandle;
}

napi_value CheckboxGroupSelectAllTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxgroupSelectAllTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxgroupSelectAllTest",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto checkboxgroupTrue = createDefaultChildNode(nodeAPI, true, "checkboxgroupTrue");
    auto checkbox1 = createChildNode(nodeAPI, "checkboxgroupTrue");
    auto checkbox2 = createChildNode(nodeAPI, "checkboxgroupTrue");
    
    auto checkboxgroupFalse = createDefaultChildNode(nodeAPI, false, "checkboxgroupFalse");
    auto checkbox3 = createChildNode(nodeAPI, "checkboxgroupFalse");
    auto checkbox4 = createChildNode(nodeAPI, "checkboxgroupFalse");

    ArkUI_AttributeItem textId1 = {.string = "checkboxgroupTrue"};
    nodeAPI->setAttribute(checkboxgroupTrue, NODE_ID, &textId1);
    ArkUI_AttributeItem textId2 = {.string = "checkboxgroupFalse"};
    nodeAPI->setAttribute(checkboxgroupFalse, NODE_ID, &textId2);

    nodeAPI->addChild(column, checkboxgroupTrue);
    nodeAPI->addChild(column, checkbox1);
    nodeAPI->addChild(column, checkbox2);
    nodeAPI->addChild(column, checkboxgroupFalse);
    nodeAPI->addChild(column, checkbox3);
    nodeAPI->addChild(column, checkbox4);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxgroupSelectAllTest",
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

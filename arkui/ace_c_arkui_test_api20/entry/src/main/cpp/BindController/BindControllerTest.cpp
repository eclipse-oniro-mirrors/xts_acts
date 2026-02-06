/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "../manager/plugin_manager.h"
#include "BindControllerTest.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
 
namespace ArkUICapiTest {
 
static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    //text
    ArkUI_NodeHandle textC = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textId = {.string = "cTextNode"};
    nodeAPI->setAttribute(textC, NODE_ID, &textId);
    ArkUI_CrossLanguageOption* TextOption = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(TextOption, false);
    OH_ArkUI_CrossLanguageOption_Destroy(TextOption);
    //textInput
    ArkUI_NodeHandle textInputC = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem textInputId = {.string = "cTextInputNode"};
    nodeAPI->setAttribute(textInputC, NODE_ID, &textInputId);
    ArkUI_CrossLanguageOption* TextInputOption = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(TextInputOption, false);
    OH_ArkUI_CrossLanguageOption_Destroy(TextInputOption);
    //textArea
    ArkUI_NodeHandle textAreaC = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem textAreaId = {.string = "cTextAreaNode"};
    nodeAPI->setAttribute(textAreaC, NODE_ID, &textAreaId);
    ArkUI_CrossLanguageOption* TextAreaOption = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(TextAreaOption, false);
    OH_ArkUI_CrossLanguageOption_Destroy(TextAreaOption);
    nodeAPI->addChild(column, textC);
    nodeAPI->addChild(column, textInputC);
    nodeAPI->addChild(column, textAreaC);
    return column;
}
 

napi_value NodeBindControllerTest::testBindController001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testBindController001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testBindController001",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto root = CreateChildNode(nodeAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testBindController001",
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
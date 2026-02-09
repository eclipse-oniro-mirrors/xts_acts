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
#include "EmbeddedComponentOptionTest.h"
#include <arkui/native_node.h>
#include <string>
static ArkUI_NodeHandle root = nullptr;
static int NUMBER_2 = 2;
namespace ArkUICapiTest {

static void onErrorLBYNDK(int32_t code, const char* name, const char* message) 
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "LBYWANT onErrorLBYNDK:%{public}d", code);
}

static void onTerminatedLBYNDK(int32_t code, AbilityBase_Want* want)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "LBYWANT onTerminatedLBYNDK:%{public}d", code);
}

static void OnEventReceive11(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 0) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        
        
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(root, &activeChildrenInfo);
        
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "count9 :%{public}d", OH_ArkUI_ActiveChildrenInfo_GetCount(activeChildrenInfo));
        if (OH_ArkUI_ActiveChildrenInfo_GetCount(activeChildrenInfo) == NUMBER_2) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value EmbeddedComponentOptionTest::testEmbeddedComponentOption001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testEmbeddedComponentOption001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testEmbeddedComponentOption001",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    root = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    // 创建文本
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text_item = {.string = "1"};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &text_item);
    ArkUI_AttributeItem text_id = {.string = "text_id"};
    nodeAPI->setAttribute(text, NODE_ID, &text_id);
    
    // 创建Button
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text1_item = {.string = "9"};
    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &text1_item);
    ArkUI_AttributeItem text1_id = {.string = "text1_id"};
    nodeAPI->setAttribute(text1, NODE_ID, &text1_id);
    nodeAPI->registerNodeEvent(text1, NODE_ON_CLICK, 0, nullptr);
    
    // 创建ec
    ArkUI_NodeHandle ec = nodeAPI->createNode(ARKUI_NODE_EMBEDDED_COMPONENT);
    auto ec_option = OH_ArkUI_EmbeddedComponentOption_Create();
    auto onErrorCallback = onErrorLBYNDK;
    auto onTerminatedCallback = onTerminatedLBYNDK;
    OH_ArkUI_EmbeddedComponentOption_SetOnError(ec_option, onErrorCallback);
    OH_ArkUI_EmbeddedComponentOption_SetOnTerminated(ec_option, onTerminatedCallback);
    ArkUI_AttributeItem itemObj = {.object = ec_option};
    nodeAPI->setAttribute(ec, NODE_EMBEDDED_COMPONENT_OPTION, &itemObj);
    
    
    nodeAPI->addChild(root, text);
    nodeAPI->addChild(root, text1);
    nodeAPI->addChild(root, ec);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceive11);
    
    if (ec_option != nullptr) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    ArkUI_ActiveChildrenInfo* activeChildrenInfo1;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(root, &activeChildrenInfo1);
    auto count1 = OH_ArkUI_ActiveChildrenInfo_GetCount(activeChildrenInfo1);
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "count2 :%{public}d", count1);
    
    nodeAPI->removeChild(root, ec);
    nodeAPI->disposeNode(ec);
    OH_ArkUI_EmbeddedComponentOption_Dispose(ec_option);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testEmbeddedComponentOption001",
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
 
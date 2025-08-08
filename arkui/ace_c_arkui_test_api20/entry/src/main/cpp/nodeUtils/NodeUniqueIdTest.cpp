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
#include "NodeUniqueIdTest.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
 
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle Column = nullptr; 
static ArkUI_NodeHandle image = nullptr; 
static ArkUI_NodeHandle text1 = nullptr; 
static ArkUI_NodeHandle text2 = nullptr; 
static ArkUI_NodeHandle text3 = nullptr; 
static ArkUI_NodeHandle text4 = nullptr; 
static ArkUI_NodeHandle text5 = nullptr; 
static ArkUI_NodeHandle text6 = nullptr;
static ArkUI_NodeHandle text7 = nullptr;
 
namespace ArkUICapiTest {
 
static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    
    text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text1_item = {.string = "GetNodeUniqueId 正常"};
    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &text1_item);
    ArkUI_AttributeItem text1_id = {.string = "text1_id"};
    nodeAPI->setAttribute(text1, NODE_ID, &text1_id);
    
    text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text2_item = {.string = "GetNodeUniqueId 节点指针置空"};
    nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &text2_item);
    ArkUI_AttributeItem text2_id = {.string = "text2_id"};
    nodeAPI->setAttribute(text2, NODE_ID, &text2_id);
    
    text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text3_item = {.string = "GetNodeUniqueId 传参nullptr"};
    nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &text3_item);
    ArkUI_AttributeItem text3_id = {.string = "text3_id"};
    nodeAPI->setAttribute(text3, NODE_ID, &text3_id);
    
    text4 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text4_item = {.string = "GetNodeHandleByUniqueId 正常"};
    nodeAPI->setAttribute(text4, NODE_TEXT_CONTENT, &text4_item);
    ArkUI_AttributeItem text4_id = {.string = "text4_id"};
    nodeAPI->setAttribute(text4, NODE_ID, &text4_id);
    
    text5 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text5_item = {.string = "GetNodeHandleByUniqueId 传参NULL"};
    nodeAPI->setAttribute(text5, NODE_TEXT_CONTENT, &text5_item);
    ArkUI_AttributeItem text5_id = {.string = "text5_id"};
    nodeAPI->setAttribute(text5, NODE_ID, &text5_id);
    
    text6 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text6_item = {.string = "GetNodeHandleByUniqueId 不存在对应节点"};
    nodeAPI->setAttribute(text6, NODE_TEXT_CONTENT, &text6_item);
    ArkUI_AttributeItem text6_id = {.string = "text6_id"};
    nodeAPI->setAttribute(text6, NODE_ID, &text6_id);
    
    text7 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem text7_item = {
        .string = "OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay "
                  "不存在对应节点"};
    nodeAPI->setAttribute(text7, NODE_TEXT_CONTENT, &text7_item);
    ArkUI_AttributeItem text7_id = {.string = "text7_id"};
    nodeAPI->setAttribute(text7, NODE_ID, &text7_id);
    
    nodeAPI->addChild(Column, text1);
    nodeAPI->addChild(Column, image);
    nodeAPI->addChild(Column, text2);
    nodeAPI->addChild(Column, text3);
    nodeAPI->addChild(Column, text4);
    nodeAPI->addChild(Column, text5);
    nodeAPI->addChild(Column, text6);
    nodeAPI->addChild(Column, text7);
    return Column;
}
 
 
static void CreatUniqueIdTest(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    //UniqueId主要测试代码
    auto uniqueId = 0;
    //ARKUI_NODE_COLUMN
    auto errorCode1 = OH_ArkUI_NodeUtils_GetNodeUniqueId(Column, &uniqueId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetColumnNodeUniqueId1 errCode:%{public}d;uniqueId:%{public}d;", errorCode1, uniqueId);
    if( errorCode1 == ARKUI_ERROR_CODE_NO_ERROR) {
        nodeAPI->setAttribute(text1, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    ArkUI_NodeHandle node;
    auto errorCode2 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(uniqueId, &node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetNodeHandle1 errCode:%{public}d;node:%{public}p;", errorCode2, node);
    if( errorCode2 == ARKUI_ERROR_CODE_NO_ERROR) {
        nodeAPI->setAttribute(text4, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    //节点指针置空
    image = nullptr;
    auto errorCode13 = OH_ArkUI_NodeUtils_GetNodeUniqueId(image, &uniqueId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetNodeUniqueId_setNullptr errCode:%{public}d;uniqueId:%{public}d;", errorCode13, uniqueId);
    if( errorCode13 == ARKUI_ERROR_CODE_PARAM_INVALID && uniqueId == -1) {
        nodeAPI->setAttribute(text2, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    //传参nullptr
    auto errorCode14 = OH_ArkUI_NodeUtils_GetNodeUniqueId(nullptr, &uniqueId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetNodeUniqueId_nullptr errCode:%{public}d;uniqueId:%{public}d;", errorCode14, uniqueId);
    if( errorCode14 == ARKUI_ERROR_CODE_PARAM_INVALID && uniqueId == -1) {
        nodeAPI->setAttribute(text3, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    //传参NULL
    auto errorCode23 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(NULL, &node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetNodeHandle_NULL errCode:%{public}d;node:%{public}p;", errorCode23, node);
    if( errorCode23 == ARKUI_ERROR_CODE_PARAM_INVALID && node == NULL) {
        nodeAPI->setAttribute(text5, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    //UniqueId不存在对应节点
    auto errorCode24 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(1001, &node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager","aaa GetNodeHandle_100 errCode:%{public}d;node:%{public}p;", errorCode24, node);
    if( errorCode24 == ARKUI_ERROR_CODE_PARAM_INVALID && node == NULL) {
        nodeAPI->setAttribute(text6, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    // UniqueId不存在对应节点
    ArkUI_IntOffset Offset;
    auto errorCode25 =
        OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay(node, &Offset);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                 "aaa GetNodeHandle_100 errCode:%{public}d;node:%{public}p;",
                 errorCode25, node);
    if (errorCode25 == ARKUI_ERROR_CODE_PARAM_INVALID && node == NULL) {
        nodeAPI->setAttribute(text7, NODE_BACKGROUND_COLOR,
                              &background_color_item);
    }
}
 
napi_value NodeUniqueIdTest::testNodeUniqueId001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testAddCustomProperty001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto root = CreateChildNode(nodeAPI);
    CreatUniqueIdTest(nodeAPI);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
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
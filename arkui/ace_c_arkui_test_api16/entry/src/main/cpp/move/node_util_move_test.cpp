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
#include "node_util_move_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static int NUMBER_0 = 0;
static int NUMBER_1 = 1;
static int NUMBER_2 = 2;
static int NUMBER_9 = 9;
static ArkUI_NodeHandle column;
static ArkUI_NodeHandle column1;
static ArkUI_NodeHandle column2;
static ArkUI_NodeHandle text;
static ArkUI_NodeHandle text1;
static ArkUI_NodeHandle text2;
static ArkUI_NodeHandle text3;
static ArkUI_NodeHandle text4;
static ArkUI_NodeHandle stack;
static ArkUI_NodeHandle bt0;
static ArkUI_NodeHandle bt1;
struct A {
    ArkUI_NodeHandle child;
    ArkUI_NodeHandle parent;
    ArkUI_NodeHandle parent2;
    int32_t index;
    int32_t index2;
};

namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem column1_id = {.string = "column1_id"};
    nodeAPI->setAttribute(column1, NODE_ID, &column1_id);
    ArkUI_AttributeItem column2_id = {.string = "column2_id"};
    nodeAPI->setAttribute(column2, NODE_ID, &column2_id);
    ArkUI_NumberValue value[] = {200};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column1, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column2, NODE_WIDTH, &item);
    ArkUI_NumberValue value1[] = {200};
    ArkUI_AttributeItem item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &item1);
    ArkUI_NumberValue value2[] = {100};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column1, NODE_HEIGHT, &item2);
    nodeAPI->setAttribute(column2, NODE_HEIGHT, &item2);
    
    ArkUI_NodeHandle row0 = nodeAPI->createNode(ARKUI_NODE_ROW);
    bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt0_id = {.string = "bt0_id"};
    nodeAPI->setAttribute(bt0, NODE_ID, &bt0_id);
    ArkUI_AttributeItem bt0_item = {.string = "appendCol2"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, NUMBER_0, nullptr);

    bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt1_id = {.string = "bt1_id"};
    nodeAPI->setAttribute(bt1, NODE_ID, &bt1_id);
    ArkUI_AttributeItem bt1_item = {.string = "error code"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, NUMBER_9, nullptr);
    
    nodeAPI->addChild(column, column1);
    nodeAPI->addChild(row0, bt0);
    nodeAPI->addChild(row0, bt1);
    nodeAPI->addChild(column, row0);
    
    text = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    text1 = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    text2 = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    text3 = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    text4 = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);

    ArkUI_NumberValue background_color_value1[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item1 = {background_color_value1,
        sizeof(background_color_value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item1);
    ArkUI_AttributeItem itemStringStyle0 = {.string = "xc1"};
    nodeAPI->setAttribute(text, NODE_ID, &itemStringStyle0);
    ArkUI_NumberValue background_color_value2[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item2 = {background_color_value2,
        sizeof(background_color_value2) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue background_color_value3[] = {{.u32 = COLOR_BLUE}};
    ArkUI_AttributeItem background_color_item3 = {background_color_value3,
        sizeof(background_color_value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text1, NODE_BACKGROUND_COLOR, &background_color_item2);
    nodeAPI->setAttribute(text2, NODE_BACKGROUND_COLOR, &background_color_item3);
    nodeAPI->setAttribute(text3, NODE_BACKGROUND_COLOR, &background_color_item2);
    nodeAPI->setAttribute(text4, NODE_BACKGROUND_COLOR, &background_color_item3);
    
    ArkUI_NumberValue value5[] = {100};
    ArkUI_AttributeItem item5 = {value5, sizeof(value5) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_WIDTH, &item5);
    nodeAPI->setAttribute(text1, NODE_WIDTH, &item5);
    nodeAPI->setAttribute(text2, NODE_WIDTH, &item5);
    nodeAPI->setAttribute(text3, NODE_WIDTH, &item5);
    nodeAPI->setAttribute(text4, NODE_WIDTH, &item5);

    ArkUI_NumberValue value6[] = {10};
    ArkUI_AttributeItem item6 = {value6, sizeof(value6) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_HEIGHT, &item6);
    nodeAPI->setAttribute(text1, NODE_HEIGHT, &item6);
    nodeAPI->setAttribute(text2, NODE_HEIGHT, &item6);
    nodeAPI->setAttribute(text3, NODE_HEIGHT, &item6);
    nodeAPI->setAttribute(text4, NODE_HEIGHT, &item6);
            
    nodeAPI->addChild(column1, text);
    nodeAPI->addChild(column1, text1);
    nodeAPI->addChild(column1, text2);
    nodeAPI->addChild(column2, text3);
    nodeAPI->addChild(column2, text4);
    return column;
}

napi_value NodeUtilMoveTest::testNodeUtilMove001(napi_env env, napi_callback_info info)
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
    static ArkUI_NodeHandle startNode = CreateChildNode(nodeAPI);
    
    A *a = new A;
    a->child = text;
    a->parent = column2;
    a->parent2 = column1;
    a->index = NUMBER_0;
    a->index2 = NUMBER_2;

    nodeAPI->registerNodeEvent(column1, NODE_ON_CLICK, NUMBER_1, a);
    nodeAPI->registerNodeEvent(column2, NODE_ON_CLICK, NUMBER_2, a);
    
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        if (targetId == NUMBER_0) {
            nodeAPI->addChild(column, column2);
        }
        if (targetId == NUMBER_1) {
            auto err = OH_ArkUI_NodeUtils_MoveTo(text, column2, 0);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "kkk click1 = %{public}d", err);
            auto parent =  OH_ArkUI_NodeUtils_GetParentInPageTree(text);
            auto getParentId = nodeAPI->getAttribute(parent, NODE_ID)->string;
            if (strcmp(getParentId, "column2_id") == 0) {
                ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
                ArkUI_AttributeItem background_color_item = {background_color_value,
                    sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(bt0, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        if (targetId == NUMBER_9) {
            auto err1 = OH_ArkUI_NodeUtils_MoveTo(nullptr, column1, 0);
            auto err2 = OH_ArkUI_NodeUtils_MoveTo(text, column2, 2);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "kkk click2 = %{public}d", err1);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "kkk click2 = %{public}d", err2);
            if (err1 == ARKUI_ERROR_CODE_PARAM_INVALID && err2 == ARKUI_ERROR_CODE_NO_ERROR) {
                ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
                ArkUI_AttributeItem background_color_item = {background_color_value,
                    sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(bt1, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        
    });
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), startNode) ==
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
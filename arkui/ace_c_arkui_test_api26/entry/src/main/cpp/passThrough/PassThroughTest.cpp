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
#include "PassThroughTest.h"
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
static ArkUI_AttributeItem item1;
static int32_t changeTest = 0;

static ArkUI_NodeHandle button1;
static ArkUI_NodeHandle button2;
static ArkUI_NodeHandle button3;

static void SetLabel(std::string id, ArkUI_NodeHandle node)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
}

static ArkUI_NodeHandle SetButtonNode(std::string id, int32_t targetId)
{
    float mMargin = 5;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {mMargin};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
    nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);
    
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    return node;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == 1) {
        auto uiContext = OH_ArkUI_GetContextByNode(button1);
        auto errorCode1 = OH_ArkUI_EnableEventPassthrough(uiContext, true, ARKUI_RAW_INPUT_EVENT_TYPE_TOUCH);
        auto errorCode2 = OH_ArkUI_EnableEventPassthrough(uiContext, true, ARKUI_RAW_INPUT_EVENT_TYPE_MOUSE);
        if(errorCode1 == ARKUI_ERROR_CODE_NO_ERROR && errorCode2 == ARKUI_ERROR_CODE_NO_ERROR){
            SetLabel("1", button1);
        }
    } else if (eventId == PARAM_2) {
        auto uiContext = OH_ArkUI_GetContextByNode(button1);
        auto errorCode3 = OH_ArkUI_EnableEventPassthrough(uiContext, false, ARKUI_RAW_INPUT_EVENT_TYPE_TOUCH);
        auto errorCode4 = OH_ArkUI_EnableEventPassthrough(uiContext, false, ARKUI_RAW_INPUT_EVENT_TYPE_MOUSE);
        if(errorCode3 == ARKUI_ERROR_CODE_NO_ERROR && errorCode4 == ARKUI_ERROR_CODE_NO_ERROR){
            SetLabel("1", button2);
        }
    } else if (eventId == PARAM_3) {
        auto errorCode5 = OH_ArkUI_EnableEventPassthrough(nullptr, false, ARKUI_RAW_INPUT_EVENT_TYPE_TOUCH);
        auto errorCode6 = OH_ArkUI_EnableEventPassthrough(nullptr, false, ARKUI_RAW_INPUT_EVENT_TYPE_MOUSE);
        if(errorCode5 == ARKUI_ERROR_CODE_PARAM_INVALID && errorCode6 == ARKUI_ERROR_CODE_PARAM_INVALID){
            SetLabel("1", button3);
        }
    }
}

napi_value PassThroughTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, row2);
    
    
    button1 = SetButtonNode("true", 1);
    button2 = SetButtonNode("false", PARAM_2);
    button3 = SetButtonNode("nullptr", PARAM_3);

    nodeAPI->addChild(row1, button1);
    nodeAPI->addChild(row1, button2);
    nodeAPI->addChild(row1, button3);

    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
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

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
#include "GestureInterceptTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>
#include <arkui/native_gesture.h>

namespace ArkUICapiTest {
static ArkUI_AttributeItem item1;
static int32_t changeTest = 0;
static ArkUI_NodeHandle text1;
static ArkUI_NodeHandle text2;
static ArkUI_NodeHandle text3;
static ArkUI_NodeHandle text4;
static ArkUI_NodeHandle text5;
static OH_ArkUI_GestureCollectIntervention mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_CONTINUE;

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
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {PARAM_5};
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
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "stack clicked");
        SetLabel("1", text1);
    }
    if (eventId == PARAM_2) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "row1 clicked");
        SetLabel("1", text2);
    }
    if (eventId == PARAM_3) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "row2 clicked");
        SetLabel("1", text3);
    }
    if (eventId == PARAM_4) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "button1 clicked");
        SetLabel("1", text4);
    }
    if (eventId == PARAM_5) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "button2 clicked");
    }
    if (eventId == PARAM_10) {
        mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_CONTINUE;
    }
    if (eventId == PARAM_11) {
        mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_DISCARD_LOWER;
    }
    if (eventId == PARAM_12) {
        mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_DISCARD_HIGHER;
    }
    if (eventId == PARAM_13) {
        mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_DISCARD_SELF;
    }
    if (eventId == PARAM_14) {
        mode = OH_ARKUI_GESTURE_COLLECT_INTERVENTION_DISCARD_LOWER_PRIORITY_SIBLINGS;
    }
    if (eventId == PARAM_15) {
        SetLabel("0", text1);
        SetLabel("0", text2);
        SetLabel("0", text3);
        SetLabel("0", text4);
    }
}

napi_value GestureInterceptTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
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

    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    nodeAPI->addChild(column, stack);
	float mHeight0 = 0.3;
    ArkUI_NumberValue heightValue0[] = {mHeight0};
    ArkUI_AttributeItem heightItem0 = {heightValue0, 1};
    nodeAPI->setAttribute(stack, NODE_HEIGHT_PERCENT, &heightItem0);
    
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);

    nodeAPI->addChild(stack, row1);
    nodeAPI->addChild(stack, row2);

    //两个row,宽高100%
    ArkUI_NumberValue widthValue1[] = {1};
    ArkUI_AttributeItem widthItem1 = {widthValue1, 1};
    nodeAPI->setAttribute(row1, NODE_WIDTH_PERCENT, &widthItem1);
    nodeAPI->setAttribute(row2, NODE_WIDTH_PERCENT, &widthItem1);
    ArkUI_NumberValue heightValue1[] = {1};
    ArkUI_AttributeItem heightItem1 = {heightValue1, 1};
    nodeAPI->setAttribute(row1, NODE_HEIGHT_PERCENT, &heightItem1);
    nodeAPI->setAttribute(row2, NODE_HEIGHT_PERCENT, &heightItem1);
    
    //背景层row1,子节点
    ArkUI_NumberValue colorValue[] = {{.u32 = COLOR_GRAY}};
    ArkUI_AttributeItem colorItem = {colorValue, 1};
    nodeAPI->setAttribute(row1, NODE_BACKGROUND_COLOR, &colorItem);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(row1, text);
    
    //前景层row2,子节点
    ArkUI_NodeHandle button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NodeHandle button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(row2, button1);
    nodeAPI->addChild(row2, button2);
    
    ArkUI_AttributeItem idValue1;
    std::string id1 = "button1";
    idValue1.string = id1.c_str();
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &idValue1);
    nodeAPI->setAttribute(button1, NODE_ID, &idValue1);

    ArkUI_AttributeItem idValue2;
    std::string id2 = "button2";
    idValue2.string = id2.c_str();
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &idValue2);

    ArkUI_NumberValue widthValue[] = {PARAM_100};
    ArkUI_AttributeItem widthItem = {widthValue, 1};
    nodeAPI->setAttribute(button1, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(button2, NODE_WIDTH, &widthItem);

	float mHeight = 40;
    ArkUI_NumberValue heightValue[] = {mHeight};
    ArkUI_AttributeItem heightItem = {heightValue, 1};
    nodeAPI->setAttribute(button1, NODE_HEIGHT, &heightItem);
    nodeAPI->setAttribute(button2, NODE_HEIGHT, &heightItem);

    //touch事件
    nodeAPI->registerNodeEvent(stack, NODE_TOUCH_EVENT, 1, &stack);
    nodeAPI->registerNodeEvent(row1, NODE_TOUCH_EVENT, PARAM_2, &row1);
    nodeAPI->registerNodeEvent(row2, NODE_TOUCH_EVENT, PARAM_3, &row2);
    nodeAPI->registerNodeEvent(button1, NODE_TOUCH_EVENT, PARAM_4, &button1);
    nodeAPI->registerNodeEvent(button2, NODE_TOUCH_EVENT, PARAM_5, &button2);

    //ARKUI_HIT_TEST_MODE_TRANSPARENT
    ArkUI_NumberValue hitValue[] = {ARKUI_HIT_TEST_MODE_TRANSPARENT};
    ArkUI_AttributeItem hitItem = {hitValue, 1};
    nodeAPI->setAttribute(stack, NODE_HIT_TEST_BEHAVIOR, &hitItem);
    nodeAPI->setAttribute(row1, NODE_HIT_TEST_BEHAVIOR, &hitItem);
    nodeAPI->setAttribute(row2, NODE_HIT_TEST_BEHAVIOR, &hitItem);
    nodeAPI->setAttribute(button1, NODE_HIT_TEST_BEHAVIOR, &hitItem);
    nodeAPI->setAttribute(button2, NODE_HIT_TEST_BEHAVIOR, &hitItem);

    nodeAPI->registerNodeEvent(row2, NODE_ON_GESTURE_COLLECT_INTERCEPT, 0, &row2);
    ArkUI_GestureCollectInterceptInfo *Info = nullptr;
    
    nodeAPI->addNodeEventReceiver(row2, [](ArkUI_NodeEvent *event) {
        auto *inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        if (OH_ArkUI_NodeEvent_GetEventType(event) == NODE_ON_GESTURE_COLLECT_INTERCEPT) {
            ArkUI_GestureCollectInterceptInfo *Info = nullptr;
            ArkUI_GestureRecognizerHandleArray array;
            ArkUI_TouchRecognizerHandleArray array1;
            int32_t size;
            int32_t size1;
            Info = OH_ArkUI_NodeEvent_GetGestureCollectInterceptInfo(event);
            if (Info) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestLog",
                             "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent!");
            } else if (Info == nullptr) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestLog","GetGestureCollectInterceptInfo nullptr");
            }

            auto errorCode1 = OH_ArkUI_GestureCollectInterceptInfo_GetResponseRecognizers(Info, &array, &size);
            auto errorCode2 = OH_ArkUI_GestureCollectInterceptInfo_GetTouchRecognizers(Info, &array1, &size1);

            int32_t uniqueId = 0;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "inputTest",
                         "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent! size %{public}d", size);
            ArkUI_ErrorCode errorCode3;
            for (auto i = 0; i < size; i++) {
                errorCode3 = OH_ArkUI_GetGestureBindNodeUniqueId(array[i], &uniqueId);
                auto gestureTest = OH_ArkUI_GestureRecognizer_IsHostBelongsTo(array[i], uniqueId);
                if (gestureTest == true) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testLog",
                                 "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent GestureRecognizer IsHostBelongsTo! %{public}d", size);
                } else if (gestureTest == false) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testLog",
                                 "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent GestureRecognizer Not IsHostBelongsTo!");
                }
            }
            for (auto i = 0; i < size1; i++) {
                auto touchTest = OH_ArkUI_TouchRecognizer_IsHostBelongsTo(array1[i], uniqueId);
                if (touchTest == true) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testLog",
                                 "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent TouchRecognizer IsHostBelongsTo! %{public}d", size1);
                } else if (touchTest == false){
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testLog",
                                 "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent TouchRecognizer Not IsHostBelongsTo!");
                }
            }
            auto errorCode4 = OH_ArkUI_GestureCollectInterceptInfo_SetGestureCollectIntervention(Info, mode);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "inputTest",
                         "NODE_ON_GESTURE_COLLECT_INTERCEPT NodeEvent!");
            if(errorCode1 == ARKUI_ERROR_CODE_NO_ERROR && errorCode2 == ARKUI_ERROR_CODE_NO_ERROR &&
                errorCode3 == ARKUI_ERROR_CODE_NO_ERROR && errorCode4 == ARKUI_ERROR_CODE_NO_ERROR){
                    SetLabel("1", text5);
            }
        }
    });
    
    auto button01 = SetButtonNode("CONTINUE", PARAM_10);
    auto button02 = SetButtonNode("DISCARD_LOWER", PARAM_11);
    auto button03 = SetButtonNode("DISCARD_HIGHER", PARAM_12);
    auto button04 = SetButtonNode("DISCARD_SELF", PARAM_13);
    auto button05 = SetButtonNode("DISCARD_LOWER_PRIORITY_SIBLINGS", PARAM_14);
    auto button06 = SetButtonNode("clear", PARAM_15);

    text1 = SetButtonNode("text1", PARAM_16);
    text2 = SetButtonNode("text2", PARAM_17);
    text3 = SetButtonNode("text3", PARAM_18);
    text4 = SetButtonNode("text4", PARAM_19);
    text5 = SetButtonNode("text5", PARAM_20);

    ArkUI_NodeHandle row01 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row02 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row03 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, row01);
    nodeAPI->addChild(column, row02);
    nodeAPI->addChild(column, row03);

    nodeAPI->addChild(row01, button01);
    nodeAPI->addChild(row01, button02);
    nodeAPI->addChild(row01, button03);
    nodeAPI->addChild(row02, button04);
    nodeAPI->addChild(row02, button05);
    nodeAPI->addChild(row02, button06);

    nodeAPI->addChild(row03, text1);
    nodeAPI->addChild(row03, text2);
    nodeAPI->addChild(row03, text3);
    nodeAPI->addChild(row03, text4);
    nodeAPI->addChild(row03, text5);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
        // 判断是否支持创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    if (gestureApi->createGroupGesture) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "[Sample_NdkAddInteractionEvent]",
                     "NdkAddInteractionEvent_GestureSampleLog, createGroupGesture api exist");
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "[Sample_NdkAddInteractionEvent]",
                     "NdkAddInteractionEvent_GestureSampleLog, createGroupGesture api not exist");
    }

    // 创建点击手势
    auto tapGesture = gestureApi->createTapGesture(1, true);
    // 给点击手势绑定回调
    auto onActionCallBackTap = [](ArkUI_GestureEvent *event, void *extraParam) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gestureLog", "row2 tap");
    };
    auto result = gestureApi->setGestureEventTarget(
        tapGesture, GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE | GESTURE_EVENT_ACTION_CANCEL, row2,
        onActionCallBackTap);
    gestureApi->addGestureToNode(row2, tapGesture, PARALLEL, NORMAL_GESTURE_MASK);
    
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

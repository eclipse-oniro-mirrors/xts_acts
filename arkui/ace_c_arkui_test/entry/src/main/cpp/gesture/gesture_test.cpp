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
#include "gesture_test.h"
#include "common/common.h"
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

uint32_t defalutColor = 0xffff0000;
uint32_t actionedColor = 0xff00ff00;
bool flag = false;
ArkUI_NodeHandle longpressNode;
void OnActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
    auto action = OH_ArkUI_UIInputEvent_GetAction(inputEvent);
    auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
    auto pointerCount = OH_ArkUI_PointerEvent_GetPointerCount(inputEvent);
    auto pointerId = OH_ArkUI_PointerEvent_GetPointerId(inputEvent, 0);
    auto getXByIndex = OH_ArkUI_PointerEvent_GetXByIndex(inputEvent, 0);
    auto getYByIndex = OH_ArkUI_PointerEvent_GetYByIndex(inputEvent, 0);
    auto getWindowXByIndex = OH_ArkUI_PointerEvent_GetWindowXByIndex(inputEvent, 0);
    auto getWindowYByIndex = OH_ArkUI_PointerEvent_GetWindowYByIndex(inputEvent, 0);
    auto getDisplayXByIndex = OH_ArkUI_PointerEvent_GetDisplayXByIndex(inputEvent, 0);
    auto getDisplayYByIndex = OH_ArkUI_PointerEvent_GetDisplayYByIndex(inputEvent, 0);
    auto getPressure = OH_ArkUI_PointerEvent_GetPressure(inputEvent, 0);
    auto getTiltX = OH_ArkUI_PointerEvent_GetTiltX(inputEvent, 0);
    auto getTiltY = OH_ArkUI_PointerEvent_GetTiltY(inputEvent, 0);
    auto getTouchAreaWidth = OH_ArkUI_PointerEvent_GetTouchAreaWidth(inputEvent, 0);
    auto getTouchAreaHeight = OH_ArkUI_PointerEvent_GetTouchAreaHeight(inputEvent, 0);
    auto getHistorySize = OH_ArkUI_PointerEvent_GetHistorySize(inputEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  inputEvent %{public}d",
        !!inputEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  sourceType %{public}d",
        sourceType);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  action %{public}d",
        action);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  toolType %{public}d",
        toolType);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  pointerCount %{public}d",
        pointerCount);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  pointerId %{public}d",
        pointerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getXByIndex %{public}f",
        getXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getYByIndex %{public}f",
        getYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getWindowXByIndex %{public}f",
        getWindowXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getWindowYByIndex %{public}f",
        getWindowYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getDisplayXByIndex %{public}f",
        getDisplayXByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getDisplayYByIndex %{public}f",
        getDisplayYByIndex);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getPressure %{public}f",
        getPressure);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTiltY %{public}f",
        getTiltX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTiltY %{public}f",
        getTiltY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  historySize %{public}lu",
        getHistorySize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTouchAreaWidth %{public}f",
        getTouchAreaWidth);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "LONGPRESSGESTURE  getTouchAreaHeight %{public}f",
        getTouchAreaHeight);
    if (!flag && longpressNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(
            ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(longpressNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "LONGPRESSGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

ArkUI_NodeHandle CreateNativeNode(char* rootId)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto nativeNode = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue widthValue[] = { {.f32 = 500} };
    ArkUI_AttributeItem widthItem = { .value = widthValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nativeNode, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue heightValue[] = { {.f32 = 500} };
    ArkUI_AttributeItem heightItem = { .value = heightValue, .size = sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nativeNode, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue value[] = {{.u32 = defalutColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nativeNode, NODE_BACKGROUND_COLOR, &value_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = rootId;
    nodeAPI->setAttribute(nativeNode, NODE_ID, &id_item);
    return nativeNode;
}

napi_value GestureTest::CreateLongPressNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
        "ListItemHitTestBehaviorTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    longpressNode = CreateNativeNode("longPressID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(
            ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto longPressGuesture = guestureAPI->createLongPressGesture(1, true, 100);
    guestureAPI->setGestureEventTarget(longPressGuesture, GESTURE_EVENT_ACTION_ACCEPT,
        longpressNode, &OnActionCallBack);
    guestureAPI->addGestureToNode(longpressNode,
        longPressGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), longpressNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArkUI_NodeHandle swipeNode;
void OnSwipeActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto angle = OH_ArkUI_SwipeGesture_GetAngle(event);
    auto velocity = OH_ArkUI_SwipeGesture_GetVelocity(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "SWIPEGESTURE  swipAction %{public}f", angle);
    if (!flag && swipeNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(swipeNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "SWIPEGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

napi_value GestureTest::CreateSwipeNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateSwipeNativeNode");
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
    flag = false;
    swipeNode = CreateNativeNode("swipeID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGuesture = guestureAPI->createSwipeGesture(1, GESTURE_DIRECTION_HORIZONTAL, 10);
    guestureAPI->setGestureEventTarget(swipeGuesture,
        GESTURE_EVENT_ACTION_ACCEPT, swipeNode, &OnSwipeActionCallBack);
    guestureAPI->addGestureToNode(swipeNode, swipeGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), swipeNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArkUI_NodeHandle panNode;
void OnPanActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto offsetY = OH_ArkUI_PanGesture_GetOffsetY(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  offsetY %{public}f", offsetY);
    if (!flag && panNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(panNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
            "Manager", "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

napi_value GestureTest::CreatePanNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateSwipeNativeNode");
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
    flag = false;
    panNode = CreateNativeNode("panID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGuesture = guestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    guestureAPI->setGestureEventTarget(panGuesture, GESTURE_EVENT_ACTION_ACCEPT, panNode, &OnPanActionCallBack);
    guestureAPI->addGestureToNode(panNode, panGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), panNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArkUI_NodeHandle pinchNode;
void OnPinchActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto scale = OH_ArkUI_PinchGesture_GetScale(event);
    auto centerX = OH_ArkUI_PinchGesture_GetCenterX(event);
    auto centerY = OH_ArkUI_PinchGesture_GetCenterY(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  scale %{public}f", scale);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  centerX %{public}f", centerX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PANGESTURE  centerY %{public}f", centerY);
    if (!flag && pinchNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(pinchNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

napi_value GestureTest::CreatePinchNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateSwipeNativeNode");
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
    flag = false;
    pinchNode = CreateNativeNode("PinchID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto pincheGuesture = guestureAPI->createPinchGesture(2, 50);
    guestureAPI->setGestureEventTarget(pincheGuesture,
        GESTURE_EVENT_ACTION_ACCEPT, pinchNode, &OnPinchActionCallBack);
    guestureAPI->addGestureToNode(pinchNode, pincheGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), pinchNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreatePinchNativeNode",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArkUI_NodeHandle rotateNode;
void OnRotateActionCallBack(ArkUI_GestureEvent *event, void *extraparam)
{
    auto angle = OH_ArkUI_RotationGesture_GetAngle(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "Manager", "PANGESTURE  angle %{public}f", angle);
    if (!flag && rotateNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));        
        auto ret = nodeAPI->setAttribute(rotateNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
}

napi_value GestureTest::CreateRotateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateSwipeNativeNode");
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
    flag = false;
    rotateNode = CreateNativeNode("rotateID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto rotateGuesture = guestureAPI->createRotationGesture(2, 0);
    guestureAPI->setGestureEventTarget(
        rotateGuesture, GESTURE_EVENT_ACTION_ACCEPT, rotateNode, &OnRotateActionCallBack);
    guestureAPI->addGestureToNode(rotateNode, rotateGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), rotateNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreatePinchNativeNode",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArkUI_NodeHandle interruptNode;
ArkUI_GestureInterruptResult OnInterruptCallback(ArkUI_GestureInterruptInfo* info)
{
    auto systag = OH_ArkUI_GestureInterruptInfo_GetSystemFlag(info);
    auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
    auto gestureEvent = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto recognizerType = OH_ArkUI_GestureInterruptInfo_GetSystemRecognizerType(info);
    if (gestureEvent == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "onPanCallBack, gestureEvent nullptr");
    } else {
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(gestureEvent);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto toolType = OH_ArkUI_UIInputEvent_GetToolType(inputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                         "onPanCallBack, PanGesture sourceType %{public}d", sourceType);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                                                     "onPanCallBack, PanGesture toolType %{public}d", toolType);
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "OnInterruptCallback,systag %{public}d", systag);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OnInterruptCallback,systag %{public}d", recognizerType);
    if (!flag && interruptNode) {
        flag = true;
        ArkUI_NumberValue value[] = {{.u32 = actionedColor}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        auto ret = nodeAPI->setAttribute(interruptNode, NODE_BACKGROUND_COLOR, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
            "PANGESTURE  setBackgroundColor result %{public}d", ret);
    }
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

napi_value GestureTest::CreateInterruptNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GuestureTest", "CreateInterruptNativeNode");
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
    flag = false;
    interruptNode = CreateNativeNode("interruptID");
    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGuesture = guestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    guestureAPI->setGestureEventTarget(panGuesture, GESTURE_EVENT_ACTION_ACCEPT, interruptNode, &OnPanActionCallBack);
    guestureAPI->addGestureToNode(interruptNode, panGuesture, PARALLEL, NORMAL_GESTURE_MASK);
    guestureAPI->setGestureInterrupterToNode(interruptNode, &OnInterruptCallback);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), interruptNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreatePinchNativeNode",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest

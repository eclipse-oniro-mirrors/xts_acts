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
#include "../component/XComponent.h"
#include "common/Common.h"
#include "component/XComponent.h"
#include "nativetype/native_type.h"
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_interface_focus.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/styled_string.h>
#include <cmath>
#include <cstdint>

static ArkUI_NodeHandle g_columnNode;
static ArkUI_NodeHandle g_navigation;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle g_pageNode;
static ArkUI_NodeHandle g_swiper;
static ArkUI_NodeHandle g_ErrorNode;
static ArkUI_NodeHandle g_navDestinationNode = nullptr;
static ArkUI_NodeContentHandle g_content;
static ArkUI_NodeContentHandle g_content3;
static ArkUI_GestureRecognizer *g_recognizer;
static ArkUI_GestureRecognizer *g_recognizer2;
static ArkUI_GestureInterruptInfo *g_event;
static ArkUI_GestureEventTargetInfo *g_event1;
static ArkUI_GestureEventTargetInfo *g_event2;
std::unordered_map<ArkUI_NavDestinationState, int32_t> g_navDestinationStateMap;
std::unordered_map<ArkUI_RouterPageState, int32_t> g_routerPageStateMap;
static ArkUI_NodeHandle rowHandle1 = nullptr;
static ArkUI_NativeNodeAPI_1 *g_nodeAPi = nullptr;
static OH_PixelmapNative *g_pixelMap = nullptr;
static ArkUI_GestureRecognizer *g_SwipeGesture;
static ArkUI_UIInputEvent *UIInput;
static ArkUI_UIInputEvent *clonedEvent;
static ArkUI_NodeHandle g_Node;
static int32_t g_test1ret1 = PARAM_2;
static int32_t g_test1ret2 = PARAM_2;
static int32_t g_test3ret1 = PARAM_2;
static int32_t g_test3ret2 = PARAM_2;
void onReceiver1(ArkUI_NodeEvent *event)
{
    ArkUI_NumberValue value[] = {{.f32 = 10.0f}};
    int32_t index = 0;
    g_test1ret1 = OH_ArkUI_NodeEvent_GetNumberValue(event, index, value);
    g_test1ret2 = OH_ArkUI_NodeEvent_GetNumberValue(event, -1, value);
    char insert[PARAM_64];
    int32_t size3 = 1;
    ArkUI_NumberValue value3[] = {{.i32 = 10}};
    g_test3ret1 = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, value3, size3);
    g_test3ret2 = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, value3, size3);
    return;
}
napi_value CreateNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, nodeHandle);
    ArkUI_AttributeItem nodeHandleitem = {.string = "textinput111", .size = PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &nodeHandleitem);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem width_item = {.value = width_value, .size = PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {.value = margin_value, .size = PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);
    ArkUI_NumberValue textinputvalue[] = {{.u32 = 0xFF0000FF}};
    ArkUI_AttributeItem textinputcoloritem = {.value = textinputvalue, .size = 1};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &textinputcoloritem);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_INPUT_ON_DID_INSERT, 1, nullptr);
    nodeAPI->addNodeEventReceiver(nodeHandle, onReceiver1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value CreateGestureNode1(napi_env env, napi_callback_info info)
{
    // 获取gestureApi接口
    static ArkUI_NativeGestureAPI_1 *gestureApi=nullptr;
    // 接受ArkTs侧传的node节点  并将其存储为全局变量
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content);

    // 获取nodeAPI接口
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建column类型的节点
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 向节点内容管理器添加节点（挂载）
    OH_ArkUI_NodeContent_AddNode(g_content, column);
    // 写页面
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem item0 = { .string = "Column1" };
    nodeAPI->setAttribute(column, NODE_ID, &item0);
    ArkUI_NumberValue width[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    // 创建拖动手势节点
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, 5);
    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_event = info;
        g_recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(g_event);

        OH_ArkUI_GetGestureEventTargetInfo(g_recognizer, &g_event1);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    // 添加手势到节点
    gestureApi->addGestureToNode(column, PanGesture, PARALLEL, NORMAL_GESTURE_MASK);
    // 将回调挂到节点
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
void eventReceiver(ArkUI_NodeEvent *event)
{
    UIInput = OH_ArkUI_NodeEvent_GetInputEvent(event);
    return;
}

napi_value CreateUIInputEventNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t targetId = 1;
    char *userData = "A";
    g_Node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue value[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(g_Node, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_Node, NODE_HEIGHT_PERCENT, &item);
    nodeAPI->registerNodeEvent(g_Node, NODE_ON_MOUSE, targetId, userData);
    nodeAPI->registerNodeEvent(g_Node, NODE_TOUCH_EVENT, targetId, userData);
    nodeAPI->addNodeEventReceiver(g_Node, eventReceiver);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_columnNode);
    return nullptr;
}


napi_value CreateGestureNode2(napi_env env, napi_callback_info info)
{
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(g_content, column);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem item0 = {.string = "Column1"};
    nodeAPI->setAttribute(column, NODE_ID, &item0);
    ArkUI_NumberValue width[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    g_SwipeGesture = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_LEFT, PARAM_100);
    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    gestureApi->addGestureToNode(column, g_SwipeGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value CreateNavigation(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    rowHandle1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, rowHandle1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value CheckRotationOptionX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationX = {.x = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationX) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationY = {.y = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationY) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionZ(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationZ = {.z = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationZ) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionAngle(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationAngle = {.angle = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationAngle) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionCenterX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationCenterX = {.centerX = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationCenterX) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionCenterY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationCenterY = {.centerY = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationCenterY) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionCenterZ(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationCenterZ = {.centerZ = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationCenterZ) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckRotationOptionPerspective(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_RotationOptions RotationOptionPerspective = {.perspective = 10.0f};
    if (OH_ArkUI_CreateRotationTransitionEffect(&RotationOptionPerspective) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckScaleOptionsX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_ScaleOptions CheckScaleOptionsX = {.x = 10.0f};
    if (OH_ArkUI_CreateScaleTransitionEffect(&CheckScaleOptionsX) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckScaleOptionsY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_ScaleOptions CheckScaleOptionsY = {.y = 10.0f};
    if (OH_ArkUI_CreateScaleTransitionEffect(&CheckScaleOptionsY) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckScaleOptionsZ(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_ScaleOptions CheckScaleOptionsZ = {.z = 10.0f};
    if (OH_ArkUI_CreateScaleTransitionEffect(&CheckScaleOptionsZ) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckScaleOptionsCenterX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_ScaleOptions CheckScaleOptionsCenterX = {.centerX = 10.0f};
    if (OH_ArkUI_CreateScaleTransitionEffect(&CheckScaleOptionsCenterX) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckScaleOptionsCenterY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_ScaleOptions CheckScaleOptionsCenterY = {.centerY = 10.0f};
    if (OH_ArkUI_CreateScaleTransitionEffect(&CheckScaleOptionsCenterY) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckTranslationOptionsX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_TranslationOptions CheckTranslationOptionsX = {.x = 10.0f};
    if (OH_ArkUI_CreateTranslationTransitionEffect(&CheckTranslationOptionsX) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckTranslationOptionsY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_TranslationOptions CheckTranslationOptionsY = {.y = 10.0f};
    if (OH_ArkUI_CreateTranslationTransitionEffect(&CheckTranslationOptionsY) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}
napi_value CheckTranslationOptionsZ(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_TranslationOptions CheckTranslationOptionsZ = {.z = 10.0f};
    if (OH_ArkUI_CreateTranslationTransitionEffect(&CheckTranslationOptionsZ) != nullptr) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreateNavDestinationNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    g_navigation = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(g_navigation, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_navigation, NODE_HEIGHT_PERCENT, &item);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_navigation);
    return nullptr;
}

napi_value GetNavDestinationState(napi_env env, napi_callback_info info)
{
    ArkUI_NavDestinationState state;
    OH_ArkUI_GetNavDestinationState(g_navigation, &state);
    if (g_navDestinationStateMap.count(state) == 0) {
        g_navDestinationStateMap.insert({state, 1});
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "g_navDestinationStateMap",
                     "g_navDestinationStateMap.insert: %{public}d", state);
    }
    return nullptr;
}

napi_value GetNavDestinationStateResult(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t state;
    napi_get_value_int32(env, args[0], &state);
    napi_create_int32(env, g_navDestinationStateMap.count(ArkUI_NavDestinationState(state)), &args[0]);
    return args[0];
}

napi_value CreateRouterPageNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    g_pageNode = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(g_pageNode, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_pageNode, NODE_HEIGHT_PERCENT, &item);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_pageNode);
    return nullptr;
}

napi_value GetRouterPageNodeState(napi_env env, napi_callback_info info)
{
    ArkUI_RouterPageState state;
    OH_ArkUI_GetRouterPageState(g_pageNode, &state);
    if (g_routerPageStateMap.count(state) == 0) {
        g_routerPageStateMap.insert({state, 1});
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "g_routerPageStateMap",
                     "g_routerPageStateMap.insert: %{public}d", state);
    }
    return nullptr;
}
napi_value GetRouterPageNodeStateResult(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t state;
    napi_get_value_int32(env, args[0], &state);
    napi_create_int32(env, g_routerPageStateMap.count(ArkUI_RouterPageState(state)), &args[0]);
    return args[0];
}

napi_value SetSwiperIndicatorMaxDisplayCount(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_value result;
        napi_create_int32(env, -1, &result); // -1表示参数获取失败
        return result;
    }
    int32_t maxDisplayCount = 0;
    if (napi_get_value_int32(env, args[0], &maxDisplayCount) != napi_ok) {
        napi_throw_type_error(env, nullptr, "参数必须是整数");
        napi_value result;
        napi_create_int32(env, PARAM_NEGATIVE_2, &result); // -3表示参数类型错误
        return result;
    }
    int32_t setResult = 0;
    ArkUI_SwiperIndicator *SetIndicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    if (SetIndicator != NULL) {
        setResult = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(SetIndicator, maxDisplayCount);
        setResult = setResult == ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : setResult;
        setResult = setResult == ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : setResult;
    }
    napi_value result;
    napi_create_int32(env, setResult, &result);
    return result;
}

napi_value SetCustomSpanMetricsWidthError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double width;
        napi_get_value_double(env, args[0], &width);
        floatValue = static_cast<float>(width);
    }
    ArkUI_CustomSpanMetrics *metrics = nullptr;
    int32_t setResult = OH_ArkUI_CustomSpanMetrics_SetWidth(metrics, floatValue) == ARKUI_ERROR_CODE_PARAM_INVALID ?
                        ARKUI_ERROR_CODE_PARAM_INVALID : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}
napi_value SetCustomSpanMetricsWidthSuccess(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double width;
        napi_get_value_double(env, args[0], &width);
        floatValue = static_cast<float>(width);
    }
    ArkUI_CustomSpanMetrics *metrics = OH_ArkUI_CustomSpanMetrics_Create();
    if (metrics == nullptr) {
        napi_create_int32(env, -1, &result); // 对象创建失败
        return result;
    }

    int32_t setResult = OH_ArkUI_CustomSpanMetrics_SetWidth(metrics, floatValue) == ARKUI_ERROR_CODE_NO_ERROR ?
                        ARKUI_ERROR_CODE_NO_ERROR : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}

// OH_ArkUI_CustomSpanMetrics_SetHeight()
napi_value SetCustomSpanMetricsHeightSuccess(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double height;
        napi_get_value_double(env, args[0], &height);
        floatValue = static_cast<float>(height);
    }
    ArkUI_CustomSpanMetrics *metrics = OH_ArkUI_CustomSpanMetrics_Create();
    if (metrics == nullptr) {
        napi_create_int32(env, -1, &result);// -1表示参数获取失败
        return result;
    }
    int32_t setResult = OH_ArkUI_CustomSpanMetrics_SetHeight(metrics, floatValue) == ARKUI_ERROR_CODE_NO_ERROR ?
                        ARKUI_ERROR_CODE_NO_ERROR : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}
napi_value SetCustomSpanMetricsHeightError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double height;
        napi_get_value_double(env, args[0], &height);
        floatValue = static_cast<float>(height);
    }
    ArkUI_CustomSpanMetrics *metrics = nullptr;
    int32_t setResult = OH_ArkUI_CustomSpanMetrics_SetHeight(metrics, floatValue) == ARKUI_ERROR_CODE_PARAM_INVALID ?
                        ARKUI_ERROR_CODE_PARAM_INVALID : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}

napi_value ArkUISnapshotOptionsSetScaleSuccess(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double scale;
        napi_get_value_double(env, args[0], &scale);
        floatValue = static_cast<float>(scale);
    }
    ArkUI_SnapshotOptions *snapshotOptions = OH_ArkUI_CreateSnapshotOptions();
    if (snapshotOptions == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t setResult = OH_ArkUI_SnapshotOptions_SetScale(snapshotOptions, floatValue) == ARKUI_ERROR_CODE_NO_ERROR ?
                            ARKUI_ERROR_CODE_NO_ERROR : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}
napi_value ArkUISnapshotOptionsSetScaleError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    float floatValue;
    if (argc >= 1 && args[0] != nullptr) {
        double scale;
        napi_get_value_double(env, args[0], &scale);
        floatValue = static_cast<float>(scale);
    }
    ArkUI_SnapshotOptions *snapshotOptions = nullptr;
    int32_t setResult = OH_ArkUI_SnapshotOptions_SetScale(snapshotOptions, floatValue) ==
                        ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : PARAM_NEGATIVE_2;
    napi_create_int32(env, setResult, &result);
    return result;
}

napi_value UnmarshallStyledStringDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint8_t *buffer = nullptr;
    size_t bufferSize = 0;
    if (argc >= 1 && args[0] != nullptr) {
        napi_get_buffer_info(env, args[0], reinterpret_cast<void **>(&buffer), &bufferSize);
    }
    if (argc >= PARAM_2 && args[1] != nullptr) {
        napi_get_value_external(env, args[1], reinterpret_cast<void **>(&bufferSize));
    }
    ArkUI_StyledString_Descriptor *descriptor = OH_ArkUI_StyledString_Descriptor_Create();
    int32_t unmarshallResult = OH_ArkUI_UnmarshallStyledStringDescriptor(buffer, bufferSize, descriptor);
    unmarshallResult = unmarshallResult == ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : unmarshallResult;
    unmarshallResult = unmarshallResult == ARKUI_ERROR_CODE_PARAM_INVALID ?
                       ARKUI_ERROR_CODE_PARAM_INVALID : unmarshallResult;
    napi_create_int32(env, unmarshallResult, &result);
    return result;
}

napi_value MarshallStyledStringDescriptorError(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_value result = nullptr;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }

    uint8_t *buffer = nullptr;
    size_t bufferSize = 0;
    size_t resultSize = 0;
    if (argc >= 1 && args[0] != nullptr) {
        napi_get_buffer_info(env, args[0], reinterpret_cast<void **>(&buffer), &bufferSize);
    }

    if (argc >= PARAM_2 && args[1] != nullptr) {
        int64_t temp = 0;
        napi_get_value_int64(env, args[1], &temp);
        bufferSize = static_cast<size_t>(temp);
    }

    if (argc >= PARAM_3 && args[PARAM_2] != nullptr) {
        int64_t temp = 0;
        napi_get_value_int64(env, args[PARAM_2], &temp);
        resultSize = static_cast<size_t>(temp);
    }

    ArkUI_StyledString_Descriptor *descriptor = nullptr;
    int32_t marshallResult = OH_ArkUI_MarshallStyledStringDescriptor(buffer, bufferSize, descriptor, &resultSize) ==
                             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : PARAM_NEGATIVE_2;
    napi_create_int32(env, marshallResult, &result);
    return result;
}

napi_value GetCheckedState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    ArkUI_AccessibilityState *state = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(state, ARKUI_ACCESSIBILITY_CHECKED);
    int32_t checkedResult = OH_ArkUI_AccessibilityState_GetCheckedState(state) == ARKUI_ACCESSIBILITY_CHECKED ?
                            ARKUI_ACCESSIBILITY_CHECKED : PARAM_NEGATIVE_2;
    napi_create_int32(env, checkedResult, &result);
    return result;
}

napi_value GetUnCheckedState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    ArkUI_AccessibilityState *state = OH_ArkUI_AccessibilityState_Create();
    int32_t checkedResult = OH_ArkUI_AccessibilityState_GetCheckedState(state) == ARKUI_ACCESSIBILITY_UNCHECKED ?
                            ARKUI_ACCESSIBILITY_UNCHECKED : PARAM_NEGATIVE_2;
    napi_create_int32(env, checkedResult, &result);
    return result;
}

napi_value ErrorCodeInternalError(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPi);
    auto column = g_nodeAPi->createNode(ARKUI_NODE_COLUMN);
    auto options = OH_ArkUI_CreateSnapshotOptions();
    int result = OH_ArkUI_GetNodeSnapshot(column, options, &g_pixelMap);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

void OnFinishCallback(void *userData) {}
napi_value ErrorCodeEventNotSupported(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    napi_value result = nullptr;
    int32_t setResult = OH_ArkUI_List_CloseAllSwipeActions(button, nullptr, OnFinishCallback);
    napi_create_int32(env, setResult, &result);
    return result;
}

napi_value ErrorCodeNodeNotSupported(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle parent = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NodeHandle child = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    child = g_columnNode;
    ArkUI_NumberValue widthValue[] = {{.f32 = 150.0f}};
    ArkUI_AttributeItem widthAttr = {widthValue, 1};
    nodeAPI->setAttribute(child, NODE_WIDTH, &widthAttr);
    int32_t setResult = nodeAPI->addChild(parent, child);
    napi_value result = nullptr;
    napi_create_int32(env, setResult, &result);
    return result;
}

napi_value ErrorCodeNodeOutOfRange(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test1ret2, &retValue);
    return retValue;
}

napi_value ErrorCodeNodeEventParamInvalid(napi_env env, napi_callback_info info)
{
    ArkUI_NodeEvent *event = nullptr;
    ArkUI_NumberValue numberValue;
    int result = OH_ArkUI_NodeEvent_GetNumberValue(event, PARAM_10, &numberValue);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ErrorCodeNodeIndexInvalid(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    int32_t smallBufferLen = PARAM_100;
    int32_t initVal = PARAM_20;
    int32_t resLen = initVal;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(rowHandle1, PARAM_NEGATIVE_1, buffer, smallBufferLen, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ErrorCodeGetInfoFailed(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    int32_t smallBufferLen = PARAM_1;
    int32_t initVal = PARAM_NEGATIVE_10;
    int32_t resLen = initVal;
    int result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, smallBufferLen, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ErrorCodeFocusNonFocusable(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle node = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_ErrorCode errorCode = OH_ArkUI_FocusRequest(node);
    napi_value result;
    napi_create_int32(env, errorCode, &result);
    return result;
}

napi_value ErrorCodeFocusNonAncestor(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003", "Invalid parameters");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003", "Failed to get NodeAPI");
        return nullptr;
    }
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue focusValue = {.i32 = 0};
    ArkUI_AttributeItem focusAttr = {.value = &focusValue, .size = 1};
    nodeAPI->setAttribute(column, NODE_FOCUSABLE, &focusAttr);
    auto child = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    focusValue.i32 = 1;
    nodeAPI->setAttribute(child, NODE_FOCUSABLE, &focusAttr);
    nodeAPI->addChild(column, child);
    int32_t focusResult = OH_ArkUI_FocusRequest(child);
    if (focusResult != ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003",
                     "Expected 150004 (NON_FOCUSABLE_ANCESTOR), but got: %{public}d", focusResult);
    }
    if (nodeAPI->disposeNode) {
        nodeAPI->disposeNode(child);
        nodeAPI->disposeNode(column);
    }
    napi_value retValue;
    napi_create_int32(env, focusResult, &retValue);
    return retValue;
}

napi_value ErrorCodeFocusNonExistent(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node = nullptr;
    ArkUI_ErrorCode errorCode = OH_ArkUI_FocusRequest(node);
    napi_value result;
    napi_create_int32(env, errorCode, &result);
    return result;
}

napi_value ErrorCodeNonScrollableContainer(napi_env env, napi_callback_info info)
{
    bool *ret;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(g_event1, ret);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ErrorCodePostClonedComponentStatusAbnormal(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle node = nullptr;
    const ArkUI_UIInputEvent *event;
    int32_t setResult = OH_ArkUI_PointerEvent_PostClonedEvent(node, event);
    napi_value res;
    napi_create_int32(env, setResult, &res);
    return res;
}

napi_value ErrorCodeRecognizerTypeNotSupported(napi_env env, napi_callback_info info)
{
    bool isLimited = true;
    int32_t result = OH_ArkUI_GetGestureParam_repeat(g_SwipeGesture, &isLimited);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ErrorCodeParamInvalid(napi_env env, napi_callback_info info)
{
    uint8_t buffer[PARAM_1024] = {0};
    size_t bufferSize = sizeof(buffer);
    ArkUI_StyledString_Descriptor *descriptor = nullptr;
    size_t resultSize = 0;
    int32_t setResult = OH_ArkUI_MarshallStyledStringDescriptor(buffer, bufferSize, descriptor, &resultSize);
    napi_value retValue;
    napi_create_int32(env, setResult, &retValue);
    return retValue;
}

napi_value ErrorCodeInvalidStyledString(napi_env env, napi_callback_info info)
{
    const std::string text = "Test";
    const size_t textLen = text.length();
    const size_t totalSize = PARAM_4 + textLen + PARAM_4 + PARAM_4 + PARAM_4;
    uint8_t *buffer = new uint8_t[totalSize];
    size_t offset = 0;
    buffer[offset++] = static_cast<uint8_t>(textLen & 0xFF);
    buffer[offset++] = static_cast<uint8_t>((textLen >> PARAM_8) & 0xFF);
    buffer[offset++] = static_cast<uint8_t>((textLen >> PARAM_16) & 0xFF);
    buffer[offset++] = static_cast<uint8_t>((textLen >> PARAM_24) & 0xFF);
    for (size_t i = 0; i < textLen; ++i) {
        buffer[offset++] = static_cast<uint8_t>(text[i]);
    }
    offset += PARAM_4;
    buffer[offset++] = 0xFF;
    buffer[offset++] = 0x00;
    buffer[offset++] = 0x00;
    buffer[offset++] = 0x00;
    const float floatValue = 12.0f;
    const uint8_t *floatBytes = reinterpret_cast<const uint8_t *>(&floatValue);
    buffer[offset++] = floatBytes[0];
    buffer[offset++] = floatBytes[1];
    buffer[offset++] = floatBytes[PARAM_2];
    buffer[offset++] = floatBytes[PARAM_3];
    uint32_t bufferSize = static_cast<uint32_t>(totalSize);
    // 5. 调用ArkUI接口
    ArkUI_StyledString_Descriptor *descriptor = OH_ArkUI_StyledString_Descriptor_Create();
    napi_value retValue;
    if (descriptor == nullptr) {
        // 处理创建失败的情况
        napi_create_int32(env, -1, &retValue); // 返回错误码
        delete[] buffer;
        return retValue;
    }
    size_t resultSize = PARAM_20;
    int32_t setResult = OH_ArkUI_MarshallStyledStringDescriptor(buffer, bufferSize, descriptor, &resultSize);
    napi_create_int32(env, setResult, &retValue);
    return retValue;
}

napi_value ErrorCodeNotClonedPointerEvent(napi_env env, napi_callback_info info)
{
    int32_t setResult = OH_ArkUI_PointerEvent_DestroyClonedEvent(UIInput);
    napi_value retValue;
    napi_create_int32(env, setResult, &retValue);
    return retValue;
}

napi_value ErrorCodeBufferSizeNotEnough(napi_env env, napi_callback_info info)
{
    int32_t *pressedKeyCodes;
    int32_t *length = nullptr;
    int32_t setResult = OH_ArkUI_UIInputEvent_GetPressedKeys(UIInput, pressedKeyCodes, length);
    napi_value retValue;
    napi_create_int32(env, setResult, &retValue);
    return retValue;
}

napi_value ErrorCodePostCloned(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(g_Node, clonedEvent);
    if (ret == ARKUI_ERROR_CODE_POST_CLONED_NO_COMPONENT_HIT_TO_RESPOND_TO_THE_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}
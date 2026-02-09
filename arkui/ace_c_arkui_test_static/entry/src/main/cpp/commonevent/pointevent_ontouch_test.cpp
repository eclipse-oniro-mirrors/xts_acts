/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "pointevent_ontouch_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static uint32_t g_historyIndex = 0;
static uint32_t g_pointerIndex = 0;

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_IMAGE);

    ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
    ArkUI_AttributeItem enable_item = {enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {
        background_color_value, sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    return nodeHandle;
}

static void EventHandleGetHistoryXY(const ArkUI_UIInputEvent *inputEvent)
{
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前组件左上角的X坐标。
    float historyX = OH_ArkUI_PointerEvent_GetHistoryX(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryXY",
        "OH_ArkUI_PointerEvent_GetHistoryX: historyX:%{public}f",
        historyX);

    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前组件左上角的Y坐标。
    float historyY = OH_ArkUI_PointerEvent_GetHistoryY(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryXY",
        "OH_ArkUI_PointerEvent_GetHistoryY: historyY:%{public}f",
        historyY);
}

static void EventHandleGetHistoryWindowXY(const ArkUI_UIInputEvent *inputEvent)
{
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前应用窗口左上角的X坐标。
    float historyWindowX = OH_ArkUI_PointerEvent_GetHistoryWindowX(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryWindowXY",
        "OH_ArkUI_PointerEvent_GetHistoryWindowX: historyWindowX:%{public}f",
        historyWindowX);

    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前应用窗口左上角的Y坐标。
    float historyWindowY = OH_ArkUI_PointerEvent_GetHistoryWindowY(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryWindowXY",
        "OH_ArkUI_PointerEvent_GetHistoryWindowY: historyWindowY:%{public}f",
        historyWindowY);
}

static void EventHandleGetHistoryDisplayXY(const ArkUI_UIInputEvent *inputEvent)
{
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前屏幕左上角的X坐标
    float historyDisPlayX = OH_ArkUI_PointerEvent_GetHistoryDisplayX(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryDisplayXY",
        "OH_ArkUI_PointerEvent_GetHistoryDisplayX: historyDisPlayX:%{public}f",
        historyDisPlayX);

    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中特定接触点相对于当前屏幕左上角的Y坐标
    float historyDisPlayY = OH_ArkUI_PointerEvent_GetHistoryDisplayY(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryDisplayXY",
        "OH_ArkUI_PointerEvent_GetHistoryDisplayY: historyDisPlayY:%{public}f",
        historyDisPlayY);
}

static void EventHandleGetHistoryTiltXY(const ArkUI_UIInputEvent *inputEvent)
{
    // 从带有指向性的输入事件（如触摸事件）中获取特定历史事件中的相对YZ平面的角度，取值的范围[-90,
    // 90]，其中正值是向右倾斜
    float historyTiltX = OH_ArkUI_PointerEvent_GetHistoryTiltX(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryTiltXY",
        "OH_ArkUI_PointerEvent_GetHistoryTiltX: historyTiltX:%{public}f",
        historyTiltX);

    // 从带有指向性的输入事件（如触摸事件）中获取特定历史事件中的相对XZ平面的角度，值的范围[-90, 90]，其中正值是向下倾斜
    float historyTiltY = OH_ArkUI_PointerEvent_GetHistoryTiltY(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryTiltXY",
        "OH_ArkUI_PointerEvent_GetHistoryTiltY: historyTiltY:%{public}f",
        historyTiltY);
}

static void EventHandleGetHistoryTouchArea(const ArkUI_UIInputEvent *inputEvent)
{
    float historyWidth = OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryTouchArea",
        "OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth: historyWidth:%{public}f",
        historyWidth);

    float historyHeight = OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "EventHandleGetHistoryTouchArea",
        "OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight: historyHeight:%{public}f",
        historyHeight);
}

static void EventTouchHandle(const ArkUI_UIInputEvent *inputEvent)
{
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取历史事件发生的时间
    uint32_t g_historyIndex = 0;
    int64_t eventTime = OH_ArkUI_PointerEvent_GetHistoryEventTime(inputEvent, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "PointEventOnTouchTest",
        "OH_ArkUI_PointerEvent_GetHistoryEventTime: eventTime:%{public}lld",
        eventTime);
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取特定历史事件中多点触控的接触点数量
    uint32_t pointCount = OH_ArkUI_PointerEvent_GetHistoryPointerCount(inputEvent, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "PointEventOnTouchTest",
        "OH_ArkUI_PointerEvent_GetHistoryPointerCount: pointCount:%{public}u",
        pointCount);
    // 从带有指向性的输入事件（如触摸事件、鼠标事件、轴事件）中获取多点触控的接触点标识
    int32_t pointId = OH_ArkUI_PointerEvent_GetHistoryPointerId(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "PointEventOnTouchTest",
        "OH_ArkUI_PointerEvent_GetHistoryPointerId: pointId:%{public}u",
        pointId);
    // 从带有指向性的输入事件（如触摸事件）中获取特定历史事件中的触屏压力
    float historyPressure = OH_ArkUI_PointerEvent_GetHistoryPressure(inputEvent, g_pointerIndex, g_historyIndex);
    OH_LOG_Print(LOG_APP,
        LOG_INFO,
        LOG_PRINT_DOMAIN,
        "PointEventOnTouchTest",
        "OH_ArkUI_PointerEvent_GetHistoryPressure: historyPressure:%{public}f",
        historyPressure);
    EventHandleGetHistoryXY(inputEvent);
    EventHandleGetHistoryWindowXY(inputEvent);
    EventHandleGetHistoryDisplayXY(inputEvent);
    EventHandleGetHistoryTiltXY(inputEvent);
    EventHandleGetHistoryTouchArea(inputEvent);
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "OnEventReceive: event is null");
        return;
    }

    // 获取组件事件类型
    ArkUI_NodeEventType nodeEventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "nodeEventType is %{public}d", nodeEventType);

    // 获取组件事件中的字符串数据
    ArkUI_StringAsyncEvent *stringAsyncEvnet = OH_ArkUI_NodeEvent_GetStringAsyncEvent(event);
    if (stringAsyncEvnet != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "stringAsyncEvnet is not nullptr");
    }

    // 获取组件事件中的用户自定义数据
    void *userData = OH_ArkUI_NodeEvent_GetUserData(event);
    if (userData == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "userData is empty");
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    ArkUI_UIInputEvent *inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);

    int32_t inputEventType = OH_ArkUI_UIInputEvent_GetType(inputEvent);
    if (inputEventType == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PointEventOnTouchTest", "inputEventType is 0");
        return;
    }
    if (inputEventType == ARKUI_UIINPUTEVENT_TYPE_TOUCH) {
        EventTouchHandle(inputEvent);
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {
        background_color_value, sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

void PointEventOnTouchTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto columnOnTouch = createChildNode(nodeAPI, true);
    auto columnOnTouchDisable = createChildNode(nodeAPI, false);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnTouchTest";
    nodeAPI->setAttribute(columnOnTouch, NODE_ID, &id_item);
    id_item.string = "OnTouchTestDisable";
    nodeAPI->setAttribute(columnOnTouchDisable, NODE_ID, &id_item);
    nodeAPI->addChild(column, columnOnTouch);
    nodeAPI->addChild(column, columnOnTouchDisable);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
}  // namespace ArkUIAniTest
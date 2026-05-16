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


#include "scroll_scrollto_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#define SCROLL_TO_EVENT_ID 1111
#define PARAM_400 400
#define PARAM_1000 1000
#define PARAM_700 700
#define PARAM_NEGATIVE_200 (-200)
#define SIZE_320 320

namespace ArkUIAniTest {

static int g_flagCanOverScroll = PARAM_0;
static int g_flagCanOverScrollOff = PARAM_0;

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    return scroll;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32 == PARAM_0 &&
            nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32 == PARAM_10) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_LINEAR}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeEase(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeEaseInOut(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_IN_OUT}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeEaseIn(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeEaseOut(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EASE_OUT}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeExtremeDeceleration(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_EXTREME_DECELERATION}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeFastOutLinearIn(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FAST_OUT_LINEAR_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeFastOutSlowIn(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FAST_OUT_SLOW_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeFriction(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_FRICTION}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeLinearOutSlowIn(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_LINEAR_OUT_SLOW_IN}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeRhythm(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_RHYTHM}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeSharp(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_SHARP}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollToTest::CreateNativeNodeSmooth(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    float height = 10.0;

    ArkUI_NumberValue scroll_value[] = {
        {.f32 = PARAM_0}, {.f32 = height}, {.i32 = PARAM_64}, {.i32 = ARKUI_CURVE_SMOOTH}, {.i32 = true}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_SCROLL, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveCanOverScroll(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceiveCanOverScroll");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    g_flagCanOverScroll++;

    if (eventId == SCROLL_TO_EVENT_ID && g_flagCanOverScroll == PARAM_2) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

void ScrollScrollToTest::CreateNativeNodeCanOverScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNode(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "CanOverScroll";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_400}, {.i32 = PARAM_64},
        {.i32 = ARKUI_CURVE_SMOOTH}, {.i32 = PARAM_0}, {.i32 = PARAM_1}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = PARAM_1}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveCanOverScroll);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveCanOverScrollOff(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceiveCanOverScrollOff");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    g_flagCanOverScrollOff++;

    if (eventId == SCROLL_TO_EVENT_ID && g_flagCanOverScrollOff == PARAM_2) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

void ScrollScrollToTest::CreateNativeNodeCanOverScrollOff(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNode(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "CanOverScrollOff";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_400}, {.i32 = PARAM_64},
        {.i32 = ARKUI_CURVE_SMOOTH}, {.i32 = PARAM_0}, {.i32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveCanOverScrollOff);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_REACH_END, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static ArkUI_NodeHandle CreateChildNodeScrollTo(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = PARAM_1000}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    return scroll;
}

static void OnEventReceiveScrollTo001(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_200) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo001";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo001);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static ArkUI_NodeHandle CreateChildNodeScrollTo002(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_1000}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    return scroll;
}

static void OnEventReceiveScrollTo002(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_200 && offsetValue1 == PARAM_0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo002(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_200}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo002";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo002);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveScrollTo003(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo003";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo003);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveScrollTo004(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_NEGATIVE_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo004";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo004);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveScrollTo005(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_NEGATIVE_200}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo005";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo005);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveScrollTo006(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_NEGATIVE_200}, {.f32 = PARAM_NEGATIVE_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo006";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo006);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveScrollTo007(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollToTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto offsetValue0 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
    auto offsetValue1 = nodeAPI->getAttribute(nodeHandler, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;

    if (eventId == SCROLL_TO_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 == PARAM_700) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollToTest::CreateNativeNodeScrollTo007(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollTo(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_1000}, {.f32 = PARAM_1000}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_OFFSET, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(ret, SUCCESS);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollTo007";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScrollTo007);
    nodeAPI->registerNodeEvent(scroll, NODE_ON_CLICK, SCROLL_TO_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
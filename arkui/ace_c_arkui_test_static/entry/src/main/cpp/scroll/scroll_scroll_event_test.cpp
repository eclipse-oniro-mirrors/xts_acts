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


#include "scroll_scroll_event_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#define ON_SCROLL_SCROLL_EVENT_ID 6054
#define ON_SCROLL_SCROLL_DID_EVENT_ID 6055
#define SIZE_320 320
#define PARAM_1000 1000
#define PARAM_NEGATIVE_200 (-200)

namespace ArkUIAniTest {

std::vector<int32_t> ScrollScrollEventTest::g_OnScrollStart(PARAM_1, PARAM_0);
std::vector<int32_t> ScrollScrollEventTest::g_OnScrollEnd(PARAM_1, PARAM_0);
static int g_flagOnWillDidScroll = PARAM_0;

static ani_object SetArrayAniData(const std::vector<int32_t>&values, ani_env* env)
{
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class intCls {};
    ani_method intCtor {};
    if (ANI_OK != env->FindClass("std.core.Int", &intCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Int error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find int Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object intObj {};
        if (ANI_OK != env->Object_New(intCls, intCtor, &intObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, intObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set int error");
            return nullptr;
        }
    }
    return aniArray;
};

ani_object ScrollScrollEventTest::GetOnWillDidData(ani_env* env, ani_object info)
{
    ani_object String_array1 = SetArrayAniData(ScrollScrollEventTest::g_OnScrollStart, env);
    ani_object String_array2 = SetArrayAniData(ScrollScrollEventTest::g_OnScrollEnd, env);
    ScrollScrollEventTest::g_OnScrollStart.clear();
    ScrollScrollEventTest::g_OnScrollEnd.clear();
    
    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 3;
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class arrayCls {};
    ani_method arrayCtor {};
    if (ANI_OK != env->FindClass("std.core.Array", &arrayCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Array error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(arrayCls, "<ctor>", "C{std.core.Array}:", &arrayCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find Array Ctor error");
        return nullptr;
    }

    ani_object arrayObj {};
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array1)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New1 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_0, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set1 array error");
        return nullptr;
    }
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array2)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New1 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_1, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set1 array error");
        return nullptr;
    }
    return aniArray;
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_320}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, button);

    return scroll;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_SCROLL_SCROLL_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    if (eventId == ON_SCROLL_SCROLL_DID_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        auto offsetValue0 = result->data[PARAM_0].f32;
        auto offsetValue1 = result->data[PARAM_1].f32;
        auto offsetValue2 = result->data[PARAM_2].i32;
        if (offsetValue0 == PARAM_0 && offsetValue1 >= PARAM_0 && offsetValue2 == PARAM_1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_YELLOW}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceiveOnWillScroll(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);

    auto offsetValue0 = result->data[PARAM_0].f32;
    auto offsetValue1 = result->data[PARAM_1].f32;
    auto offsetValue2 = result->data[PARAM_2].i32;
    auto offsetValue3 = result->data[PARAM_3].i32;

    if (eventId == ON_SCROLL_SCROLL_EVENT_ID) {
        if (offsetValue0 == PARAM_0 && offsetValue1 >= PARAM_0 && offsetValue2 == PARAM_1 && offsetValue3 == PARAM_0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void ScrollScrollEventTest::CreateNativeNodeOnWillScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnWillScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnWillScroll);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rootColumn);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeOnDidScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnDidScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_DID_SCROLL, ON_SCROLL_SCROLL_DID_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rootColumn);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void OnEventReceiveOnWillDidScroll(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_SCROLL_SCROLL_EVENT_ID) {
        if (g_flagOnWillDidScroll == PARAM_0) {
            ScrollScrollEventTest::g_OnScrollStart[PARAM_0] = PARAM_1;
        }
        ScrollScrollEventTest::g_OnScrollEnd[PARAM_0] = PARAM_1;
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        g_flagOnWillDidScroll = PARAM_1;
    }

    if (eventId == ON_SCROLL_SCROLL_DID_EVENT_ID) {
        if (g_flagOnWillDidScroll == PARAM_0) {
            ScrollScrollEventTest::g_OnScrollStart[PARAM_0] = PARAM_2;
        }
        ScrollScrollEventTest::g_OnScrollEnd[PARAM_0] = PARAM_2;
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_YELLOW}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        g_flagOnWillDidScroll = PARAM_1;
    }
}

void ScrollScrollEventTest::CreateNativeNodeOnWillDidScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnWillDidScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnWillDidScroll);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_DID_SCROLL, ON_SCROLL_SCROLL_DID_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rootColumn);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeOnReachStart(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnReachStart";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_REACH_START, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rootColumn);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeOnReachEnd(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnReachEnd";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_REACH_END, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, rootColumn);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static ArkUI_NodeHandle CreateChildNodeScrollBy(ArkUI_NativeNodeAPI_1 *nodeAPI)
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

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    return scroll;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_200);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy001";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static ArkUI_NodeHandle CreateChildNodeScrollBy002(ArkUI_NativeNodeAPI_1 *nodeAPI)
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

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);

    return scroll;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy002(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_200}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_200);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy002";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy003";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_NEGATIVE_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_NEGATIVE_200);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy004";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_NEGATIVE_200}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_NEGATIVE_200);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy005";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ScrollScrollEventTest::CreateNativeNodeScrollBy006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_1000}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ_NO_RETURN_VALUE(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_1000);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy006";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest

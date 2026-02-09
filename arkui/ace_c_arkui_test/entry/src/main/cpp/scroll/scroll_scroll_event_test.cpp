/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "../manager/plugin_manager.h"
#include "scroll_scroll_event_test.h"
#include <string>

#define ON_SCROLL_SCROLL_EVENT_ID 6054
#define ON_SCROLL_SCROLL_DID_EVENT_ID 6055
#define SIZE_320 320
#define PARAM_1000 1000
#define PARAM_NEGATIVE_200 (-200)

namespace ArkUICapiTest {

std::vector<int32_t> ScrollScrollEventTest::g_OnScrollStart(PARAM_1, PARAM_0);
std::vector<int32_t> ScrollScrollEventTest::g_OnScrollEnd(PARAM_1, PARAM_0);
static int g_flagOnWillDidScroll = PARAM_0;

static napi_value SetArrayNapiDataWithScroll(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};

napi_value ScrollScrollEventTest::GetOnWillDidData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetOnWillDidData");
    napi_value result;
    napi_create_array(env, &result);

    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithScroll(ScrollScrollEventTest::g_OnScrollStart, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiDataWithScroll(ScrollScrollEventTest::g_OnScrollEnd, env));

    ScrollScrollEventTest::g_OnScrollStart.clear();
    ScrollScrollEventTest::g_OnScrollEnd.clear();
    return result;
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_130}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_150}};
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

napi_value ScrollScrollEventTest::CreateNativeNodeOnWillScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnWillScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnWillScroll);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeOnDidScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnDidScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_DID_SCROLL, ON_SCROLL_SCROLL_DID_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
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

napi_value ScrollScrollEventTest::CreateNativeNodeOnWillDidScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnWillDidScroll";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveOnWillDidScroll);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_WILL_SCROLL, ON_SCROLL_SCROLL_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_DID_SCROLL, ON_SCROLL_SCROLL_DID_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeOnReachStart(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnReachStart";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_REACH_START, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeOnReachEnd(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scrollCalled = CreateChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnReachEnd";
    nodeAPI->setAttribute(scrollCalled, NODE_ID, &id_item);

    nodeAPI->addChild(rootColumn, scrollCalled);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    nodeAPI->registerNodeEvent(scrollCalled, NODE_SCROLL_EVENT_ON_REACH_END, ON_SCROLL_SCROLL_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), rootColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeScrollBy(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);

    ArkUI_NumberValue button_length_value[] = {{.f32 = PARAM_300}};
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

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_150}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_150);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy001";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static ArkUI_NodeHandle CreateChildNodeScrollBy002(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_300}};
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

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy002(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_100}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_100);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy002";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy003";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_NEGATIVE_200}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_NEGATIVE_200);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy004";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy005(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &item);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_NEGATIVE_200}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_NEGATIVE_200);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_0);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy005";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ScrollScrollEventTest::CreateNativeNodeScrollBy006(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeScrollBy(nodeAPI);
    ArkUI_NumberValue scroll_value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_1000}};
    ArkUI_AttributeItem scroll_item = {scroll_value, sizeof(scroll_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BY, &scroll_item);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_OFFSET)->value[PARAM_1].f32, PARAM_1000);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ScrollBy006";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollEventTest",
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

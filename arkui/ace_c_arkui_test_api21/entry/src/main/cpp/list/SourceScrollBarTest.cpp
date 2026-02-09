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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "SourceScrollBarTest.h"
#define LIST_ON_WILL_SCROLL_EVENT_ID 6203
#define PARAM_0_POINT_2 0.2

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildSource(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = {200};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = SIZE_200;
    nodeAPI->setAttribute(list, NODE_WIDTH, &item);
    value[0].f32 = SIZE_250;
    nodeAPI->setAttribute(list, NODE_HEIGHT, &item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "list_bar_source";
    nodeAPI->setAttribute(list, NODE_ID, &id_item);

    ArkUI_NumberValue barValue[] = { { .i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON } };
    ArkUI_AttributeItem barItem = {barValue, sizeof(barValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE, &barItem);

    ArkUI_NumberValue barWidValue[] = { { .f32 = SIZE_80 } };
    ArkUI_AttributeItem barWidItem = {barWidValue, sizeof(barWidValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_SCROLL_BAR_WIDTH, &barWidItem);

    ArkUI_NumberValue edgeEffectValue[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}};
    ArkUI_AttributeItem edgeEffectItem = {edgeEffectValue, sizeof(edgeEffectValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GRAY}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_WILL_SCROLL, LIST_ON_WILL_SCROLL_EVENT_ID, nullptr);

    for (int32_t i = 0; i < SIZE_30; i++) {
        auto listItem = nodeAPI->createNode(ARKUI_NODE_FLOW_ITEM);
        value[0].f32 = SIZE_50;
        nodeAPI->setAttribute(listItem, NODE_WIDTH, &item);
        nodeAPI->setAttribute(listItem, NODE_HEIGHT, &item);
        auto textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);

        std::string str = "N_" + std::to_string(i);
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        ArkUI_NumberValue textAlign_value[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_START}};
        ArkUI_AttributeItem textAlign_item = {textAlign_value, sizeof(textAlign_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &textAlign_item);

        nodeAPI->addChild(listItem, textNode);
        nodeAPI->addChild(list, listItem);
    }

    return list;
}

static void OnEventReceiveBar(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListFlingEventTest", "OnEventReceiveDrag");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListFlingEventTest", "SCROLL_BAR: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    
    float offsetValue = result->data[PARAM_0].f32;
    int32_t stateValue = result->data[PARAM_1].i32;
    int32_t sourceValue = result->data[PARAM_2].i32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR", "offset0: %{public}f", offsetValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR", "state1: %{public}i", stateValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR", "source2: %{public}i", sourceValue);

    if (eventId == LIST_ON_WILL_SCROLL_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "Source");
        if (sourceValue == ARKUI_SCROLL_SOURCE_SCROLL_BAR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Source", "ARKUI_SCROLL_SOURCE_SCROLL_BAR");
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceiveBarFling(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListFlingEventTest", "OnEventReceiveFling");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListFlingEventTest", "SCROLL_BAR_FLING: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    
    float offsetValue = result->data[PARAM_0].f32;
    int32_t stateValue = result->data[PARAM_1].i32;
    int32_t sourceValue = result->data[PARAM_2].i32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR_FLING", "offset0: %{public}f", offsetValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR_FLING", "state1: %{public}i", stateValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLL_BAR_FLING", "source2: %{public}i", sourceValue);

    if (eventId == LIST_ON_WILL_SCROLL_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "Source");
        if (sourceValue == ARKUI_SCROLL_SOURCE_SCROLL_BAR_FLING) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Source", "ARKUI_SCROLL_SOURCE_SCROLL_BAR_FLING");
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value SourceScrollBarTest::SourceBarTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillScroll", "SourceBarTest");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceBarTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listNode = CreateChildSource(nodeAPI);

    nodeAPI->addChild(rootColumn, listNode);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveBar);

    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, rootColumn) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceBarTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value SourceScrollBarTest::SourceBarFlingTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillScroll", "SourceBarFlingTest");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceBarFlingTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listNode = CreateChildSource(nodeAPI);

    nodeAPI->addChild(rootColumn, listNode);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveBarFling);

    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, rootColumn) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceBarFlingTest",
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
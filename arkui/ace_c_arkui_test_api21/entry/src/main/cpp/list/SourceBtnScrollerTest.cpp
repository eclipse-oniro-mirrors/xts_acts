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
#include "SourceBtnScrollerTest.h"
#define LIST_ON_WILL_SCROLL_EVENT_ID 6203
#define PARAM_0_POINT_2 0.2

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildSource(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = {200};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = SIZE_150;
    nodeAPI->setAttribute(list, NODE_WIDTH, &item);
    value[0].f32 = SIZE_200;
    nodeAPI->setAttribute(list, NODE_HEIGHT, &item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "list_source_scroller";
    nodeAPI->setAttribute(list, NODE_ID, &id_item);

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
        auto textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
        value[0].f32 = PARAM_1;
        nodeAPI->setAttribute(textNode, NODE_WIDTH_PERCENT, &item);
        value[0].f32 = PARAM_0_POINT_2;
        nodeAPI->setAttribute(textNode, NODE_HEIGHT_PERCENT, &item);

        std::string str = "N_" + std::to_string(i);
        ArkUI_AttributeItem content = {.string = str.c_str()};
        nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        ArkUI_NumberValue textAlign_value[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_CENTER}};
        ArkUI_AttributeItem textAlign_item = {textAlign_value, sizeof(textAlign_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &textAlign_item);

        nodeAPI->addChild(listItem, textNode);
        nodeAPI->addChild(list, listItem);
    }

    return list;
}

static void OnEventReceiveScroller(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SourceScrollerTest", "OnEventReceiveScroller");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceScrollerTest", "SCROLLER: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CLICK_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "ON_CLICK_EVENT_ID");
        ArkUI_NumberValue page_value[] = {{.i32 = PARAM_0}, {.i32 = PARAM_0}};
        ArkUI_AttributeItem page_item = {page_value, sizeof(page_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getNextSibling(nodeHandler), NODE_SCROLL_PAGE, &page_item);
    }

    if (eventId == LIST_ON_WILL_SCROLL_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "Source");
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        float offsetValue = result->data[PARAM_0].f32;
        int32_t stateValue = result->data[PARAM_1].i32;
        int32_t sourceValue = result->data[PARAM_2].i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLLER", "offset0: %{public}f", offsetValue);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLLER", "state1: %{public}i", stateValue);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SCROLLER", "source2: %{public}i", sourceValue);

        if (sourceValue == ARKUI_SCROLL_SOURCE_SCROLLER) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Source", "ARKUI_SCROLL_SOURCE_SCROLLER");
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void OnEventReceiveAnimation(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SourceScrollerTest", "OnEventReceiveAnimation");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceScrollerTest", "ANIMATION: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CLICK_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "ON_CLICK_EVENT_ID");
        ArkUI_NumberValue page_value[] = {{.i32 = PARAM_0}, {.i32 = PARAM_1}};
        ArkUI_AttributeItem page_item = {page_value, sizeof(page_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeAPI->getNextSibling(nodeHandler), NODE_SCROLL_PAGE, &page_item);
    }

    if (eventId == LIST_ON_WILL_SCROLL_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onWillScroll", "Source");
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        float offsetValue = result->data[PARAM_0].f32;
        int32_t stateValue = result->data[PARAM_1].i32;
        int32_t sourceValue = result->data[PARAM_2].i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ANIMATION", "offset0: %{public}f", offsetValue);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ANIMATION", "state1: %{public}i", stateValue);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ANIMATION", "source2: %{public}i", sourceValue);

        if (sourceValue == ARKUI_SCROLL_SOURCE_ANIMATION) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Source", "ARKUI_SCROLL_SOURCE_ANIMATION");
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value SourceBtnScrollerTest::SourceScrollerTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillScroll", "SourceScrollerTest");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceScrollerTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listNode = CreateChildSource(nodeAPI);
    
    auto btn1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "scroller_btn_1";
    nodeAPI->setAttribute(btn1, NODE_ID, &id_item);
    ArkUI_NumberValue value[] = {100};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = SIZE_50;
    nodeAPI->setAttribute(btn1, NODE_WIDTH, &item);
    nodeAPI->setAttribute(btn1, NODE_HEIGHT, &item);
    nodeAPI->registerNodeEvent(btn1, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->addChild(rootColumn, btn1);
    nodeAPI->addChild(rootColumn, listNode);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveScroller);

    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, rootColumn) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceScrollerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value SourceBtnScrollerTest::SourceAnimationTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onWillScroll", "SourceAnimationTest");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceAnimationTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto rootColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listNode = CreateChildSource(nodeAPI);
    
    auto btn2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "scroller_btn_2";
    nodeAPI->setAttribute(btn2, NODE_ID, &id_item);
    ArkUI_NumberValue value[] = {100};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = SIZE_50;
    nodeAPI->setAttribute(btn2, NODE_WIDTH, &item);
    nodeAPI->setAttribute(btn2, NODE_HEIGHT, &item);
    nodeAPI->registerNodeEvent(btn2, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->addChild(rootColumn, btn2);
    nodeAPI->addChild(rootColumn, listNode);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveAnimation);

    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, rootColumn) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SourceAnimationTest",
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
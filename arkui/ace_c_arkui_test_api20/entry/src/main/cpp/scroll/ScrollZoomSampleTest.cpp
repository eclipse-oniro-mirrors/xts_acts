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
#include <arkui/native_interface.h>
#include "arkui/native_node.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "ScrollZoomSampleTest.h"
#define ON_SCROLLSTART_ZOOM_EVENT_ID 6101
#define ON_SCROLLSTOP_ZOOM_EVENT_ID 6102
#define ON_SCROLL_DID_ZOOM_EVENT_ID 6103

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateScrollZoomHandle(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue size_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem size_item = {size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &size_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &size_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "scrollable_zoom";
    nodeAPI->setAttribute(scroll, NODE_ID, &id_item);
    
    ArkUI_NumberValue dir_value[] = {{ .i32 = ARKUI_SCROLL_DIRECTION_FREE }};
    ArkUI_AttributeItem dir_item = { dir_value, sizeof(dir_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &dir_item);
    
    ArkUI_NumberValue max_size_value[] = {{.f32 = PARAM_3}};
    ArkUI_AttributeItem max_size_item = { max_size_value, sizeof(max_size_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MAX_ZOOM_SCALE, &max_size_item);
    ArkUI_NumberValue min_size_value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem min_size_item = { min_size_value, sizeof(min_size_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(scroll, NODE_SCROLL_MIN_ZOOM_SCALE, &min_size_item);
    
    ArkUI_NumberValue scale_value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem scale_item = { scale_value, sizeof(scale_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ZOOM_SCALE, &scale_item);
    int32_t enableZoom = true;
    ArkUI_NumberValue enableZoom_value[] = {{.i32 = enableZoom}};
    ArkUI_AttributeItem enableZoom_item = {enableZoom_value, sizeof(enableZoom_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_BOUNCES_ZOOM, &enableZoom_item);
    
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GRAY}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &background_color_item);
    
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_START, ON_SCROLLSTART_ZOOM_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_ZOOM_STOP, ON_SCROLLSTOP_ZOOM_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(scroll, NODE_SCROLL_EVENT_ON_DID_ZOOM, ON_SCROLL_DID_ZOOM_EVENT_ID, nullptr);
    
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem itemString = {nullptr, 0, "HELLO"};
    nodeAPI -> setAttribute(text, NODE_TEXT_CONTENT, &itemString);
    id_item.string = "text_zoom";
    nodeAPI->setAttribute(text, NODE_ID, &id_item);
    ArkUI_NumberValue text_size_value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem text_size_item = {text_size_value, sizeof(text_size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_WIDTH_PERCENT, &text_size_item);
    nodeAPI->setAttribute(text, NODE_HEIGHT_PERCENT, &text_size_item);
    
    ArkUI_NumberValue font_value[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem font_item = {font_value, sizeof(font_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &font_item);
    
    ArkUI_NumberValue font_color_value[] = {{.u32 = COLOR_PINK}};
    ArkUI_AttributeItem font_color_item = {font_color_value, sizeof(font_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_COLOR, &font_color_item);
    
    nodeAPI->addChild(column, scroll);
    nodeAPI->addChild(scroll, text);

    return column;
}

napi_value ScrollZoomSampleTest::ScrollZoomStartTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "setScrollZoom", "CreateScrollZoomHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateScrollZoomHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = CreateScrollZoomHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        if (eventId == ON_SCROLLSTART_ZOOM_EVENT_ID) {
            ArkUI_NumberValue background_color_value1[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item1 = {background_color_value1,
                sizeof(background_color_value1) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item1);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollZoomSampleTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ScrollZoomSampleTest::ScrollZoomDidTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "setScrollZoom", "CreateScrollZoomHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateScrollZoomHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = CreateScrollZoomHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

        if (eventId == ON_SCROLL_DID_ZOOM_EVENT_ID) {
            ArkUI_NumberValue background_color_value2[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item2 = {background_color_value2,
                sizeof(background_color_value2) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item2);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollZoomSampleTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ScrollZoomSampleTest::ScrollZoomStopTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "setScrollZoom", "CreateScrollZoomHandle");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateScrollZoomHandle", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = CreateScrollZoomHandle(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
  
        if (eventId == ON_SCROLLSTOP_ZOOM_EVENT_ID) {
            ArkUI_NumberValue background_color_value3[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item3 = {background_color_value3,
                sizeof(background_color_value3) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item3);
        }
    });
    std::string id(xComponentID);
    auto nativeXComponent = PluginManager::GetInstance()->GetNativeXComponent(id);
    if (OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, testNode) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollZoomSampleTest",
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
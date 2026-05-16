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

#include "slider_onchange_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NodeComponentEvent *componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);

    if (eventId == ON_CHANGE_EVENT_ID &&
        strcmp(nodeAPI->getAttribute(nodeHandler, NODE_ID)->string, "OnChangeSlider") == 0) {
        ArkUI_NumberValue trackColorValue[] = {{.u32 = 0xFFFF0000}};
        ArkUI_AttributeItem trackColorItem = {trackColorValue, sizeof(trackColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_SLIDER_TRACK_COLOR, &trackColorItem);
    }

    if (eventId == ON_CHANGE_EVENT_ID && componentEvent->data[PARAM_0].f32 == SIZE_50 &&
        componentEvent->data[PARAM_1].f32 == PARAM_0 &&
        strcmp(nodeAPI->getAttribute(nodeHandler, NODE_ID)->string, "OnChangeSliderValue") == 0) {
        ArkUI_NumberValue trackColorValueSecond[] = {{.u32 = 0xFF00FF00}};
        ArkUI_AttributeItem trackColorItemSecond = {trackColorValueSecond,
                                                    sizeof(trackColorValueSecond) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_SLIDER_TRACK_COLOR, &trackColorItemSecond);
    }
}

napi_value SliderOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    // parent column
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // slider
    auto slider = nodeAPI->createNode(ARKUI_NODE_SLIDER);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "OnChangeSlider";
    nodeAPI->setAttribute(slider, NODE_ID, &idItem);

    auto sliderV = nodeAPI->createNode(ARKUI_NODE_SLIDER);
    ArkUI_AttributeItem idItemV = {};
    idItemV.string = "OnChangeSliderValue";
    nodeAPI->setAttribute(sliderV, NODE_ID, &idItemV);

    nodeAPI->addChild(column, slider);
    nodeAPI->addChild(column, sliderV);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(slider, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(slider, NODE_SLIDER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    nodeAPI->registerNodeEvent(sliderV, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(sliderV, NODE_SLIDER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderOnChangeTest",
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
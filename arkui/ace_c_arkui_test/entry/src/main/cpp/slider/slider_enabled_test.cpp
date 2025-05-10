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

#include "slider_enabled_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_SLIDER);

    ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
    ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);

    // set background color
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    // set width
    ArkUI_NumberValue width_value[] = {{.f32 = SLIDER_WIDTH_200}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    // set height
    ArkUI_NumberValue height_value[] = {{.f32 = SLIDER_HEIGHT_30}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SliderEnabledTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderEnabledTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    uint32_t color = COLOR_PURPLE;
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    switch (eventId) {
        case ON_CLICK_EVENT_ID:
            color = COLOR_GREEN;
            break;
        case ON_FOCUS_EVENT_ID:
            color = COLOR_BLUE;
            break;
        case ON_BLUR_EVENT_ID:
            color = COLOR_YELLOW;
            break;
        default:
            break;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

napi_value SliderEnabledTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderEnabledTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderEnabledTest", "GetContext env or info is null");
        return nullptr;
    }

    // parent column
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // set height
    ArkUI_NumberValue col_height_value[] = {{.f32 = COLUMN_HEIGHT_150}};
    ArkUI_AttributeItem col_height_item = {col_height_value, sizeof(col_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &col_height_item);

    // set width
    ArkUI_NumberValue col_width_value[] = {{.f32 = COLUMN_WIDTH_150}};
    ArkUI_AttributeItem col_width_item = {col_width_value, sizeof(col_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_WIDTH, &col_width_item);

    // set alignment
    ArkUI_NumberValue justify_content_value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND}};
    ArkUI_AttributeItem justify_content_item = {justify_content_value,
                                                sizeof(justify_content_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &justify_content_item);

    // first slider
    auto slider = createChildNode(nodeAPI, PARAM_1);

    // second slider
    auto sliderDisabled = createChildNode(nodeAPI, PARAM_0);

    // third slider
    auto sliderAbnormal = createChildNode(nodeAPI, PARAM_NEGATIVE_1);

    // set slider ID
    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnClickEnabledSlider";
    nodeAPI->setAttribute(slider, NODE_ID, &id_item);
    ArkUI_AttributeItem id_second_item = {};
    id_second_item.string = "OnClickDisabledSlider";
    nodeAPI->setAttribute(sliderDisabled, NODE_ID, &id_second_item);
    ArkUI_AttributeItem id_third_item = {};
    id_third_item.string = "OnClickAbnormalSlider";
    nodeAPI->setAttribute(sliderAbnormal, NODE_ID, &id_third_item);

    nodeAPI->addChild(column, slider);
    nodeAPI->addChild(column, sliderDisabled);
    nodeAPI->addChild(column, sliderAbnormal);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderEnabledTest",
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
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
#include "textpicker_onchange_test.h"
#include <arkui/native_type.h>
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto textPicker = nodeAPI->createNode(ARKUI_NODE_TEXT_PICKER);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_150}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem heightItem = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue borderWidthValue[] = {{.f32 = PARAM_2}};
    ArkUI_AttributeItem borderWidthValueItem = {borderWidthValue, sizeof(borderWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker, NODE_BORDER_WIDTH, &borderWidthValueItem);

    ArkUI_NumberValue marginValue[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem marginItem = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textPicker, NODE_MARGIN, &marginItem);

    ArkUI_NumberValue rangeValue[] = {{.i32 = ARKUI_TEXTPICKER_RANGETYPE_SINGLE}};
    ArkUI_AttributeItem rangeItem = {rangeValue, sizeof(rangeValue) / sizeof(ArkUI_NumberValue)};
    rangeItem.string = "apple;orange;peach";
    nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_RANGE, &rangeItem);

    nodeAPI->registerNodeEvent(textPicker, NODE_TEXT_PICKER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    return textPicker;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerOnClickTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextPickerOnClickTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextPickerOnClickTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CHANGE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        bool checkResult = false;
        checkResult = (result->data[PARAM_0].i32 != PARAM_1);
        if (checkResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}
napi_value TextPickerOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextPickerOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    // 创建nodeAPI
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textPicker = createChildNode(nodeAPI);

    nodeAPI->addChild(column, textPicker);

    ArkUI_AttributeItem idItem = {};
    idItem.string = "textPickerOnChangeTest";
    nodeAPI->setAttribute(textPicker, NODE_ID, &idItem);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 所有组件挂在到XComponent
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextPickerOnChangeTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
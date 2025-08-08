/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "textinput_inputfilter_test.h"

#include "../manager/plugin_manager.h"
#include "common/common.h"
#define INPUT_FILTER_1 "[a-z]"

namespace ArkUICapiTest {

static auto CreateSubTextInputNode(ArkUI_NativeNodeAPI_1* nodeAPI, const char* str)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    // set width
    ArkUI_NumberValue width_value[] = { { .f32 = SIZE_350 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    // set height
    ArkUI_NumberValue height_value[] = { { .f32 = SIZE_200 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = SIZE_5 } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue value[] = { { .f32 = SIZE_30 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_FONT_SIZE, &value_item);

    // set  str
    ArkUI_AttributeItem textinputItem = {};
    textinputItem.string = str;
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_INPUT_INPUT_FILTER, &textinputItem);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_INPUT_ON_INPUT_FILTER_ERROR, ON_CHANGE_EVENT_ID, nullptr);

    return nodeHandle;
}
static void EventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputInputFilterTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputInputFilterTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputInputFilterTest", "OnEventReceive eventId: %{public}d",
        eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CHANGE_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);

        return;
    }
}
napi_value TextInputInputFilterTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputInputFilterTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputInputFilterTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    const char* srcLocal1 = INPUT_FILTER_1;
    auto textInput = CreateSubTextInputNode(nodeAPI, srcLocal1);
    ArkUI_AttributeItem item = {};
    item.string = "1234abc";
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &item);
    item.string = "textInputIntentFilter";
    nodeAPI->setAttribute(textInput, NODE_ID, &item);
    nodeAPI->addChild(column, textInput);
    nodeAPI->registerNodeEventReceiver(&EventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputInputFilterTest",
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
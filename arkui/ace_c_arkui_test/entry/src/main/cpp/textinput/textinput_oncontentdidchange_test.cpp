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

#include "textinput_oncontentdidchange_test.h"

#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

static ArkUI_NodeHandle textInput = nullptr;
#define ON_CLICK_EVENT_ID 1011
#define ON_CLICK_EVENT_ID_2 1012
#define FONT_SIZE 30
float g_textInputFontSize = 0;
std::vector<int32_t> TextInputOnContentDidChangeTest::contentDidValue = {};
static napi_value SetArrayNapiDataWithContentDid(const std::vector<int32_t>& data, napi_env env)
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
static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}
static auto CreateButton(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto nodeHandler = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue width_value[] = { { .f32 = 300 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandler, NODE_WIDTH, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = 50 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandler, NODE_HEIGHT, &height_item);

    return nodeHandler;
}
static auto CreateChildNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    float width = 200;
    float height = 200;
    textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue widthValue[] = { { .f32 = width } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue heightValue[] = { { .f32 = height } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_HEIGHT, &heightItem);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "Textinput";
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &content_item);
    ArkUI_NumberValue style_value[] = { { .i32 = ARKUI_TEXTINPUT_STYLE_INLINE } };
    ArkUI_AttributeItem type_item = { style_value, sizeof(style_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_STYLE, &type_item);
    return textInput;
}
static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest", "OnEventReceive ");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest",
        "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    switch (eventId) {
        case ON_CONTENT_DID_CHANGE_ID: {
            ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
            if (result == nullptr) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest",
                    "Failed to get caret offset attribute");
                return;
            }
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest",
                "ON_CONTENT_DID_CHANGE_ID fontWidth : %{public}f fontHeight : %{public}f", result->data[PARAM_0].f32,
                result->data[PARAM_1].f32);
            PushBackIntToData(TextInputOnContentDidChangeTest::contentDidValue, result->data[PARAM_0].f32);
            PushBackIntToData(TextInputOnContentDidChangeTest::contentDidValue, result->data[PARAM_1].f32);
            if (g_textInputFontSize == FONT_SIZE) {
                ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
                ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(textInput, NODE_BACKGROUND_COLOR, &color_item);
            }
            return;
        }
        case ON_CLICK_EVENT_ID: {
            ArkUI_NumberValue value[] = { { .f32 = FONT_SIZE } };
            ArkUI_AttributeItem valueItem = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
            g_textInputFontSize = nodeAPI->getAttribute(textInput, NODE_FONT_SIZE)->value[PARAM_0].f32;
            return;
        }
        default:
            break;
    }
}

napi_value TextInputOnContentDidChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto input = CreateChildNode(nodeAPI);
    textInput = input;
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateButton(nodeAPI);
    ArkUI_NumberValue setCaretPosition_value[] = { { .i32 = 9 } };
    ArkUI_AttributeItem setCaretPosition_item = { setCaretPosition_value,
        sizeof(setCaretPosition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CARET_OFFSET, &setCaretPosition_item);
    ArkUI_AttributeItem id_item1 = {};
    id_item1.string = "TextInputOnContentSizeChangeTest_buttonId1";
    nodeAPI->setAttribute(button, NODE_ID, &id_item1);
    id_item1.string = "OnContentDidChangeTestTextInput";
    nodeAPI->setAttribute(textInput, NODE_ID, &id_item1);
    ArkUI_NumberValue value[] = { { .f32 = 10 } };
    ArkUI_AttributeItem valueItem = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_SIZE, &valueItem);
    ArkUI_AttributeItem button_item1 = {};
    button_item1.string = "改变字体大小";
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &button_item1);
    nodeAPI->addChild(column, textInput);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEvent(textInput, NODE_TEXT_INPUT_ON_CONTENT_SIZE_CHANGE, ON_CONTENT_DID_CHANGE_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        return nullptr;
    }
    return exports;
}
napi_value TextInputOnContentDidChangeTest::GetTextInputContentDidData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnContentDidChangeTest", "GetTextInputContentDidData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithContentDid(TextInputOnContentDidChangeTest::contentDidValue, env));
    TextInputOnContentDidChangeTest::contentDidValue.clear();
    return result;
}
} // namespace ArkUICapiTest
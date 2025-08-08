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

#include "textarea_ontextselectionchange_test.h"

#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

#define TEXT_AREA_ON_TEXT_SELECTION_CHANGE_TEST_STRING "textarea"
#define ON_CLICK_EVENT_ID 5022
#define START 0
#define END 4
static ArkUI_NodeHandle textArea = nullptr;
std::vector<int32_t> TextAreaOnTextSelectionChangeTest::SelectionVector = {};

static napi_value SetArrayNapiDataWithTextInput(const std::vector<int32_t>& data, napi_env env)
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
ArkUI_NodeHandle TextAreaOnTextSelectionChangeTest::CreateSubTextAreaNode(ArkUI_NativeNodeAPI_1* nodeApi)
{
    float width = 200;
    float height = 200;
    auto textArea = nodeApi->createNode(ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue widthValue[] = { { .f32 = width } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeApi->setAttribute(textArea, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = { { .f32 = height } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeApi->setAttribute(textArea, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue color_value[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
    nodeApi->setAttribute(textArea, NODE_BACKGROUND_COLOR, &color_item);

    ArkUI_NumberValue showKey_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem showKey_item = { showKey_value, sizeof(showKey_value) / sizeof(ArkUI_NumberValue) };
    nodeApi->setAttribute(textArea, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS, &showKey_item);

    ArkUI_AttributeItem content_item = {};
    content_item.string = "TextArea";
    nodeApi->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &content_item);

    return textArea;
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
static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest", "OnEventReceive");
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    switch (eventId) {
        case ON_TEXT_AREA_SELECTION_CHANGE_ID: {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
                "OnEventReceive ON_TEXT_AREA_SELECTION_CHANGE_ID");
            auto ret = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_TEXT_SELECTION);
            if (ret == nullptr) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
                    "Failed to get caret offset attribute");
                return;
            }
            ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
                "ON_TEXT_AREA_SELECTION_CHANGE_ID start : %{public}d,end : %{public}d", result->data[PARAM_0].i32,
                result->data[PARAM_1].i32);
            PushBackIntToData(TextAreaOnTextSelectionChangeTest::SelectionVector, result->data[PARAM_0].i32);
            PushBackIntToData(TextAreaOnTextSelectionChangeTest::SelectionVector, result->data[PARAM_1].i32);
            if ((ret->value[0].i32 == START) && (ret->value[1].i32 == END)) {
                OH_LOG_Print(
                    LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest", "OnEventReceive");
                if (ret->value[1].i32 > 0) {
                    ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
                    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
                    nodeAPI->setAttribute(textArea, NODE_BACKGROUND_COLOR, &color_item);
                }
            }
            return;
        }
        case ON_CLICK_EVENT_ID: {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
                "OnEventReceive ON_CLICK_EVENT_ID");
            ArkUI_NumberValue setTextSelection_value1[] = { { .i32 = 0 }, { .i32 = 4 } };
            ArkUI_AttributeItem setTextSelection_item1 = { setTextSelection_value1,
                sizeof(setTextSelection_value1) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT_SELECTION, &setTextSelection_item1);
            return;
        }
        default:
            break;
    }
}

napi_value TextAreaOnTextSelectionChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto Area = CreateSubTextAreaNode(nodeAPI);
    textArea = Area;

    auto button = CreateButton(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnTextSelectionChangeTestTextArea";
    nodeAPI->setAttribute(textArea, NODE_ID, &id_item);
    id_item.string = "OnButtonClick";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    ArkUI_AttributeItem text_item = {};
    text_item.string = TEXT_AREA_ON_TEXT_SELECTION_CHANGE_TEST_STRING;
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &text_item);

    ArkUI_AttributeItem button_item1 = {};
    button_item1.string = "选中0-4";
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &button_item1);

    nodeAPI->addChild(column, textArea);
    nodeAPI->addChild(column, button);

    nodeAPI->registerNodeEvent(
        textArea, NODE_TEXT_AREA_ON_TEXT_SELECTION_CHANGE, ON_TEXT_AREA_SELECTION_CHANGE_ID, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value TextAreaOnTextSelectionChangeTest::GetTextAreaData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnTextSelectionChangeTest", "GetTextInputData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithTextInput(TextAreaOnTextSelectionChangeTest::SelectionVector, env));

    TextAreaOnTextSelectionChangeTest::SelectionVector.clear();
    return result;
}
} // namespace ArkUICapiTest
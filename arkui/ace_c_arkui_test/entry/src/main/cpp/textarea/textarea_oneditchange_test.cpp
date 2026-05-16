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

#include "textarea_oneditchange_test.h"

#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

#define TEXT_AREA_ON_EDIT_CHANGE_TEST_STRING "textareaoneditchange"
static ArkUI_NodeHandle textArea = nullptr;
std::vector<int32_t> TextAreaOnEditChangeTest::editChangeValue = {};
static napi_value SetArrayNapiDataWithEditChange(const std::vector<int32_t>& data, napi_env env)
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
static auto createChildNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue width_value[] = { { .f32 = SIZE_100 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textArea, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(textArea, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = DEFAULT_MARGIN } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textArea, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_RED } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(textArea, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(textArea, NODE_TEXT_AREA_ON_EDIT_CHANGE, ON_TEXT_AREA_EDIT_CHANGE_ID, nullptr);

    return textArea;
}

static auto createRowNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_ROW);

    ArkUI_NumberValue size_value[] = { { .f32 = SIZE_400 }, { .f32 = SIZE_400 } };
    ArkUI_AttributeItem size_item = { size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_SIZE, &size_item);

    ArkUI_NumberValue align_value[] = { { .i32 = ARKUI_VERTICAL_ALIGNMENT_TOP } };
    ArkUI_AttributeItem align_item = { align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_ROW_ALIGN_ITEMS, &align_item);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest", "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (eventId == ON_TEXT_AREA_EDIT_CHANGE_ID) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest",
            "ON_TEXT_AREA_EDIT_CHANGE_ID edit : %{public}d", result->data[PARAM_0].i32);
        PushBackIntToData(TextAreaOnEditChangeTest::editChangeValue, result->data[PARAM_0].i32);
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(textArea, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value TextAreaOnEditChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto row = createRowNode(nodeAPI);
    createChildNode(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnEditChangeTestTextArea";
    nodeAPI->setAttribute(textArea, NODE_ID, &id_item);

    ArkUI_AttributeItem text_item = {};
    text_item.string = TEXT_AREA_ON_EDIT_CHANGE_TEST_STRING;
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &text_item);

    nodeAPI->addChild(row, textArea);
    nodeAPI->registerNodeEvent(textArea, NODE_TEXT_AREA_ON_CONTENT_SIZE_CHANGE, ON_TEXT_AREA_EDIT_CHANGE_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaOnEditChangeTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value TextAreaOnEditChangeTest::GetTextAreaEditChangeData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnEditChangeTest", "GetTextInputEditChangeData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithEditChange(TextAreaOnEditChangeTest::editChangeValue, env));
    TextAreaOnEditChangeTest::editChangeValue.clear();
    return result;
}
} // namespace ArkUICapiTest
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
#include "textarea_selectionmenuhidden_test.h"

#include "../manager/plugin_manager.h"
#include "common/common.h"

namespace ArkUICapiTest {

static auto CreateTextAreaNode(ArkUI_NativeNodeAPI_1* nodeAPI, int32_t value)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue width_value[] = { { .f32 = 350 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = 100 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    ArkUI_AttributeItem text_item = {};
    text_item.string = "test";
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_AREA_TEXT, &text_item);

    ArkUI_NumberValue keyboard_value[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem keyboard_item = { keyboard_value, sizeof(keyboard_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_AREA_ENABLE_KEYBOARD_ON_FOCUS, &keyboard_item);

    ArkUI_NumberValue keyboard1_value[] = { { .i32 = PARAM_0 } };
    ArkUI_AttributeItem keyboard1_item = { keyboard_value, sizeof(keyboard1_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS, &keyboard1_item);

    ArkUI_NumberValue show_value[] = { { .i32 = value } };
    ArkUI_AttributeItem show_item = { show_value, sizeof(show_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_AREA_SELECTION_MENU_HIDDEN, &show_item);

    ArkUI_NumberValue fontsize[] = { { .f32 = 40 } };
    ArkUI_AttributeItem fontsize_item = { fontsize, sizeof(fontsize) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_FONT_SIZE, &fontsize_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = 10 } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    return nodeHandle;
}
napi_value TextAreaSelectionMenuHiddenTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextAreaSelectionMenuHiddenTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputSelectionMenuHiddenTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto textArea = CreateTextAreaNode(nodeAPI, 0);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "textArea";
    nodeAPI->setAttribute(textArea, NODE_ID, &id_item);

    nodeAPI->addChild(column, textArea);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputSelectionMenuHiddenTest",
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

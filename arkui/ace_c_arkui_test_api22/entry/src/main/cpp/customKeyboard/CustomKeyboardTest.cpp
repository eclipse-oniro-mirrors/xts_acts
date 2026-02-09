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

#include "CustomKeyboardTest.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_dialog.h>
#include <cstdint>
#include <string>
 
namespace ArkUICapiTest {

    napi_value CustomKeyboardTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "CustomKeyboardTest", "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

        auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem textItem = {.string = "TextArea"};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);

        auto textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
        ArkUI_AttributeItem id_textArea = {.string = "TextArea"};
        nodeAPI->setAttribute(textArea, NODE_ID, &id_textArea);
        
        auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem id_button = {.string = "Button"};
        nodeAPI->setAttribute(button, NODE_ID, &id_button);

        auto buttonText = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem id_buttonText = {.string = "ButtonText"};
        nodeAPI->setAttribute(buttonText, NODE_ID, &id_buttonText);
        ArkUI_AttributeItem buttonTextItem = {.string = "get"};
        nodeAPI->setAttribute(buttonText, NODE_TEXT_CONTENT, &buttonTextItem);
        nodeAPI->addChild(button, buttonText);

        ArkUI_NumberValue colorValue[] = {{.u32 = false}};
        ArkUI_AttributeItem customKeyboard = {.value = colorValue, .size = sizeof(colorValue) / sizeof(ArkUI_NumberValue), .object = button};
        auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_CUSTOM_KEYBOARD, &customKeyboard);

        ArkUI_NumberValue focusValue[] = {{.i32 = 1}};
        ArkUI_AttributeItem focusItem = {focusValue, 1};
        nodeAPI->setAttribute(textArea, NODE_DEFAULT_FOCUS, &focusItem);

        nodeAPI->addChild(column, text);
        nodeAPI->addChild(column, textArea);
    
        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column)
        == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomKeyboardTest",
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
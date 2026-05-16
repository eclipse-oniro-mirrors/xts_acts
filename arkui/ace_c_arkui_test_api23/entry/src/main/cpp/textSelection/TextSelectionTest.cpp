/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include "TextSelectionTest.h"

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle selectedText = nullptr;
static ArkUI_NodeHandle textSelection = nullptr;
static int g_optionsIndex = 0;
static int g_changeNumeber = 3;
namespace ArkUICapiTest {

    napi_value TextSelectionTest::textSelectionTest(napi_env env, napi_callback_info info)
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
                         "TextContentAlignTest", "GetContext env or info is null");
            return nullptr;
        }
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        selectedText = nodeAPI->createNode(ARKUI_NODE_TEXT);
        textSelection = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem textSelectionIdItem = {.string = "textSelection"};

        auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem textIdItem = {.string = "selectedText"};
        std::string contentStr = "The text component is setTextSelection";
        ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
        ArkUI_NumberValue copyOptionsIndex = {.i32 = ARKUI_COPY_OPTIONS_IN_APP};
        ArkUI_AttributeItem copyOptionsItem = {&copyOptionsIndex, 1};
        ArkUI_AttributeItem buttonIdItem = {.string = "Button"};

        nodeAPI->setAttribute(textSelection, NODE_ID, &textSelectionIdItem);
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonIdItem);
        nodeAPI->setAttribute(button, NODE_ID, &buttonIdItem);
        nodeAPI->setAttribute(selectedText, NODE_ID, &textIdItem);
        nodeAPI->setAttribute(selectedText, NODE_TEXT_CONTENT, &contentItem);
        nodeAPI->setAttribute(selectedText, NODE_TEXT_COPY_OPTION, &copyOptionsItem);
        nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 0, nullptr);

        nodeAPI->addChild(column, selectedText);
        nodeAPI->addChild(column, textSelection);
        nodeAPI->addChild(column, button);
        nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
                ArkUI_MenuPolicy OptionsArray[] = {ARKUI_MENU_POLICY_HIDE, ARKUI_MENU_POLICY_DEFAULT,
                                                   ARKUI_MENU_POLICY_SHOW};
                ArkUI_SelectionOptions *options = OH_ArkUI_SelectionOptions_Create();
                OH_ArkUI_SelectionOptions_SetMenuPolicy(options, OptionsArray[g_optionsIndex]);
                ArkUI_NumberValue value[] = {{.i32 = 1}, {.i32 = 6}};
                ArkUI_NumberValue *setTextSelectionArray = value;
                ArkUI_AttributeItem selectionItem = {.value = setTextSelectionArray, .size = 2, .object = options};
                nodeAPI->setAttribute(selectedText, NODE_TEXT_TEXT_SELECTION, &selectionItem);
                auto menuPolicy = OH_ArkUI_SelectionOptions_GetMenuPolicy(options);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestSelection", "MenuPolicy为 %{public}d", menuPolicy);
                auto aaa = nodeAPI->getAttribute(selectedText, NODE_TEXT_TEXT_SELECTION);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestSelection", "getAttribute1 %{public}d",
                             aaa->value[0].i32);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestSelection", "getAttribute2 %{public}d",
                             aaa->value[1].i32);
                std::string str = "menuPolicy" + std::to_string(menuPolicy) + "select" +
                                  std::to_string(aaa->value[0].i32) + " " + std::to_string(aaa->value[1].i32);
                ArkUI_AttributeItem strItem = {.string = str.c_str()};

                nodeAPI->setAttribute(textSelection, NODE_TEXT_CONTENT, &strItem);
                g_optionsIndex++;
                if (g_optionsIndex == g_changeNumeber) {
                    g_optionsIndex = 0;
                }
                OH_ArkUI_SelectionOptions_Dispose(options);
            });
        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                     column) == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextContentAlignTest",
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
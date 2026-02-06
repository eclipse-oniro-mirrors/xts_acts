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

#include "UiStatesTest.h"

namespace UiStatesTest {

ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

napi_value TestUIState001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    int globalUserDataTest = 10;
    int32_t globalStates = static_cast <int32_t> (UI_STATE_NORMAL);
    int result = OH_ArkUI_AddSupportedUIStates(text, globalStates, [](int currentStates, void* userData) {
                ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
                if ((currentStates & UI_STATE_NORMAL) == UI_STATE_NORMAL) {
                    ArkUI_AttributeItem logMsg1 = {.string = "UI_STATE_NORMAL"};
                    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &logMsg1);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback NORMAL");
                }
            }, true, static_cast<void*>(&globalUserDataTest));
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TestUIState002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    int globalUserDataTest = 10;
    int32_t globalStates = static_cast <int32_t> (UI_STATE_FOCUSED);
    int result = OH_ArkUI_AddSupportedUIStates(text, globalStates, [](int currentStates, void* userData) {
                ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
                if ((currentStates & UI_STATE_FOCUSED) == UI_STATE_FOCUSED) {
                    ArkUI_AttributeItem logMsg1 = {.string = "UI_STATE_FOCUSED"};
                    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &logMsg1);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback FOCUSED");
                }
            }, true, static_cast<void*>(&globalUserDataTest));
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TestUIState003(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    int globalUserDataTest = 10;
    int32_t globalStates = static_cast <int32_t> (UI_STATE_DISABLED);
    int result = OH_ArkUI_AddSupportedUIStates(button, globalStates, [](int currentStates, void* userData) {
                ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
                if ((currentStates & UI_STATE_DISABLED) == UI_STATE_DISABLED) {
                    ArkUI_AttributeItem logMsg1 = {.string = "UI_STATE_DISABLED"};
                    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &logMsg1);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback DISABLED");
                }
            }, true, static_cast<void*>(&globalUserDataTest));
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TestUIState004(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle checkbox = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);
    int globalUserDataTest = 10;
    int32_t globalStates = static_cast <int32_t> (UI_STATE_SELECTED);
    int result = OH_ArkUI_AddSupportedUIStates(checkbox, globalStates, [](int currentStates, void* userData) {
                ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
                if ((currentStates & UI_STATE_SELECTED) == UI_STATE_SELECTED) {
                    ArkUI_AttributeItem logMsg1 = {.string = "UI_STATE_SELECTED"};
                    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &logMsg1);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback SELECTED");
                }
            }, true, static_cast<void*>(&globalUserDataTest));
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
} // namespace UiStatesTest

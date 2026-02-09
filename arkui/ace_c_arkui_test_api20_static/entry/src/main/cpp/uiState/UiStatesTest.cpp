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
#include "../manager/plugin_manager.h"
#include "ani/ani.h"
#include <arkui/native_node_ani.h>
 
namespace ArkUIAniTest {
    int32_t g_globalStatesToBeSupported = static_cast<int32_t>(UI_STATE_PRESSED);
    int32_t g_globalStatesToBeRemoved = static_cast<int32_t>(UI_STATE_PRESSED);
    ArkUI_NodeHandle text1 = nullptr;
    int g_globalUserDataTest = 10;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
    {
        auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

        ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enable_item = {enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

        ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
        ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
        nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

        ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
        ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

        nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

        return nodeHandle;
    }

    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "UiStatesTest", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "UiStatesTest", "OnEventReceive: event is null");
            return;
        }

        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "UiStatesTest", "OnEventReceive eventId: %{public}d",
                     eventId);

        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        if (eventId == ON_CLICK_EVENT_ID) {
            OH_ArkUI_AddSupportedUIStates(text1, g_globalStatesToBeSupported, [](int currentStates, void* userData) {
                ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
                if ((currentStates & UI_STATE_PRESSED) == UI_STATE_PRESSED) {
                    ArkUI_AttributeItem logMsg1 = {.string = "PRESSEDREMOVE"};
                    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &logMsg1);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback PRESSED");
                }
            }, true, static_cast<void*>(&g_globalUserDataTest));
            OH_ArkUI_RemoveSupportedUIStates(text1, g_globalStatesToBeRemoved);
        }
    }

    void UiStatesTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "UiStatesTest", "CreateNativeNode");

        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
        //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
        ArkUI_NodeContentHandle contentHandle;
        OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto button = createChildNode(nodeAPI, true);

        ArkUI_AttributeItem id_item = {};
        id_item.string = "OnChangeButton";
        nodeAPI->setAttribute(button, NODE_ID, &id_item);
        nodeAPI->addChild(column, button);
        text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem id_item1 = {};
        id_item1.string = "textStates";
        nodeAPI->setAttribute(text1, NODE_ID, &id_item1);
        ArkUI_AttributeItem logMsg = {.string = "uiStatesTest"};
        nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &logMsg);
        OH_ArkUI_AddSupportedUIStates(text1, g_globalStatesToBeSupported, [](int currentStates, void* userData) {
            ArkUI_NodeHandle node = static_cast<ArkUI_NodeHandle>(userData);
            if ((currentStates & UI_STATE_PRESSED) == UI_STATE_PRESSED) {
                ArkUI_AttributeItem logMsg1 = {.string = "PRESSED"};
                nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &logMsg1);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FrameNodeTest", "style callback PRESSED");
            }
        }, true, static_cast<void*>(&g_globalUserDataTest));
        nodeAPI->addChild(column, text1);
        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
        OH_ArkUI_NodeContent_AddNode(contentHandle, column);
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");

        return;
    }
} // namespace ArkUIAniTest
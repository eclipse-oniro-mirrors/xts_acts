/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "keyEvent_GetPressedKeys.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = "KeyEvent"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_KEY_EVENT, 2, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_KEY_PRE_IME, 2, nullptr);

    return button;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventGetPressedKeys", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventGetPressedKeys", "OnEventReceive: event is null");
        return;
    }
    auto get_ArkuI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);

    int32_t count = 1;
    int32_t pressedKeys[1] = {0};
    auto type = OH_ArkUI_UIInputEvent_GetPressedKeys(get_ArkuI_UIInputEvent, pressedKeys, &count);
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "keyEventTest",
                                        "gsong_NODE_ON_KEY_PREIME_modifierKeys pressedKeys=%{public}d", type,pressedKeys[0]);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (type == 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            
    }else{
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventGetPressedKeys",
                     "KeyEventGetPressedKeys result : %{public}d", type);
    }
}

void KeyEventGetPressedKeysTest::KeyEventGetPressedKeysTest_001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI);
    ArkUI_AttributeItem textId = {.string = "KeyEventGetPressedKeys"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);

    nodeAPI->addChild(column, button);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICapiTest
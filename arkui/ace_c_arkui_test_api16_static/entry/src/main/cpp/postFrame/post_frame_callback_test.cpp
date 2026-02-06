/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "post_frame_callback_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
int g_myUserData = 0;
ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

static int NUMBER_3 = 3;
static int NUMBER_4 = 4;
static int NUMBER_5 = 5;
static int NUMBER_40 = 40;
static int NUMBER_41 = 41;
static int NUMBER_42 = 42;


namespace ArkUIAniTest {

void PostFrameCallbackTest::CallBack(uint64_t nanoTimestamp, uint32_t frameCount, void* userData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AddCAPIFrameCallback",
        "OH_ArkUI_PostFrameCallback nanoTimestamp = %{public}lu , frameCount = %{public}d", nanoTimestamp, frameCount);
    if (userData) {
            int* myData = (int*)userData;
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AddCAPIFrameCallback",
                "OH_ArkUI_PostFrameCallback myData = %{public}d ", *myData);
    }
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto startDrag = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue startDragWidthValue[] = {230};
    ArkUI_AttributeItem startDragWidthItem = {startDragWidthValue, 1};
    ArkUI_NumberValue startDragHeightValue[] = {700};
    ArkUI_AttributeItem startDragHeightItem = {startDragHeightValue, 1};
    nodeAPI->setAttribute(startDrag, NODE_WIDTH, &startDragWidthItem);
    nodeAPI->setAttribute(startDrag, NODE_HEIGHT, &startDragHeightItem);
    nodeAPI->registerNodeEvent(startDrag, NODE_ON_CLICK, 1, nullptr);
    
    auto enableDragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue enableDragAreaHeightValue[] = {180};
    ArkUI_AttributeItem AreaHeightItem = {enableDragAreaHeightValue, 1};
    ArkUI_NumberValue borderValue[] = {1};
    ArkUI_AttributeItem borderItem = {borderValue, 1};
    nodeAPI->setAttribute(enableDragArea, NODE_WIDTH, &startDragWidthItem);
    nodeAPI->setAttribute(enableDragArea, NODE_HEIGHT, &AreaHeightItem);
    nodeAPI->setAttribute(enableDragArea, NODE_BORDER_WIDTH, &borderItem);
    
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item1 = {.string = "正常"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->addChild(startDrag, button1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, NUMBER_3, nullptr);
    ArkUI_AttributeItem textId1 = {.string = "onClick1"};
    nodeAPI->setAttribute(button1, NODE_ID, &textId1);
    
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item2 = {.string = "CallBack为空"};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->addChild(startDrag, button2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, NUMBER_4, nullptr);
    ArkUI_AttributeItem textId2 = {.string = "onClick2"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId2);
    
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item3 = {.string = "uiContext为空"};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    nodeAPI->addChild(startDrag, button3);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK, NUMBER_5, nullptr);
    ArkUI_AttributeItem textId3 = {.string = "onClick3"};
    nodeAPI->setAttribute(button3, NODE_ID, &textId3);
    
    nodeAPI->addChild(startDrag, enableDragArea);
    return startDrag;
}

void PostFrameCallbackTest::testPostFrameCallback001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    static ArkUI_NodeHandle startDrag = CreateChildNode(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        auto context = OH_ArkUI_GetContextByNode(startDrag);
        if (targetId == NUMBER_3) {
            g_myUserData = NUMBER_40;
            auto a = OH_ArkUI_PostFrameCallback(context, &g_myUserData, PostFrameCallbackTest::CallBack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PostFrameCallback code = %{public}d", a);
            if (a == ARKUI_ERROR_CODE_NO_ERROR) {
                nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        if (targetId == NUMBER_4) {
            g_myUserData = NUMBER_41;
            auto b = OH_ArkUI_PostFrameCallback(context, &g_myUserData, nullptr);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PostFrameCallback code = %{public}d", b);
            if (b == ARKUI_ERROR_CODE_CALLBACK_INVALID) {
                nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        if (targetId == NUMBER_5) {
            g_myUserData = NUMBER_42;
            auto c = OH_ArkUI_PostFrameCallback(nullptr, &g_myUserData, PostFrameCallbackTest::CallBack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "PostFrameCallback code = %{public}d", c);
            if (c == ARKUI_ERROR_CODE_UI_CONTEXT_INVALID) {
                nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, startDrag);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest
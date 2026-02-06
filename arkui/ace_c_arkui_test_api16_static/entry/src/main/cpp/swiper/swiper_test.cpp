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
#include "swiper_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static ArkUI_NativeNodeAPI_1 *nodeAPI;
static ArkUI_NodeHandle swiper;

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    swiper = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    const int size = 14;
    const char* arr[size] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"};
    
    for (int j = 0; j < size; j++) {
        ArkUI_NodeHandle textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content = { .string = arr[j] };
        nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        
        ArkUI_NumberValue value[] = {0};
        ArkUI_AttributeItem item = {value, 1};
        value[0].f32 = 400; // 400: width of textNode
        nodeAPI->setAttribute(textNode, NODE_WIDTH, &item);
        value[0].f32 = 160; // 160: height of textNode
        nodeAPI->setAttribute(textNode, NODE_HEIGHT, &item);
        value[0].u32 = COLOR_BLUE;
        nodeAPI->setAttribute(textNode, NODE_BACKGROUND_COLOR, &item);
        value[0].i32 = 0;
        nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &item);
        value[0].f32 = 30; // 30: fontSize
        nodeAPI->setAttribute(textNode, NODE_FONT_SIZE, &item);
        
        ArkUI_AttributeItem textId = {.string = "SwiperAutoPlayText"};
        nodeAPI->setAttribute(textNode, NODE_ID, &textId);
        nodeAPI->addChild(swiper, textNode);
    }
    ArkUI_NumberValue value[2];
    ArkUI_AttributeItem item = {.value=value, .size=2};
    value[0].i32 = 1;
    value[1].i32 = 1;
    nodeAPI->setAttribute(swiper, NODE_SWIPER_AUTO_PLAY, &item);
    
    ArkUI_NumberValue value2[1];
    ArkUI_AttributeItem item2 = {.value=value, .size=1};
    value[0].f32 = 1000; // 1000: autoplay intervals
    nodeAPI->setAttribute(swiper, NODE_SWIPER_INTERVAL, &item2);
    
    ArkUI_AttributeItem textId = {.string = "SwiperAutoPlay"};
    nodeAPI->setAttribute(swiper, NODE_ID, &textId);
    
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item1 = {.string = "Reset AutoPlay"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->addChild(stack, button1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, 0, nullptr);
    ArkUI_AttributeItem textId1 = {.string = "onClick1"};
    nodeAPI->setAttribute(button1, NODE_ID, &textId1);
    
    nodeAPI->addChild(stack, swiper);
    return stack;
}

void SwiperTest::swiperAutoPlayTest(ani_env* env, ani_object info, ani_object NodeContent)
{
OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto testNode = CreateChildNode(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        if (targetId == 0) {
            nodeAPI->resetAttribute(swiper, NODE_SWIPER_AUTO_PLAY);
        }
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, testNode);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest
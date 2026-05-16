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

#include <string>
#include "../component/swiper_component.h"
#include "../component/text_component.h"
#include "../manager/plugin_manager.h"
#include "swiper_common.h"
#include "swiper_onselect_test.h"
 #include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
 
static std::shared_ptr<TextComponent> CreateTextNode(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    return text;
}
 
static std::shared_ptr<SwiperComponent> CreateSwiperNode(const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFF);
    const double half = 0.5;
    swiper->SetPercentWidth(half);
    swiper->SetPercentHeight(half);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(true);
    swiper->SetId(id);
    auto text = CreateTextNode(0xFFAFEEEE);
    auto text_second = CreateTextNode(0xFF00FF00);
    swiper->AddChild(text);
    swiper->AddChild(text_second);
    text->SetId("OnSelectTest");
    return swiper;
}
 
void SwiperOnSelectTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto swiper = CreateSwiperNode("OnSelectTestSwiper");
    auto text = std::make_shared<TextComponent>();
    swiper->RegisterOnSelect([swiper, text](ArkUI_NodeEvent* event) {
        ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        std::string str = "Page: " + std::to_string(result->data[0].i32);
        text->SetTextContent(str);
        auto node = nodeAPI->getChildAt(nodeHandler, result->data[0].i32);
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_RED } };
        ArkUI_AttributeItem background_color_value_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_value_item);
    });
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, text->GetComponent());
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICApiDemo
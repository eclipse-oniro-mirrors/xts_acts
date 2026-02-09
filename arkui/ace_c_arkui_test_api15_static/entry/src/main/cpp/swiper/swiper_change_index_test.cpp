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

#include "swiper_change_index_test.h"
#include <cstdint>
#include <string>
#include "../manager/plugin_manager.h"
#include "../component/button_component.h"
#include "common/common.h"
#include "swiper_common.h"
#include "../component/swiper_component.h"
#include "../component/text_component.h"
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_BLACK 0xFF000000
#define MAX_PAGE 100
#define MIN_PAGE 0
#define PAGE_NUMBERS 10
#define PARAM_0_POINT_1 0.1
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
namespace ArkUIAniTest {

static std::shared_ptr<SwiperComponent> CreateSwiper(const std::string &id, int32_t index)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(COLOR_WHITE);
    swiper->SetWidth(SIZE_200);
    swiper->SetHeight(SIZE_100);
    swiper->SetMargin(PARAM_20);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(false);
    swiper->SetId(id);
    swiper->RegisterOnChange([swiper, index](ArkUI_NodeEvent *event) { swiper->SetSwiperToIndex(index, true); });
    return swiper;
}

void SwiperChangeIndexTest::SwiperChangeIndex(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto swiper = CreateSwiper("SwiperChangeIndex", PARAM_2);
    swiper->SetId("swiper");
    auto swiper_second = CreateSwiper("SwiperChangeIndexSecond", PARAM_4);
    auto swiper_third = CreateSwiper("SwiperChangeIndexThird", PARAM_NEGATIVE_1);

    for (int i = 0; i < PAGE_NUMBERS; i++) {
        auto text = std::make_shared<TextComponent>();
        text->SetTextContent(std::to_string(i));
        text->SetBackgroundColor((i * COLOR_WHITE / PAGE_NUMBERS) | COLOR_BLACK);
        swiper->AddChild(text);
    }

    for (int i = 0; i < PAGE_NUMBERS; i++) {
        auto text = std::make_shared<TextComponent>();
        text->SetTextContent(std::to_string(i));
        text->SetBackgroundColor((i * COLOR_WHITE / PAGE_NUMBERS) | COLOR_BLACK);
        swiper_second->AddChild(text);
    }
    for (int i = 0; i < PAGE_NUMBERS; i++) {
        auto text = std::make_shared<TextComponent>();
        text->SetTextContent(std::to_string(i));
        text->SetBackgroundColor((i * COLOR_WHITE / PAGE_NUMBERS) | COLOR_BLACK);
        swiper_third->AddChild(text);
    }
    auto button1 = new ButtonComponent();
    auto text1 = new TextComponent();
    button1->SetLable("1");
    button1->SetId("changeIndex_9");
    button1->SetMargin(SIZE_10);
    button1->SetPercentWidth(PARAM_0_POINT_1);
    button1->SetPercentHeight(PARAM_0_POINT_1);
    button1->RegisterOnClick([button1, swiper, text1]() {
        int32_t index = 9;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick enter");
        swiper->SetSwiperIndex(index, 0);
        auto item = swiper->getAttribute(NODE_SWIPER_INDEX);
        text1->SetTextContent(std::to_string(item->value[0].i32));
        text1->SetId("text1");
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick leave");
    });
    
    auto button2 = new ButtonComponent();
    button2->SetLable("2");
    button2->SetId("changeIndex_-1");
    auto text2 = new TextComponent();
    text2->SetId("text2");
    button2->SetMargin(SIZE_10);
    button2->SetPercentWidth(PARAM_0_POINT_1);
    button2->SetPercentHeight(PARAM_0_POINT_1);
    button2->RegisterOnClick([button2, swiper_second, text2]() {
        int32_t index1 = -1;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick enter");
        swiper_second->SetSwiperIndex(index1, 1);
        auto item2 = swiper_second->getAttribute(NODE_SWIPER_INDEX);
        text2->SetTextContent(std::to_string(item2->value[0].i32));
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick leave");
    });

    auto button3 = new ButtonComponent();
    button3->SetLable("3");
    button3->SetId("changeIndex_1000");
    auto text3 = new TextComponent();
    text3->SetId("text3");
    button3->SetMargin(SIZE_10);
    button3->SetPercentWidth(PARAM_0_POINT_1);
    button3->SetPercentHeight(PARAM_0_POINT_1);
    button3->RegisterOnClick([button3, swiper_third, text3]() {
        int32_t index2 = 1000;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick enter");
        swiper_third->SetSwiperIndex(index2, 0);
        auto item3 = swiper_third->getAttribute(NODE_SWIPER_INDEX);
        text3->SetTextContent(std::to_string(item3->value[0].i32));
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest111", "Swiper RegisterOnClick leave");
        if ((index2 > MAX_PAGE) || (index2 < MIN_PAGE)) {
            int32_t index5 = 0;
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "SwiperChangeIndexTest22222", "Swiper RegisterOnClick leave");
            swiper_third->SetSwiperIndex(index5, 0);
            auto item4 = swiper_third->getAttribute(NODE_SWIPER_INDEX);
            text3->SetTextContent(std::to_string(item4->value[0].i32));
        } else {
            text3->SetTextContent(std::to_string(item3->value[0].i32));
        }
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperChangeIndexTest", "Swiper RegisterOnClick leave");
    });

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, button1->GetComponent());
    nodeAPI->addChild(column, button2->GetComponent());
    nodeAPI->addChild(column, button3->GetComponent());
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, swiper_second->GetComponent());
    nodeAPI->addChild(column, swiper_third->GetComponent());
    nodeAPI->addChild(column, text1->GetComponent());
    nodeAPI->addChild(column, text2->GetComponent());
    nodeAPI->addChild(column, text3->GetComponent());

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
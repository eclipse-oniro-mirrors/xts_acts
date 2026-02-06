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

#include "swiper_indicator_test.h"
#include <cstdint>
#include <iostream>
#include <string>
#include "../manager/plugin_manager.h"
#include "../component/button_component.h"
#include "../component/row_component.h"
#include "../component/swiper_component.h"
#include "../component/text_component.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

std::vector<int32_t> ignoreSizePool =  {-1, 0, 1};
std::vector<float> spacePool = {0.0f, 8.0f, -1.0f, 5.0f, 20.0f};
std::vector<bool> maskPool = {false, true};
std::vector<float> bottomPool = {0, 20, -10, 30};

int32_t SwiperIndicatorTest::ignoreSizeIndex_ = 0;
int32_t SwiperIndicatorTest::maskIndex_ = 0;
int32_t SwiperIndicatorTest::spaceIndex_ = 0;
int32_t SwiperIndicatorTest::bottomIndex_ = 0;

//圆点导航点
static void SetBasicIndicator(ArkUI_SwiperIndicator* indicator, bool ignoreSize, float space, float bottom)
{
    if (indicator == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperIndicatorTest", "indicator is null");
        return;
    }
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetMask(indicator, true);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, COLOR_YELLOW);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, COLOR_RED);
    OH_ArkUI_SwiperIndicator_SetSpace(indicator, space);
    OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, ignoreSize);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, bottom);
}

static std::shared_ptr<SwiperComponent> CreateSwiperNode(const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetPercentWidth(PARAM_025);
    swiper->SetPercentHeight(PARAM_01);
    swiper->SetMargin(PARAM_5);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(false);
    swiper->SetId(id);
    std::vector<uint32_t> colors = { 0xFFAFEEEE, 0xFF00FF00, 0xFFFF0000, 0xFF0000FF };
    for (const auto& color : colors) {
        auto text = std::make_shared<TextComponent>();
        text->SetBackgroundColor(color);
        swiper->AddChild(text);
    }
    return swiper;
}

static std::shared_ptr<SwiperComponent> SetupSwiper(const std::string& id,
    ArkUI_SwiperIndicator* indicator, bool ignoreSize, float space, float bottom)
{
    auto swiper = CreateSwiperNode(id);
    SetBasicIndicator(indicator, ignoreSize, space, bottom);
    swiper->SetSwiperIndicator(indicator);
    return swiper;
}

// 数字导航点
static void SetDigitBasicIndicator(ArkUI_SwiperDigitIndicator* indicator, bool ignoreSize, float bottom)
{
    if (indicator == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperDigitIndicatorTest", "indicator is null");
        return;
    }
    OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(indicator, bottom),
    OH_ArkUI_SwiperDigitIndicator_SetFontSize(indicator, PARAM_10);
    OH_ArkUI_SwiperDigitIndicator_SetFontColor(indicator, COLOR_YELLOW);
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor(indicator, COLOR_RED);
    OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom(indicator, ignoreSize);
}

static std::shared_ptr<SwiperComponent> SetupDigitSwiper(const std::string& id,
    ArkUI_SwiperDigitIndicator* indicator, bool ignoreSize, float bottom)
{
    auto swiper = CreateSwiperNode(id);
    SetDigitBasicIndicator(indicator, ignoreSize, bottom);
    swiper->SetSwiperDigitIndicator(indicator);
    return swiper;
}
    
void SwiperIndicatorTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TextPickerEnableHapticFeedbackTest::TextPickerEnableHapticFeedback start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
//    圆点导航点
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    auto swiper = SetupSwiper("SwiperDotIndicator", indicator,  false,  10, 0);

    //数字导航点
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    auto digitSwiper = SetupDigitSwiper("SwiperDigitIndicator", digitIndicator,  false, 0);

    //space
    auto spaceText = std::make_shared<TextComponent>();
    spaceText->SetPercentWidth(PARAM_03);
    spaceText->SetPercentHeight(PARAM_003);
    spaceText->SetTextContent("space:");
    auto spaceButton = std::make_shared<ButtonComponent>();
    uint32_t testIndicatorSpace = 0;
    spaceButton->SetPercentWidth(PARAM_02);
    spaceButton->SetPercentHeight(PARAM_003);
    spaceButton->SetId("Space");
    spaceButton->SetLable("Space");
    spaceButton->RegisterOnClick([swiper, indicator, spaceText, &testIndicatorSpace]() {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wangyu", "click");
         spaceIndex_ = (spaceIndex_ + 1) % spacePool.size();
         auto space = spacePool[spaceIndex_];
         spaceText->SetTextContent("space:" + std::to_string(space));
         OH_ArkUI_SwiperIndicator_SetSpace(indicator, space);
         swiper->SetSwiperIndicator(indicator);
         testIndicatorSpace = OH_ArkUI_SwiperIndicator_GetBottomPosition(indicator);
    });

    //ignoreSize
    auto ignoreSizeText = std::make_shared<TextComponent>();
    ignoreSizeText->SetPercentWidth(PARAM_03);
    ignoreSizeText->SetPercentHeight(PARAM_003);
    ignoreSizeText->SetTextContent("ignore:");
    auto ignoreSizeButton = std::make_shared<ButtonComponent>();
    ignoreSizeButton->SetPercentWidth(PARAM_02);
    ignoreSizeButton->SetPercentHeight(PARAM_003);
    ignoreSizeButton->SetId("ignoreSize");
    ignoreSizeButton->SetLable("ignoreSize");
    ignoreSizeButton->RegisterOnClick([swiper, digitSwiper, indicator, digitIndicator, ignoreSizeText]() {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wangyu", "click");
         ignoreSizeIndex_ = (ignoreSizeIndex_ + 1) % ignoreSizePool.size();
         auto ignoreSize = ignoreSizePool[ignoreSizeIndex_];
         ignoreSizeText->SetTextContent("ignoreSize:" + std::to_string(ignoreSize));
         OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, ignoreSize);
         OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom(digitIndicator, ignoreSize);
         swiper->SetSwiperIndicator(indicator);
         digitSwiper->SetSwiperDigitIndicator(digitIndicator);
    });

    //mask
    auto maskText = std::make_shared<TextComponent>();
    maskText->SetPercentWidth(PARAM_03);
    maskText->SetPercentHeight(PARAM_003);
    maskText->SetTextContent("mask:");
    auto maskButton = std::make_shared<ButtonComponent>();
    maskButton->SetPercentWidth(PARAM_02);
    maskButton->SetPercentHeight(PARAM_003);
    maskButton->SetId("mask");
    maskButton->SetLable("mask");
    maskButton->RegisterOnClick([swiper, indicator, maskText]() {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wangyu", "click");
         maskIndex_ = (maskIndex_ + 1) % maskPool.size();
         auto mask = maskPool[maskIndex_];
         maskText->SetTextContent("mask:" + std::to_string(mask));
         OH_ArkUI_SwiperIndicator_SetMask(indicator, mask);
         swiper->SetSwiperIndicator(indicator);
    });

    //bottom
    auto bottomText = std::make_shared<TextComponent>();
    bottomText->SetPercentWidth(PARAM_03);
    bottomText->SetPercentHeight(PARAM_003);
    bottomText->SetTextContent("bottom:");

    //可变样式导航点
    auto styleText = std::make_shared<TextComponent>();
    styleText->SetPercentWidth(PARAM_03);
    styleText->SetPercentHeight(PARAM_003);
    styleText->SetTextContent("TestBottom");
    styleText->SetFontSize(PARAM_20);
    styleText->SetFontColor(COLOR_BLUE);

    auto bottomButton = std::make_shared<ButtonComponent>();
    bottomButton->SetPercentWidth(PARAM_02);
    bottomButton->SetHeight(PARAM_30);
    bottomButton->SetId("bottom");
    bottomButton->SetLable("bottom");
    bottomButton->RegisterOnClick([swiper, digitSwiper, indicator, digitIndicator, bottomText]() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wangyu", "click");
        bottomIndex_ = (bottomIndex_ + 1) % bottomPool.size();
        auto bottom = bottomPool[bottomIndex_];
        bottomText->SetTextContent("bottom:" + std::to_string(bottom));
        OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, bottom);
        OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(digitIndicator, bottom);
        swiper->SetSwiperIndicator(indicator);
        digitSwiper->SetSwiperDigitIndicator(digitIndicator);
    });

    auto styleRow = std::make_shared<RowComponent>();
    styleRow->AddChild(swiper);
    styleRow->AddChild(digitSwiper);

    auto spaceColumn = std::make_shared<ColumnComponent>();
    spaceColumn->AddChild(spaceText);
    spaceColumn->AddChild(spaceButton);

    auto ignoreSizeColumn = std::make_shared<ColumnComponent>();
    ignoreSizeColumn->AddChild(ignoreSizeText);
    ignoreSizeColumn->AddChild(ignoreSizeButton);

    auto buttonRow1 = std::make_shared<RowComponent>();
    buttonRow1->AddChild(spaceColumn);
    buttonRow1->AddChild(ignoreSizeColumn);

    auto maskColumn = std::make_shared<ColumnComponent>();
    maskColumn->AddChild(maskText);
    maskColumn->AddChild(maskButton);

    auto bottomColumn = std::make_shared<ColumnComponent>();
    bottomColumn->AddChild(bottomText);
    bottomColumn->AddChild(bottomButton);

    auto buttonRow2 = std::make_shared<RowComponent>();
    buttonRow2->AddChild(maskColumn);
    buttonRow2->AddChild(bottomColumn);
//    
    auto column = new ColumnComponent();
    column->AddChild(styleText);
    column->AddChild(styleRow);
    column->AddChild(buttonRow1);
    column->AddChild(buttonRow2);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void SwiperIndicatorTest::CreateNativeNodeAbnormal(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]SwiperIndicatorTest::CreateNativeNodeAbnormal start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    auto swiper = CreateSwiperNode("SwiperDotIndicator");
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetSpace(indicator, PARAM_NEGATIVE_10);
    OH_ArkUI_SwiperIndicator_SetMask(indicator, true);
    swiper->SetSwiperIndicator(indicator);

    auto indicator_second = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    auto swiper_second = CreateSwiperNode("SwiperSecondDotIndicator");
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator_second, ABNORMAL_PARAM);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator_second, ABNORMAL_PARAM);
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator_second, ABNORMAL_PARAM);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator_second, ABNORMAL_PARAM);
        OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, ABNORMAL_PARAM);
    OH_ArkUI_SwiperIndicator_SetSpace(indicator, ABNORMAL_PARAM);
    OH_ArkUI_SwiperIndicator_SetMask(indicator_second, true);
    swiper_second->SetSwiperIndicator(indicator_second);
    // parent node
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, swiper_second->GetComponent());
    OH_ArkUI_SwiperIndicator_Dispose(indicator);
    OH_ArkUI_SwiperIndicator_Dispose(indicator_second);
    
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICApiDemo
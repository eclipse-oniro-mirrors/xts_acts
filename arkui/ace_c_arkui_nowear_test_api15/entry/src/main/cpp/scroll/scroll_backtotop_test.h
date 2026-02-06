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

#ifndef ARKUI_CAPI_DEMO_SCROLL_SCROLL_BACKTOTOP_TEST_H
#define ARKUI_CAPI_DEMO_SCROLL_SCROLL_BACKTOTOP_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include "../common/common.h"
#include "../component/text_component.h"
#include "../component/component.h"
#include "../component/flowitem_component.h"
#include "../component/button_component.h"
#include "../component/column_component.h"
#include "../component/scroll_component.h"
#include "../component/waterflow_component.h"
namespace ArkUICapiTest {
extern std::string g_message5;
class ScrollBackToTopTest {
public:
    ~ScrollBackToTopTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
private:
    template<int32_t size = 15>
    static std::shared_ptr<ArkUICapiTest::ColumnComponent> CreateWaterFlowByNestedScroll(
        int32_t forward, int32_t backward, bool up = true)
    {
        auto outerColumn = std::make_shared<ArkUICapiTest::ColumnComponent>();
        auto scroll = std::make_shared<ArkUICapiTest::ScrollComponent>();
        auto column = std::make_shared<ArkUICapiTest::ColumnComponent>();
        auto waterFlow = std::make_shared<ArkUICapiTest::WaterFlowComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);
        auto reserveTop = std::make_shared<ArkUICapiTest::ColumnComponent>();
        auto reserveDown = std::make_shared<ArkUICapiTest::ColumnComponent>();
        bool isWaterFlowBackToTop = true;
        auto button2 = std::make_shared<ArkUICapiTest::ButtonComponent>();
        button2->SetWidth(SIZE_120);
        button2->SetHeight(SIZE_30);
        button2->SetId("Scroll/FlowTop");
        button2->SetLable("Scroll/FlowTop");
        button2->RegisterOnClick([waterFlow, isWaterFlowBackToTop, scroll]() mutable {
            if (isWaterFlowBackToTop == true) {
                isWaterFlowBackToTop = false;
            } else {
                isWaterFlowBackToTop = true;
            }
                waterFlow -> SetBackToTop(isWaterFlowBackToTop);
                scroll -> SetBackToTop(isWaterFlowBackToTop);
        });
        reserveTop->SetWidth(SIZE_110);
        reserveTop->SetHeight(SIZE_40);
        reserveTop->SetBackgroundColor(COLOR_GREEN);
        reserveTop->SetBorderRadius(SIZE_10, SIZE_10, SIZE_10, SIZE_10);
        reserveDown->SetWidth(SIZE_110);
        reserveDown->SetHeight(SIZE_40);
        reserveDown->SetBackgroundColor(COLOR_RED);
        reserveDown->SetBorderRadius(SIZE_10, SIZE_10, SIZE_10, SIZE_10);
        waterFlow->SetWidth(SIZE_110);
        waterFlow->SetHeight(SIZE_70);
        waterFlow->SetWaterFlowRowsGap(SIZE_10);
        waterFlow->SetBackgroundColor(COLOR_GRAY);
        waterFlow->SetId("WaterFlow");
        auto textMessage5 = std::make_shared<TextComponent>();
        textMessage5->SetHeight(SIZE_30);
        textMessage5->SetTextContent(g_message5);
        textMessage5->SetId("waterFlowBackMessage");
        waterFlow->SetLazyAdapter(adapter);
        waterFlow->SetBorderWidth(1, 1, 1, 1);
        waterFlow->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
        waterFlow->SetColumnsTemplate("1fr 1fr");
        waterFlow->SetRowsTemplate("1fr 1fr");
        waterFlow->SetWaterFlowNestedScroll(forward, backward);
        waterFlow->SetBackToTop(isWaterFlowBackToTop);
        auto item = waterFlow->getAttribute(NODE_SCROLL_NESTED_SCROLL);
        if (item->value[0].i32 != forward || item->value[1].i32 != backward) {
            waterFlow->SetBackgroundColor(COLOR_RED);
        }
        for (int i = 0; i < size; i++) {
            auto col = std::make_shared<ArkUICapiTest::ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            col->SetBackgroundColor(((i + 1) * 0xFFFFFF / size) | 0xFF000000);
            adapter->InsertItem(i, col);
        }
        column->AddChild(reserveTop);
        column->AddChild(waterFlow);
        column->AddChild(reserveDown);
        scroll->SetHeight(SIZE_60);
        scroll->AddChild(column);
        scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
        scroll->SetBorderWidth(1, 1, 1, 1);
        scroll->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
        scroll->SetBackToTop(isWaterFlowBackToTop) ;
        if (up) {
            scroll->SetScrollTo(0, SIZE_200, {});
            waterFlow->SetWaterFlowScrollToIndex(size - 1, 0, 0);
            waterFlow->SetOnReachStart([waterFlow, textMessage5]() {
            OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "WaterFlowEventTest", "OnReachStart");
            g_message5 = "onWaterFlowBack";
            textMessage5->SetTextContent(g_message5);
    });
        }
        // put the button in the outer column layout instead of the scroll component
        outerColumn->AddChild(button2);
        outerColumn->AddChild(textMessage5);
        outerColumn->AddChild(scroll);
        return outerColumn;
    }
};
} // namespace ArkUICApiDemo
#endif // ARKUI_CAPI_DEMO_SCROLL_SCROLL_BACKTOTOP_TEST_H

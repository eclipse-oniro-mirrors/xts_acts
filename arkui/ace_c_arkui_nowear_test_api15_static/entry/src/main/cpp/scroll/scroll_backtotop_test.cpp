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

#include "scroll_backtotop_test.h"

#include "../manager/plugin_manager.h"
#include "../component/button_component.h"
#include "../component/column_component.h"
#include "../component/component.h"
#include "../component/flowitem_component.h"
#include "../component/grid_component.h"
#include "../component/text_component.h"
#include "../component/row_component.h"
#include "../component/list_component.h"
#include <cstdint>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
constexpr int32_t GRID_ITEM_COUNT = 24;
constexpr int32_t GRID_ITEM_COUNT_80 = 80;
constexpr int32_t FLOW_ITEM_COUNT = 40;
int32_t g_backToTopValue = true;
int32_t g_backToTopValue1 = true;
std::string g_message1 = " ";
std::string g_message2 = " ";
std::string g_message3 = " ";
std::string g_message4 = " ";
std::string g_message5 = " ";

static void OnAdapterEventReceive(ArkUI_NodeAdapterEvent *event)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (type == NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER) {
        int32_t index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        if (index == 0) {
            gridItem->SetBackgroundColor(COLOR_RED);
        } else {
            gridItem->SetBackgroundColor(COLOR_YELLOW);
        }
        gridItem->SetBorderWidth(SIZE_5);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        OH_ArkUI_NodeAdapterEvent_SetItem(event, gridItem->GetComponent());
    }
}

std::shared_ptr<ColumnComponent> CreategridExample1()
{
    auto adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, &OnAdapterEventReceive);
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, GRID_ITEM_COUNT_80);
    ArkUI_AttributeItem adapterItem{.object = adapter};
    auto grid1Column = std::make_shared<ColumnComponent>();
    grid1Column->SetId("grid1Column");
    auto textMessage1 = std::make_shared<TextComponent>();
    textMessage1->SetTextContent(g_message1);
    textMessage1->SetId("gridBackMessage");
    grid1Column->AddChild(textMessage1);
    auto grid = new GridComponent();
    auto button1 = std::make_shared<ButtonComponent>();
    button1->SetWidth(SIZE_120);
    button1->SetHeight(SIZE_30);
    button1->SetId("GridTop");
    button1->SetLable("GridTop");
    button1->SetMargin(SIZE_3);
    button1->RegisterOnClick([grid]() {
        if (g_backToTopValue1 == true) {
        g_backToTopValue1 = false;
        grid -> SetBackToTop(g_backToTopValue1);
    } else {
        g_backToTopValue1 = true;
        grid -> SetBackToTop(g_backToTopValue1);
    }
    });
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_120);
    grid->SetId("Grid1");
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_5);
    grid->SetBorderWidth(SIZE_5);
    grid->SetBackToTop(g_backToTopValue);
    grid->SetOnReachStart([grid, textMessage1]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridEventTest", "OnReachStart");
        g_message1 = "onGridBack";
        textMessage1->SetTextContent(g_message1);
    });
    grid->SetOnDidScroll([grid, textMessage1](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        g_message1 = "onGridNotBack";
        textMessage1->SetTextContent(g_message1);
    });
    grid->SetMargin(SIZE_5);
    grid->setAttribute(NODE_GRID_NODE_ADAPTER, &adapterItem);
    grid1Column->AddChild(std::shared_ptr<GridComponent>(grid));
    grid1Column->AddChild(button1);
    grid1Column->SetId("gridBackToTop");
    return grid1Column;
}

std::shared_ptr<ScrollComponent> CreateScroll(int32_t number)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollBackToTopTest", "CreateScroll");
    auto scroll = std::make_shared<ScrollComponent>();
    scroll->SetWidth(SIZE_180);
    scroll->SetHeight(SIZE_70);
    scroll->SetMargin(DEFAULT_MARGIN);
    scroll->SetId("Scroll");
    scroll->SetScrollScrollBar(ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
    scroll->SetScrollScrollDirection(ARKUI_SCROLL_DIRECTION_HORIZONTAL);
    scroll->SetScrollEnablePaging(1);
    scroll->AddChildWithNumber(number, ARKUI_NODE_ROW);
    scroll->SetScrollBy(SIZE_500, 0);
    scroll->SetBackToTop(g_backToTopValue);

    return scroll;
}

static void AddListItem(std::shared_ptr<ListComponent> list, uint32_t color, int num)
{
    std::vector<std::shared_ptr<Component>> input;
    for (int i = 0; i < num; i++) {
        auto listItem = std::make_shared<ListItemComponent>();
        listItem->SetWidth(SIZE_100);
        listItem->SetHeight(SIZE_50);
        listItem->SetBackgroundColor(color);
        input.push_back(listItem);
    }
    auto adapter = make_shared<ItemAdapter<ListItemComponent>>(input);
    list->SetLazyAdapter(adapter);
}
static std::shared_ptr<ListComponent> CreateListComponent(int listSpace, int itemCount, int vertical = ArkUI_Axis::ARKUI_AXIS_VERTICAL)
{
    auto list = std::make_shared<ListComponent>();
    list->SetWidth(SIZE_100);
    list->SetHeight(SIZE_100);
    list->SetListSpace(listSpace);
    list->SetBackgroundColor(COLOR_RED);
    list->SetListDirection(vertical);
    list->SetId("List");
    list->SetScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetBackToTop(g_backToTopValue);
    AddListItem(list, COLOR_YELLOW, itemCount);
    return list;
}

void ScrollBackToTopTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = new ColumnComponent();
    auto row = std::make_shared<RowComponent>();
    auto columnScroll = std::make_shared<ColumnComponent>();
    auto scroll1 = CreateScroll(20);
    scroll1->SetId("Scroll1");
    auto textMessage3 = std::make_shared<TextComponent>();
    textMessage3->SetTextContent(g_message3);
    textMessage3->SetId("scroll1BackMessage");
    scroll1->SetOnReachStart([scroll1, textMessage3]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollEventTest", "OnReachStart");
        g_message3 = "onScroll1Back";
        textMessage3->SetTextContent(g_message3);
    });
    auto scroll7 = CreateScroll(100);
    scroll7->SetId("Scroll7");
    auto textMessage4 = std::make_shared<TextComponent>();
    textMessage4->SetTextContent(g_message4);
    textMessage4->SetId("scroll7BackMessage");
    scroll7->SetOnReachStart([scroll7, textMessage4]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollEventTest", "OnReachStart");
        g_message4 = "onScroll7Back";
        textMessage4->SetTextContent(g_message4);
    });
    auto grid1Column = CreategridExample1();
    auto mode2 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
    auto mode3 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
    auto waterFlow = CreateWaterFlowByNestedScroll(mode2, mode3);
    auto list = CreateListComponent(20, 5);
    auto textMessage2 = std::make_shared<TextComponent>();
    textMessage2->SetTextContent(g_message2);
    textMessage2->SetId("listBackMessage");
    list->SetScrollTo(0, SIZE_200, {});
    list->SetOnReachStart([list, textMessage2]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnReachStart");
        g_message2 = "onListBack";
        textMessage2->SetTextContent(g_message2);
    });
    list->SetOnDidScroll([list, textMessage2](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        g_message2 = "onListNotBack";
        textMessage2->SetTextContent(g_message2);
    });
    list->AddChild(textMessage2);
    list->SetScrollBarColor(COLOR_BLUE);
    list->SetScrollBarWidth(0);
    
    auto button1 = std::make_shared<ButtonComponent>();
    button1->SetWidth(SIZE_120);
    button1->SetHeight(SIZE_30);
    button1->SetId("ListTop");
    button1->SetLable("ListTop");
    button1->SetMargin(SIZE_3);
    button1->RegisterOnClick([list, waterFlow, scroll1, scroll7]() {
        if (g_backToTopValue == true) {
            g_backToTopValue = false;
            scroll1->SetBackToTop(g_backToTopValue);
            scroll7->SetBackToTop(g_backToTopValue);
            list->SetBackToTop(g_backToTopValue);
        } else {
            g_backToTopValue = true;
            scroll1->SetBackToTop(g_backToTopValue);
            scroll7->SetBackToTop(g_backToTopValue);
            list->SetBackToTop(g_backToTopValue);
        }
    });
    
    auto item = nodeAPI->getAttribute(list->GetComponent(), NODE_SCROLL_BACK_TO_TOP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollBackToTopTest",
                 "xueming item = %{public}d", item->value[0].i32);
    columnScroll->AddChild(scroll1);
    columnScroll->AddChild(scroll7);
    row->AddChild(columnScroll);
    row->AddChild(waterFlow);
    column->AddChild(row);
    column->AddChild(grid1Column);
    column->AddChild(list);
    column->AddChild(button1);
    column->AddChild(textMessage2);
    column->AddChild(textMessage3);
    column->AddChild(textMessage4);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICApiDemo
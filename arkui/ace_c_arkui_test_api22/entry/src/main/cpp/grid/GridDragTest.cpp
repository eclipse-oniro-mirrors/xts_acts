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

#include "grid/GridDragTest.h"
#include "GridAttrsTest.h"
#include "GridAbilityTest.h"
#include "component/TextComponentTest.h"
#include "component/ScrollComponentTest.h"
#include "manager/PluginManagerTest.h"
#include "component/RowComponentTest.h"

namespace ArkUICapiTest {
constexpr int32_t GRID_ITEM_COUNT = 4;
// 测试库
const std::vector<int32_t> boolTestPool = {0, 1, -2};

// 测试 dragStartValue
int32_t GridDragTest::dragStartValueIndex_ = 0;
int32_t GridDragTest::dragStartCount_ = 0;
int32_t GridDragTest::dragMoveCount_ = 0;
int32_t GridDragTest::dragLeaveCount_ = 0;
int32_t GridDragTest::dropCount_ = 0;
int32_t GridDragTest::selectCount_ = 0;

std::vector<std::shared_ptr<TextComponent>> GridDragTest::counterTexts_;
template <typename T> inline std::vector<std::shared_ptr<T>> &GetKeepAliveContainer()
{
    static std::vector<std::shared_ptr<T>> keepAliveContainer;
    return keepAliveContainer;
}

void GridDragTest::UpdateCounterTexts()
{
    if (counterTexts_.size() < SIZE_5) return;

    std::vector<std::string> contents = {
        std::to_string(dragStartCount_),
        std::to_string(dragMoveCount_),
        std::to_string(dragLeaveCount_),
        std::to_string(dropCount_),
        std::to_string(selectCount_)
    };

    for (size_t i = 0; i < counterTexts_.size() && i < contents.size(); i++) {
        counterTexts_[i]->SetTextContent(contents[i]);
    }
}

std::shared_ptr<ColumnComponent> GridDragTest::CreateCounterDisplay()
{
    auto counterColumn = std::make_shared<ColumnComponent>();
    auto counterRow = std::make_shared<RowComponent>();
    auto counterRow2 = std::make_shared<RowComponent>();
    counterTexts_.clear();
    // 创建五个计数器显示文本
    std::vector<std::string> eventNames = {
        "DragStart",
        "DragMove",
    };
    std::vector<std::string> eventNames2 = {
        "DragLeave",
        "Drop",
        "Select"
    };
    for (const auto& eventName : eventNames) {
        auto text = std::make_shared<TextComponent>();
        text->SetTextContent("0");
        text->SetFontSize(PARAM_14);
        text->SetId(eventName);
        text->SetBackgroundColor(COLOR_LIGHT_BLUE); // 浅灰色背景便于区分
        counterRow->AddChild(text);
        counterTexts_.push_back(text);
    }
    for (const auto& eventName : eventNames2) {
        auto text = std::make_shared<TextComponent>();
        text->SetTextContent("0");
        text->SetFontSize(PARAM_14);
        text->SetId(eventName);
        text->SetBackgroundColor(COLOR_LIGHT_BLUE); // 浅灰色背景便于区分
        counterRow2->AddChild(text);
        counterTexts_.push_back(text);
    }
    counterColumn->AddChild(counterRow);
    counterColumn->AddChild(counterRow2);
    return counterColumn;
}

std::shared_ptr<GridComponent> GridDragTest::CreateGrid()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = std::make_shared<GridComponent>();
    grid->SetId("DraggableGrid");
    grid->SetGridColumnsTemplate("1fr 1fr 1fr");
    grid->SetWidth(SIZE_100);
    grid->SetHeight(SIZE_50);
    grid->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
    grid->SetBorderWidth(PARAM_1);
    grid->SetGridDragAnimation(PARAM_1);
    grid->SetGridEditMode(PARAM_1);
    grid->SetDragStartReturnValue(PARAM_1);
    for (int i = 0; i < GRID_ITEM_COUNT; i++) {
        auto gridItem = std::make_shared<GridItemComponent>();
        auto text = std::make_shared<TextComponent>();
        text->SetFontSize(PARAM_16);
        text->SetTextContent(std::to_string(i));
        text->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        text->SetPercentWidth(PARAM_0_POINT_8);
        text->SetPercentHeight(PARAM_0_POINT_2);
        text->SetBackgroundColor(COLOR_PINK);
        if (i == 0) {
            gridItem->SetId("DraggableItem");
            gridItem->SetGridItemOnSelect([gridItem](bool selected) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "OnSelect selected:%{public}d", selected);
            selectCount_++;
        });
            gridItem->SetGridItemSelected(true);
        };
        gridItem->AddChild(text);
        grid->AddChild(gridItem);
    }
    GetKeepAliveContainer<GridComponent>().emplace_back(grid);
    return grid;
}
std::shared_ptr<GridComponent> GridDragTest::CreateGrid_2()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = std::make_shared<GridComponent>();
    grid->SetId("DraggableGrid");
    grid->SetGridEditMode(PARAM_1);
    grid->SetDragStartReturnValue(PARAM_1);
    grid->SetGridMultiSelectable(PARAM_1);
    grid->SetWidth(SIZE_100);
    grid->SetHeight(SIZE_50);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    grid->SetGridMultiSelectable(1);
    for (int i = 0; i < PARAM_2; i++) {
        auto gridItem = std::make_shared<GridItemComponent>();
        auto text = std::make_shared<TextComponent>();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(SIZE_3);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        if (i == 0) {
            gridItem->SetId("DraggableItem_2");
        };
        gridItem->SetGridItemOnSelect([gridItem](bool selected) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "OnSelect selected:%{public}d", selected);
            selectCount_++;
            UpdateCounterTexts();
        });
        if (i % PARAM_2 == 0) {
            gridItem->SetGridItemSelectable(false);
        } else {
            gridItem->SetGridItemSelectable(true);
        }
        if (i == 1) {
            gridItem->SetGridItemSelectable(true);
            gridItem->SetGridItemSelected(true);
        }
        text->SetTextContent("A");
        gridItem->AddChild(text);
        grid->AddChild(gridItem);
    }
    GetKeepAliveContainer<GridComponent>().emplace_back(grid);
    return grid;
}

std::shared_ptr<GridComponent> GridDragTest::OnGridTest()
{
    auto grid = CreateGrid();
    grid->SetOnItemDragStart([grid](float x, float y, int32_t index) {
        dragStartCount_++;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
                     "OnItemDragStart x:%{public}f y:%{public}f, index:%{public}d", x, y, index);
        grid->SetBackgroundColor(COLOR_RED);
        UpdateCounterTexts();
    });
    // 测试 NODE_GRID_ON_ITEM_DRAG_MOVE
    grid->SetOnItemDragMove([grid](float x, float y, int32_t index, int32_t insertIndex) {
        dragMoveCount_++;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
                     "OnItemDragMove x: %{public}f, y: %{public}f, index:%{public}d, insertIndex:%{public}d", x, y,
                     index, insertIndex);
        grid->SetBackgroundColor(COLOR_BLUE);
        UpdateCounterTexts();
    });
    // 测试 NODE_GRID_ON_ITEM_DRAG_LEAVE
    grid->SetOnItemDragLeave([grid](float x, float y, int32_t index) {
        dragLeaveCount_++;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
                     "OnItemDragLeave x: %{public}f, y: %{public}f, index:%{public}d", x, y, index);
        grid->SetBackgroundColor(COLOR_PINK);
        UpdateCounterTexts();
    });
    // 测试 NODE_GRID_ON_ITEM_DROP
    grid->SetOnItemDrop([grid](float x, float y, int32_t index, int32_t itemIndex, int32_t success) {
        dropCount_++;
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
            "OnItemDragDrop x: %{public}f, y: %{public}f, index:%{public}d, itemIndex:%{public}d, success:%{public}d",
            x, y, index, itemIndex, success);
        grid->SetBackgroundColor(COLOR_YELLOW);
        UpdateCounterTexts();
    });
    return grid;
}

napi_value GridDragTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "CreateNativeNode");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid_2 = CreateGrid_2();
    auto grid = OnGridTest();
    auto column = std::make_shared<ColumnComponent>();
    column->AddChild(grid);
    column->AddChild(grid_2);
    auto counterDisplay = CreateCounterDisplay();
    column->AddChild(counterDisplay);
    auto scroll = new ScrollComponent();
    scroll->SetPercentHeight(1.0f);
    scroll->SetPercentWidth(1.0f);
    scroll->SetMargin(SIZE_10);
    scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    scroll->SetId("scroll");
    scroll->AddChild(column);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 scroll->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "OH_NativeXComponent failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
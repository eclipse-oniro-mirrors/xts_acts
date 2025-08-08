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

#ifndef CAPIDEMO_WATERFLOW_NESTED_SCROLL_TEST_H
#define CAPIDEMO_WATERFLOW_NESTED_SCROLL_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "../common/common.h"
#include "scroll_component.h"
#include "text_component.h"
#include "waterflow_component.h"

namespace ArkUICapiTest {
class WaterFlowNestedScrollTest {
public:
    ~WaterFlowNestedScrollTest() = default;
    // testWaterFlowNestedScroll001
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    // testWaterFlowNestedScroll002
    static napi_value CreateNativeNodeSmall(napi_env env, napi_callback_info info);
    // testWaterFlowNestedScroll003
    static napi_value CreateNativeNodeReset(napi_env env, napi_callback_info info);
    static napi_value WaterFlowGetNestedScrollData(napi_env env, napi_callback_info info);
    static std::vector<int32_t> firstNestedScrollData;
    static std::vector<int32_t> lastNestedScrollData;

private:
    template<int32_t size = PARAM_15>
    static std::shared_ptr<ScrollComponent> CreateWaterFlowByNestedScroll(
        const std::string& id, int32_t forward, int32_t backward, bool up = true)
    {
        auto scroll = std::make_shared<ScrollComponent>();
        auto column = std::make_shared<ColumnComponent>();
        auto waterFlow = std::make_shared<WaterFlowComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);
        auto reserveTop = std::make_shared<ColumnComponent>();
        auto reserveDown = std::make_shared<ColumnComponent>();
        reserveTop->SetWidth(SIZE_110);
        reserveTop->SetHeight(SIZE_60);
        reserveDown->SetWidth(SIZE_110);
        reserveDown->SetHeight(SIZE_60);
        waterFlow->SetWidth(SIZE_110);
        waterFlow->SetHeight(SIZE_200);
        waterFlow->SetWaterFlowRowsGap(SIZE_10);
        waterFlow->SetLazyAdapter(adapter);
        waterFlow->SetColumnsTemplate("1fr 1fr");
        waterFlow->SetRowsTemplate("1fr 1fr");
        waterFlow->SetWaterFlowNestedScroll(forward, backward);
        auto item = waterFlow->getAttribute(NODE_SCROLL_NESTED_SCROLL);
        firstNestedScrollData.push_back(item->value[PARAM_0].i32);
        lastNestedScrollData.push_back(item->value[PARAM_1].i32);
        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            adapter->InsertItem(i, col);
        }
        column->AddChild(reserveTop);
        column->AddChild(waterFlow);
        column->AddChild(reserveDown);
        scroll->SetHeight(SIZE_200);
        scroll->AddChild(column);
        scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
        scroll->SetId(id);
        if (up) {
            scroll->SetScrollTo(SIZE_0, SIZE_200, {});
            waterFlow->SetWaterFlowScrollToIndex(size - PARAM_1, PARAM_0, PARAM_0);
        }
        return scroll;
    }

    template<int32_t size = PARAM_15>
    static std::shared_ptr<ScrollComponent> CreateWaterFlowByNestedScrollReset(
        const std::string& id, int32_t forward, int32_t backward, bool up = true)
    {
        auto scroll = std::make_shared<ScrollComponent>();
        auto column = std::make_shared<ColumnComponent>();
        auto waterFlow = std::make_shared<WaterFlowComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);
        auto reserveTop = std::make_shared<ColumnComponent>();
        auto reserveDown = std::make_shared<ColumnComponent>();
        reserveTop->SetWidth(SIZE_110);
        reserveTop->SetHeight(SIZE_60);
        reserveDown->SetWidth(SIZE_110);
        reserveDown->SetHeight(SIZE_60);
        waterFlow->SetWidth(SIZE_110);
        waterFlow->SetHeight(SIZE_200);
        waterFlow->SetWaterFlowRowsGap(SIZE_10);
        waterFlow->SetLazyAdapter(adapter);
        waterFlow->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        waterFlow->SetColumnsTemplate("1fr 1fr");
        waterFlow->SetRowsTemplate("1fr 1fr");
        waterFlow->SetWaterFlowNestedScroll(forward, backward);
        waterFlow->resetAttribute(NODE_SCROLL_NESTED_SCROLL);
        auto item = waterFlow->getAttribute(NODE_SCROLL_NESTED_SCROLL);
        firstNestedScrollData.push_back(item->value[PARAM_0].i32);
        lastNestedScrollData.push_back(item->value[PARAM_1].i32);
        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            adapter->InsertItem(i, col);
        }
        column->AddChild(reserveTop);
        column->AddChild(waterFlow);
        column->AddChild(reserveDown);
        scroll->SetHeight(SIZE_200);
        scroll->AddChild(column);
        scroll->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
        scroll->SetId(id);
        if (up) {
            scroll->SetScrollTo(PARAM_0, SIZE_200, {});
            waterFlow->SetWaterFlowScrollToIndex(size - PARAM_1, PARAM_0, PARAM_0);
        }
        return scroll;
    }
};
} // namespace ArkUICapiTest
#endif // CAPIDEMO_WATERFLOW_NESTED_SCROLL_TEST_H
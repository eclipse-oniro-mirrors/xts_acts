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

#ifndef ARKUI_CAPI_XTS_WATERFLOW_SCROLL_PAGE_TEST_H
#define ARKUI_CAPI_XTS_WATERFLOW_SCROLL_PAGE_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "button_component.h"
#include "column_component.h"
#include "common/common.h"
#include "text_component.h"
#include "waterflow_component.h"

namespace ArkUICapiTest {
#define COLOR_BASE 0xFFFFFF

constexpr int32_t PAGE_ITEM_COUNT_5 = PARAM_5;

class WaterFlowScrollPageTest {
public:
    ~WaterFlowScrollPageTest() = default;
    static napi_value TestWaterFlowScrollPage(napi_env env, napi_callback_info info);
    static napi_value WaterFlowGetScrollPageData(napi_env env, napi_callback_info info);
    static std::vector<int32_t> retData;
    static std::vector<int32_t> firstScrollIndexData;
    static std::vector<int32_t> lastScrollIndexData;

    template<int32_t size = PAGE_ITEM_COUNT_5, typename... Args>
    static std::shared_ptr<ColumnComponent> CreateWaterFlow(
        std::function<void(std::shared_ptr<WaterFlowComponent>, Args...)> change, Args... args)
    {
        auto column = std::make_shared<ColumnComponent>();
        auto waterFlow = std::make_shared<WaterFlowComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);

        waterFlow->SetWidth(SIZE_110);
        waterFlow->SetHeight(SIZE_200);
        waterFlow->SetWaterFlowRowsGap(SIZE_10);
        waterFlow->SetWaterFlowColumnsGap(SIZE_10);
        waterFlow->SetBackgroundColor(COLOR_GRAY);
        waterFlow->SetLazyAdapter(adapter);
        waterFlow->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        waterFlow->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
        waterFlow->SetColumnsTemplate("1fr 1fr");
        waterFlow->SetRowsTemplate("1fr 1fr");

        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            col->SetBackgroundColor(((i + PARAM_1) * COLOR_BASE / size) | COLOR_BLACK);
            col->SetBorderRadius(SIZE_10, SIZE_10, SIZE_10, SIZE_10);
            adapter->InsertItem(i, col);
        }
        column->AddChild(waterFlow);
        if (change) {
            change(waterFlow, args...);
        }
        return column;
    }
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_WATERFLOW_SCROLL_PAGE_TEST_H
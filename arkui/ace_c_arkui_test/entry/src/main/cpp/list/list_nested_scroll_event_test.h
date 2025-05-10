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

#ifndef CAPIDEMO_LIST_NESTED_SCROLL_EVENT_TEST_H
#define CAPIDEMO_LIST_NESTED_SCROLL_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "../common/common.h"
#include "list_component.h"
#include "scroll_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
#define SIZE_110 110

class ListNestedScrollTest {
public:
    ~ListNestedScrollTest() = default;
    // testListNestedScroll001
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    // testListNestedScroll002
    static napi_value CreateNativeNodeSmall(napi_env env, napi_callback_info info);
    // testListNestedScroll003
    static napi_value CreateNativeNodeReset(napi_env env, napi_callback_info info);
    static napi_value ListGetNestedScrollData(napi_env env, napi_callback_info info);
    static std::vector<int32_t> firstNestedScrollData;
    static std::vector<int32_t> lastNestedScrollData;

private:
    template<int32_t size = PARAM_15>
    static std::shared_ptr<ScrollComponent> CreateListByNestedScroll(
        const std::string& id, int32_t forward, int32_t backward, bool up = true)
    {
        auto scroll = std::make_shared<ScrollComponent>();
        auto column = std::make_shared<ColumnComponent>();
        auto list = std::make_shared<ListComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<ListItemComponent>>(input);
        auto reserveTop = std::make_shared<ColumnComponent>();
        auto reserveDown = std::make_shared<ColumnComponent>();
        reserveTop->SetWidth(SIZE_110);
        reserveTop->SetHeight(SIZE_60);
        reserveDown->SetWidth(SIZE_110);
        reserveDown->SetHeight(SIZE_60);
        list->SetWidth(SIZE_110);
        list->SetHeight(SIZE_200);
        list->SetLazyAdapter(adapter);
        list->SetNestedScroll(forward, backward);
        auto item = list->getAttribute(NODE_SCROLL_NESTED_SCROLL);
        firstNestedScrollData.push_back(item->value[PARAM_0].i32);
        lastNestedScrollData.push_back(item->value[PARAM_1].i32);
        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            adapter->InsertItem(i, col);
        }
        column->AddChild(reserveTop);
        column->AddChild(list);
        column->AddChild(reserveDown);
        scroll->SetHeight(SIZE_200);
        scroll->AddChild(column);
        scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
        scroll->SetId(id);
        if (up) {
            scroll->SetScrollTo(PARAM_0, SIZE_200, {});
            list->SetListScrollToIndex(size - PARAM_1, PARAM_0, PARAM_0);
        }
        return scroll;
    }

    template<int32_t size = PARAM_15>
    static std::shared_ptr<ScrollComponent> CreateListByNestedScrollReset(
        const std::string& id, int32_t forward, int32_t backward, bool up = true)
    {
        auto scroll = std::make_shared<ScrollComponent>();
        auto column = std::make_shared<ColumnComponent>();
        auto list = std::make_shared<ListComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<ListItemComponent>>(input);
        auto reserveTop = std::make_shared<ColumnComponent>();
        auto reserveDown = std::make_shared<ColumnComponent>();
        reserveTop->SetWidth(SIZE_110);
        reserveTop->SetHeight(SIZE_60);
        reserveDown->SetWidth(SIZE_110);
        reserveDown->SetHeight(SIZE_60);
        list->SetWidth(SIZE_110);
        list->SetHeight(SIZE_200);
        list->SetLazyAdapter(adapter);
        list->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        list->SetNestedScroll(forward, backward);
        list->resetAttribute(NODE_SCROLL_NESTED_SCROLL);
        auto item = list->getAttribute(NODE_SCROLL_NESTED_SCROLL);
        firstNestedScrollData.push_back(item->value[PARAM_0].i32);
        lastNestedScrollData.push_back(item->value[PARAM_1].i32);
        for (int i = PARAM_0; i < size; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetWidth(SIZE_40);
            col->SetHeight(SIZE_40);
            adapter->InsertItem(i, col);
        }
        column->AddChild(reserveTop);
        column->AddChild(list);
        column->AddChild(reserveDown);
        scroll->SetHeight(SIZE_200);
        scroll->AddChild(column);
        scroll->SetBorderWidth(PARAM_1, PARAM_1, PARAM_1, PARAM_1);
        scroll->SetScrollScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
        scroll->SetId(id);
        if (up) {
            scroll->SetScrollTo(PARAM_0, SIZE_200, {});
            list->SetListScrollToIndex(size - PARAM_1, PARAM_0, PARAM_0);
        }
        return scroll;
    }
};
} // namespace ArkUICapiTest
#endif // CAPIDEMO_LIST_NESTED_SCROLL_TEST_H

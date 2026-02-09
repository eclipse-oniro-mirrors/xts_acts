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

#ifndef ARKUI_CAPI_XTS_LIST_SCROLL_PAGE_TEST_H
#define ARKUI_CAPI_XTS_LIST_SCROLL_PAGE_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "button_component.h"
#include "column_component.h"
#include "common/common.h"
#include "list_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
#define SIZE_70 70
#define SIZE_110 110
#define COLOR_BASE 0xFFFFFF

class ListScrollPageTest {
public:
    ~ListScrollPageTest() = default;
    static napi_value TestListScrollPage(napi_env env, napi_callback_info info);
    static napi_value GetScrollPageData(napi_env env, napi_callback_info info);
    static std::vector<int32_t> retData;
    static std::vector<int32_t> firstScrollIndexData;
    static std::vector<int32_t> lastScrollIndexData;
    static std::vector<int32_t> subcomponentScrollIndexData;

    template<int32_t size = PARAM_5, typename... Args>
    static std::shared_ptr<ColumnComponent> CreateList(
        std::function<void(std::shared_ptr<ListComponent>, Args...)> change, Args... args)
    {
        auto column = std::make_shared<ColumnComponent>();
        auto list = std::make_shared<ListComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<ListItemComponent>>(input);

        list->SetWidth(SIZE_110);
        list->SetHeight(SIZE_200);
        list->SetListSpace(PARAM_10);
        list->SetBackgroundColor(COLOR_GRAY);
        list->SetLazyAdapter(adapter);
        list->SetId("list");

        for (int i = PARAM_0; i < size; i++) {
            auto item = std::make_shared<ListItemComponent>();
            item->SetWidth(SIZE_40);
            item->SetHeight(SIZE_40);
            item->SetBackgroundColor(((i + PARAM_1) * COLOR_BASE / size) | COLOR_BLACK);
            adapter->InsertItem(i, item);
        }
        column->AddChild(list);
        if (change) {
            change(list, args...);
        }
        return column;
    }
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_LIST_SCROLL_PAGE_TEST_H

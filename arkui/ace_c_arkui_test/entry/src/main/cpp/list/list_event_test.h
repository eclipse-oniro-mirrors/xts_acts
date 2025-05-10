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

#ifndef ARKUI_CAPI_XTS_LIST_EVENT_TEST_H
#define ARKUI_CAPI_XTS_LIST_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "column_component.h"
#include "common/common.h"
#include "list_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
#define PARAM_NEGATIVE_1000 (-1000)
#define PARAM_NEGATIVE_100000 (-100000)
#define SIZE_60 60
#define SIZE_70 70
#define SIZE_110 110
#define SIZE_100000 100000
#define COLOR_BASE 0xFFFFFF

class ListEventTest {
public:
    ~ListEventTest() = default;
    static napi_value CreateNativeNodeOnScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnScrollFrameBegin(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnScrollStart(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnScrollStop(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnWillScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnDidScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnWillDidScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollToIndex(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnReachStart(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnReachEnd(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnScrollIndex(napi_env env, napi_callback_info info);
    static napi_value GetOnWillScrollData(napi_env env, napi_callback_info info);
    static napi_value GetOnDidScrollData(napi_env env, napi_callback_info info);
    static napi_value GetOnWillDidScrollData(napi_env env, napi_callback_info info);
    static napi_value GetOnScrollIndexData(napi_env env, napi_callback_info info);
    static napi_value GetOnScrollData(napi_env env, napi_callback_info info);
    static std::vector<double> scrollHorizontalData;
    static std::vector<double> scrollVerticalData;
    static std::vector<double> willOffsetData;
    static std::vector<int32_t> willStateData;
    static std::vector<int32_t> willSourceData;
    static std::vector<double> didOffsetData;
    static std::vector<int32_t> didStateData;
    static std::vector<int32_t> firstScrollIndexData;
    static std::vector<int32_t> lastScrollIndexData;
    static std::vector<int32_t> subcomponentScrollIndexData;

private:
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
#endif // ARKUI_CAPI_XTS_LIST_EVENT_TEST_H

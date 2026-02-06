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

#ifndef ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H
#define ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "button_component.h"
#include "column_component.h"
#include "common/common.h"
#include "list_component.h"
#include "scroll/scroll_borderwidth_test.cpp"
#include "text_component.h"

namespace ArkUICapiTest {
#define COLOR_BASE 0xFFFFFF

class ListScrollOffsetTest {
public:
    ~ListScrollOffsetTest() = default;
    static napi_value TestListScrollOffset001(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset002(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset003(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset004(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset005(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset006(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset007(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset008(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset009(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset010(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset011(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset012(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset013(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset014(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset015(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset016(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset017(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset018(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset019(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset020(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset021(napi_env env, napi_callback_info info);
    static napi_value TestListScrollOffset022(napi_env env, napi_callback_info info);
    static napi_value GetScrollOffsetData(napi_env env, napi_callback_info info);

    static std::vector<double> listHorizontalData;
    static std::vector<double> listVerticalData;
    static std::vector<int32_t> setRetData;

    static std::shared_ptr<ListComponent> CreateList()
    {
        auto list = std::make_shared<ListComponent>();
        list->SetWidth(SIZE_200);
        list->SetHeight(SIZE_150);
        list->SetListSpace(PARAM_10);
        list->SetBackgroundColor(COLOR_GRAY);
        list->SetId("list");

        auto size = PARAM_50;
        for (int i = PARAM_0; i < size; i++) {
            auto item = std::make_shared<ListItemComponent>();
            item->SetWidth(SIZE_40);
            item->SetHeight(SIZE_40);
            item->SetBackgroundColor(((i + PARAM_1) * COLOR_BASE / size) | COLOR_BLACK);
            list->AddChild(item);
        }
        return list;
    }
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H

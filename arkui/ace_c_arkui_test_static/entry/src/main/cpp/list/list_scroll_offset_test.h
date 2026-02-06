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

#ifndef ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H
#define ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "component/button_component.h"
#include "component/column_component.h"
#include "common/common.h"
#include "component/list_component.h"
#include "component/text_component.h"
#include "ani/ani.h"

namespace ArkUIAniTest {
#define COLOR_BASE 0xFFFFFF

class ListScrollOffsetTest {
public:
    ~ListScrollOffsetTest() = default;
    static void TestListScrollOffset001(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset002(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset003(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset004(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset005(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset006(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset007(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset008(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset009(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset010(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset011(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset012(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset013(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset014(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset015(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset016(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset017(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset018(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset019(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset020(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset021(ani_env* env, ani_object info, ani_object NodeContent);
    static void TestListScrollOffset022(ani_env* env, ani_object info, ani_object NodeContent);
    static ani_object GetScrollOffsetData(ani_env* env, ani_object info);

    static std::vector<double> listHorizontalData;
    static std::vector<double> listVerticalData;
    static std::vector<int32_t> setRetData;

    static std::shared_ptr<ListComponent> CreateList()
    {
        auto list = std::make_shared<ListComponent>();
        list->SetWidth(SIZE_200);
        list->SetHeight(SIZE_300);
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
} // namespace ArkUIAniTest
#endif // ARKUI_CAPI_XTS_LIST_SCROLL_OFFSET_TEST_H

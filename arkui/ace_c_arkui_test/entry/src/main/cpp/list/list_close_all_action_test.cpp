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
#include "list_close_all_action_test.h"

#include <arkui/native_interface.h>
#include <thread>

#include "../manager/plugin_manager.h"
#include "component/button_component.h"
#include "component/column_component.h"
#include "component/list_component.h"
#include "component/row_component.h"

namespace ArkUICapiTest {
using namespace std;
std::vector<int32_t> ListCloseAllTest::retData = {};

static napi_value SetArrayNapiData(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
}

static napi_value SetArrayNapiData(const std::vector<double>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_double(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
}

static void PushBackIntData(std::vector<int32_t>& data, int32_t value)
{
    if (data.empty()) {
        data.push_back(value);
        return;
    }
    if (data.back() != value) {
        data.push_back(value);
    }
}

static void PushBackFloatData(std::vector<double>& data, double value)
{
    if (data.empty()) {
        if (value != PARAM_0) {
            data.push_back(value);
        }
        return;
    }
    if ((data.back() > PARAM_0 && value < PARAM_0) || (data.back() < PARAM_0 && value > PARAM_0)) {
        data.push_back(value);
    }
}

static void SetAction(std::shared_ptr<ListItemComponent> listItem,
    ArkUI_ListItemSwipeEdgeEffect setEdgeEffect =
        ArkUI_ListItemSwipeEdgeEffect::ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_SPRING)
{
    auto option = new ListItemSwipeActionOption();
    auto col1 = std::make_shared<ColumnComponent>();
    col1->SetWidth(SIZE_30);
    col1->SetHeight(SIZE_30);
    col1->SetBackgroundColor(COLOR_GREEN);
    auto col2 = std::make_shared<ColumnComponent>();
    col2->SetWidth(SIZE_30);
    col2->SetHeight(SIZE_30);
    col2->SetBackgroundColor(COLOR_YELLOW);

    auto item1 = OH_ArkUI_ListItemSwipeActionItem_Create();
    auto item2 = OH_ArkUI_ListItemSwipeActionItem_Create();

    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, col1->GetComponent());
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item2, col2->GetComponent());
    option->SetStart(item1);
    option->SetEnd(item2);
    option->SetEdgeEffect(setEdgeEffect);
    listItem->SetListItemSwiperAction(option);
}

static std::shared_ptr<RowComponent> CreateButton(std::vector<std::shared_ptr<ListComponent>> list)
{
    auto row = make_shared<RowComponent>();
    for (int i = PARAM_0; i < list.size(); i++) {
        auto eachList = list[i];
        auto button1 = make_shared<ButtonComponent>();
        button1->SetWidth(SIZE_30);
        button1->SetHeight(SIZE_30);
        button1->SetId("callbackButton" + std::to_string(i));
        button1->SetBackgroundColor(COLOR_GREEN);
        button1->RegisterOnClick([eachList]() {
            void* userData = reinterpret_cast<void*>(eachList.get());
            auto ret = OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), userData, [](void* userData) {
                auto list = reinterpret_cast<ListComponent*>(userData);
                list->SetBackgroundColor(COLOR_RED);
            });
            ListCloseAllTest::retData.push_back(ret);
        });
        auto button2 = make_shared<ButtonComponent>();
        button2->SetWidth(SIZE_30);
        button2->SetHeight(SIZE_30);
        button2->SetId("nullCallbackButton" + std::to_string(i));
        button2->SetBackgroundColor(COLOR_GREEN);
        button2->RegisterOnClick([eachList]() {
            auto ret = OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), nullptr, nullptr);
            ListCloseAllTest::retData.push_back(ret);
        });
        row->AddChild(button1);
        row->AddChild(button2);
    }
    return row;
}

napi_value ListCloseAllTest::GetRetData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListCloseAllTest", "GetOnScrollIndexData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListCloseAllTest::retData, env));
    ListCloseAllTest::retData.clear();
    return result;
}

static std::shared_ptr<ListComponent> CreateListWithAction(int32_t num, int32_t vertical, string firstItemId)
{
    auto list = make_shared<ListComponent>();
    list->SetMargin(PARAM_5);
    list->SetWidth(SIZE_80);
    list->SetHeight(SIZE_80);
    list->SetListDirection(vertical);
    list->SetListDivider(COLOR_BLACK, PARAM_2, PARAM_0, PARAM_0);
    for (int i = PARAM_0; i < num; i++) {
        auto listItem = make_shared<ListItemComponent>();
        if (i == PARAM_0) {
            listItem->SetId(firstItemId);
        }
        listItem->SetWidth(SIZE_40);
        listItem->SetHeight(SIZE_40);
        listItem->SetBackgroundColor(COLOR_BLUE);
        SetAction(listItem);
        list->AddChild(listItem);
    }
    return list;
}

napi_value ListCloseAllTest::CreateNativeNodeCloseAll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeCloseAll", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeCloseAll", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = new ColumnComponent();
    auto list1 = CreateListWithAction(SIZE_100, ArkUI_Axis::ARKUI_AXIS_VERTICAL, "list1");
    auto list2 = CreateListWithAction(SIZE_100, ArkUI_Axis::ARKUI_AXIS_HORIZONTAL, "list2");
    auto row = CreateButton({ list1, list2 });
    column->AddChild(list1);
    column->AddChild(list2);
    column->AddChild(row);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeCloseAll",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest

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

#include "list_scroll_by_test.h"

#include <arkui/native_interface.h>
#include <cstdint>
#include <thread>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"
#include "row_component.h"

namespace ArkUICapiTest {
using OnScrollByCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
std::vector<int32_t> ListScrollByTest::retData = {};
std::vector<int32_t> ListScrollByTest::firstScrollIndexData = {};
std::vector<int32_t> ListScrollByTest::lastScrollIndexData = {};
std::vector<int32_t> ListScrollByTest::subcomponentScrollIndexData = {};

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

static std::shared_ptr<ButtonComponent> CreateButton(const char* id, std::shared_ptr<ColumnComponent> col)
{
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetWidth(SIZE_100);
    btn->SetHeight(SIZE_50);
    btn->SetId(id);
    col->AddChild(btn);
    return btn;
}

static std::shared_ptr<ColumnComponent> CreateListButton(std::shared_ptr<ColumnComponent> col)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto colBtn = std::make_shared<ColumnComponent>();
    auto btn1 = CreateButton("btn1", colBtn);
    auto btn2 = CreateButton("btn2", colBtn);
    auto btn3 = CreateButton("btn3", colBtn);
    auto btn4 = CreateButton("btn4", colBtn);
    btn1->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_0 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn2->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = SIZE_100 }, { .f32 = SIZE_100 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn3->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = SIZE_100000 }, { .f32 = SIZE_100000 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn4->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = PARAM_NEGATIVE_100 }, { .f32 = PARAM_NEGATIVE_100 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    return colBtn;
}

static OnScrollByCallBack scrollBy = [](std::shared_ptr<ListComponent> list) {
    list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollByTest",
            "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last, subcomponent);
        ListScrollByTest::firstScrollIndexData.push_back(first);
        ListScrollByTest::lastScrollIndexData.push_back(last);
        ListScrollByTest::subcomponentScrollIndexData.push_back(subcomponent);
    });
};

napi_value ListScrollByTest::GetScrollByData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetOnScrollIndexData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListScrollByTest::retData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListScrollByTest::firstScrollIndexData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(ListScrollByTest::lastScrollIndexData, env));
    napi_set_element(env, result, PARAM_3, SetArrayNapiData(ListScrollByTest::subcomponentScrollIndexData, env));
    ListScrollByTest::firstScrollIndexData.clear();
    ListScrollByTest::lastScrollIndexData.clear();
    ListScrollByTest::subcomponentScrollIndexData.clear();
    ListScrollByTest::retData.clear();
    return result;
}

napi_value ListScrollByTest::TestListScrollBy001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scrollBy);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollByTest::TestListScrollBy002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scrollBy);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollByTest::TestListScrollBy003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scrollBy);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollByTest::TestListScrollBy004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scrollBy);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest",
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
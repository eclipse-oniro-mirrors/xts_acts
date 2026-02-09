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

#include "GridEventTest.h"

#include <thread>

#include "../manager/PluginManagerTest.h"
#include "component/ButtonComponentTest.h"
#include "component/RowComponentTest.h"
#include "component/GridComponentTest.h"

namespace ArkUICapiTest {
using OnReachStartCallBack = std::function<void(std::shared_ptr<GridComponent>, bool)>;
using OnReachEndCallBack = std::function<void(std::shared_ptr<GridComponent>, bool)>;
using OnScrollStopCallBack = std::function<void(std::shared_ptr<GridComponent>, bool)>;
using OnWillDidScrollCallBack = std::function<void(std::shared_ptr<GridComponent>)>;
using OnScrollIndexCallBack = std::function<void(std::shared_ptr<GridComponent>)>;
using OnScrollFrameBeginCallBack = std::function<void(std::shared_ptr<GridComponent>, int32_t)>;
using ScrollToIndex3CallBack = std::function<void(std::shared_ptr<GridComponent>, int32_t, int32_t)>;
std::vector<double> GridEventTest::willOffsetData = {};
std::vector<int32_t> GridEventTest::willStateData = {};
std::vector<int32_t> GridEventTest::willSourceData = {};
std::vector<double> GridEventTest::didOffsetData = {};
std::vector<int32_t> GridEventTest::didStateData = {};
std::vector<int32_t> GridEventTest::firstScrollIndexData = {};
std::vector<int32_t> GridEventTest::lastScrollIndexData = {};
std::vector<int32_t> GridEventTest::timeData = {};

std::shared_ptr<GridComponent> CreateGrid1(int32_t type, const std::string& key = "GridComponentTest")
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_450);
    grid->SetHeight(SIZE_300);
    // 设置columnsTemplate:NODE_GRID_COLUMN_TEMPLATE;
    grid->SetColumnsTemplate("1fr 1fr 1fr 1fr");
    // 设置columnsGap:NODE_GRID_COLUMN_GAP
    grid->SetGridColumnsGap(SIZE_10);
    // 设置rowGap:NODE_GRID_ROW_GAP
    grid->SetGridRowsGap(SIZE_5);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    grid->SetId(key);

    if (type == 1) {
        ArkUI_NumberValue value[] = {{.i32 = 1}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(grid->GetComponent(), NODE_GRID_FOCUS_WRAP_MODE, &item);
    }

    std::string message = "这是一段文字";
    std::string showMessage;
    for (int i = PARAM_0; i < PARAM_10; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(PARAM_3);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        showMessage += message;
        text->SetTextContent(showMessage);

        ArkUI_NumberValue focusable_value[] = {{.i32 = 1}};
        ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text->GetComponent(), NODE_FOCUSABLE, &focusable_item);

        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    return grid;
}

napi_value SetArrayNapiData(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};
napi_value SetArrayNapiData(const std::vector<double>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_double(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};
void PushBackIntData(std::vector<int32_t>& data, int32_t value)
{
    if (data.empty()) {
        data.push_back(value);
        return;
    }
    if (data.back() != value) {
        data.push_back(value);
    }
}
void PushBackFloatData(std::vector<double>& data, double value)
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

napi_value GridEventTest::GridOnScrollIndexTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridOnDidScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto col1 = CreateGrid1(0, "GridComponentTest5");
    col1->SetOnScrollIndex([col1](int32_t first, int32_t last)  {
         col1->SetBackgroundColor(0x12345678);
    });
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GridEventTest::GridOnDidScrollTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridOnDidScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateGrid1(0);
    col1->SetOnDidScroll([col1](float offset, int32_t state) {
         col1->SetBackgroundColor(COLOR_PURPLE);
    });
    auto column = std::make_shared<ColumnComponent>();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GridEventTest::GridOnScrollBarUpdateTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridOnScrollBarUpdateTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest", "GetContext env or info is null");
        return nullptr;
    }
    
    auto col1 = CreateGrid1(0, "GridComponentTest6");
    
    col1->SetOnScrollBarUpdate();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GridEventTest::GridOnWillScrollTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridOnWillScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateGrid1(0, "GridComponentTest3");
    col1->SetOnWillScroll([col1](float offset, int32_t state, int32_t source) {
         col1->SetBackgroundColor(0x21331211);
    });
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridEventTest",
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
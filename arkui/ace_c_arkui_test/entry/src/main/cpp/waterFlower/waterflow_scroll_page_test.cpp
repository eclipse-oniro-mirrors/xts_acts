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

#include "waterflow_scroll_page_test.h"

#include <arkui/native_interface.h>
#include <cstdint>
#include <thread>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"
#include "row_component.h"
#include "waterflow_component.h"

namespace ArkUICapiTest {
using OnScrollPageCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>)>;
std::vector<int32_t> WaterFlowScrollPageTest::retData = {};
std::vector<int32_t> WaterFlowScrollPageTest::firstScrollIndexData = {};
std::vector<int32_t> WaterFlowScrollPageTest::lastScrollIndexData = {};

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

static std::shared_ptr<ColumnComponent> CreateWaterFlowButton(std::shared_ptr<ColumnComponent> col)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto colBtn = std::make_shared<ColumnComponent>();
    auto btn1 = std::make_shared<ButtonComponent>();
    auto btn2 = std::make_shared<ButtonComponent>();
    btn1->SetWidth(SIZE_100);
    btn1->SetHeight(SIZE_50);
    btn1->SetId("btn1");
    btn2->SetWidth(SIZE_100);
    btn2->SetHeight(SIZE_50);
    btn2->SetId("btn2");
    colBtn->AddChild(btn1);
    colBtn->AddChild(btn2);
    btn1->RegisterOnClick([col, nodeAPI]() {
        auto waterFlow = dynamic_cast<WaterFlowComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .i32 = PARAM_1 }, { .i32 = PARAM_1 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(waterFlow->GetComponent(), NODE_SCROLL_PAGE, &item);
        WaterFlowScrollPageTest::retData.push_back(ret);
    });
    btn2->RegisterOnClick([col, nodeAPI]() {
        auto waterFlow = dynamic_cast<WaterFlowComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .i32 = PARAM_0 }, { .i32 = PARAM_0 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(waterFlow->GetComponent(), NODE_SCROLL_PAGE, &item);
        WaterFlowScrollPageTest::retData.push_back(ret);
    });
    return colBtn;
}

static OnScrollPageCallBack scrollPage = [](std::shared_ptr<WaterFlowComponent> waterFlow) {
    waterFlow->SetOnScrollIndex([waterFlow](int32_t first, int32_t last) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowScrollPageTest",
            "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last);
        WaterFlowScrollPageTest::firstScrollIndexData.push_back(first);
        WaterFlowScrollPageTest::lastScrollIndexData.push_back(last);
    });
};

napi_value WaterFlowScrollPageTest::WaterFlowGetScrollPageData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollPageTest", "GetOnScrollIndexData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(WaterFlowScrollPageTest::retData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(WaterFlowScrollPageTest::firstScrollIndexData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(WaterFlowScrollPageTest::lastScrollIndexData, env));
    WaterFlowScrollPageTest::firstScrollIndexData.clear();
    WaterFlowScrollPageTest::lastScrollIndexData.clear();
    WaterFlowScrollPageTest::retData.clear();
    return result;
}

napi_value WaterFlowScrollPageTest::TestWaterFlowScrollPage(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollPageTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollPageTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateWaterFlow<SIZE_40>(scrollPage);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateWaterFlowButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollPageTest",
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
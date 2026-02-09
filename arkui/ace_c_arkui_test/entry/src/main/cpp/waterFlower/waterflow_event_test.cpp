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

#include "waterflow_event_test.h"

#include <thread>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "row_component.h"

namespace ArkUICapiTest {
using OnReachStartCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, bool)>;
using OnReachEndCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, bool)>;
using OnScrollStopCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, bool)>;
using OnWillDidScrollCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>)>;
using OnScrollIndexCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>)>;
using OnScrollFrameBeginCallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, int32_t)>;
using ScrollToIndex3CallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, int32_t, int32_t)>;
std::vector<double> WaterFlowEventTest::willOffsetData = {};
std::vector<int32_t> WaterFlowEventTest::willStateData = {};
std::vector<int32_t> WaterFlowEventTest::willSourceData = {};
std::vector<double> WaterFlowEventTest::didOffsetData = {};
std::vector<int32_t> WaterFlowEventTest::didStateData = {};
std::vector<int32_t> WaterFlowEventTest::firstScrollIndexData = {};
std::vector<int32_t> WaterFlowEventTest::lastScrollIndexData = {};
std::vector<int32_t> WaterFlowEventTest::timeData = {};

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

OnReachStartCallBack reachStart = [](std::shared_ptr<WaterFlowComponent> waterFlow, bool isRow) {
    if (isRow) {
        waterFlow->SetLayoutDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    waterFlow->SetWaterFlowScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    waterFlow->SetOnReachStart([waterFlow]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "OnReachStart");
        waterFlow->SetBackgroundColor(COLOR_RED);
    });
};
OnReachEndCallBack reachEnd = [](std::shared_ptr<WaterFlowComponent> waterFlow, bool isRow) {
    if (isRow) {
        waterFlow->SetLayoutDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    waterFlow->SetWaterFlowScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    waterFlow->SetOnReachEnd([waterFlow]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "OnReachEnd");
        waterFlow->SetBackgroundColor(COLOR_RED);
    });
};
OnScrollStopCallBack scrollStop = [](std::shared_ptr<WaterFlowComponent> waterFlow, bool isRow) {
    if (isRow) {
        waterFlow->SetLayoutDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    waterFlow->SetOnScrollStop([waterFlow]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "OnScrollStop");
        waterFlow->SetBackgroundColor(COLOR_RED);
    });
};
OnWillDidScrollCallBack willDidScroll = [](std::shared_ptr<WaterFlowComponent> waterFlow) {
    waterFlow->SetWidth(SIZE_200);
    waterFlow->SetWaterFlowEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    waterFlow->SetWaterFlowScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    waterFlow->SetWaterFlowScrollBarWidth(SIZE_50);
    waterFlow->SetOnWillScroll([waterFlow](float offset, int32_t state, int32_t source) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnWillScroll offset: %{public}f, state: %{public}d, source: %{public}d", offset, state, source);
        WaterFlowEventTest::timeData.push_back(PARAM_1);
        PushBackFloatData(WaterFlowEventTest::willOffsetData, offset);
        PushBackIntData(WaterFlowEventTest::willStateData, state);
        PushBackIntData(WaterFlowEventTest::willSourceData, source);
    });
    waterFlow->SetOnDidScroll([waterFlow](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        WaterFlowEventTest::timeData.push_back(PARAM_2);
        PushBackFloatData(WaterFlowEventTest::didOffsetData, offset);
        PushBackIntData(WaterFlowEventTest::didStateData, state);
    });
};
OnScrollFrameBeginCallBack scrollFrameBegin = [](std::shared_ptr<WaterFlowComponent> waterFlow, int32_t distance) {
    waterFlow->SetWidth(SIZE_200);
    waterFlow->SetWaterFlowScrollBarWidth(SIZE_50);
    waterFlow->SetWaterFlowEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    waterFlow->SetWaterFlowScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    waterFlow->SetOnScrollFrameBegin([waterFlow, distance](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnScrollFrameBegin offset: %{public}f, state: %{public}d", offset, state);
        PushBackFloatData(WaterFlowEventTest::willOffsetData, offset);
        PushBackIntData(WaterFlowEventTest::willStateData, state);
        return distance;
    });
    waterFlow->SetOnScrollIndex([waterFlow](int32_t first, int32_t last) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OnScrollIndex first: %{public}d, last: %{public}d", first, last);
        WaterFlowEventTest::firstScrollIndexData.push_back(first);
        WaterFlowEventTest::lastScrollIndexData.push_back(last);
    });
};

std::shared_ptr<ColumnComponent> CreateWaterFlowButton(std::shared_ptr<ColumnComponent> col)
{
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
    btn1->RegisterOnClick([col]() {
        auto waterFlow = dynamic_cast<WaterFlowComponent*>(col->GetChildren().front().get());
        waterFlow->SetScrollTo(PARAM_0, PARAM_NEGATIVE_1000, {});
    });
    btn2->RegisterOnClick([col]() {
        auto waterFlow = dynamic_cast<WaterFlowComponent*>(col->GetChildren().front().get());
        waterFlow->SetScrollPage(false, false);
    });
    return colBtn;
}

// NODE_SCROLL_EVENT_ON_REACH_START
napi_value WaterFlowEventTest::CreateNativeNodeReachStart(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }
    // NODE_SCROLL_EVENT_ON_REACH_START
    auto col1 = CreateWaterFlow(reachStart, false);
    auto col2 = CreateWaterFlow(reachStart, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    // parent node
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto waterFlow = dynamic_cast<WaterFlowComponent*>(node->GetChildren().front().get());
            waterFlow->SetScrollTo(PARAM_NEGATIVE_100000, PARAM_NEGATIVE_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_REACH_END
napi_value WaterFlowEventTest::CreateNativeNodeReachEnd(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }
    // NODE_SCROLL_EVENT_ON_REACH_END
    auto col1 = CreateWaterFlow(reachEnd, false);
    auto col2 = CreateWaterFlow(reachEnd, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    // parent node
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto waterFlow = dynamic_cast<WaterFlowComponent*>(node->GetChildren().front().get());
            waterFlow->SetScrollTo(PARAM_100000, PARAM_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_SCROLL_STOP
napi_value WaterFlowEventTest::CreateNativeNodeScrollStop(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }
    // NODE_SCROLL_EVENT_ON_SCROLL_STOP
    auto col1 = CreateWaterFlow(scrollStop, false);
    auto col2 = CreateWaterFlow(scrollStop, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    // parent node
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto waterFlow = dynamic_cast<WaterFlowComponent*>(node->GetChildren().front().get());
            waterFlow->SetScrollTo(PARAM_100000, PARAM_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_WATER_FLOW_ON_WILL_SCROLL
// NODE_WATER_FLOW_ON_DID_SCROLL
napi_value WaterFlowEventTest::CreateNativeNodeOnWillDidScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateWaterFlow<SIZE_40>(willDidScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateWaterFlowButton(col1));
    column->AddChild(row1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value WaterFlowEventTest::GetOnWillDidScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetOnWillDidScrollData");
    napi_value result;
    napi_create_array(env, &result);

    napi_set_element(env, result, PARAM_0, SetArrayNapiData(WaterFlowEventTest::willOffsetData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(WaterFlowEventTest::willStateData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(WaterFlowEventTest::willSourceData, env));
    napi_set_element(env, result, PARAM_3, SetArrayNapiData(WaterFlowEventTest::didOffsetData, env));
    napi_set_element(env, result, PARAM_4, SetArrayNapiData(WaterFlowEventTest::didStateData, env));
    napi_set_element(env, result, PARAM_5, SetArrayNapiData(WaterFlowEventTest::timeData, env));

    WaterFlowEventTest::willOffsetData.clear();
    WaterFlowEventTest::willStateData.clear();
    WaterFlowEventTest::willSourceData.clear();
    WaterFlowEventTest::didOffsetData.clear();
    WaterFlowEventTest::didStateData.clear();
    WaterFlowEventTest::timeData.clear();
    return result;
}

napi_value WaterFlowEventTest::CreateNativeNodeOnScrollIndex(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }

    OnScrollIndexCallBack scrollIndex = [](std::shared_ptr<WaterFlowComponent> waterFlow) {
        waterFlow->SetWaterFlowEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
        waterFlow->SetWaterFlowScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
        waterFlow->SetOnScrollIndex([waterFlow](int32_t first, int32_t last) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
                "OnScrollIndex first: %{public}d, last: %{public}d", first, last);
            WaterFlowEventTest::firstScrollIndexData.push_back(first);
            WaterFlowEventTest::lastScrollIndexData.push_back(last);
        });
    };
    auto col1 = CreateWaterFlow<PARAM_16>(scrollIndex);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value WaterFlowEventTest::GetOnScrollIndexData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetOnScrollIndexData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(WaterFlowEventTest::firstScrollIndexData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(WaterFlowEventTest::lastScrollIndexData, env));
    WaterFlowEventTest::firstScrollIndexData.clear();
    WaterFlowEventTest::lastScrollIndexData.clear();
    return result;
}

napi_value WaterFlowEventTest::CreateNativeNodeOnScrollFrameBegin(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "CreateNativeNode");

    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    int32_t offset = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    napi_get_value_int32(env, args[PARAM_1], &offset);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateWaterFlow<SIZE_40>(scrollFrameBegin, offset);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    auto column = new ColumnComponent();
    column->AddChild(col1);
    column->AddChild(btn);
    btn->RegisterOnClick([col1]() {
        auto waterFlow = dynamic_cast<WaterFlowComponent*>(col1->GetChildren().front().get());
        waterFlow->SetScrollBy(PARAM_0, PARAM_100);
    });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value WaterFlowEventTest::CreateNativeNodeScrollToIndex(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollBarTest", "CreateNativeNode");
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    int32_t index = PARAM_0;
    int32_t alignment = PARAM_0;
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    napi_get_value_int32(env, args[PARAM_1], &index);
    napi_get_value_int32(env, args[PARAM_2], &alignment);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollBarTest", "GetContext env or info is null");
        return nullptr;
    }
    ScrollToIndex3CallBack changeParam = [](std::shared_ptr<WaterFlowComponent> waterFlow, int32_t index,
                                             int32_t alignment) {
        waterFlow->SetWaterFlowScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
        waterFlow->SetOnScrollIndex([waterFlow](int32_t first, int32_t last) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WaterFlowEventTest",
                "OnScrollIndex first: %{public}d, last: %{public}d", first, last);
            WaterFlowEventTest::firstScrollIndexData.push_back(first);
            WaterFlowEventTest::lastScrollIndexData.push_back(last);
        });
        std::thread th([waterFlow, index, alignment]() {
            std::this_thread::sleep_for(std::chrono::seconds(PARAM_1));
            waterFlow->SetWaterFlowScrollToIndex(index, PARAM_1, alignment);
        });
        th.detach();
    };
    // NODE_WATER_FLOW_SCROLL_TO_INDEX
    auto col1 = CreateWaterFlow<SIZE_60>(changeParam, index, alignment);
    // parent node
    auto column = new ColumnComponent();
    column->AddChild(col1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollBarTest",
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
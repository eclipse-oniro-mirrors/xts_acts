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

#include "list_event_test.h"

#include <thread>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "row_component.h"

namespace ArkUICapiTest {
using OnScrollCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnScrollFrameBeginCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnScrollStartCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnScrollStopCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnWillDidScrollCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnReachStartCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnReachEndCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnScrollIndexCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using ScrollToIndexCallBack = std::function<void(std::shared_ptr<ListComponent>, int32_t, int32_t)>;

std::vector<double> ListEventTest::scrollHorizontalData = {};
std::vector<double> ListEventTest::scrollVerticalData = {};
std::vector<double> ListEventTest::willOffsetData = {};
std::vector<int32_t> ListEventTest::willStateData = {};
std::vector<int32_t> ListEventTest::willSourceData = {};
std::vector<double> ListEventTest::didOffsetData = {};
std::vector<int32_t> ListEventTest::didStateData = {};
std::vector<int32_t> ListEventTest::firstScrollIndexData = {};
std::vector<int32_t> ListEventTest::lastScrollIndexData = {};
std::vector<int32_t> ListEventTest::subcomponentScrollIndexData = {};

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

static OnScrollStartCallBack scrollStart = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetOnScrollStart([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnScrollStart");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnScrollStopCallBack scrollStop = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetOnScrollStop([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnScrollStop");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnReachStartCallBack reachStart = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetListScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    list->SetOnReachStart([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnReachStart");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnReachEndCallBack reachEnd = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetListScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    list->SetOnReachEnd([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnReachEnd");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnScrollCallBack scroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_150);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_50);
    list->SetOnScroll([list](float horizontal, float vertical) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "SetOnScroll horizontal: %{public}f, vertical: %{public}f", horizontal, vertical);
        PushBackFloatData(ListEventTest::scrollHorizontalData, horizontal);
        PushBackFloatData(ListEventTest::scrollVerticalData, vertical);
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnWillDidScrollCallBack willDidScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_150);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_50);
    list->SetOnWillScroll([list](float offset, int32_t state, int32_t source) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnWillScroll offset: %{public}f, state: %{public}d, source: %{public}d", offset, state, source);
        list->SetBackgroundColor(COLOR_GREEN);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        PushBackIntData(ListEventTest::willSourceData, source);
    });
    list->SetOnDidScroll([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        list->SetBackgroundColor(COLOR_RED);
        PushBackFloatData(ListEventTest::didOffsetData, offset);
        PushBackIntData(ListEventTest::didStateData, state);
    });
};

static OnWillDidScrollCallBack willScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_150);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_50);
    list->SetOnWillScroll([list](float offset, int32_t state, int32_t source) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnWillScroll offset: %{public}f, state: %{public}d, source: %{public}d", offset, state, source);
        list->SetBackgroundColor(COLOR_GREEN);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        PushBackIntData(ListEventTest::willSourceData, source);
    });
};

static OnWillDidScrollCallBack didScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_150);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_50);
    list->SetOnDidScroll([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        list->SetBackgroundColor(COLOR_RED);
        PushBackFloatData(ListEventTest::didOffsetData, offset);
        PushBackIntData(ListEventTest::didStateData, state);
    });
};

static OnScrollFrameBeginCallBack scrollFrameBegin = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_150);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_50);
    list->SetOnScrollFrameBegin([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnScrollFrameBegin offset: %{public}f, state: %{public}d", offset, state);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        return SIZE_10;
    });
};

static ScrollToIndexCallBack changeParam = [](std::shared_ptr<ListComponent> list, int32_t index, int32_t alignment) {
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last, subcomponent);
        ListEventTest::firstScrollIndexData.push_back(first);
        ListEventTest::lastScrollIndexData.push_back(last);
        ListEventTest::subcomponentScrollIndexData.push_back(subcomponent);
    });
    std::thread th([list, index, alignment]() {
        std::this_thread::sleep_for(std::chrono::seconds(PARAM_1));
        list->SetListScrollToIndex(index, PARAM_1, alignment);
    });
    th.detach();
};

static std::shared_ptr<ColumnComponent> CreateListButton(std::shared_ptr<ColumnComponent> col)
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
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        list->SetScrollTo(PARAM_0, PARAM_NEGATIVE_1000, {});
    });
    btn2->RegisterOnClick([col]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        list->SetScrollPage(false, false);
    });
    return colBtn;
}

// NODE_SCROLL_EVENT_ON_REACH_START
napi_value ListEventTest::CreateNativeNodeOnReachStart(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList(reachStart, false);
    auto col2 = CreateList(reachStart, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(PARAM_NEGATIVE_100000, PARAM_NEGATIVE_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_REACH_END
napi_value ListEventTest::CreateNativeNodeOnReachEnd(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList(reachEnd, false);
    auto col2 = CreateList(reachEnd, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_SCROLL_START
napi_value ListEventTest::CreateNativeNodeOnScrollStart(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList(scrollStart, false);
    auto col2 = CreateList(scrollStart, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_SCROLL_STOP
napi_value ListEventTest::CreateNativeNodeOnScrollStop(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList(scrollStop, false);
    auto col2 = CreateList(scrollStop, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
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
napi_value ListEventTest::CreateNativeNodeOnWillDidScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(willDidScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_WATER_FLOW_ON_WILL_SCROLL
napi_value ListEventTest::CreateNativeNodeOnWillScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(willScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_WATER_FLOW_ON_DID_SCROLL
napi_value ListEventTest::CreateNativeNodeOnDidScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(didScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListEventTest::GetOnWillDidScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListEventTest::willOffsetData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListEventTest::willStateData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(ListEventTest::willSourceData, env));
    napi_set_element(env, result, PARAM_3, SetArrayNapiData(ListEventTest::didOffsetData, env));
    napi_set_element(env, result, PARAM_4, SetArrayNapiData(ListEventTest::didStateData, env));
    ListEventTest::willOffsetData.clear();
    ListEventTest::willStateData.clear();
    ListEventTest::willSourceData.clear();
    ListEventTest::didOffsetData.clear();
    ListEventTest::didStateData.clear();
    return result;
}

napi_value ListEventTest::GetOnWillScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListEventTest::willOffsetData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListEventTest::willStateData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(ListEventTest::willSourceData, env));
    ListEventTest::willOffsetData.clear();
    ListEventTest::willStateData.clear();
    ListEventTest::willSourceData.clear();
    return result;
}

napi_value ListEventTest::GetOnDidScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListEventTest::didOffsetData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListEventTest::didStateData, env));
    ListEventTest::didOffsetData.clear();
    ListEventTest::didStateData.clear();
    return result;
}

// NODE_LIST_ON_SCROLL_INDEX
napi_value ListEventTest::CreateNativeNodeOnScrollIndex(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    OnScrollIndexCallBack scrollIndex = [](std::shared_ptr<ListComponent> list) {
        list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
        list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
        list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
                "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last,
                subcomponent);
            ListEventTest::firstScrollIndexData.push_back(first);
            ListEventTest::lastScrollIndexData.push_back(last);
            ListEventTest::subcomponentScrollIndexData.push_back(subcomponent);
        });
    };
    auto col1 = CreateList<PARAM_16>(scrollIndex);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListEventTest::GetOnScrollIndexData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnScrollIndexData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListEventTest::firstScrollIndexData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListEventTest::lastScrollIndexData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(ListEventTest::subcomponentScrollIndexData, env));
    ListEventTest::firstScrollIndexData.clear();
    ListEventTest::lastScrollIndexData.clear();
    ListEventTest::subcomponentScrollIndexData.clear();
    return result;
}

// NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN
napi_value ListEventTest::CreateNativeNodeOnScrollFrameBegin(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scrollFrameBegin);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    auto column = new ColumnComponent();
    column->AddChild(col1);
    column->AddChild(btn);
    btn->RegisterOnClick([col1]() {
        auto list = dynamic_cast<ListComponent*>(col1->GetChildren().front().get());
        list->SetScrollBy(PARAM_0, PARAM_100);
    });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

// NODE_SCROLL_EVENT_ON_SCROLL
napi_value ListEventTest::CreateNativeNodeOnScroll(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_40>(scroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListEventTest::GetOnScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnScrollData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListEventTest::scrollHorizontalData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListEventTest::scrollVerticalData, env));
    ListEventTest::scrollHorizontalData.clear();
    ListEventTest::scrollVerticalData.clear();
    return result;
}

// NODE_LIST_SCROLL_TO_INDEX
napi_value ListEventTest::CreateNativeNodeScrollToIndex(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "CreateNativeNode");
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
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetContext env or info is null");
        return nullptr;
    }
    auto col1 = CreateList<SIZE_60>(changeParam, index, alignment);
    auto column = new ColumnComponent();
    column->AddChild(col1);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
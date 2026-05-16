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

#include "list_scroll_offset_test.h"

#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <cstdint>

#include "../manager/plugin_manager.h"
#include "common/common.h"
#include "list/list_event_test.h"

namespace ArkUICapiTest {
#define PARAM_NEGATIVE_20 (-20)
#define PARAM_NEGATIVE_1000 (-1000)
#define SIZE_1000 1000
#define SIZE_2000 2000
#define SIZE_100000 100000
using ScrollOffsetCallBack = std::function<void(std::shared_ptr<ListComponent>)>;

struct ScrollOffset {
    float horizontal;
    float vertical;
    int32_t duration;
    int32_t curve;
    int32_t spring;
    int32_t cross;
};

std::vector<double> ListScrollOffsetTest::listHorizontalData = {};
std::vector<double> ListScrollOffsetTest::listVerticalData = {};
std::vector<int32_t> ListScrollOffsetTest::setRetData = {};

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
};

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
};

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

static auto SetScrollOffset(ArkUI_NodeHandle list, ScrollOffset& scrollOffset, int32_t flag)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    switch (flag) {
        case PARAM_0: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_1: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_2: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve }, { .i32 = scrollOffset.spring } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_3: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve }, { .i32 = scrollOffset.spring },
                { .i32 = scrollOffset.cross } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        default:
            break;
    }
    return PARAM_NEGATIVE_1;
}

static auto CreateListScrollOffset(ScrollOffset scrollOffset, int32_t flag)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listPtr = ListScrollOffsetTest::CreateList();
    auto list = listPtr->GetComponent();
    auto ret = SetScrollOffset(list, scrollOffset, flag);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
        "ret = %{public}d, horizontal = %{public}f, vertical = %{public}f, ", ret, scrollOffset.horizontal,
        scrollOffset.vertical);
    PushBackIntData(ListScrollOffsetTest::setRetData, ret);
    auto btn = new ButtonComponent();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");

    nodeAPI->addChild(column, list);
    nodeAPI->addChild(column, btn->GetComponent());
    btn->RegisterOnClick([list, nodeAPI]() {
        auto horizon = nodeAPI->getAttribute(list, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
        auto vert = nodeAPI->getAttribute(list, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
            "horizon = %{public}f, vertical = %{public}f, ", horizon, vert);
        ListScrollOffsetTest::listHorizontalData.push_back(horizon);
        ListScrollOffsetTest::listVerticalData.push_back(vert);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
            "listHorizontalData = %{public}f, listVerticalData = %{public}f, ",
            ListScrollOffsetTest::listHorizontalData[PARAM_0], ListScrollOffsetTest::listVerticalData[PARAM_0]);
    });
    return column;
}

napi_value ListScrollOffsetTest::GetScrollOffsetData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollOffsetTest", "GetScrollOffsetData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListScrollOffsetTest::setRetData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListScrollOffsetTest::listHorizontalData, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiData(ListScrollOffsetTest::listVerticalData, env));
    ListScrollOffsetTest::setRetData.clear();
    ListScrollOffsetTest::listHorizontalData.clear();
    ListScrollOffsetTest::listVerticalData.clear();
    return result;
}

napi_value ListScrollOffsetTest::TestListScrollOffset001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset001", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_NEGATIVE_20;
    scrollOffset.vertical = PARAM_NEGATIVE_20;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset001",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset002", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_0;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset002",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset003", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset003", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_100;
    scrollOffset.vertical = PARAM_100;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset003",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset004", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset004", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = SIZE_100000;
    scrollOffset.vertical = SIZE_100000;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset004",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset005(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset005", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset005", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = PARAM_NEGATIVE_1000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset005",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset006(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset006", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset006", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset006",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset007(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset007", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset007", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset007",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset008(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset008", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset008", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset008",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset009(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset009", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset009", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_OUT;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset009",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset010(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset010", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset010", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_IN_OUT;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset010",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset011(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset011", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset011", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FAST_OUT_SLOW_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset011",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset012(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset012", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset012", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset012",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset013(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset013", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset013", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset013",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset014(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset014", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset014", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EXTREME_DECELERATION;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset014",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset015(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset015", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset015", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_SHARP;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset015",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset016(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset016", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset016", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_RHYTHM;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset016",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset017(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset017", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset017", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_SMOOTH;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset017",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset018(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset018", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset018", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FRICTION;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset018",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset019(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset019", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset019", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = PARAM_NEGATIVE_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset019",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset020(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset020", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset020", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = PARAM_13;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset020",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset021(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset021", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset021", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    scrollOffset.spring = PARAM_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset021",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollOffsetTest::TestListScrollOffset022(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset022", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset022", "GetContext env or info is null");
        return nullptr;
    }
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    scrollOffset.spring = PARAM_1;
    scrollOffset.cross = PARAM_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollOffset022",
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
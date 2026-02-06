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

#include "list_nested_scroll_event_test.h"

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "list_component.h"
#include "row_component.h"
#include "text_component.h"

static auto mode1 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
static auto mode2 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
static auto mode3 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
static auto mode4 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_PARALLEL;

namespace ArkUICapiTest {
std::vector<int32_t> ListNestedScrollTest::firstNestedScrollData = {};
std::vector<int32_t> ListNestedScrollTest::lastNestedScrollData = {};

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

static auto CreateNestedScrollNode(std::vector<std::shared_ptr<ScrollComponent>> scrolls1,
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2, std::vector<std::shared_ptr<ScrollComponent>> scrolls3)
{
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    auto row3 = std::make_shared<RowComponent>();
    for (auto scroll : scrolls1) {
        row1->AddChild(scroll);
    }
    for (auto scroll : scrolls2) {
        row2->AddChild(scroll);
    }
    for (auto scroll : scrolls3) {
        row3->AddChild(scroll);
    }
    column->AddChild(row1);
    column->AddChild(row2);
    column->AddChild(row3);

    return column;
}

napi_value ListNestedScrollTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "GetContext env or info is null");
        return nullptr;
    }
    auto scroll1 = CreateListByNestedScroll("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScroll("scroll2", mode2, mode1);
    auto scroll3 = CreateListByNestedScroll("scroll3", mode2, mode2);
    auto scroll4 = CreateListByNestedScroll("scroll4", mode2, mode3);
    auto scroll5 = CreateListByNestedScroll("scroll5", mode2, mode4);
    auto scroll6 = CreateListByNestedScroll("scroll6", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScroll("scroll7", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScroll("scroll8", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScroll("scroll9", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScroll("scroll10", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScroll("scroll11", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScroll("scroll12", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListNestedScrollTest::CreateNativeNodeSmall(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "GetContext env or info is null");
        return nullptr;
    }
    auto scroll1 = CreateListByNestedScroll<PARAM_8>("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScroll<PARAM_8>("scroll2", mode2, mode1);
    auto scroll3 = CreateListByNestedScroll<PARAM_8>("scroll3", mode2, mode2);
    auto scroll4 = CreateListByNestedScroll<PARAM_8>("scroll4", mode2, mode3);
    auto scroll5 = CreateListByNestedScroll<PARAM_8>("scroll5", mode2, mode4);
    auto scroll6 = CreateListByNestedScroll<PARAM_8>("scroll6", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScroll<PARAM_8>("scroll7", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScroll<PARAM_8>("scroll8", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScroll<PARAM_8>("scroll9", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScroll<PARAM_8>("scroll10", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScroll<PARAM_8>("scroll11", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScroll<PARAM_8>("scroll12", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListNestedScrollTest::CreateNativeNodeReset(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "GetContext env or info is null");
        return nullptr;
    }
    auto scroll1 = CreateListByNestedScrollReset("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScrollReset("scroll1", mode2, mode1);
    auto scroll3 = CreateListByNestedScrollReset("scroll1", mode2, mode2);
    auto scroll4 = CreateListByNestedScrollReset("scroll1", mode2, mode3);
    auto scroll5 = CreateListByNestedScrollReset("scroll1", mode2, mode4);
    auto scroll6 = CreateListByNestedScrollReset("scroll1", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScrollReset("scroll1", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScrollReset("scroll1", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScrollReset("scroll1", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScrollReset("scroll1", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScrollReset("scroll1", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScrollReset("scroll1", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);
    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value ListNestedScrollTest::ListGetNestedScrollData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "ListGetNestedScrollData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiData(ListNestedScrollTest::firstNestedScrollData, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiData(ListNestedScrollTest::lastNestedScrollData, env));
    ListNestedScrollTest::firstNestedScrollData.clear();
    ListNestedScrollTest::lastNestedScrollData.clear();
    return result;
}
} // namespace ArkUICapiTest
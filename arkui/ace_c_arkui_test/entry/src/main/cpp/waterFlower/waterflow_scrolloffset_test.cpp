/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "waterflow_scrolloffset_test.h"

#include <cstdint>
#include <thread>
#define SCROLL_NEGATIVE_20 (-20.0f)
#define SCROLL_0 0.0f
#define SCROLL_130 130.0f
#define SCROLL_100000 100000.0f

namespace ArkUICapiTest {

std::vector<double> WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo = {};

using ScrollTo2CallBack = std::function<void(std::shared_ptr<WaterFlowComponent>, float, float, bool)>;
using ScrollToBySectionOptionCallBack = std::function<void(
    std::shared_ptr<WaterFlowComponent>, std::vector<WaterFlowSection>, float hOffset, float vOffset, bool)>;
static std::vector<WaterFlowSection> WATER_FLOW_DEFAULT_INDEX_SECTION {
    { PARAM_4, PARAM_2, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr },
    { PARAM_6, PARAM_3, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr },
    { PARAM_4, PARAM_2, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr },
    { PARAM_6, PARAM_3, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr },
    { PARAM_4, PARAM_2, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr },
    { PARAM_6, PARAM_3, PARAM_0, PARAM_0, { PARAM_0, PARAM_0, PARAM_0, PARAM_0 }, nullptr, nullptr }
};

static napi_value SetArrayNapiDataWithGesture(const std::vector<double>& data, napi_env env)
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

static void PushBackFloatToData(std::vector<double>& data, double value)
{
    data.push_back(value);
}

static std::shared_ptr<ColumnComponent> CreateReloadColumn()
{
    auto col = std::make_shared<ColumnComponent>();
    col->SetWidth(SIZE_100);
    col->SetHeight(SIZE_80);
    col->SetBackgroundColor(COLOR_YELLOW);
    return col;
}

static auto CreateWaterFlowScrollOffsetNode(std::vector<std::shared_ptr<ColumnComponent>> scrolls1,
    std::vector<std::shared_ptr<ColumnComponent>> scrolls2, std::vector<std::shared_ptr<ColumnComponent>> scrolls3)
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

ScrollTo2CallBack change = [](std::shared_ptr<WaterFlowComponent> waterFlow, float hOffset, float vOffset, bool isRow) {
    if (isRow) {
        waterFlow->SetLayoutDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    waterFlow->SetWaterFlowScrollToIndex(PARAM_6, PARAM_0, ARKUI_SCROLL_ALIGNMENT_START);
    waterFlow->SetScrollTo(hOffset, vOffset, {});
    std::thread th(
        [](std::shared_ptr<WaterFlowComponent> waterFlow, float hOffset, float vOffset, bool isRow) {
            std::this_thread::sleep_for(std::chrono::milliseconds(PARAM_2000));
            auto item = waterFlow->getAttribute(NODE_SCROLL_OFFSET);
            PushBackFloatToData(WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo, item->value[0].f32);
            PushBackFloatToData(WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo, item->value[1].f32);
        },
        waterFlow, hOffset, vOffset, isRow);
    th.detach();
};

static ScrollToBySectionOptionCallBack AddSectionOption = [](std::shared_ptr<WaterFlowComponent> waterFlow,
                                                              std::vector<WaterFlowSection> sections, float hOffset,
                                                              float vOffset, bool isRow) {
    if (isRow) {
        waterFlow->SetLayoutDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    // set water flow section option
    auto options = std::make_shared<WaterFlowSectionOption>();
    options->SetSize(sections.size());
    for (int i = PARAM_0; i < sections.size(); i++) {
        options->SetSection(i, sections[i]);
    }
    // reloadItem
    auto adapter = waterFlow->GetAdapter();
    adapter->ReloadItem(PARAM_5, CreateReloadColumn());
    // waterFlow
    waterFlow->SetWaterFlowSectionOption(PARAM_0, options);
    waterFlow->SetWaterFlowScrollToIndex(PARAM_11, PARAM_0, ARKUI_SCROLL_ALIGNMENT_START);
    waterFlow->SetScrollTo(hOffset, vOffset, {});
    // getAttribute
    std::thread th(
        [](std::shared_ptr<WaterFlowComponent> waterFlow, float hOffset, float vOffset, bool isRow) {
            std::this_thread::sleep_for(std::chrono::milliseconds(PARAM_2000));
            auto item = waterFlow->getAttribute(NODE_SCROLL_OFFSET);
            PushBackFloatToData(WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo, item->value[PARAM_0].f32);
            PushBackFloatToData(WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo, item->value[PARAM_1].f32);
        },
        waterFlow, hOffset, vOffset, isRow);
    th.detach();
};

napi_value WaterFlowScrollOffsetTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollOffsetTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollOffsetTest", "GetContext env or info is null");
        return nullptr;
    }

    auto col1 = CreateWaterFlow<SIZE_60>(change, SCROLL_NEGATIVE_20, SCROLL_0, true);
    auto col2 = CreateWaterFlow<SIZE_60>(change, SCROLL_0, SCROLL_0, true);
    auto col3 = CreateWaterFlow<SIZE_60>(change, SCROLL_130, SCROLL_0, true);
    auto col4 = CreateWaterFlow<SIZE_60>(change, SCROLL_100000, SCROLL_0, true);
    auto col5 = CreateWaterFlow<SIZE_60>(change, SCROLL_0, SCROLL_NEGATIVE_20, false);
    auto col6 = CreateWaterFlow<SIZE_60>(change, SCROLL_0, SCROLL_0, false);
    auto col7 = CreateWaterFlow<SIZE_60>(change, SCROLL_0, SCROLL_130, false);
    auto col8 = CreateWaterFlow<SIZE_60>(change, SCROLL_0, SCROLL_100000, false);
    auto col9 =
        CreateWaterFlow<SIZE_30>(AddSectionOption, WATER_FLOW_DEFAULT_INDEX_SECTION, SCROLL_0, SCROLL_130, false);
    auto col10 =
        CreateWaterFlow<SIZE_30>(AddSectionOption, WATER_FLOW_DEFAULT_INDEX_SECTION, SCROLL_130, SCROLL_0, true);
    std::vector<std::shared_ptr<ColumnComponent>> cols1 = { col1, col2, col3, col4 };
    std::vector<std::shared_ptr<ColumnComponent>> cols2 = { col5, col6, col7, col8 };
    std::vector<std::shared_ptr<ColumnComponent>> cols3 = { col9, col10 };
    auto column = CreateWaterFlowScrollOffsetNode(cols1, cols2, cols3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowScrollOffsetTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value WaterFlowScrollOffsetTest::WaterFlowScrollOffsetData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest", "GetGestureData");
    napi_value result;
    napi_create_array(env, &result);

    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithGesture(WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo, env));

    WaterFlowScrollOffsetTest::waterFlowScrollOffsetInfo.clear();
    return result;
}
} // namespace ArkUICapiTest
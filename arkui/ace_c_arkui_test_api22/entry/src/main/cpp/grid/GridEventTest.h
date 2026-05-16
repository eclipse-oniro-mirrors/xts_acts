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

#ifndef GRID_EVENT_TEST_H
#define GRID_EVENT_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include "component/FlowItemComponentTest.h"

#include "component/ColumnComponentTest.h"
#include "common/common.h"
#include "component/TextComponentTest.h"
#include "component/GridComponentTest.h"
#include "component/node_adapter.h"

namespace ArkUICapiTest {
#define COLOR_BASE 0xFFFFFF
constexpr int32_t EVENT_GRID_ITEM_COUNT = PARAM_15;
constexpr int32_t GRID_ITEM_COUNT = 100;
constexpr int32_t GRID_ITEM_COUNT_80 = 80;

class GridEventTest {
public:
    ~GridEventTest() = default;
    static napi_value GridOnScrollIndexTest(napi_env env, napi_callback_info info);
    static napi_value GridOnDidScrollTest(napi_env env, napi_callback_info info);
    static napi_value GridOnScrollBarUpdateTest(napi_env env, napi_callback_info info);
    static napi_value GridOnWillScrollTest(napi_env env, napi_callback_info info);
    
    static std::vector<double> willOffsetData;
    static std::vector<int32_t> willStateData;
    static std::vector<int32_t> willSourceData;
    static std::vector<double> didOffsetData;
    static std::vector<int32_t> didStateData;
    static std::vector<int32_t> firstScrollIndexData;
    static std::vector<int32_t> lastScrollIndexData;
    static std::vector<int32_t> timeData;
};
} // namespace ArkUICapiTest
#endif // GRID_EVENT_TEST_H
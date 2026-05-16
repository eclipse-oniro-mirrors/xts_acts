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

#ifndef ARKUI_CAPI_XTS_WATERFLOW_FILLPOLICY_TEST_H
#define ARKUI_CAPI_XTS_WATERFLOW_FILLPOLICY_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include "component/ColumnComponentTest.h"
#include "common/common.h"
#include "component/TextComponentTest.h"
#include "component/WaterFlowComponentTest.h"
#define COLOR_BASE 0xFFFFFF

namespace ArkUICapiTest {
constexpr int32_t EVENT_FLOW_ITEM_COUNT = 100;
class WaterFlowTest {
public:
    ~WaterFlowTest() = default;
    static napi_value WaterFlowFillPolicyTest(napi_env env, napi_callback_info info);
private:
    static std::shared_ptr<WaterFlowComponent> CreateWaterFlow()
    {
        auto waterFlow = std::make_shared<WaterFlowComponent>();
        auto input = std::vector<std::shared_ptr<Component>>();
        auto adapter = std::make_shared<ItemAdapter<FlowItemComponent>>(input);

        waterFlow->SetPercentWidth(PARAM_0_POINT_8);
        waterFlow->SetPercentHeight(PARAM_0_POINT_6);
        waterFlow->SetBackgroundColor(COLOR_GRAY);
        waterFlow->SetLazyAdapter(adapter);

        for (int i = PARAM_0; i < EVENT_FLOW_ITEM_COUNT; i++) {
            auto col = std::make_shared<ColumnComponent>();
            col->SetPercentWidth(PARAM_0_POINT_2);
            col->SetPercentHeight(PARAM_0_POINT_2);
            col->SetBackgroundColor(((i + PARAM_1) * COLOR_BASE / EVENT_FLOW_ITEM_COUNT) | COLOR_BLACK);
            adapter->InsertItem(i, col);
        }
        return waterFlow;
    }
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_WATERFLOW_FILLPOLICY_TEST_H
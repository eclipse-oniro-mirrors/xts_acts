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

#include "WaterFlowFillPolicyTest.h"
#include <thread>
#include "manager/PluginManagerTest.h"
#include "component/ButtonComponentTest.h"
#include "component/RowComponentTest.h"

namespace ArkUICapiTest {
napi_value WaterFlowTest::WaterFlowFillPolicyTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowFillPolicyTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowFillPolicyTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto waterFlow = CreateWaterFlow();
    waterFlow->SetColumnsTemplate(PARAM_NEGATIVE_1);
    waterFlow->SetId("waterFlow");
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetLabel("0");
    btn->SetId("btn");
    btn->RegisterOnClick([waterFlow]() {
        waterFlow->SetColumnsTemplate(PARAM_0);
    });
    auto btn1 = std::make_shared<ButtonComponent>();
    btn1->SetLabel("1");
    btn1->SetId("btn1");
    btn1->RegisterOnClick([waterFlow]() {
        waterFlow->SetColumnsTemplate(PARAM_1);
    });
    auto btn2 = std::make_shared<ButtonComponent>();
    btn2->SetLabel("2");
    btn2->SetId("btn2");
    btn2->RegisterOnClick([waterFlow]() {
        waterFlow->SetColumnsTemplate(PARAM_2);
    });
    auto btn3 = std::make_shared<ButtonComponent>();
    btn3->SetLabel("-1");
    btn3->SetId("btn3");
    btn3->RegisterOnClick([waterFlow]() {
        waterFlow->SetColumnsTemplate(PARAM_NEGATIVE_1);
    });
    auto column = new ColumnComponent();
    auto row = std::make_shared<RowComponent>();
    row->AddChild(btn);
    row->AddChild(btn1);
    row->AddChild(btn2);
    row->AddChild(btn3);
    column->AddChild(row);
    column->AddChild(waterFlow);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "WaterFlowFillPolicyTest",
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
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "../component/column_component.h"
#include "../component/datepicker_component.h"
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include "datepicker_test.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>

namespace ArkUICapiTest {
    
napi_value DatePickerTest::DatePickerModeTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DatePickerModeTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DatePickerModeTest",
            "GetContext env or info is null");
        return nullptr;
    }
    
    auto datepicker1 = std::make_shared<DatePickerComponent>();
    datepicker1->SetDatePickerMode(ARKUI_DATEPICKER_MODE_DATE);
    datepicker1->SetDatePickerSelected("2024-12-31");
    datepicker1->SetDatePickerStart("2000-1-1");
    datepicker1->SetDatePickerEnd("2025-2-2");
    datepicker1->SetId("datePickerMode1");
    
    auto datepicker2 = std::make_shared<DatePickerComponent>();
    datepicker2->SetDatePickerMode(ARKUI_DATEPICKER_YEAR_AND_MONTH);
    datepicker2->SetDatePickerSelected("2024-12-31");
    datepicker2->SetDatePickerStart("2000-1-1");
    datepicker2->SetDatePickerEnd("2025-2-2");
    datepicker2->SetId("datePickerMode2");
    
    auto datepicker3 = std::make_shared<DatePickerComponent>();
    datepicker3->SetDatePickerMode(ARKUI_DATEPICKER_MONTH_AND_DAY);
    datepicker3->SetDatePickerSelected("2024-12-31");
    datepicker3->SetDatePickerStart("2000-1-1");
    datepicker3->SetDatePickerEnd("2025-2-2");
    datepicker3->SetId("datePickerMode3");
    
    auto column = new ColumnComponent();
    column->AddChild(datepicker1);
    column->AddChild(datepicker2);
    column->AddChild(datepicker3);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DatePickerModeTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

} // ArkUICapiTest

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

#include "../manager/plugin_manager.h"
#include "calendarPicker_date_test.h"
#include "../component/column_component.h"
#include <arkui/native_dialog.h>
#include <arkui/native_type.h>
#include <string>
#include "../component/calendarPicker_component.h"
  
namespace ArkUICapiTest {
  
napi_value CalendarPickerStartEndTest::CalendarPickerDateTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerStartEndTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerStartEndTest",
            "GetContext env or info is null");
        return nullptr;
    }
      
    auto calendarPicker = std::make_shared<CalendarPickerComponent>();
    calendarPicker->SetCalendarPickerStart("2024-12-01");
    calendarPicker->SetCalendarPickerEnd("2025-12-30");
    calendarPicker->SetId("CalendarPickerDate_001");
      
    auto column = new ColumnComponent();
    column->AddChild(calendarPicker);
  
    // 所有组件挂载到XComponent
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerStartEndTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
  
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
  
    return exports;
}
  
} // namespace ArkUICApiDemo
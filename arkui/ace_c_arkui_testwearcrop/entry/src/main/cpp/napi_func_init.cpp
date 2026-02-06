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
#include "calendarpicker/calendarpicker_edgealign_test.cpp"
#include "calendarpicker/calendarpicker_textstyle_test.cpp"
#include "common/common.h"

#include "calendarpicker/calendarpicker_width_test.cpp"
#include "calendarpicker/calendarpicker_hintradius_test.cpp"
#include "calendarpicker/calendarpicker_selecteddate_test.cpp"




namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }
    napi_property_descriptor desc[] = {  
        {"testCalendarPickerHintRadius001", nullptr, TestCalendarPickerHintRadius001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius002", nullptr, TestCalendarPickerHintRadius002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius003", nullptr, TestCalendarPickerHintRadius003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius004", nullptr, TestCalendarPickerHintRadius004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius005", nullptr, TestCalendarPickerHintRadius005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius006", nullptr, TestCalendarPickerHintRadius006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerHintRadius007", nullptr, TestCalendarPickerHintRadius007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerEdgeAlign001", nullptr, TestCalendarPickerEdgeAlign001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerEdgeAlign002", nullptr, TestCalendarPickerEdgeAlign002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerEdgeAlign003", nullptr, TestCalendarPickerEdgeAlign003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerEdgeAlign004", nullptr, TestCalendarPickerEdgeAlign004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle001", nullptr, TestCalendarPickerTextStyle001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle002", nullptr, TestCalendarPickerTextStyle002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle003", nullptr, TestCalendarPickerTextStyle003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle004", nullptr, TestCalendarPickerTextStyle004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle005", nullptr, TestCalendarPickerTextStyle005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle006", nullptr, TestCalendarPickerTextStyle006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle007", nullptr, TestCalendarPickerTextStyle007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle008", nullptr, TestCalendarPickerTextStyle008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle009", nullptr, TestCalendarPickerTextStyle009, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle010", nullptr, TestCalendarPickerTextStyle010, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle011", nullptr, TestCalendarPickerTextStyle011, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle012", nullptr, TestCalendarPickerTextStyle012, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle013", nullptr, TestCalendarPickerTextStyle013, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle014", nullptr, TestCalendarPickerTextStyle014, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle015", nullptr, TestCalendarPickerTextStyle015, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerTextStyle016", nullptr, TestCalendarPickerTextStyle016, nullptr, nullptr, nullptr,
         napi_default, nullptr}, 
        {"testCalendarPickerWidth001", nullptr, TestCalendarPickerWidth001, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testCalendarPickerWidth002", nullptr, TestCalendarPickerWidth002, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testCalendarPickerWidth003", nullptr, TestCalendarPickerWidth003, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testCalendarPickerWidth004", nullptr, TestCalendarPickerWidth004, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"testCalendarPickerEdgeAlign005", nullptr, TestCalendarPickerEdgeAlign005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerSelectedDate001", nullptr, TestCalendarPickerSelectedDate001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerSelectedDate002", nullptr, TestCalendarPickerSelectedDate002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerSelectedDate003", nullptr, TestCalendarPickerSelectedDate003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerSelectedDate004", nullptr, TestCalendarPickerSelectedDate004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testCalendarPickerSelectedDate005", nullptr, TestCalendarPickerSelectedDate005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
       
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module nativefuncModule = {.nm_version = 1,
                                       .nm_flags = 0,
                                       .nm_filename = nullptr,
                                       .nm_register_func = Init,
                                       .nm_modname = "nativefunc",
                                       .nm_priv = ((void *)0),
                                       .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativefuncModule); }
} // namespace ArkUICapiTest
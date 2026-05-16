/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include "TextCommon/TextCommonEnumTest.cpp"
#include "TextArea/TextAreaEnumTest.cpp"
#include "TextInput/TextInputEnumTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TextEnumTest_001", nullptr, TextEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_002", nullptr, TextEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_003", nullptr, TextEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_004", nullptr, TextEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_005", nullptr, TextEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_006", nullptr, TextEnumTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_007", nullptr, TextEnumTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_008", nullptr, TextEnumTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_009", nullptr, TextEnumTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_010", nullptr, TextEnumTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_011", nullptr, TextEnumTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_012", nullptr, TextEnumTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_013", nullptr, TextEnumTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_014", nullptr, TextEnumTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_015", nullptr, TextEnumTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_016", nullptr, TextEnumTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_017", nullptr, TextEnumTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_018", nullptr, TextEnumTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_019", nullptr, TextEnumTest_019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_020", nullptr, TextEnumTest_020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_021", nullptr, TextEnumTest_021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_022", nullptr, TextEnumTest_022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_023", nullptr, TextEnumTest_023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_024", nullptr, TextEnumTest_024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_025", nullptr, TextEnumTest_025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_026", nullptr, TextEnumTest_026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_027", nullptr, TextEnumTest_027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_028", nullptr, TextEnumTest_028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_029", nullptr, TextEnumTest_029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_030", nullptr, TextEnumTest_030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_031", nullptr, TextEnumTest_031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_032", nullptr, TextEnumTest_032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_033", nullptr, TextEnumTest_033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_034", nullptr, TextEnumTest_034, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextAreaEnumTest_001", nullptr, TextAreaEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_002", nullptr, TextAreaEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_003", nullptr, TextAreaEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_004", nullptr, TextAreaEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_005", nullptr, TextAreaEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_006", nullptr, TextAreaEnumTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextInputEnumTest_001", nullptr, TextInputEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_002", nullptr, TextInputEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_003", nullptr, TextInputEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_004", nullptr, TextInputEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_005", nullptr, TextInputEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
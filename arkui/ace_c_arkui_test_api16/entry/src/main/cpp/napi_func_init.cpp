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
#include "common/common.h"
#include "text/text_immutablf_font_weight.cpp"
#include "button/button_type_test.cpp"
#include "textinput/textinput_wordbreak_test.cpp"
namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"textImmutablfFontWeight_001", nullptr, textImmutablfFontWeight_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_002", nullptr, textImmutablfFontWeight_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_003", nullptr, textImmutablfFontWeight_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_004", nullptr, textImmutablfFontWeight_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_005", nullptr, textImmutablfFontWeight_005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_006", nullptr, textImmutablfFontWeight_006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_007", nullptr, textImmutablfFontWeight_007,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_008", nullptr, textImmutablfFontWeight_008,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_009", nullptr, textImmutablfFontWeight_009,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_010", nullptr, textImmutablfFontWeight_010,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_011", nullptr, textImmutablfFontWeight_011,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_012", nullptr, textImmutablfFontWeight_012,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_013", nullptr, textImmutablfFontWeight_013,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_014", nullptr, textImmutablfFontWeight_014,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_015", nullptr, textImmutablfFontWeight_015,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textImmutablfFontWeight_016", nullptr, textImmutablfFontWeight_016,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testButtonType006", nullptr, TestButtonType006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testButtonType007", nullptr, TestButtonType007, nullptr, nullptr, nullptr, napi_default, nullptr},
		{"testTextInputWordBreak001", nullptr, TestTextInputWordBreak001, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"testTextInputWordBreak002", nullptr, TestTextInputWordBreak002, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"testTextInputWordBreak003", nullptr, TestTextInputWordBreak003, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"testTextInputWordBreak004", nullptr, TestTextInputWordBreak004, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"testTextInputWordBreak005", nullptr, TestTextInputWordBreak005, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"testTextInputWordBreak006", nullptr, TestTextInputWordBreak006, nullptr, nullptr, nullptr,
         napi_default, nullptr }, 
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

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
#include "node/NodeAdoptChildTest.cpp"
#include "touchTestInfo/ErrorCodeTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TestNodeAdoptChild001", nullptr, TestNodeAdoptChild001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild002", nullptr, TestNodeAdoptChild002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild003", nullptr, TestNodeAdoptChild003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild004", nullptr, TestNodeAdoptChild004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild005", nullptr, TestNodeAdoptChild005, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild006", nullptr, TestNodeAdoptChild006, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild007", nullptr, TestNodeAdoptChild007, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild008", nullptr, TestNodeAdoptChild008, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild009", nullptr, TestNodeAdoptChild009, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild010", nullptr, TestNodeAdoptChild010, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild011", nullptr, TestNodeAdoptChild011, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild012", nullptr, TestNodeAdoptChild012, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild013", nullptr, TestNodeAdoptChild013, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild014", nullptr, TestNodeAdoptChild014, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild015", nullptr, TestNodeAdoptChild015, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild016", nullptr, TestNodeAdoptChild016, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild017", nullptr, TestNodeAdoptChild017, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild018", nullptr, TestNodeAdoptChild018, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild019", nullptr, TestNodeAdoptChild019, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild020", nullptr, TestNodeAdoptChild020, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild021", nullptr, TestNodeAdoptChild021, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild022", nullptr, TestNodeAdoptChild022, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild023", nullptr, TestNodeAdoptChild023, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild024", nullptr, TestNodeAdoptChild024, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild025", nullptr, TestNodeAdoptChild025, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild026", nullptr, TestNodeAdoptChild026, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild027", nullptr, TestNodeAdoptChild027, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild028", nullptr, TestNodeAdoptChild028, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild029", nullptr, TestNodeAdoptChild029, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild030", nullptr, TestNodeAdoptChild030, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild031", nullptr, TestNodeAdoptChild031, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild032", nullptr, TestNodeAdoptChild032, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild033", nullptr, TestNodeAdoptChild033, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild034", nullptr, TestNodeAdoptChild034, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild035", nullptr, TestNodeAdoptChild035, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild036", nullptr, TestNodeAdoptChild036, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild037", nullptr, TestNodeAdoptChild037, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild038", nullptr, TestNodeAdoptChild038, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild039", nullptr, TestNodeAdoptChild039, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild040", nullptr, TestNodeAdoptChild040, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild041", nullptr, TestNodeAdoptChild041, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild042", nullptr, TestNodeAdoptChild042, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild043", nullptr, TestNodeAdoptChild043, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild044", nullptr, TestNodeAdoptChild044, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild045", nullptr, TestNodeAdoptChild045, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild046", nullptr, TestNodeAdoptChild046, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild047", nullptr, TestNodeAdoptChild047, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild048", nullptr, TestNodeAdoptChild048, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild049", nullptr, TestNodeAdoptChild049, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild050", nullptr, TestNodeAdoptChild050, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild051", nullptr, TestNodeAdoptChild051, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild052", nullptr, TestNodeAdoptChild052, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild053", nullptr, TestNodeAdoptChild053, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild054", nullptr, TestNodeAdoptChild054, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild055", nullptr, TestNodeAdoptChild055, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild056", nullptr, TestNodeAdoptChild056, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild057", nullptr, TestNodeAdoptChild057, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild058", nullptr, TestNodeAdoptChild058, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild059", nullptr, TestNodeAdoptChild059, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild060", nullptr, TestNodeAdoptChild060, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild061", nullptr, TestNodeAdoptChild061, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild062", nullptr, TestNodeAdoptChild062, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild063", nullptr, TestNodeAdoptChild063, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild064", nullptr, TestNodeAdoptChild064, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild065", nullptr, TestNodeAdoptChild065, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild066", nullptr, TestNodeAdoptChild066, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild067", nullptr, TestNodeAdoptChild067, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestNodeAdoptChild068", nullptr, TestNodeAdoptChild068, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestErrorCode001", nullptr, TestErrorCode001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestErrorCode002", nullptr, TestErrorCode002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestErrorCode003", nullptr, TestErrorCode003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestErrorCode004", nullptr, TestErrorCode004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"TestErrorCode005", nullptr, TestErrorCode005, nullptr, nullptr, nullptr,
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
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
#include "matrix4/ErrorCodeTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TestErrorCode001", nullptr, TestErrorCode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode002", nullptr, TestErrorCode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode003", nullptr, TestErrorCode003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode004", nullptr, TestErrorCode004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode005", nullptr, TestErrorCode005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode006", nullptr, TestErrorCode006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode007", nullptr, TestErrorCode007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode008", nullptr, TestErrorCode008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode009", nullptr, TestErrorCode009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode010", nullptr, TestErrorCode010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode011", nullptr, TestErrorCode011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestErrorCode012", nullptr, TestErrorCode012, nullptr, nullptr, nullptr, napi_default, nullptr},
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
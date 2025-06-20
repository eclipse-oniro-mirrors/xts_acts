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
#include "common/common.h"
#include "customdialog/customdialog_test.cpp"
#include "customdialog/customdialog_background.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"testCustomDialog001", nullptr, TestCustomDialog001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomDialog002", nullptr, TestCustomDialog002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomDialogWidth", nullptr, TestCustomDialogWidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomDialogHeight", nullptr, TestCustomDialogHeight, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomDialogBorderWidth", nullptr, TestCustomDialogBorderWidth, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testCustomDialogBorderColor", nullptr, TestCustomDialogBorderColor, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testCustomDialogBorderStyle", nullptr, TestCustomDialogBorderStyle, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testCustomDialogShadow", nullptr, TestCustomDialogShadow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomDialogCustomShadow", nullptr, TestCustomDialogCustomShadow, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogBackgroundBlurStyle", nullptr, TestCustomDialogBackgroundBlurStyle, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testCustomDialogKeyboardAvoidMode", nullptr, TestCustomDialogKeyboardAvoidMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogEnableHoverMode", nullptr, TestCustomDialogEnableHoverMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogHoverModeArea", nullptr, TestCustomDialogHoverModeArea, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogLevelMode", nullptr, TestCustomDialogLevelMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogLevelUniqueId", nullptr, TestCustomDialogLevelUniqueId, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogImmersiveMode", nullptr, TestCustomDialogImmersiveMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogBackgroundColor", nullptr, TestCustomDialogBackgroundColor, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomDialogCornerRadius", nullptr, TestCustomDialogCornerRadius, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomModalMode", nullptr, TestCustomModalMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomAutoCancel", nullptr, TestCustomAutoCancel, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"testCustomMask", nullptr, TestCustomMask, nullptr, nullptr, nullptr,
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

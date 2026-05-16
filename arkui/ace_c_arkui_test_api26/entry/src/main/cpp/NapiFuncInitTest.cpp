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
#include "onAreaChange/AreaChangeErrorCodeTest.cpp"
#include "gestureIntercept/GestureErrorCodeTest.cpp"
#include "scroll/scrollWithMouseTest.cpp"
#include "scroll/autoAdjustMarginTest.cpp"
#include "list/listBackBehaviorTest.cpp"
#include "inspectorLabel/InspectorLabelTest.cpp"
#include "accessibilityFocusId/AccessibilityFocusIdTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"AreaChangeErrorCode001", nullptr, AreaChangeErrorCode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AreaChangeErrorCode002", nullptr, AreaChangeErrorCode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode001", nullptr, GestureInterceptErrorCode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode002", nullptr, GestureInterceptErrorCode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode003", nullptr, GestureInterceptErrorCode003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode004", nullptr, GestureInterceptErrorCode004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptNullTest001", nullptr, GestureInterceptNullTest001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ScrollWithMouseTest_001", nullptr, ScrollWithMouseTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_002", nullptr, ScrollWithMouseTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_003", nullptr, ScrollWithMouseTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_004", nullptr, ScrollWithMouseTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_001", nullptr, AutoAdjustMarginTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_002", nullptr, AutoAdjustMarginTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_003", nullptr, AutoAdjustMarginTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_004", nullptr, AutoAdjustMarginTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_001", nullptr, ListBackBehaviorTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},	 
        {"ListBackBehaviorTest_002", nullptr, ListBackBehaviorTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},	 
        {"ListBackBehaviorTest_003", nullptr, ListBackBehaviorTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_004", nullptr, ListBackBehaviorTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_001", nullptr, InspectorLabelTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_002", nullptr, InspectorLabelTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_003", nullptr, InspectorLabelTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityNextFocusIdTest_001", nullptr, AccessibilityNextFocusIdTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityNextFocusIdTest_002", nullptr, AccessibilityNextFocusIdTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityDefaultFocusTest_001", nullptr, AccessibilityDefaultFocusTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityDefaultFocusTest_002", nullptr, AccessibilityDefaultFocusTest_002, nullptr, nullptr, nullptr,
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
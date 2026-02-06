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
#include "manager/plugin_manager.h"
#include "setKeyProcessingMode/key_processing_mode.h"
#include "scroll/scroll_backtotop_test.h"
#include "keyDisPatchTest/keyEventDispatch_test.h"
#include "focusControl/focus_Control.h"
#include "getGestureParam/getGestureParam.h"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"KeyEventPatchTest", nullptr, KeyEventDispatchTest::KeyEventPatchTest,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventData", nullptr, KeyEventDispatchTest::GetKeyEventData,
         nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"KeyProcessingMode001", nullptr, KeyProcessingMode::KeyProcessingMode001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyProcessingMode002", nullptr, KeyProcessingMode::KeyProcessingMode002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollBackToTopTest", nullptr, ScrollBackToTopTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
		 
		 {"FocusControlTest_003", nullptr, FocusControlTest::FocusControlTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
         {"FocusControlTest_004", nullptr, FocusControlTest::FocusControlTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"GetGestureParamTest_a", nullptr, GetGestureParamTest::GetGestureParamTest_a, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_a1", nullptr, GetGestureParamTest::GetGestureParamTest_a1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_b", nullptr, GetGestureParamTest::GetGestureParamTest_b, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_c", nullptr, GetGestureParamTest::GetGestureParamTest_c, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_d", nullptr, GetGestureParamTest::GetGestureParamTest_d, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_e", nullptr, GetGestureParamTest::GetGestureParamTest_e, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_f", nullptr, GetGestureParamTest::GetGestureParamTest_f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_g", nullptr, GetGestureParamTest::GetGestureParamTest_g, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_h", nullptr, GetGestureParamTest::GetGestureParamTest_h, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_i", nullptr, GetGestureParamTest::GetGestureParamTest_i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_j", nullptr, GetGestureParamTest::GetGestureParamTest_j, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGestureParamTest_j1", nullptr, GetGestureParamTest::GetGestureParamTest_j1, nullptr, nullptr, nullptr, napi_default, nullptr},  
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }

    PluginManager::GetInstance()->Export(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativerenderModule = {.nm_version = 1,
                                         .nm_flags = 0,
                                         .nm_filename = nullptr,
                                         .nm_register_func = Init,
                                         .nm_modname = "nativerender",
                                         .nm_priv = ((void *)0),
                                         .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativerenderModule); }
} // namespace ArkUICapiTest

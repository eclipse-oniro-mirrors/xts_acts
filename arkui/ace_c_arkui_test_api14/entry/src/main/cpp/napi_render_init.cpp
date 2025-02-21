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
#include "customproperty/custom_property_test.h"
#include "keyEvent/keyEvent_GetType.h"
#include "keyEvent/keyEvent_GetKeyCode.h"
#include "keyEvent/keyEvent_GetDeviceId.h"
#include "keyEvent/keyEvent_GetKeyIntensionCode.h"
#include "keyEvent/keyEvent_GetKeySource.h"
#include "keyEvent/keyEvent_GetKeyText.h"
#include "keyEvent/keyEvent_GetPressedKeys.h"
#include "keyEvent/keyEvent_GetUnicode.h"
#include "keyEvent/keyEvent_SetConsumed.h"
#include "keyEvent/keyEvent_StopPropagation.h"
#include "styledString/styledString_test.h"

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
        {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetCustomProperty", nullptr, CustomPropertyTest::testGetCustomProperty001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetParentInPageTree", nullptr, CustomPropertyTest::testGetParentInPageTree002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetActiveChildrenInfo", nullptr, CustomPropertyTest::testGetActiveChildrenInfo003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetCurrentPageRootNode", nullptr, CustomPropertyTest::testGetCurrentPageRootNode004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testIsCreatedByNDK", nullptr, CustomPropertyTest::testIsCreatedByNDK005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetNodeType", nullptr, CustomPropertyTest::testGetNodeType006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomPropertyDestroy", nullptr, CustomPropertyTest::testCustomPropertyDestroy007,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testCustomPropertyGetStringValue", nullptr, CustomPropertyTest::testCustomPropertyGetStringValue008,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testActiveChildrenInfoDestroy", nullptr, CustomPropertyTest::testActiveChildrenInfoDestroy009,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testActiveChildrenInfoGetNodeByIndex", nullptr, CustomPropertyTest::testActiveChildrenInfoGetNodeByIndex010,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testActiveChildrenInfoGetCount", nullptr, CustomPropertyTest::testActiveChildrenInfoGetCount011,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyEventGetTypeTest_001", nullptr, KeyEventGetTypeTest::KeyEventGetTypeTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},

        {"KeyEventGetKeyCodeTest_001", nullptr, KeyEventGetKeyCodeTest::KeyEventGetKeyCodeTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},
         
        {"KeyEventGetKeyTextTest_001", nullptr, KeyEventGetKeyTextTest::KeyEventGetKeyTextTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},

        {"KeyEventGetKeySourceTest_001", nullptr, KeyEventGetKeySourceTest::KeyEventGetKeySourceTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},

        {"KeyEventGetGetDeviceIdTest_001", nullptr, KeyEventGetGetDeviceIdTest::KeyEventGetGetDeviceIdTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},
         
        {"KeyEventStopPropagationTest_001", nullptr, KeyEventStopPropagationTest::KeyEventStopPropagationTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyEventGetPressedKeysTest_001", nullptr, KeyEventGetPressedKeysTest::KeyEventGetPressedKeysTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},

        {"KeyEventGetKeyIntensionCodeTest_001", nullptr, KeyEventGetKeyIntensionCodeTest::KeyEventGetKeyIntensionCodeTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},

        {"KeyEventGetUnicodeTest_001", nullptr, KeyEventGetUnicodeTest::KeyEventGetUnicodeTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},
         
        {"KeyEventSetConsumedTest_001", nullptr, KeyEventSetConsumedTest::KeyEventSetConsumedTest_001,nullptr, nullptr, nullptr, napi_default, nullptr},
		
		{"testStyledString001", nullptr, StyledStringTest::testStyledString001, 
		 nullptr, nullptr, nullptr, napi_default, nullptr},
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

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
#include "invalidate/InvalidateAttributesTest.cpp"
#include "commonEvent/RegisterCommonEventTest.cpp"
#include "allowForceDark/AllowForceDarkTest.cpp"
#include "Image/ImageContentTransitionEffectTest.cpp"
#include "nodeUtil/NodeUtilsMethodTest.cpp"
#include "scroll/ScrollEventTypeTest.cpp"
#include "list/ListEventTypeTest.cpp"
#include "refresh/RefreshEventTypeTest.cpp"
#include "waterFlow/WaterFlowEventTypeTest.cpp"
#include "grid/GridEventTypeTest.cpp"

namespace ArkUICapiTest
{
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        if ((env == nullptr) || (exports == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"TestInvalidateAttributes", nullptr, TestInvalidateAttributes, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRegisterCommonEvent001", nullptr, TestRegisterCommonEvent001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRegisterCommonEvent002", nullptr, TestRegisterCommonEvent002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestRegisterCommonEvent003", nullptr, TestRegisterCommonEvent003, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestAllowForceDark", nullptr, TestAllowForceDark, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestImageContentTransitionEffect001", nullptr, TestAllowForceDark, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestImageContentTransitionEffect002", nullptr, TestAllowForceDark, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"enum_GetEventType_Scroll", nullptr, Enum_GetEventType_Scroll, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"enum_GetEventType_List", nullptr, Enum_GetEventType_List, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"enum_GetEventType_Refresh", nullptr, Enum_GetEventType_Refresh, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"enum_GetEventType_WaterFlow", nullptr, Enum_GetEventType_WaterFlow, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"enum_GetEventType_Grid", nullptr, Enum_GetEventType_Grid, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue001", nullptr, TestMethodReturnValue001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue002", nullptr, TestMethodReturnValue002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue003", nullptr, TestMethodReturnValue003, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue004", nullptr, TestMethodReturnValue004, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue005", nullptr, TestMethodReturnValue005, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestMethodReturnValue006", nullptr, TestMethodReturnValue006, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode001", nullptr, TestNodeErrorCode001, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode002", nullptr, TestNodeErrorCode002, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode003", nullptr, TestNodeErrorCode003, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode004", nullptr, TestNodeErrorCode004, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode005", nullptr, TestNodeErrorCode005, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode006", nullptr, TestNodeErrorCode006, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode007", nullptr, TestNodeErrorCode007, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode008", nullptr, TestNodeErrorCode008, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode009", nullptr, TestNodeErrorCode009, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode010", nullptr, TestNodeErrorCode010, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"TestNodeErrorCode011", nullptr, TestNodeErrorCode011, nullptr, nullptr, nullptr,
                napi_default, nullptr}, 
        };
        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok)
        {
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

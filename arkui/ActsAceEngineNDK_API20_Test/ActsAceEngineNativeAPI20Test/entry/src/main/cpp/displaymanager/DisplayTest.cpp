/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/Common.h"
#include "DisplayManagerTest.h"
namespace ArkUIDisplayManagerTest {
EXTERN_C_START
static void DisplayManagerTest(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        { "ArkuiAiAnalysisFinish", nullptr, DisplayManager::ArkuiAiAnalysisFinish,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ArkuiAiAnalysisDisabled", nullptr, DisplayManager::ArkuiAiAnalysisDisabled,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ArkuiAiAnalysisUnsupported", nullptr, DisplayManager::ArkuiAiAnalysisUnsupported,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ArkuiAiAnalysisOngoing", nullptr, DisplayManager::ArkuiAiAnalysisOngoing,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ArkuiAiAnalysisStopped", nullptr, DisplayManager::ArkuiAiAnalysisStopped,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ArkuiNodeUndefined", nullptr, DisplayManager::ArkuiNodeUndefined,
            nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static napi_value DisplayManager(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[300] = {};
    DisplayManagerTest(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module displaymanagerModule = {.nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = DisplayManager,
    .nm_modname = "displaymanager",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&displaymanagerModule); }
} // namespace ArkUICapiTest

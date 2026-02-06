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
        { "GetDefaultDisplayId", nullptr, DisplayManager::GetDefaultDisplayId,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayWidth", nullptr, DisplayManager::GetDefaultDisplayWidth,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayHeight", nullptr, DisplayManager::GetDefaultDisplayHeight,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayRotation", nullptr, DisplayManager::GetDefaultDisplayRotation,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayOrientation", nullptr, DisplayManager::GetDefaultDisplayOrientation,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayVirtualPixelRatio", nullptr, DisplayManager::GetDefaultDisplayVirtualPixelRatio,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayRefreshRate", nullptr, DisplayManager::GetDefaultDisplayRefreshRate,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayDensityDpi", nullptr, DisplayManager::GetDefaultDisplayDensityDpi,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayDensityPixels", nullptr, DisplayManager::GetDefaultDisplayDensityPixels,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayScaledDensity", nullptr, DisplayManager::GetDefaultDisplayScaledDensity,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayDensityXdpi", nullptr, DisplayManager::GetDefaultDisplayDensityXdpi,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDefaultDisplayDensityYdpi", nullptr, DisplayManager::GetDefaultDisplayDensityYdpi,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreateDefaultDisplayCutoutInfo", nullptr, DisplayManager::CreateDefaultDisplayCutoutInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyDefaultDisplayCutoutInfoSuccess", nullptr, DisplayManager::DestroyDefaultDisplayCutoutInfoSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void DisplayManagerTest1(napi_property_descriptor* desc)
{
    const uint32_t offset = 14;
    napi_property_descriptor descTemp[] = {
        { "DestroyDefaultDisplayCutoutInfoError", nullptr, DisplayManager::DestroyDefaultDisplayCutoutInfoError,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFoldDisplayMode", nullptr, DisplayManager::GetFoldDisplayMode,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterDisplayChangeListener", nullptr, DisplayManager::RegisterDisplayChangeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnRegisterDisplayChangeListener", nullptr, DisplayManager::UnRegisterDisplayChangeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterFoldDisplayModeChangeListenerNoSupport", nullptr,
            DisplayManager::RegisterFoldDisplayModeChangeListenerNoSupport,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterFoldDisplayModeChangeListenerInvalidParam", nullptr,
            DisplayManager::RegisterFoldDisplayModeChangeListenerInvalidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetAllDisplay", nullptr, DisplayManager::GetAllDisplay,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetDisplayById", nullptr, DisplayManager::GetDisplayById,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePrimaryDisplay", nullptr, DisplayManager::CreatePrimaryDisplay,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterAvailableAreaChangeListener", nullptr, DisplayManager::RegisterAvailableAreaChangeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyAvailableArea", nullptr, DisplayManager::DestroyAvailableArea,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}
static void DisplayManagerTest2(napi_property_descriptor* desc)
{
    const uint32_t offset = 25;
    napi_property_descriptor descTemp[] = {
        { "RegisterDisplayAddListener", nullptr, DisplayManager::RegisterDisplayAddListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterDisplayRemoveListener", nullptr, DisplayManager::RegisterDisplayRemoveListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value DisplayManager(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[300] = {};
    DisplayManagerTest(desc);
    DisplayManagerTest1(desc);
    DisplayManagerTest2(desc);
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

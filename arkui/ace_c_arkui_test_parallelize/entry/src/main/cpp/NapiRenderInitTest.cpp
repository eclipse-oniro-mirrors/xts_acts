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
#include "manager/PluginManagerTest.h"
#include "swiper/SwiperTest.h"
#include "publicAttribute/XtsTestCaseTest.cpp"
#include "xcomponent/XcomponentTest.h"
#include "button/ButtonTest.h"
#include "checkbox/CheckboxTest.h"
#include "checkboxgroup/CheckboxgroupTest.h"
#include "radio//RadioTest.h"
#include "slider/SliderTest.h"
#include "toggle/ToggleTest.h"

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
        // swiper
        {"testSwiper", nullptr, SwiperCreateNativeNodeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        // publicAttirbute
        {"CreateNativeNodePublic", nullptr, CreateNativeNodePublic,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DisposeNativeNodePublic", nullptr, DisposeNativeNodePublic,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        // XComponent
        {"XComponentDisposeNativeNode", nullptr, ArkUIXComponentCApiDemo::XComponentTest::DisposeNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"XComponentCreateNativeNode", nullptr, ArkUIXComponentCApiDemo::XComponentTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"XComponentTextureDisposeNativeNode", nullptr, ArkUIXComponentCApiDemo::XComponentTextureTest::DisposeNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"XComponentTextureCreateNativeNode", nullptr, ArkUIXComponentCApiDemo::XComponentTextureTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"buttonTest", nullptr, ButtonTest::buttonTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkBoxTest", nullptr, CheckBoxTest::checkBoxTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"checkBoxGroupTest", nullptr, CheckBoxGroupTest::checkBoxGroupTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"radioTest", nullptr, RadioTest::radioTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sliderTest", nullptr, SliderTest::sliderTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"toggleTest", nullptr, ToggleTest::toggleTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
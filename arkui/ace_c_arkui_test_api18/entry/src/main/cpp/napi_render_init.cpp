/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
#include "datepicker/datepicker_test.h"
#include "textpicker/textPicker_enableHapticFeedback_test.h"
#include "datepicker/datePicker_enableHapticFeedback_test.h"
#include "swiper/swiper_indicator_test.h"
#include "ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.h"
#include "visibleAreaEventOptions/visibleAreaEventOptions.h"
#include "gestureRecognizer/GestureInterrupterTest.h"
#include "XComponent/xcomponent_lifecycle_test.h"
#include "button/button_font_scale_Test.h"

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
        { "getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testDatePickerMode", nullptr, DatePickerTest::DatePickerModeTest,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textPickerEnableHapticFeedback", nullptr, TextPickerEnableHapticFeedbackTest::TextPickerEnableHapticFeedback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        { "datePickerEnableHapticFeedback", nullptr, DatePickerEnableTest::DatePickerEnableHapticFeedback,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        { "swiperIndicatorTest", nullptr, SwiperIndicatorTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr },
        {"testExpectedFrameRateRangeCallback", nullptr, ExpectedFrameRateRangeCallbackTest::testExpectedFrameRateRangeCallback001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DragEndPendingTest_001", nullptr, VisibleAreaEventOptionsTest::DragEndPendingTest_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"VisibleAreaEventOptionsTest_a", nullptr, VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_a, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"VisibleAreaEventOptionsTest_b", nullptr, VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_b, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"VisibleAreaEventOptionsTest_c", nullptr, VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_c, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"VisibleAreaEventOptionsTest_d", nullptr, VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_d, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"TestGestureInterrupter", nullptr, GestureInterrupterTest::TestGestureInterrupter, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentCreateNativeNode", nullptr, XComponentLifeCycleTest::createNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentAttachToMainTree", nullptr, XComponentLifeCycleTest::attachToMainTree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentDetachFromMainTree", nullptr, XComponentLifeCycleTest::detachFromMainTree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentDispose", nullptr, XComponentLifeCycleTest::dispose, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentSetUserData", nullptr, XComponentLifeCycleTest::setUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentGetUserData", nullptr, XComponentLifeCycleTest::getUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentInitialize", nullptr, XComponentLifeCycleTest::initialize, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentFinalize", nullptr, XComponentLifeCycleTest::finalize, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"XComponentRemoveSurfaceCallback", nullptr, XComponentLifeCycleTest::removeSurfaceCallback, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"buttonFontScale", nullptr, ButtonFontScaleTest::ButtonFontScale,
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

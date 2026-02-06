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
#include "swiper/swiper_dot_indicator_test.cpp"
#include "swiper/swiper_arrowStyle_test.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"testSwiperDigitIndicator001", nullptr, TestSwiperDigitIndicator001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator002", nullptr, TestSwiperDigitIndicator002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator003", nullptr, TestSwiperDigitIndicator003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator004", nullptr, TestSwiperDigitIndicator004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator005", nullptr, TestSwiperDigitIndicator005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator006", nullptr, TestSwiperDigitIndicator006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator007", nullptr, TestSwiperDigitIndicator007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperDigitIndicator008", nullptr, TestSwiperDigitIndicator008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle001", nullptr, TestSwiperArrowStyle001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle002", nullptr, TestSwiperArrowStyle002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle003", nullptr, TestSwiperArrowStyle003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle004", nullptr, TestSwiperArrowStyle004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle005", nullptr, TestSwiperArrowStyle005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testSwiperArrowStyle006", nullptr, TestSwiperArrowStyle006, nullptr, nullptr, nullptr, napi_default, nullptr},
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

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
#include "image/ImageAltTest.h"
#include "textMinLines/MinLinesTest.h"
#include "hasAxisTest/HasAxisTest.h"
#include "list/CoastingAxisTest.h"
#include "list/SnapSpeedTest.h"
#include "list/LanesValueTest.h"
#include "waterFlow/WaterFlowFillPolicyTest.h"
#include "image/ImageDrawableDescriptorTest.h"
#include "image/ImageErrorTest.h"
#include "textLineHeight/LineHeightTest.h"
#include "textArea/TextAreaBarStateTest.h"
#include "scrollbarTest/ScrollBarTest.h"
#include "showCounterTest/ShowCounterTest.h"
#include "swiper/FinishAnimationTest.h"
#include "imageSpanTest/ImageSpanTest.h"
#include "customKeyboard/CustomKeyboardTest.h"
#include "image/AnimationControllerTest.h"
#include "grid/GridFillPolicyTest.h"
#include "grid/GridEventTest.h"
#include "InteractiveFramework/RegionListTest.h"
#include "clipShape/ClipShapeTest.h"
#include "CustomComponent/CustomMarkDirtyTest.h"
#include "LayoutManager/LayoutManagerTest.h"
#include "grid/GridDragTest.h"

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
        {"imageAltTest", nullptr, ImageAltTest::imageAltTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textMinLinesTest", nullptr, MinLinesTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasAxisTest", nullptr, HasAxisTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"RegionListTest", nullptr, RegionListTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"CoastingAxisTest_a", nullptr, CoastingAxisTest::CoastingAxisEventTest_a,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CoastingAxisTest_b", nullptr, CoastingAxisTest::CoastingAxisEventTest_b,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CoastingAxisTest_c", nullptr, CoastingAxisTest::CoastingAxisEventTest_c,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CoastingAxisTest_d", nullptr, CoastingAxisTest::CoastingAxisEventTest_d,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CoastingAxisTest_e", nullptr, CoastingAxisTest::CoastingAxisEventTest_e,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CoastingAxisTest", nullptr, CoastingAxisTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WaterFlowFillPolicyTest", nullptr, WaterFlowTest::WaterFlowFillPolicyTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"snapSpeedTest", nullptr, SnapSpeedTest::snapSpeedTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"LanesValueTest", nullptr, ListTest::LanesValueTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageDrawableDescriptorTest", nullptr, ImageDrawableDescriptorTest::imageDrawableDescriptorTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imageErrorTest", nullptr, ImageErrorTest::imageErrorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textLineHeightTest", nullptr, LineHeightTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"textAreaBarStateTest", nullptr, TextAreaBarStateTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scrollBarTest", nullptr, ScrollBarTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    
        {"showCounterTest", nullptr, ShowCounterTest::showCounterTest, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"FinishAnimationTest", nullptr, SwiperFinishAnimationTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageSpanTest", nullptr, ImageSpanTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customKeyboardTest", nullptr, CustomKeyboardTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"animationControllerTest", nullptr, AnimationControllerTest::animationControllerTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GridFillPolicyTest", nullptr, GridTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gridOnWillScrollTest", nullptr, GridEventTest::GridOnWillScrollTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gridOnScrollIndexTest", nullptr, GridEventTest::GridOnScrollIndexTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gridOnDidScrollTest", nullptr, GridEventTest::GridOnDidScrollTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gridOnScrollBarUpdateTest", nullptr, GridEventTest::GridOnScrollBarUpdateTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"clipShapeTest", nullptr, ClipShapeTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateCustomMarkDirtyNativeRoot", nullptr, CustomMarkDirtyTest::CreateCustomMarkDirtyNativeRoot,
             nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LayoutManagerTest001", nullptr, LayoutManagerTest::LayoutManagerTest001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest002", nullptr, LayoutManagerTest::LayoutManagerTest002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest003", nullptr, LayoutManagerTest::LayoutManagerTest003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest004", nullptr, LayoutManagerTest::LayoutManagerTest004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest005", nullptr, LayoutManagerTest::LayoutManagerTest005, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest006", nullptr, LayoutManagerTest::LayoutManagerTest006, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest007", nullptr, LayoutManagerTest::LayoutManagerTest007, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"LayoutManagerTest008", nullptr, LayoutManagerTest::LayoutManagerTest008, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"gridDragTest", nullptr, GridDragTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
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
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
#include "text/TextEnumTest.cpp"
#include "containerPicker/ContainerPickerCanLoopTest.cpp"
#include "containerPicker/ContainerPickerEnableHapticFeedbackTest.cpp"
#include "containerPicker/ContainerPickerSelectedIndexTest.cpp"
#include "containerPicker/ContainerPickerSelectionIndicatorTest.cpp"
#include "containerPicker/ContainerPickerSubComponentTest.cpp"
#include "text/TextDirectionTest.cpp"
#include "MotionPath/MotionPathOptionsTest.cpp"
#include "publicCapacity/AtomicServiceMenuBarSetVisibleTest.cpp"
#include "node/IsInRenderStateReturnValueTest.cpp"
#include "refresh/RefreshAttrsTest.cpp"
#include "image/ImageAntialiasedTest.cpp"
#include "list/ListEmptyTest.cpp"
#include "grid/GridEmptyTest.cpp"
#include "TextMarqueeOptions/TextMarqueeOptionsTest.cpp"
#include "TextMarqueeOptions/ControllerBaseCreatTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TestContainerPickerCanLoop001", nullptr,
         TestContainerPickerCanLoop001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop002", nullptr,
         TestContainerPickerCanLoop002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop003", nullptr,
         TestContainerPickerCanLoop003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop004", nullptr,
         TestContainerPickerCanLoop004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback001", nullptr,
         TestContainerPickerEnableHapticFeedback001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback002", nullptr,
         TestContainerPickerEnableHapticFeedback002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback003", nullptr,
         TestContainerPickerEnableHapticFeedback003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback004", nullptr,
         TestContainerPickerEnableHapticFeedback004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex001", nullptr,
         TestContainerPickerSelectedIndex001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex002", nullptr,
         TestContainerPickerSelectedIndex002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex003", nullptr,
         TestContainerPickerSelectedIndex003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex004", nullptr,
         TestContainerPickerSelectedIndex004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator001", nullptr,
         TestContainerPickerSelectionIndicator001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator002", nullptr,
         TestContainerPickerSelectionIndicator002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator003", nullptr,
         TestContainerPickerSelectionIndicator003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator004", nullptr,
         TestContainerPickerSelectionIndicator004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator005", nullptr,
         TestContainerPickerSelectionIndicator005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator006", nullptr,
         TestContainerPickerSelectionIndicator006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator007", nullptr,
         TestContainerPickerSelectionIndicator007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator008", nullptr,
         TestContainerPickerSelectionIndicator008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator009", nullptr,
         TestContainerPickerSelectionIndicator009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator010", nullptr,
         TestContainerPickerSelectionIndicator010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator011", nullptr,
         TestContainerPickerSelectionIndicator011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator012", nullptr,
         TestContainerPickerSelectionIndicator012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator013", nullptr,
         TestContainerPickerSelectionIndicator013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator014", nullptr,
         TestContainerPickerSelectionIndicator014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator015", nullptr,
         TestContainerPickerSelectionIndicator015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator016", nullptr,
         TestContainerPickerSelectionIndicator016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator017", nullptr,
         TestContainerPickerSelectionIndicator017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent001", nullptr,
         TestContainerPickerSubComponent001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent002", nullptr,
         TestContainerPickerSubComponent002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent003", nullptr,
         TestContainerPickerSubComponent003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent004", nullptr,
         TestContainerPickerSubComponent004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent005", nullptr,
         TestContainerPickerSubComponent005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextDirection_001", nullptr, TextDirection_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextDirection_002", nullptr, TextDirection_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextDirection_003", nullptr, TextDirection_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextDirection_004", nullptr, TextDirection_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextDirection_005", nullptr, TextDirection_005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextDirection_006", nullptr, TextDirection_006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions001", nullptr, MotionPathOptionsCreate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions002", nullptr, MotionPathOptionsPath, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions003", nullptr, MotionPathOptionsFrom, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions004", nullptr, MotionPathOptionsTo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions005", nullptr, MotionPathOptionsRotatable, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions006", nullptr, GetMotionPathOptions, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions007", nullptr, GetMotionPathOptionsInvalid, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions008", nullptr, GetPathBufferSizeError, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions009", nullptr, MotionPathNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextEnumTest_001", nullptr, TextEnumTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextEnumTest_002", nullptr, TextEnumTest_002, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_003", nullptr, TextEnumTest_003, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_004", nullptr, TextEnumTest_004, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_005", nullptr, TextEnumTest_005, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_006", nullptr, TextEnumTest_006, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_007", nullptr, TextEnumTest_007, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_008", nullptr, TextEnumTest_008, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_009", nullptr, TextEnumTest_009, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_010", nullptr, TextEnumTest_010, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_011", nullptr, TextEnumTest_011, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextEnumTest_012", nullptr, TextEnumTest_012, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_013", nullptr, TextEnumTest_013, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_014", nullptr, TextEnumTest_014, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_015", nullptr, TextEnumTest_015, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_016", nullptr, TextEnumTest_016, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_017", nullptr, TextEnumTest_017, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_018", nullptr, TextEnumTest_018, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_019", nullptr, TextEnumTest_019, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_020", nullptr, TextEnumTest_020, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextEnumTest_021", nullptr, TextEnumTest_021, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextEnumTest_022", nullptr, TextEnumTest_022, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextEnumTest_023", nullptr, TextEnumTest_023, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextMarqueeOptionsTest", nullptr, TextMarqueeOptionsTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ControllerBaseCreatTest", nullptr, ControllerBaseCreatTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestAtomicServiceMenuBarSetVisible01", nullptr,
         TestAtomicServiceMenuBarSetVisible01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextSelectionTest", nullptr, MotionPathNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestIsInRenderStateReturnValue001", nullptr, TestIsInRenderStateReturnValue001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestIsInRenderStateReturnValue002", nullptr, TestIsInRenderStateReturnValue002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testPullUpToCancelRefresh01", nullptr, TestPullUpToCancelRefresh01, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testPullUpToCancelRefresh02", nullptr, TestPullUpToCancelRefresh02, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testPullUpToCancelRefreshError", nullptr, TestPullUpToCancelRefreshError, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testImageAntialiased001", nullptr,
         TestImageAntialiased001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testImageAntialiased002", nullptr,
         TestImageAntialiased002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testImageAntialiased003", nullptr,
         TestImageAntialiased003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testImageAntialiased004", nullptr,
         TestImageAntialiased004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testImageAntialiased005", nullptr,
         TestImageAntialiased005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ListEmptyTest_001", nullptr, ListEmptyTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEmptyTest_002", nullptr, ListEmptyTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEmptyTest_003", nullptr, ListEmptyTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEmptyTest_004", nullptr, ListEmptyTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridIndexTest_001", nullptr, GridIndexTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEmptyTest_001", nullptr, GridEmptyTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEmptyTest_002", nullptr, GridEmptyTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEmptyTest_003", nullptr, GridEmptyTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEmptyTest_004", nullptr, GridEmptyTest_004, nullptr, nullptr, nullptr,
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
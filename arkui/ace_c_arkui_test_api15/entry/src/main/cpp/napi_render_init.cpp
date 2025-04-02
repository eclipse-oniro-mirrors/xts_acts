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
#include "manager/plugin_manager.h"
#include "keyDisPatchTest/keyEventDispatch_test.h"
#include "progress/progress_linear_style_test.h"

#include "focusControl/focus_Control.h"
#include "checkboxgroup/checkboxgroup_group_test.h"
#include "checkboxgroup/checkboxgroup_selectall_test.h"
#include "checkbox/checkbox_group_test.h"
#include "list/list_test.h"
#include "listScrollTo/list_scroll_to_test.h"
#include "textArea/textArea_letter_spacing.h"
#include "node/node_handle_by_id_test.h"
#include "window/get_window_info_test.h"
#include "lazyForEach/lazyforeach_expand_mode_test.h"
#include "gesturetouchcancel/gesture_cancel.h"
#include "snapShot/snap_shot.h"
#include "snapShot/container.h"
#include "scroll/scroll_backtotop_test.h"
#include "gestureRecognizer/gestureRecognizer.h"
#include "eventInfo/eventInfo.h"


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
        {"testProgressLinearStyle", nullptr, ProgressLinearStyleTest::ProgressLinearStyleTest001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
		{"FocusControlTest_001", nullptr, FocusControlTest::FocusControlTest_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FocusControlTest_002", nullptr, FocusControlTest::FocusControlTest_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FocusControlTest_003", nullptr, FocusControlTest::FocusControlTest_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FocusControlTest_004", nullptr, FocusControlTest::FocusControlTest_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"listTestCallback", nullptr, ListTest::ListCaseTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"listScrollToTestCallback", nullptr, ListScrollToTest::ListScrollToIndexTest, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"checkboxGroupGroupTest", nullptr, CheckboxGroupGroupTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"checkboxGroupSelectAllTest", nullptr, CheckboxGroupSelectAllTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"checkboxGroupTest", nullptr, CheckboxGroupTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaLetterSpacing001", nullptr, TextAreaLetterSpacing::textAreaLetterSpacing001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"textInputLetterSpacing002", nullptr, TextAreaLetterSpacing::textInputLetterSpacing002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testNodeHandleById", nullptr, NodeHandleByIdTest::testNodeHandleById001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testGetWindowInfo", nullptr, GetWindowInfoTest::testGetWindowInfo001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testHostWindowInfoGetName", nullptr, GetWindowInfoTest::testHostWindowInfoGetName002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testHostWindowInfoDestroy", nullptr, GetWindowInfoTest::testHostWindowInfoDestroy003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode001", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode002", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode003", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode004", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode005", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode006", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode007", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode007,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode008", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode008,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLazyForEachExpandMode009", nullptr, LazyForEachExpandModeTest::testLazyForEachExpandMode009,
         nullptr, nullptr, nullptr, napi_default, nullptr},
		 {"gesturecancelTest", nullptr, GestureInterfaceCancelTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetTouchEventData", nullptr, GestureInterfaceCancelTest::GetTouchEventData,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snapShotTest001", nullptr, Manager::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestsnapShotetResult", nullptr, Manager::GetResult, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollBackToTopTest", nullptr, ScrollBackToTopTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestGestureRecognizerFinger001", nullptr, GestureRecognizerTest::TestGestureRecognizerFinger001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGestureRecognizerGetResult", nullptr, GestureRecognizerTest::GetResult, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestEventInfoGetPressedTime001", nullptr, EventInfoTest::TestEventInfoGetPressedTime001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestEventInfoGetResult", nullptr, EventInfoTest::GetResult, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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

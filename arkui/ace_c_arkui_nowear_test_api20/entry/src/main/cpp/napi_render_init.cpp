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
#include "button/button_gettype_test.h"
#include "grid/FocusWrapModeTest.h"
#include "drag/GetDisplayIdTest.h"
#include "drag/GetDragSourceTest.h"
#include "drag/GetTouchPointGlobalDisplayTest.h"
#include "drag/DragEventFuncTest.h"
#include "InteractiveFramework/DragGetPreDragStatusTest.h"
#include "dropBadge/EnableDropDisallowedBadgeTest.h"
#include "dialog/DialogGetStateTest.h"
#include "image/ImageDraggableEventTest.h"

namespace ArkUICapiTest
{
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
        if ((env == nullptr) || (exports == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"buttonGetTypeTest", nullptr, ButtonGetTypeTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"FocusWrapModeTest001", nullptr, FocusWrapModeTest::FocusWrapModeTest001, nullptr, nullptr,
                nullptr, napi_default, nullptr},
            {"FocusWrapModeTest002", nullptr, FocusWrapModeTest::FocusWrapModeTest002, nullptr, nullptr,
                nullptr, napi_default, nullptr},
            {"FocusWrapModeTest003", nullptr, FocusWrapModeTest::FocusWrapModeTest003, nullptr, nullptr,
                nullptr, napi_default, nullptr},
            {"dragEventGetDisplayId", nullptr, GetDisplayIdTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"dragEventGetDragSource", nullptr, GetDragSourceTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"dragEventGetGlobalDisplay", nullptr, GetDragSourceTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"dragEventFuncTest", nullptr, DragEventFuncTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"dragEventFuncTest036", nullptr, DragEventFuncTest::dragEventFuncTest036, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"GetPanGesture036Ret", nullptr, DragEventFuncTest::GetPanGesture036Ret, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"dragEventFuncTest037", nullptr, DragEventFuncTest::dragEventFuncTest037, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"dragEventFuncTest039", nullptr, DragEventFuncTest::dragEventFuncTest039, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"dragEventFuncTest041", nullptr, DragEventFuncTest::dragEventFuncTest041, nullptr, nullptr, nullptr, 
                napi_default, nullptr},
            {"getPreDragStatusTest", nullptr, GetPreDragStatusTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
            {"Enum_ARKUI_DRAG_STATUS_STARTED", nullptr, GetPreDragStatusTest::Enum_ARKUI_DRAG_STATUS_STARTED, nullptr, nullptr, nullptr,
            napi_default, nullptr},
            {"enableDropDisallowedBadge", nullptr, EnableDropDisallowedBadgeTest::CreateNativeNode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
            {"dialogGetStateTest", nullptr, DialogGetStateTest::CreateNativeNode, nullptr, nullptr, nullptr,
                napi_default, nullptr},
            {"dialogGetStateErrorCode_001", nullptr, DialogGetStateTest::GetStateErrorCode_001, nullptr, nullptr,
                nullptr, napi_default, nullptr},
            {"dialogGetStateErrorCode_002", nullptr, DialogGetStateTest::GetStateErrorCode_002, nullptr, nullptr,
                nullptr, napi_default, nullptr},
            {"imageDraggableEventTest", nullptr, ImageDraggableEventTest::CreateNativeNode, nullptr, nullptr, nullptr,
                napi_default, nullptr},
        };
        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok)
        {
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

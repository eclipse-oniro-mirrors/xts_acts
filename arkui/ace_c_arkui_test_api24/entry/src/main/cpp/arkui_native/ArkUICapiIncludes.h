/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/*
 * 说明：本文件不是「类型声明头文件」（与 matrix4/Matrix4Test.h 等不同）。
 * 仅用于在 ArkUICapiNapiDescriptors.cpp 翻译单元内，按顺序 #include 各 ArkUI C API XTS 用例 .cpp，
 * 与 NapiArkUICapiGenModule.cpp（仅模块 Init + 注册）分离，避免用例代码被重复编译。用例实现仍各自 #include common.h 等。
 */

#ifndef ARKUI_CAPI_XTS_ARKUICAPI_INCLUDES_H
#define ARKUI_CAPI_XTS_ARKUICAPI_INCLUDES_H

#include "arkui_native/ArkUI_Full/drag_and_drop/DragAndDrop_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/drawable_descriptor/DrawableDescriptor_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/native_interface_a11y/NativeInterfaceA11y_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/native_node/NativeNode_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/native_type/NativeType_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/native_type/NativeType_ApiSuite2.cpp"
#include "arkui_native/ArkUI_Full/styled_string/StyledString_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/styled_string/StyledString_ApiSuite2.cpp"
#include "arkui_native/ArkUI_Full/styled_string/StyledString_ApiSuite3.cpp"
#include "arkui_native/ArkUI_Full/styled_string/StyledString_ApiSuite4.cpp"
#include "arkui_native/ArkUI_Full/ui_input_event/UiInputEvent_ApiSuite1.cpp"
#include "arkui_native/ArkUI_Full/ui_input_event/UiInputEvent_ApiSuite2.cpp"

#endif // ARKUI_CAPI_XTS_ARKUICAPI_INCLUDES_H

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
#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_gesture.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "drag/DragReturnNullTest.h"

namespace ArkUICapiTest {


static napi_value True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUIGestureInterruptInfo_ *inf = new ArkUIGestureInterruptInfo_;
    ArkUI_GestureInterruptInfo_ *event = new ArkUI_GestureInterruptInfo_;
    inf->isSystemGesture = true;
    event->interruptData = *(ArkUIGestureInterruptInfo_*)inf;
    auto result = OH_ArkUI_GestureInterruptInfo_GetSystemFlag((ArkUI_GestureInterruptInfo*)event);
    ASSERT_EQ(result, true);
    NAPI_END;
}

static napi_value False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUIGestureInterruptInfo_ *inf = new ArkUIGestureInterruptInfo_;
    ArkUI_GestureInterruptInfo_ *event = new ArkUI_GestureInterruptInfo_;
    inf->isSystemGesture = false;
    event->interruptData = *(ArkUIGestureInterruptInfo_*)inf;
    auto result = OH_ArkUI_GestureInterruptInfo_GetSystemFlag((ArkUI_GestureInterruptInfo*)event);
    ASSERT_EQ(result, false);
    NAPI_END;
}


static napi_value True_OH_ArkUI_GetGestureRecognizerEnabled(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_GestureRecognizer_ *GestureRecognizer_ = new ArkUI_GestureRecognizer_;
    GestureRecognizer_ ->gesture = (ArkUIGesture_*)1;
    auto result = OH_ArkUI_GetGestureRecognizerEnabled((ArkUI_GestureRecognizer*)GestureRecognizer_);
    ASSERT_EQ(result, false);
    NAPI_END;
}

static napi_value False_OH_ArkUI_GetGestureRecognizerEnabled(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_GetGestureRecognizerEnabled(nullptr);
    ASSERT_EQ(result, false);
    NAPI_END;
}

static napi_value True_OH_ArkUI_IsBuiltInGesture(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_GestureRecognizer_ *GestureRecognizer_ = new ArkUI_GestureRecognizer_;
    auto result = OH_ArkUI_IsBuiltInGesture((ArkUI_GestureRecognizer*)GestureRecognizer_);
    ASSERT_EQ(result, false);
    NAPI_END;
}

static napi_value False_OH_ArkUI_IsBuiltInGesture(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_IsBuiltInGesture(nullptr);
    ASSERT_EQ(result, false);
    NAPI_END;
}

static napi_value True_OH_ArkUI_IsGestureRecognizerValid(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_GestureRecognizer_ *GestureRecognizer_ = new ArkUI_GestureRecognizer_;
    auto result = OH_ArkUI_IsGestureRecognizerValid((ArkUI_GestureRecognizer*)GestureRecognizer_);
    ASSERT_EQ(result, false);
    NAPI_END;
}

static napi_value False_OH_ArkUI_IsGestureRecognizerValid(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_IsGestureRecognizerValid(nullptr);
    ASSERT_EQ(result, false);
    NAPI_END;
}


} // namespace ArkUICapiTest
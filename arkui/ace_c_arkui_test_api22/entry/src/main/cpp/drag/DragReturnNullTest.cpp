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
#include "drag/DragReturnNullTest.h"
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {
static napi_value Nullptr_OH_ArkUI_CreateDragActionWithContext(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_CreateDragActionWithContext(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_CreateDragActionWithNode(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_CreateDragActionWithNode(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_GestureInterruptInfo_GetGestureEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}


static napi_value Nullptr_OH_ArkUI_GestureInterruptInfo_GetRecognizer(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_ParallelInnerGestureEvent_ *event = new ArkUI_ParallelInnerGestureEvent_;
    event->current = nullptr;
    event->responseLinkRecognizer = nullptr;
    event->userData = nullptr;
    event->count = 0;
    auto *previewOptions = OH_ArkUI_GestureInterruptInfo_GetRecognizer((ArkUI_GestureInterruptInfo *)event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetRecognizer", "GetRecognizer ret: %{public}p", previewOptions);      
    if(previewOptions == PARAM_0)
        ASSERT_EQ_INT(previewOptions, nullptr);
    else
        ASSERT_OBJ_NE(previewOptions, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetUserData(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_ParallelInnerGestureEvent_ *event = new ArkUI_ParallelInnerGestureEvent_;
    event->current = nullptr;
    event->responseLinkRecognizer = nullptr;
    event->userData = nullptr;
    event->count = 0;
    auto *previewOptions = OH_ArkUI_ParallelInnerGestureEvent_GetUserData((ArkUI_ParallelInnerGestureEvent *)event);
    ASSERT_EQ_INT(previewOptions, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer(napi_env env,
                                                                                  napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_ParallelInnerGestureEvent_ *event = new ArkUI_ParallelInnerGestureEvent_;
    event->current = nullptr;
    event->responseLinkRecognizer = nullptr;
    event->userData = nullptr;
    event->count = 0;
    auto *previewOptions =
        OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer((ArkUI_ParallelInnerGestureEvent *)event);
    ASSERT_EQ_INT(previewOptions, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_CreateDragPreviewOption(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_CreateDragPreviewOption();
    ASSERT_OBJ_NE(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_TouchRecognizer_GetNodeHandle(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_TouchRecognizer_GetNodeHandle(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_GestureEvent_GetRawInputEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_GestureEvent_GetRawInputEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_GestureInterrupter_GetUserData(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_GestureInterrupter_GetUserData(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetNodeHandle(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetNodeHandle(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetInputEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetInputEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetNodeComponentEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetStringAsyncEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetStringAsyncEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetUserData(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetUserData(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_CreateSnapshotOptions(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_CreateSnapshotOptions();
    ASSERT_OBJ_NE(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_VisibleAreaEventOptions_Create(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_VisibleAreaEventOptions_Create();
    ASSERT_OBJ_NE(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}

static napi_value Nullptr_OH_ArkUI_NodeEvent_GetTouchTestInfo(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NodeEvent_GetTouchTestInfo(nullptr);
    ASSERT_EQ_INT(result, nullptr);
    NAPI_END;
}
} // namespace ArkUICapiTest

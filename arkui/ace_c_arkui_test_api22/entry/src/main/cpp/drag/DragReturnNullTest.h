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

#ifndef ACE_C_ARKUI_TEST_API22_DRAG_RETURN_NULL_H
#define ACE_C_ARKUI_TEST_API22_DRAG_RETURN_NULL_H
#include <arkui/native_node.h>
namespace ArkUICapiTest {
struct ArkUIGesture_;
typedef int ArkUI_Int32;
struct ArkUIGestureEventTargetInfo_ {
    void *uiNode = nullptr;
};
struct ArkUIGestureRecognizer_ {
    ArkUI_Int32 type = -1;
    ArkUIGesture_ *gesture = nullptr;
    void *extraData = nullptr;
    void *attachNode = nullptr;
    bool capi = true;
    void *recognizer = nullptr;
    ArkUIGestureEventTargetInfo_ targetInfo = {};
};

struct ArkUI_ParallelInnerGestureEvent_ {
    ArkUIGestureRecognizer_ *current = nullptr;
    ArkUIGestureRecognizer_ **responseLinkRecognizer = nullptr;
    void *userData = nullptr;
    int32_t count;
};

struct ArkUIGestureInterruptInfo_ {
    bool isSystemGesture;
};
struct ArkUI_GestureInterruptInfo_ {
    ArkUIGestureInterruptInfo_ interruptData;
};

struct ArkUIGesture_;

struct ArkUI_GestureRecognizer_ {
    int32_t type = -1;
    ArkUIGesture_* gesture = nullptr;
    void* extraData = nullptr;
    void* attachNode = nullptr;
    bool capi = true;
    void* recognizer = nullptr;
    ArkUIGestureEventTargetInfo_ targetInfo = {};
};
}
#endif // ACE_C_ARKUI_TEST_API22_DRAG_RETURN_NULL_H
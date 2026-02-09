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

#ifndef NDKXCOMPONENT_XCOMPONENTMOUSE_H
#define NDKXCOMPONENT_XCOMPONENTMOUSE_H

#include "component/XComponent.h"

#define XC ArkUICapiTest::XComponent

namespace XComponentMouse {

static OH_NativeXComponent_MouseEvent_Callback XComponentCallback;
static XC ColumnComponent = XC(ARKUI_NODE_COLUMN);
static XC XComponent = XC(ARKUI_NODE_XCOMPONENT);
static OH_NativeXComponent_MouseEvent g_mouseEvent = {
    .x = -1,
    .y = -1,
    .screenX = -1,
    .screenY = -1,
    .timestamp = -1,
    .action = OH_NativeXComponent_MouseEventAction(),
    .button = OH_NativeXComponent_MouseEventButton(),
};
static std::unordered_map<OH_NativeXComponent_MouseEventAction, OH_NativeXComponent_MouseEvent> g_mouseEventActionMap;
static std::unordered_map<OH_NativeXComponent_MouseEventButton, OH_NativeXComponent_MouseEvent> g_mouseEventButtonMap;
void InitNode();
void MouseEventCallback(OH_NativeXComponent* component, void* window);
OH_NativeXComponent_MouseEventAction SelectMouseEventAction(int32_t index);
OH_NativeXComponent_MouseEventButton SelectMouseEventButton(int32_t index);

napi_value CreateMouseNativeNode(napi_env env, napi_callback_info info);
napi_value MouseEventAction(napi_env env, napi_callback_info info);
napi_value MouseEventButton(napi_env env, napi_callback_info info);
napi_value MouseEventTimeStamp(napi_env env, napi_callback_info info);

};

#endif //NDKXCOMPONENT_XCOMPONENTMOUSE_H

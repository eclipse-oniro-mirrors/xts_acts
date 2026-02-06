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

#include "common/Common.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <algorithm>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <unistd.h>

namespace {
static int32_t g_uiInputEventSourceUnknown = 100;
static int32_t g_uiInputEventMouse = 100;
static int32_t g_uiInputEventSourceMouse = 100;
static int32_t g_uiInputEventKey = 100;
static int32_t g_uiInputEventSourceScreen = 100;
static int32_t g_getChangedPointerId = 100;
static int32_t g_getRollAngle = 100;
static int32_t g_getPressedKeys1 = 100;
static int32_t g_getPressedKeys2 = 100;
static int32_t g_getModifierKey = 100;
static int32_t g_getPressedButtons = 100;
static int32_t g_createClonedEvent = 100;
static int32_t g_fingerId = 0;
static int32_t g_pIndex = 0;
static std::vector<int32_t> g_touchActions;
static std::vector<int32_t> g_mouseActions;
static std::vector<int32_t> g_pressedButtons;
static std::vector<int32_t> g_axisAction;
static std::vector<int32_t> g_setHitTestMode;
static std::vector<ArkUI_InteractionHand> g_handAction;
static ArkUI_InteractionHand g_hand;
static uint64_t g_modifierKey = 100;
static float g_getDisplayX = 0;
static float g_getDisplayXByIndex = 0;
static float g_getDisplayY = 0;
static float g_getDisplayYByIndex = 0;
static float g_getHistoryDisplayXByIndex = 0;
static float g_getHistoryDisplayYByIndex = 0;
static double g_rollAngle = 0;
static uint32_t g_pointerIndex = 1;
static uint32_t g_historyIndex = 0;
static ArkUI_UIInputEvent *clonedEvent;
static ArkUI_UIInputEvent *UIInput;
static ArkUI_NodeHandle g_Node;
} // namespace

static napi_value UIInputEventType0100(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_uiInputEventMouse == ARKUI_UIINPUTEVENT_TYPE_MOUSE) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0101(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_uiInputEventKey == ARKUI_UIINPUTEVENT_TYPE_KEY) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0102(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_uiInputEventSourceUnknown == ARKUI_UIINPUTEVENT_TYPE_UNKNOWN) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0103(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_uiInputEventSourceMouse == ARKUI_UIINPUTEVENT_TYPE_TOUCH) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0104(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_uiInputEventSourceScreen == ARKUI_UIINPUTEVENT_TYPE_AXIS) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0105(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_touchActions.begin(), g_touchActions.end(), UI_TOUCH_EVENT_ACTION_CANCEL);
    if (it != g_touchActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0106(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_touchActions.begin(), g_touchActions.end(), UI_TOUCH_EVENT_ACTION_DOWN);
    if (it != g_touchActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0107(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_touchActions.begin(), g_touchActions.end(), UI_TOUCH_EVENT_ACTION_MOVE);
    if (it != g_touchActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0108(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_mouseActions.begin(), g_mouseActions.end(), UI_MOUSE_EVENT_ACTION_UNKNOWN);
    if (it != g_mouseActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0109(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_mouseActions.begin(), g_mouseActions.end(), UI_MOUSE_EVENT_ACTION_PRESS);
    if (it != g_mouseActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0110(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_mouseActions.begin(), g_mouseActions.end(), UI_MOUSE_EVENT_ACTION_RELEASE);
    if (it != g_mouseActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0111(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_mouseActions.begin(), g_mouseActions.end(), UI_MOUSE_EVENT_ACTION_MOVE);
    if (it != g_mouseActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0112(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_mouseActions.begin(), g_mouseActions.end(), UI_MOUSE_EVENT_ACTION_CANCEL);
    if (it != g_mouseActions.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0113(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_NONE);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0114(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_LEFT);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0115(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_RIGHT);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0116(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_MIDDLE);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0117(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_BACK);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0118(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_pressedButtons.begin(), g_pressedButtons.end(), UI_MOUSE_EVENT_BUTTON_FORWARD);
    if (it != g_pressedButtons.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0119(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_handAction.begin(), g_handAction.end(), ARKUI_EVENT_HAND_NONE);
    if (it != g_handAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0120(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_handAction.begin(), g_handAction.end(), ARKUI_EVENT_HAND_LEFT);
    if (it != g_handAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0121(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_handAction.begin(), g_handAction.end(), ARKUI_EVENT_HAND_RIGHT);
    if (it != g_handAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0122(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_axisAction.begin(), g_axisAction.end(), UI_AXIS_EVENT_ACTION_NONE);
    if (it != g_axisAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0123(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_axisAction.begin(), g_axisAction.end(), UI_AXIS_EVENT_ACTION_BEGIN);
    if (it != g_axisAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0124(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_axisAction.begin(), g_axisAction.end(), UI_AXIS_EVENT_ACTION_UPDATE);
    if (it != g_axisAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0125(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_axisAction.begin(), g_axisAction.end(), UI_AXIS_EVENT_ACTION_END);
    if (it != g_axisAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0126(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    sleep(PARAM_5);
    auto it = std::find(g_axisAction.begin(), g_axisAction.end(), UI_AXIS_EVENT_ACTION_CANCEL);
    if (it != g_axisAction.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0127(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_modifierKey & ARKUI_MODIFIER_KEY_FN != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0128(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_setHitTestMode.begin(), g_setHitTestMode.end(), HTM_BLOCK_HIERARCHY);
    if (it != g_setHitTestMode.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0129(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto it = std::find(g_setHitTestMode.begin(), g_setHitTestMode.end(), HTM_BLOCK_DESCENDANTS);
    if (it != g_setHitTestMode.end()) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0130(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    auto ret = OH_ArkUI_PointerEvent_GetChangedPointerId(nullptr, nullptr);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0131(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getChangedPointerId) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0132(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getDisplayX != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0133(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getDisplayXByIndex != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0134(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getDisplayY != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0135(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getDisplayYByIndex != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0136(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_GetRollAngle(nullptr, &g_rollAngle);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0137(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getRollAngle) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0138(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getHistoryDisplayXByIndex != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0139(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getHistoryDisplayYByIndex != 0) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0140(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_UIInputEvent_GetPressedKeys(nullptr, nullptr, nullptr);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0141(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getPressedKeys2 == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0142(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getPressedKeys2 == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0143(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getModifierKey == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0144(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getPressedButtons == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0145(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_getPressedButtons == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0146(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_CreateClonedEvent(nullptr, nullptr);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0147(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    if (g_createClonedEvent == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0148(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_DestroyClonedEvent(nullptr);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0149(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_DestroyClonedEvent(clonedEvent);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0150(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_DestroyClonedEvent(UIInput);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0151(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 0;
    float y = 0;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(nullptr, x, y);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0152(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 0;
    float y = 0;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(clonedEvent, x, y);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0153(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 0;
    float y = 0;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPosition(UIInput, x, y);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0154(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 0;
    float y = 0;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(nullptr, x, y, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0155(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 10.0f;
    float y = 10.0f;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(clonedEvent, x, y, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0156(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    float x = 0;
    float y = 0;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventLocalPositionByIndex(UIInput, x, y, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0157(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(nullptr, g_fingerId);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0158(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(clonedEvent, g_fingerId);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0159(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventChangedFingerId(UIInput, g_fingerId);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0160(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(nullptr, g_fingerId, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0161(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(clonedEvent, g_fingerId, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0162(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventFingerIdByIndex(UIInput, g_fingerId, g_pIndex);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0163(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(g_Node, clonedEvent);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0164(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(g_Node, nullptr);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0165(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(g_Node, UIInput);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0166(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(nullptr, clonedEvent);
    if (ret == ARKUI_ERROR_CODE_POST_CLONED_COMPONENT_STATUS_ABNORMAL) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0167(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_PostClonedEvent(g_Node, clonedEvent);
    if (ret == ARKUI_ERROR_CODE_POST_CLONED_NO_COMPONENT_HIT_TO_RESPOND_TO_THE_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0168(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    OH_ArkUI_UIInputEvent_GetLatestStatus();
    errcode = 0;
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0169(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventActionType(nullptr, UI_TOUCH_EVENT_ACTION_DOWN);
    if (ret == ARKUI_ERROR_CODE_PARAM_INVALID) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0170(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventActionType(clonedEvent, UI_TOUCH_EVENT_ACTION_DOWN);
    if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

static napi_value UIInputEventType0171(napi_env env, napi_callback_info info)
{
    int32_t errcode = 1;
    int32_t ret = OH_ArkUI_PointerEvent_SetClonedEventActionType(UIInput, UI_TOUCH_EVENT_ACTION_DOWN);
    if (ret == ARKUI_ERROR_CODE_NOT_CLONED_POINTER_EVENT) {
        errcode = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}

void eventReceiver(ArkUI_NodeEvent *event)
{
    ArkUI_UIInputEvent *UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    UIInput = UIInputEvent;
    g_uiInputEventMouse = OH_ArkUI_UIInputEvent_GetType(UIInputEvent);
    g_uiInputEventSourceScreen = OH_ArkUI_UIInputEvent_GetSourceType(UIInputEvent);
    g_uiInputEventSourceMouse = OH_ArkUI_UIInputEvent_GetSourceType(UIInputEvent);
    g_axisAction.push_back(OH_ArkUI_AxisEvent_GetAxisAction(UIInputEvent));
    auto qaz = OH_ArkUI_PointerEvent_GetInteractionHand(UIInputEvent, &g_hand);
    g_getChangedPointerId = OH_ArkUI_PointerEvent_GetChangedPointerId(UIInputEvent, &g_pointerIndex) ==
                            ARKUI_ERROR_CODE_NO_ERROR;
    g_getDisplayX = OH_ArkUI_PointerEvent_GetGlobalDisplayX(UIInputEvent);
    g_getDisplayXByIndex = OH_ArkUI_PointerEvent_GetGlobalDisplayXByIndex(UIInputEvent, g_pointerIndex);
    g_getDisplayY = OH_ArkUI_PointerEvent_GetGlobalDisplayY(UIInputEvent);
    g_getDisplayYByIndex = OH_ArkUI_PointerEvent_GetGlobalDisplayYByIndex(UIInputEvent, g_pointerIndex);
    g_createClonedEvent = OH_ArkUI_PointerEvent_CreateClonedEvent(UIInputEvent, &clonedEvent);
    g_createClonedEvent = g_createClonedEvent == ARKUI_ERROR_CODE_NO_ERROR ?
                          ARKUI_ERROR_CODE_NO_ERROR : g_createClonedEvent;
    int32_t length = 1;
    int32_t *pressButton = (int32_t *)malloc(length * sizeof(int32_t));
    g_getPressedButtons = OH_ArkUI_MouseEvent_GetPressedButtons(UIInputEvent, pressButton, &length);
    g_getPressedButtons = g_getPressedButtons == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ?
                          ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR : g_getPressedButtons;
    g_getPressedButtons = g_getPressedButtons == ARKUI_ERROR_CODE_NO_ERROR ?
                          ARKUI_ERROR_CODE_NO_ERROR : g_getPressedButtons;
    if (OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayX(UIInputEvent, g_pointerIndex, g_historyIndex)) {
        g_getHistoryDisplayXByIndex =
            OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayX(UIInputEvent, g_pointerIndex, g_historyIndex);
    }
    if (OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayY(UIInputEvent, g_pointerIndex, g_historyIndex)) {
        g_getHistoryDisplayYByIndex =
            OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayY(UIInputEvent, g_pointerIndex, g_historyIndex);
    }
    g_getRollAngle = OH_ArkUI_PointerEvent_GetRollAngle(UIInputEvent, &g_rollAngle) == ARKUI_ERROR_CODE_NO_ERROR;
    g_setHitTestMode.push_back(OH_ArkUI_PointerEvent_SetInterceptHitTestMode(UIInputEvent, HTM_BLOCK_HIERARCHY));
    g_setHitTestMode.push_back(OH_ArkUI_PointerEvent_SetInterceptHitTestMode(UIInputEvent, HTM_BLOCK_DESCENDANTS));
    if (qaz == 0) {
        g_handAction.push_back(g_hand);
    }
    if (g_uiInputEventSourceScreen == UI_INPUT_EVENT_SOURCE_TYPE_TOUCH_SCREEN) {
        g_touchActions.push_back(OH_ArkUI_UIInputEvent_GetAction(UIInputEvent));
    }
    if (g_uiInputEventSourceMouse == 1) {
        g_mouseActions.push_back(OH_ArkUI_UIInputEvent_GetAction(UIInputEvent));
        g_pressedButtons.push_back(OH_ArkUI_MouseEvent_GetMouseButton(UIInputEvent));
    }
    return;
}

void eventReceiver1(ArkUI_NodeEvent *event)
{
    ArkUI_UIInputEvent *UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    g_uiInputEventKey = OH_ArkUI_UIInputEvent_GetType(UIInputEvent);
    g_uiInputEventSourceUnknown = OH_ArkUI_UIInputEvent_GetSourceType(UIInputEvent);
    g_getModifierKey = OH_ArkUI_UIInputEvent_GetModifierKeyStates(UIInputEvent, &g_modifierKey) ==
                       ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : PARAM_NEGATIVE_2;
    int32_t length = 10;
    int32_t *pressedKeys = (int32_t *)malloc(length * sizeof(int32_t));
    g_getPressedKeys2 = OH_ArkUI_UIInputEvent_GetPressedKeys(UIInputEvent, pressedKeys, &length);
    g_getPressedKeys2 = g_getPressedKeys2 == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH ?
                        ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH : g_getPressedKeys2;
    g_getPressedKeys2 = g_getPressedKeys2 == ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : g_getPressedKeys2;
    return;
}

napi_value CreateUIInputEventNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int32_t targetId = 1;
    char *userData = "A";
    g_Node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NodeHandle g_columnNode = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.f32 = 1.0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(g_columnNode, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_columnNode, NODE_HEIGHT_PERCENT, &item);
    nodeAPI->registerNodeEvent(g_columnNode, NODE_ON_MOUSE, targetId, userData);
    nodeAPI->registerNodeEvent(g_columnNode, NODE_TOUCH_EVENT, targetId, userData);
    nodeAPI->setAttribute(g_Node, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_Node, NODE_HEIGHT_PERCENT, &item);
    nodeAPI->registerNodeEvent(g_Node, NODE_ON_MOUSE, targetId, userData);
    nodeAPI->registerNodeEvent(g_Node, NODE_TOUCH_EVENT, targetId, userData);
    nodeAPI->addNodeEventReceiver(g_Node, eventReceiver);
    nodeAPI->registerNodeEvent(g_columnNode, NODE_ON_AXIS, targetId, userData);
    nodeAPI->addNodeEventReceiver(g_columnNode, eventReceiver);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_columnNode);
    ArkUI_NodeHandle g_columnNode1 = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue value1[] = {{.i32 = 1}};
    ArkUI_AttributeItem item1 = {.value = value1, .size = PARAM_1};
    nodeAPI->setAttribute(g_columnNode1, NODE_FOCUSABLE, &item1);
    nodeAPI->setAttribute(g_columnNode1, NODE_DEFAULT_FOCUS, &item1);
    nodeAPI->registerNodeEvent(g_columnNode1, NODE_ON_KEY_EVENT, targetId, userData);
    nodeAPI->addNodeEventReceiver(g_columnNode1, eventReceiver1);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, g_columnNode1);
    return nullptr;
}

napi_property_descriptor desc[] = {
    {"CreateUIInputEventNode", nullptr, CreateUIInputEventNode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0100", nullptr, UIInputEventType0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0101", nullptr, UIInputEventType0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0102", nullptr, UIInputEventType0102, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0103", nullptr, UIInputEventType0103, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0104", nullptr, UIInputEventType0104, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0105", nullptr, UIInputEventType0105, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0106", nullptr, UIInputEventType0106, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0107", nullptr, UIInputEventType0107, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0108", nullptr, UIInputEventType0108, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0109", nullptr, UIInputEventType0109, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0110", nullptr, UIInputEventType0110, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0111", nullptr, UIInputEventType0111, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0112", nullptr, UIInputEventType0112, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0113", nullptr, UIInputEventType0113, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0114", nullptr, UIInputEventType0114, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0115", nullptr, UIInputEventType0115, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0116", nullptr, UIInputEventType0116, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0117", nullptr, UIInputEventType0117, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0118", nullptr, UIInputEventType0118, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0119", nullptr, UIInputEventType0119, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0120", nullptr, UIInputEventType0120, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0121", nullptr, UIInputEventType0121, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0122", nullptr, UIInputEventType0122, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0123", nullptr, UIInputEventType0123, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0124", nullptr, UIInputEventType0124, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0125", nullptr, UIInputEventType0125, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0126", nullptr, UIInputEventType0126, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0127", nullptr, UIInputEventType0127, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0128", nullptr, UIInputEventType0128, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0129", nullptr, UIInputEventType0129, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0130", nullptr, UIInputEventType0130, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0131", nullptr, UIInputEventType0131, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0132", nullptr, UIInputEventType0132, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0133", nullptr, UIInputEventType0133, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0134", nullptr, UIInputEventType0134, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0135", nullptr, UIInputEventType0135, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0136", nullptr, UIInputEventType0136, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0137", nullptr, UIInputEventType0137, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0138", nullptr, UIInputEventType0138, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0139", nullptr, UIInputEventType0139, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0140", nullptr, UIInputEventType0140, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0141", nullptr, UIInputEventType0141, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0142", nullptr, UIInputEventType0142, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0143", nullptr, UIInputEventType0143, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0144", nullptr, UIInputEventType0144, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0145", nullptr, UIInputEventType0145, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0146", nullptr, UIInputEventType0146, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0147", nullptr, UIInputEventType0147, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0148", nullptr, UIInputEventType0148, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0149", nullptr, UIInputEventType0149, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0150", nullptr, UIInputEventType0150, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0151", nullptr, UIInputEventType0151, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0152", nullptr, UIInputEventType0152, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0153", nullptr, UIInputEventType0153, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0154", nullptr, UIInputEventType0154, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0155", nullptr, UIInputEventType0155, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0156", nullptr, UIInputEventType0156, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0157", nullptr, UIInputEventType0157, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0158", nullptr, UIInputEventType0158, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0159", nullptr, UIInputEventType0159, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0160", nullptr, UIInputEventType0160, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0161", nullptr, UIInputEventType0161, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0162", nullptr, UIInputEventType0162, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0163", nullptr, UIInputEventType0163, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0164", nullptr, UIInputEventType0164, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0165", nullptr, UIInputEventType0165, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0166", nullptr, UIInputEventType0166, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0167", nullptr, UIInputEventType0167, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0168", nullptr, UIInputEventType0168, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0169", nullptr, UIInputEventType0169, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0170", nullptr, UIInputEventType0170, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UIInputEventType0171", nullptr, UIInputEventType0171, nullptr, nullptr, nullptr, napi_default, nullptr},
};


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "uiinputeventndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }

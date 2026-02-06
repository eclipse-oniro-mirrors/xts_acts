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

#include "component/XComponent.h"

namespace ArkUICapiTest {

static int32_t g_testFunctionIndex = 0;
static int32_t g_result = -1;
static OH_NativeXComponent_KeyEvent* g_keyEvent = nullptr;
static OH_NativeXComponent_KeyAction g_action = OH_NATIVEXCOMPONENT_KEY_ACTION_UNKNOWN;
static OH_NativeXComponent_EventSourceType g_eventSourceType = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
static int64_t g_deviceId = PARAM_NEGATIVE_2;
static int64_t g_timestamp = PARAM_NEGATIVE_2;
static uint64_t g_targetTimestamp = 0;
static uint64_t g_keys = PARAM_NEGATIVE_2;
static bool g_isNumLockOn = NULL;
static bool g_isCapsLockOn = NULL;
static bool g_isScrollLockOn = NULL;
static XComponent g_xComponent = XComponent(ARKUI_NODE_COLUMN);
static XComponent* g_childXComponent = new XComponent(ARKUI_NODE_XCOMPONENT);
static OHNativeWindow* g_nativeWindow = nullptr;
static OH_NativeXComponent_TouchEvent g_touchEvent;
static int g_touchIndex = 0;
static int32_t g_point = 0;
static int32_t g_action_result = 0;
static void (*const TEST_FUNCTIONS[19])() = {
    XComponent::GetKeyEventAction001,
    XComponent::GetKeyEventAction002,
    XComponent::GetKeyEventSourceType001,
    XComponent::GetKeyEventSourceType002,
    XComponent::GetKeyEventDeviceId001,
    XComponent::GetKeyEventDeviceId002,
    XComponent::GetKeyEventTimestamp001,
    XComponent::GetKeyEventTimestamp002,
    XComponent::GetKeyEventModifierKeyStates001,
    XComponent::GetKeyEventModifierKeyStates002,
    XComponent::GetKeyEventNumLockState001,
    XComponent::GetKeyEventNumLockState002,
    XComponent::GetKeyEventCapsLockState001,
    XComponent::GetKeyEventCapsLockState002,
    XComponent::GetKeyEventScrollLockState001,
    XComponent::GetKeyEventScrollLockState002,
    XComponent::GetKeyEventActionEnum001,
    XComponent::GetKeyEventActionEnum002,
    XComponent::GetKeyEventActionEnum003
};

napi_value ChooseTestFunction(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    napi_get_value_int32(env, args[PARAM_0], &g_testFunctionIndex);
    return nullptr;
}

napi_value GetKeyEventAction(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = PARAM_NEGATIVE_2;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "KeyEventXComponent", "Choose Function GetKeyEventAction");
    if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_UNKNOWN) {
        result = -1;
    } else if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_DOWN) {
        result = 0;
    } else if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_UP) {
        result = 1;
    }
    g_action = OH_NATIVEXCOMPONENT_KEY_ACTION_UNKNOWN;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventActionEnum(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "KeyEventXComponent", "Choose Function GetKeyEventAction");
    napi_create_int32(env, g_action_result, &retValue);
    g_action_result = 0;
    return retValue;
}

napi_value GetKeyEventSourceType(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = PARAM_NEGATIVE_2;
    if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
    } else if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_MOUSE) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_MOUSE;
    } else if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHSCREEN;
    } else if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHPAD) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_TOUCHPAD;
    } else if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_JOYSTICK) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_JOYSTICK;
    } else if (g_eventSourceType == OH_NATIVEXCOMPONENT_SOURCE_TYPE_KEYBOARD) {
        result = OH_NATIVEXCOMPONENT_SOURCE_TYPE_KEYBOARD;
    }
    g_eventSourceType = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventDeviceId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int64_t result = PARAM_NEGATIVE_2;
    if (g_deviceId == PARAM_NEGATIVE_2) {
        result = 0;
    } else {
        result = 1;
    }
    g_deviceId = PARAM_NEGATIVE_2;
    napi_create_int64(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventTimestamp(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int64_t result = PARAM_NEGATIVE_2;
    if (g_timestamp == PARAM_NEGATIVE_2) {
        result = 0;
    } else {
        result = 1;
    }
    g_timestamp = PARAM_NEGATIVE_2;
    napi_create_int64(env, result, &retValue);
    return retValue;
}

napi_value GetKeyEventModifierKeyStates(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_result, &retValue);
    return retValue;
}

napi_value GetKeyEventNumLockState(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_result, &retValue);
    return retValue;
}
napi_value GetKeyEventCapsLockState(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_result, &retValue);
    return retValue;
}
napi_value GetKeyEventScrollLockState(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_result, &retValue);
    return retValue;
}

napi_value AttachNativeRootNode001(napi_env env, napi_callback_info info)
{
    XComponent Column = XComponent(ARKUI_NODE_COLUMN);
    Column.SetBackgroundColor(0xffff0000);
    Column.SetWidth(COLUMN_WIDTH_AND_HEIGHT);
    Column.SetHeight(COLUMN_WIDTH_AND_HEIGHT);
    ArkUI_NativeNodeAPI_1* _nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    _nodeAPI->addChild(g_childXComponent->GetComponent(), Column.GetComponent());
    napi_value retValue = 0;
    int32_t result = OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    result = OH_NativeXComponent_AttachNativeRootNode(g_childXComponent->GetXComponent(), Column.GetComponent()) ==
             OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    OH_NativeXComponent_DetachNativeRootNode(g_childXComponent->GetXComponent(), Column.GetComponent());
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value AttachNativeRootNode002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_AttachNativeRootNode(g_xComponent.GetXComponent(), nullptr) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value DetachNativeRootNode001(napi_env env, napi_callback_info info)
{
    XComponent Column = XComponent(ARKUI_NODE_COLUMN);
    Column.SetBackgroundColor(0xffff0000);
    Column.SetWidth(COLUMN_WIDTH_AND_HEIGHT);
    Column.SetHeight(COLUMN_WIDTH_AND_HEIGHT);
    ArkUI_NativeNodeAPI_1* _nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    _nodeAPI->addChild(g_childXComponent->GetComponent(), Column.GetComponent());
    napi_value retValue = 0;
    int32_t result = OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    OH_NativeXComponent_AttachNativeRootNode(g_childXComponent->GetXComponent(), Column.GetComponent());
    result = OH_NativeXComponent_DetachNativeRootNode(g_childXComponent->GetXComponent(), Column.GetComponent()) ==
             OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value DetachNativeRootNode002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeXComponent_DetachNativeRootNode(g_xComponent.GetXComponent(), nullptr) ==
                     OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                     OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetExpectedFrameRateRange001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_ExpectedRateRange ExpectedRateRange = { .min = 30, .max = 60, .expected = 45 };
    int32_t result = 0;
    result = OH_NativeXComponent_SetExpectedFrameRateRange(g_childXComponent->GetXComponent(), &ExpectedRateRange);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetExpectedFrameRateRange002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_ExpectedRateRange ExpectedRateRange = { .min = 30, .max = 60, .expected = 45 };
    if (OH_NativeXComponent_SetExpectedFrameRateRange(nullptr, &ExpectedRateRange) == 0) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    if (OH_NativeXComponent_SetExpectedFrameRateRange(g_childXComponent->GetXComponent(), nullptr) == 0) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    return retValue;
}

napi_value SetArkUIExpectedFrameRateRange001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_ExpectedRateRange ExpectedRateRange = { .min = 30, .max = 60, .expected = 45 };
    int32_t result = 0;
    OH_ArkUI_XComponent_Initialize(g_childXComponent->GetComponent());
    result = OH_ArkUI_XComponent_SetExpectedFrameRateRange(g_childXComponent->GetComponent(), ExpectedRateRange) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetArkUIExpectedFrameRateRange002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeXComponent_ExpectedRateRange ExpectedRateRange = { .min = 30, .max = 60, .expected = 45 };
    int32_t result = 0;
    result= OH_ArkUI_XComponent_SetExpectedFrameRateRange(nullptr, ExpectedRateRange) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    return retValue;
}

napi_value RegisterOnFrameCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_NativeXComponent_RegisterOnFrameCallback(g_childXComponent->GetXComponent(), OnFrameCallback) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterOnFrameCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterOnFrameCallback(nullptr, OnFrameCallback) ==
             PARAM_NEGATIVE_2 ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ArkUIRegisterOnFrameCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_ArkUI_XComponent_RegisterOnFrameCallback(g_childXComponent->GetComponent(), OnArkUIFrameCallback) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ArkUIRegisterOnFrameCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_ArkUI_XComponent_RegisterOnFrameCallback(nullptr, OnArkUIFrameCallback) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

void OnFrameCallback(OH_NativeXComponent* component, uint64_t timestamp, uint64_t targetTimestamp)
{
    return;
}

void OnArkUIFrameCallback(ArkUI_NodeHandle node, uint64_t timestamp, uint64_t targetTimestamp)
{
    return;
}

napi_value UnregisterOnFrameCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_NativeXComponent_UnregisterOnFrameCallback(g_childXComponent->GetXComponent()) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterOnFrameCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_UnregisterOnFrameCallback(nullptr) ==
             PARAM_NEGATIVE_2 ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ArkUIUnregisterOnFrameCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_ArkUI_XComponent_RegisterOnFrameCallback(g_childXComponent->GetComponent(), OnArkUIFrameCallback);
    result = OH_ArkUI_XComponent_UnregisterOnFrameCallback(g_childXComponent->GetComponent()) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value ArkUIUnregisterOnFrameCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_ArkUI_XComponent_UnregisterOnFrameCallback(nullptr) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterUIInputEventCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_NativeXComponent_RegisterUIInputEventCallback(g_childXComponent->GetXComponent(),
                                                              UIInputEventCallback, ARKUI_UIINPUTEVENT_TYPE_AXIS) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterUIInputEventCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t resul1 = OH_NativeXComponent_RegisterUIInputEventCallback(g_childXComponent->GetXComponent(),
                                                                      UIInputEventCallback,
                                                                      ARKUI_UIINPUTEVENT_TYPE_KEY) ==
                     ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    int32_t resul2 = OH_NativeXComponent_RegisterUIInputEventCallback(g_childXComponent->GetXComponent(),
                                                                      UIInputEventCallback,
                                                                      ARKUI_UIINPUTEVENT_TYPE_MOUSE) ==
                     ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    int32_t resul3 = OH_NativeXComponent_RegisterUIInputEventCallback(g_childXComponent->GetXComponent(),
                                                                      UIInputEventCallback,
                                                                      ARKUI_UIINPUTEVENT_TYPE_TOUCH) ==
                     ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    int32_t resul4 = OH_NativeXComponent_RegisterUIInputEventCallback(g_childXComponent->GetXComponent(),
                                                                      UIInputEventCallback,
                                                                      ARKUI_UIINPUTEVENT_TYPE_UNKNOWN) ==
                     ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    int32_t result = resul1 == ARKUI_ERROR_CODE_PARAM_INVALID || resul2 == ARKUI_ERROR_CODE_PARAM_INVALID ||
                     resul3 == ARKUI_ERROR_CODE_PARAM_INVALID || resul4 == ARKUI_ERROR_CODE_PARAM_INVALID ?
                     ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

void UIInputEventCallback(OH_NativeXComponent* component, ArkUI_UIInputEvent* event, ArkUI_UIInputEvent_Type type)
{
    return;
}

napi_value RegisterOnTouchInterceptCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterOnTouchInterceptCallback(g_childXComponent->GetXComponent(),
                                                                  OnTouchInterceptCallback) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterOnTouchInterceptCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterOnTouchInterceptCallback(nullptr, OnTouchInterceptCallback) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    result = OH_NativeXComponent_RegisterOnTouchInterceptCallback(g_childXComponent->GetXComponent(), nullptr) ==
             ARKUI_ERROR_CODE_PARAM_INVALID && result == ARKUI_ERROR_CODE_PARAM_INVALID ?
             ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

HitTestMode OnTouchInterceptCallback(OH_NativeXComponent* component, ArkUI_UIInputEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TouchPoint", "OnTouchInterceptCallback");
    return HTM_BLOCK;
}

napi_value GetNativeAccessibilityProvider001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_AccessibilityProvider* handle;
    result = OH_NativeXComponent_GetNativeAccessibilityProvider(g_childXComponent->GetXComponent(), &handle) ==
             OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNativeAccessibilityProvider002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    ArkUI_AccessibilityProvider* handle;
    int32_t result = 0;
    result = OH_NativeXComponent_GetNativeAccessibilityProvider(nullptr, &handle) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? PARAM_401 : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    result = OH_NativeXComponent_GetNativeAccessibilityProvider(g_childXComponent->GetXComponent(), nullptr) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == PARAM_401 ?
             result : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterKeyEventCallbackWithResult001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    ArkUI_AccessibilityProvider* handle;
    result = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(g_childXComponent->GetXComponent(),
                                                                    OnKeyEventCallbackWithResult) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
             OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterKeyEventCallbackWithResult002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    ArkUI_AccessibilityProvider* handle;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(nullptr, OnKeyEventCallbackWithResult) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? PARAM_401 : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    result = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(g_childXComponent->GetXComponent(), nullptr) ==
             OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == PARAM_401 ?
             result : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

bool OnKeyEventCallbackWithResult(OH_NativeXComponent* component, void* window)
{
    return false;
}

napi_value XComponentInitialize001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    Component temp = Component(ARKUI_NODE_XCOMPONENT);
    int32_t result = 0;
    result = OH_ArkUI_XComponent_Initialize(temp.GetComponent());
    result = OH_ArkUI_XComponent_Initialize(temp.GetComponent()) == ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID ?
             ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value XComponentFinalize001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    Component temp = Component(ARKUI_NODE_XCOMPONENT);
    int32_t result = 0;
    result = OH_ArkUI_XComponent_Finalize(temp.GetComponent()) == ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID ?
             ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    result = OH_ArkUI_XComponent_Finalize(temp.GetComponent()) == ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID ?
             ARKUI_ERROR_CODE_XCOMPONENT_STATE_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value XComponentSetNeedSoftKeyboard001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_ArkUI_XComponent_SetNeedSoftKeyboard(g_childXComponent->GetComponent(), false) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value XComponentSetNeedSoftKeyboard002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_ArkUI_XComponent_SetNeedSoftKeyboard(nullptr, true) ==
             ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    result = OH_ArkUI_XComponent_SetNeedSoftKeyboard(nullptr, false) ==
             ARKUI_ERROR_CODE_PARAM_INVALID && result == ARKUI_ERROR_CODE_PARAM_INVALID ?
             ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    return retValue;
}

napi_value GetExtraMouseEventInfo001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_NativeXComponent_ExtraMouseEventInfo* ExtraMouseEventInfo;
    result = OH_NativeXComponent_GetExtraMouseEventInfo(g_childXComponent->GetXComponent(), &ExtraMouseEventInfo) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetExtraMouseEventInfo002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    OH_NativeXComponent_ExtraMouseEventInfo* ExtraMouseEventInfo;
    result = OH_NativeXComponent_GetExtraMouseEventInfo(nullptr, &ExtraMouseEventInfo);
    result = OH_NativeXComponent_GetExtraMouseEventInfo(g_childXComponent->GetXComponent(), nullptr) ==
             ARKUI_ERROR_CODE_PARAM_INVALID && result == ARKUI_ERROR_CODE_PARAM_INVALID ?
             ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetMouseEventModifierKeyStates001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_NativeXComponent_ExtraMouseEventInfo* ExtraMouseEventInfo;
    OH_NativeXComponent_GetExtraMouseEventInfo(g_childXComponent->GetXComponent(), &ExtraMouseEventInfo);
    result = OH_NativeXComponent_GetMouseEventModifierKeyStates(ExtraMouseEventInfo, &g_keys) ==
             ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetMouseEventModifierKeyStates002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    OH_NativeXComponent_ExtraMouseEventInfo* ExtraMouseEventInfo;
    OH_NativeXComponent_GetExtraMouseEventInfo(g_childXComponent->GetXComponent(), &ExtraMouseEventInfo);
    result = OH_NativeXComponent_GetMouseEventModifierKeyStates(nullptr, &g_keys);
    result = OH_NativeXComponent_GetMouseEventModifierKeyStates(ExtraMouseEventInfo, nullptr) ==
             ARKUI_ERROR_CODE_PARAM_INVALID && result == ARKUI_ERROR_CODE_PARAM_INVALID ?
             ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterFocusEventCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_NativeXComponent_RegisterFocusEventCallback(g_childXComponent->GetXComponent(), OnFocusEvent);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterFocusEventCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterFocusEventCallback(nullptr, OnFocusEvent);
    result = OH_NativeXComponent_RegisterFocusEventCallback(g_childXComponent->GetXComponent(),
                                                            nullptr) == PARAM_NEGATIVE_2 && result == PARAM_NEGATIVE_2 ?
                                                            ARKUI_ERROR_CODE_PARAM_INVALID : 0;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterBlurEventCallback001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = ARKUI_ERROR_CODE_PARAM_INVALID;
    result = OH_NativeXComponent_RegisterBlurEventCallback(g_childXComponent->GetXComponent(), OnBlurEvent);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterBlurEventCallback002(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = OH_NativeXComponent_RegisterBlurEventCallback(nullptr, OnBlurEvent);
    result = OH_NativeXComponent_RegisterBlurEventCallback(g_childXComponent->GetXComponent(),
                                                           nullptr) == PARAM_NEGATIVE_2 && result == PARAM_NEGATIVE_2 ?
                                                           ARKUI_ERROR_CODE_PARAM_INVALID : 0;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    g_xComponent.SetPercentWidth(PARAM_80);
    g_xComponent.SetPercentHeight(PARAM_80);
    g_xComponent.SetBackgroundColor(0xffff0000);
    g_childXComponent->SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    g_childXComponent->SetXComponentId("TestXComponent");
    g_childXComponent->SetPercentWidth(PARAM_1);
    g_childXComponent->SetPercentHeight(PARAM_1);
    g_childXComponent->SetId("NativeXComponentTest");
    g_childXComponent->SetFocusable(true);
    g_childXComponent->SetFocusDefault(true);
    g_childXComponent->PrintXComponentInfo();
    std::shared_ptr<Component> ptr = std::make_shared<XComponent>(*g_childXComponent);
    g_xComponent.AddChild(ptr);
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, &g_childXComponent);
    OH_NativeXComponent_RegisterKeyEventCallback(g_childXComponent->GetXComponent(), OnKeyEvent);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, g_xComponent.GetComponent());
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

void XComponent::SetXComponentType(ArkUI_XComponentType type)
{
    ArkUI_NumberValue value[] = {0};
    value[0].i32 = type;
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_TYPE, &item);
}

void XComponent::SetXComponentId(char* id)
{
    ArkUI_NumberValue value[] = {0};
    ArkUI_AttributeItem item = {value, 1, id};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_ID, &item);
}

void XComponent::SetXComponentSurfaceSize(uint32_t width, uint32_t height)
{
    ArkUI_NumberValue value[] = {{.u32 = width}, {.u32 = height}};
    ArkUI_AttributeItem item = {value, 2};
    _nodeAPI->setAttribute(_component, NODE_XCOMPONENT_SURFACE_SIZE, &item);
}

void XComponent::SetFocusable(bool flag)
{
    ArkUI_NumberValue FocusValue[] = {{.i32 = flag?1:0}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    _nodeAPI->setAttribute(_component, NODE_FOCUSABLE, &FocusItem);
}

void XComponent::SetFocusDefault(bool flag)
{
    ArkUI_NumberValue FocusValue[] = {{.i32 = flag?1:0}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    _nodeAPI->setAttribute(_component, NODE_DEFAULT_FOCUS, &FocusItem);
}

void XComponent::PrintXComponentInfo()
{
    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(_component);
    if (!nativeXComponent) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent error");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent success");
    auto typeRet = _nodeAPI->getAttribute(_component, NODE_XCOMPONENT_TYPE);
    if (typeRet) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent type: %{public}d",
                 typeRet->value[0].i32);
    }
    auto idRet = _nodeAPI->getAttribute(_component, NODE_XCOMPONENT_ID);
    if (idRet) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent id: %{public}s",
                 idRet->string);
    }
}

void OnFocusEvent(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TouchPoint", "OnFocusEvent");
    return;
}

void OnBlurEvent(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TouchPoint", "OnTouchInterceptCallback");
    return;
}

void OnKeyEvent(OH_NativeXComponent* component, void* window)
{
    // 2. 获取键盘事件数据
    int32_t ret = OH_NativeXComponent_GetKeyEvent(component, &g_keyEvent);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponent", "GetKeyEventError");
        return;
    }
    // 3. 处理按键事件
    if (g_testFunctionIndex >= PARAM_0 && g_testFunctionIndex <= PARAM_18) {
        TEST_FUNCTIONS[g_testFunctionIndex]();
    }
}

void XComponent::GetKeyEventAction001()
{
    g_result = OH_NativeXComponent_GetKeyEventAction(g_keyEvent, &g_action);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventAction001 g_result: %{public}d, g_action: %{public}d",
        g_result, g_action);
}

void XComponent::GetKeyEventAction002()
{
    g_result = OH_NativeXComponent_GetKeyEventAction(nullptr, &g_action);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventAction002 g_result: %{public}d, g_action: %{public}d",
        g_result, g_action);
}

void XComponent::GetKeyEventActionEnum001()
{
    g_result = OH_NativeXComponent_GetKeyEventAction(g_keyEvent, &g_action);
    if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_DOWN) {
        g_action_result = 1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventActionEnum001 g_result: %{public}d, g_action: %{public}d, g_action_result: %{public}d",
        g_result, g_action, g_action_result);
}

void XComponent::GetKeyEventActionEnum002()
{
    g_result = OH_NativeXComponent_GetKeyEventAction(g_keyEvent, &g_action);
    if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_UP) {
        g_action_result = 1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventActionEnum002 g_result: %{public}d, g_action: %{public}d, g_action_result: %{public}d",
        g_result, g_action, g_action_result);
}

void XComponent::GetKeyEventActionEnum003()
{
    g_result = OH_NativeXComponent_GetKeyEventAction(g_keyEvent, &g_action);
    if (g_action == OH_NATIVEXCOMPONENT_KEY_ACTION_UNKNOWN) {
        g_action_result = 1;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventActionEnum003 g_result: %{public}d, g_action: %{public}d, g_action_result: %{public}d",
        g_result, g_action, g_action_result);
}

void XComponent::GetKeyEventSourceType001()
{
    g_result = OH_NativeXComponent_GetKeyEventSourceType(g_keyEvent, &g_eventSourceType);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventSourceType001 g_result: %{public}d, g_eventSourceType: %{public}d",
        g_result, g_eventSourceType);
}

void XComponent::GetKeyEventSourceType002()
{
    g_result = OH_NativeXComponent_GetKeyEventSourceType(nullptr, &g_eventSourceType);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventSourceType002 g_result: %{public}d, g_eventSourceType: %{public}d",
        g_result, g_eventSourceType);
}

void XComponent::GetKeyEventDeviceId001()
{
    g_result = OH_NativeXComponent_GetKeyEventDeviceId(g_keyEvent, &g_deviceId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventDeviceId001 g_result: %{public}d, g_deviceId: %{public}d",
        g_result, g_deviceId);
}

void XComponent::GetKeyEventDeviceId002()
{
    g_result = OH_NativeXComponent_GetKeyEventDeviceId(nullptr, &g_deviceId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventDeviceId002 g_result: %{public}d, g_deviceId: %{public}d",
        g_result, g_deviceId);
}

void XComponent::GetKeyEventTimestamp001()
{
    g_result = OH_NativeXComponent_GetKeyEventTimestamp(g_keyEvent, &g_timestamp);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventTimestamp001 g_result: %{public}d, g_timestamp: %{public}d",
        g_result, g_timestamp);
}

void XComponent::GetKeyEventTimestamp002()
{
    g_result = OH_NativeXComponent_GetKeyEventTimestamp(nullptr, &g_timestamp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventTimestamp002 g_result: %{public}d, g_timestamp: %{public}d",
        g_result, g_timestamp);
}

void XComponent::GetKeyEventModifierKeyStates001()
{
    g_result = OH_NativeXComponent_GetKeyEventModifierKeyStates(g_keyEvent, &g_keys) ==
               ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventModifierKeyStates001 g_result: %{public}d, g_keys: %{public}d",
        g_result, g_keys);
}

void XComponent::GetKeyEventModifierKeyStates002()
{
    g_result = OH_NativeXComponent_GetKeyEventModifierKeyStates(nullptr, &g_keys) ==
               ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventModifierKeyStates002 g_result: %{public}d, g_keys: %{public}d",
        g_result, g_keys);
}

void XComponent::GetKeyEventNumLockState001()
{
    g_result = OH_NativeXComponent_GetKeyEventNumLockState(g_keyEvent, &g_isNumLockOn) ==
               ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventNumLockState001 g_result: %{public}d, g_isNumLockOn: %{public}d",
        g_result, g_isNumLockOn);
}

void XComponent::GetKeyEventNumLockState002()
{
    g_result = OH_NativeXComponent_GetKeyEventNumLockState(nullptr, &g_isNumLockOn) ==
               ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventNumLockState002 g_result: %{public}d, g_isNumLockOn: %{public}d",
        g_result, g_isNumLockOn);
}

void XComponent::GetKeyEventCapsLockState001()
{
    g_result = OH_NativeXComponent_GetKeyEventCapsLockState(g_keyEvent, &g_isCapsLockOn) ==
               ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventCapsLockState001 g_result: %{public}d, g_isCapsLockOn: %{public}d",
        g_result, g_isCapsLockOn);
}

void XComponent::GetKeyEventCapsLockState002()
{
    g_result = OH_NativeXComponent_GetKeyEventCapsLockState(nullptr, &g_isCapsLockOn) ==
               ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventCapsLockState002 g_result: %{public}d, g_isCapsLockOn: %{public}d",
        g_result, g_isCapsLockOn);
}

void XComponent::GetKeyEventScrollLockState001()
{
    g_result = OH_NativeXComponent_GetKeyEventScrollLockState(g_keyEvent, &g_isScrollLockOn) ==
               ARKUI_ERROR_CODE_NO_ERROR ? ARKUI_ERROR_CODE_NO_ERROR : ARKUI_ERROR_CODE_PARAM_INVALID;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventScrollLockState001 g_result: %{public}d, g_isScrollLockOn: %{public}d",
        g_result, g_isScrollLockOn);
}

void XComponent::GetKeyEventScrollLockState002()
{
    g_result = OH_NativeXComponent_GetKeyEventScrollLockState(nullptr, &g_isScrollLockOn) ==
               ARKUI_ERROR_CODE_PARAM_INVALID ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventXComponent",
        "Choose Function GetKeyEventScrollLockState002 g_result: %{public}d, g_isScrollLockOn: %{public}d",
        g_result, g_isScrollLockOn);
}

}

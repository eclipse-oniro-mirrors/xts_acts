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

#include "AccessibilityTest.h"
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

namespace AccessibilityTools {
int32_t FindAccessibilityNodeInfosById(
    int64_t elementId,
    ArkUI_AccessibilitySearchMode mode,
    int32_t requestId,
    ArkUI_AccessibilityElementInfoList* elementList)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindAccessibilityNodeInfosByText(
    int64_t elementId,
    const char* text,
    int32_t requestId,
    ArkUI_AccessibilityElementInfoList* elementList)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindFocusedAccessibilityNode(
    int64_t elementId,
    ArkUI_AccessibilityFocusType focusType,
    int32_t requestId,
    ArkUI_AccessibilityElementInfo* elementInfo)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindNextFocusAccessibilityNode(
    int64_t elementId,
    ArkUI_AccessibilityFocusMoveDirection direction,
    int32_t requestId,
    ArkUI_AccessibilityElementInfo* elementInfo)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t ExecuteAccessibilityAction(
    int64_t elementId,
    ArkUI_Accessibility_ActionType actionType,
    ArkUI_AccessibilityActionArguments *actionArguments,
    int32_t requestId)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t ClearFocusedFocusAccessibilityNode()
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t GetAccessibilityNodeCursorPosition(
    int64_t elementId,
    int32_t requestId,
    int32_t* index)
{
    *index = 0;
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindAccessibilityNodeInfosById(
    const char* instanceId,
    int64_t elementId,
    ArkUI_AccessibilitySearchMode mode,
    int32_t requestId,
    ArkUI_AccessibilityElementInfoList* elementList)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindAccessibilityNodeInfosByText(
    const char* instanceId,
    int64_t elementId,
    const char* text,
    int32_t requestId,
    ArkUI_AccessibilityElementInfoList* elementList)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindFocusedAccessibilityNode(
    const char* instanceId,
    int64_t elementId,
    ArkUI_AccessibilityFocusType focusType,
    int32_t requestId,
    ArkUI_AccessibilityElementInfo* elementInfo)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t FindNextFocusAccessibilityNode(
    const char* instanceId,
    int64_t elementId,
    ArkUI_AccessibilityFocusMoveDirection direction,
    int32_t requestId,
    ArkUI_AccessibilityElementInfo* elementInfo)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t ExecuteAccessibilityAction(
    const char* instanceId,
    int64_t elementId,
    ArkUI_Accessibility_ActionType actionType,
    ArkUI_AccessibilityActionArguments *actionArguments,
    int32_t requestId)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t ClearFocusedFocusAccessibilityNode(const char* instanceId)
{
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

int32_t GetAccessibilityNodeCursorPosition(
    const char* instanceId,
    int64_t elementId,
    int32_t requestId,
    int32_t* index)
{
    *index = 0;
    return ArkUI_AcessbilityErrorCode(SUCCESS_CODE);
}

napi_value RegisterCallback0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto node = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    if (node == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(node);
    if (provider == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityProviderCallbacks callbacks = {
        .findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById,
        .findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText,
        .findFocusedAccessibilityNode = FindFocusedAccessibilityNode,
        .findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode,
        .executeAccessibilityAction = ExecuteAccessibilityAction,
        .clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode,
        .getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition
    };
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallback(provider, &callbacks);
    OH_ArkUI_AccessibilityProvider_Dispose(provider);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterCallback0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityProviderCallbacks callbacks = {
        .findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById,
        .findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText,
        .findFocusedAccessibilityNode = FindFocusedAccessibilityNode,
        .findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode,
        .executeAccessibilityAction = ExecuteAccessibilityAction,
        .clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode,
        .getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition
    };
    ArkUI_AccessibilityProvider *provider = nullptr;
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallback(provider, &callbacks);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterCallback0300(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto node = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    if (node == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(node);
    if (provider == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallback(provider, nullptr);
    OH_ArkUI_AccessibilityProvider_Dispose(provider);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterCallbackWithInstance0100(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto node = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    if (node == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(node);
    if (provider == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    
    const char* instanceId = "id";
    ArkUI_AccessibilityProviderCallbacksWithInstance callbacks = {
        .findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById,
        .findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText,
        .findFocusedAccessibilityNode = FindFocusedAccessibilityNode,
        .findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode,
        .executeAccessibilityAction = ExecuteAccessibilityAction,
        .clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode,
        .getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition
    };
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(instanceId, provider, &callbacks);
    OH_ArkUI_AccessibilityProvider_Dispose(provider);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterCallbackWithInstance0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityProviderCallbacksWithInstance callbacks = {
        .findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById,
        .findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText,
        .findFocusedAccessibilityNode = FindFocusedAccessibilityNode,
        .findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode,
        .executeAccessibilityAction = ExecuteAccessibilityAction,
        .clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode,
        .getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition
    };
    const char* instanceId = "id";
    ArkUI_AccessibilityProvider *provider = nullptr;
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(instanceId, provider, &callbacks);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterCallbackWithInstance0300(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto node = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    if (node == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(node);
    if (provider == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* instanceId = "id";
    int32_t result = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(instanceId, provider, nullptr);
    OH_ArkUI_AccessibilityProvider_Dispose(provider);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

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

#include "TextInputContentType.h"
#include "arkui/native_interface_accessibility.h"

namespace TextInputContentTypeTest {
int g_mode1 = 1;
int g_mode2 = 1;
int g_mode3 = 1;
int g_focusType1 = 1;
int g_focusType2 = 1;
int g_focusType3 = 1;
int g_direction1 = 1;
int g_direction2 = 1;
int g_direction3 = 1;
int g_direction4 = 1;
int g_direction5 = 1;
napi_value ActionTypeTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_INVALID),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_LONG_CLICK),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_003(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_FORWARD),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SCROLL_BACKWARD),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_005(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_COPY),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_006(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PASTE),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_007(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CUT),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_008(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SELECT_TEXT),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_009(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_TEXT),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ActionTypeTest_010(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_SET_CURSOR_POSITION),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_INVALID);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_LONG_CLICKED);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_003(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SELECTED);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_TEXT_UPDATE);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_005(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_STATE_UPDATE);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_006(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CONTENT_UPDATE);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_007(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_SCROLLED);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_008(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_REQUEST_ACCESSIBILITY_FOCUS);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_009(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_OPEN);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_010(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_PAGE_CLOSE);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_011(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ANNOUNCE_FOR_ACCESSIBILITY);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value EventTypeTest_012(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityEventType eventType =
        ArkUI_AccessibilityEventType(ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_FOCUS_NODE_UPDATE);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value AcessbilityErrorCodeTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    int32_t elementId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, elementId);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : 1, &retValue);
    return retValue;
}

napi_value AcessbilityErrorCodeTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t elementId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, elementId);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ? 0 : 1, &retValue);
    return retValue;
}
int32_t FindAccessibilityNodeInfosById(int64_t elementId, ArkUI_AccessibilitySearchMode mode, int32_t requestId,
                                       ArkUI_AccessibilityElementInfoList* elementList)
{
    switch (mode) {
        case ARKUI_ACCESSIBILITY_NATIVE_SEARCH_MODE_PREFETCH_PREDECESSORS:
            g_mode1 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_SEARCH_MODE_PREFETCH_SIBLINGS:
            g_mode2 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_SEARCH_MODE_PREFETCH_CHILDREN:
            g_mode3 = 0;
            break;
    };
}

int32_t FindFocusedAccessibilityNode(int64_t elementId, ArkUI_AccessibilityFocusType focusType,
                                     int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo)
{
    switch (focusType) {
        case ARKUI_ACCESSIBILITY_NATIVE_FOCUS_TYPE_INVALID :
            g_focusType1 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_FOCUS_TYPE_INPUT :
            g_focusType2 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_FOCUS_TYPE_ACCESSIBILITY :
            g_focusType3 = 0;
            break;
    };
}
int32_t FindNextFocusAccessibilityNode(int64_t elementId, ArkUI_AccessibilityFocusMoveDirection direction,
                                       int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo)
{
    switch (direction) {
        case ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_INVALID:
            g_direction1 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_UP:
            g_direction2 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_DOWN:
            g_direction3 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_LEFT:
            g_direction2 = 0;
            break;
        case ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_RIGHT:
            g_direction3 = 0;
            break;
    };
}
napi_value CreateAccessibilityNode(napi_env env, napi_callback_info info)
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
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    auto node1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto node11 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto node2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, node1);
    nodeAPI->addChild(node1, node11);
    nodeAPI->addChild(column, node2);
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(column);
    ArkUI_AccessibilityProvider* provider1 = OH_ArkUI_AccessibilityProvider_Create(node1);
    ArkUI_AccessibilityProvider* provider11 = OH_ArkUI_AccessibilityProvider_Create(node11);
    ArkUI_AccessibilityProvider* provider2 = OH_ArkUI_AccessibilityProvider_Create(node2);
    ArkUI_AccessibilityElementInfoList* elementList;
    ArkUI_AccessibilityProviderCallbacks callbacks = {
        .findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById,
        .findFocusedAccessibilityNode = FindFocusedAccessibilityNode,
        .findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode,
    };
    OH_ArkUI_AccessibilityProviderRegisterCallback(provider, &callbacks);
    OH_ArkUI_AccessibilityProviderRegisterCallback(provider1, &callbacks);
    OH_ArkUI_AccessibilityProvider_Dispose(provider);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value AccessibilitySearchModeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_mode1, &retValue);
    return retValue;
}
}
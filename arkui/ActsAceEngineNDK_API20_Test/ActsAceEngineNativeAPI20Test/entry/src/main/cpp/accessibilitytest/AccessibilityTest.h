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

#ifndef TEST1_H
#define TEST1_H

#include <arkui/native_node_napi.h>
#include "common/Common.h"
#include "napi/native_api.h"
#include <arkui/native_interface_accessibility.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <js_native_api_types.h>
#include <cstdint>

namespace AccessibilityTools {
    const uint32_t MAX_NAME_LENGTH = 1024;
    const uint32_t RESULT_BAD_PARAMETER = -2;
    const int32_t SUCCESS_CODE = 0;

    // AccessibilityCallBack function declarations
    int32_t FindAccessibilityNodeInfosById(
        int64_t elementId,
        ArkUI_AccessibilitySearchMode mode,
        int32_t requestId,
        ArkUI_AccessibilityElementInfoList* elementList);

    int32_t FindAccessibilityNodeInfosByText(
        int64_t elementId,
        const char* text,
        int32_t requestId,
        ArkUI_AccessibilityElementInfoList* elementList);

    int32_t FindFocusedAccessibilityNode(
        int64_t elementId,
        ArkUI_AccessibilityFocusType focusType,
        int32_t requestId,
        ArkUI_AccessibilityElementInfo* elementInfo);

    int32_t FindNextFocusAccessibilityNode(
        int64_t elementId,
        ArkUI_AccessibilityFocusMoveDirection direction,
        int32_t requestId,
        ArkUI_AccessibilityElementInfo* elementInfo);

    int32_t ExecuteAccessibilityAction(
        int64_t elementId,
        ArkUI_Accessibility_ActionType action,
        ArkUI_AccessibilityActionArguments *actionArguments,
        int32_t requestId);

    int32_t ClearFocusedFocusAccessibilityNode();

    int32_t GetAccessibilityNodeCursorPosition(
        int64_t elementId,
        int32_t requestId,
        int32_t* index);

    // Version with instanceId parameter
    int32_t FindAccessibilityNodeInfosById(
        const char* instanceId,
        int64_t elementId,
        ArkUI_AccessibilitySearchMode mode,
        int32_t requestId,
        ArkUI_AccessibilityElementInfoList* elementList);

    int32_t FindAccessibilityNodeInfosByText(
        const char* instanceId,
        int64_t elementId,
        const char* text,
        int32_t requestId,
        ArkUI_AccessibilityElementInfoList* elementList);

    int32_t FindFocusedAccessibilityNode(
        const char* instanceId,
        int64_t elementId,
        ArkUI_AccessibilityFocusType focusType,
        int32_t requestId,
        ArkUI_AccessibilityElementInfo* elementInfo);

    int32_t FindNextFocusAccessibilityNode(
        const char* instanceId,
        int64_t elementId,
        ArkUI_AccessibilityFocusMoveDirection direction,
        int32_t requestId,
        ArkUI_AccessibilityElementInfo* elementInfo);

    int32_t ExecuteAccessibilityAction(
        const char* instanceId,
        int64_t elementId,
        ArkUI_Accessibility_ActionType action,
        ArkUI_AccessibilityActionArguments *actionArguments,
        int32_t requestId);

    int32_t ClearFocusedFocusAccessibilityNode(const char* instanceId);

    int32_t GetAccessibilityNodeCursorPosition(
        const char* instanceId,
        int64_t elementId,
        int32_t requestId,
        int32_t* index);

    // NAPI function declarations
    napi_value RegisterCallback0100(napi_env env, napi_callback_info info);
    napi_value RegisterCallback0200(napi_env env, napi_callback_info info);
    napi_value RegisterCallback0300(napi_env env, napi_callback_info info);
    napi_value RegisterCallbackWithInstance0100(napi_env env, napi_callback_info info);
    napi_value RegisterCallbackWithInstance0200(napi_env env, napi_callback_info info);
    napi_value RegisterCallbackWithInstance0300(napi_env env, napi_callback_info info);

    // Element ID related functions
    napi_value SetElementId0100(napi_env env, napi_callback_info info);
    napi_value SetElementId0200(napi_env env, napi_callback_info info);

    // Parent ID related functions
    napi_value SetParentId0100(napi_env env, napi_callback_info info);
    napi_value SetParentId0200(napi_env env, napi_callback_info info);

    // Component Type related functions
    napi_value SetComponentType0100(napi_env env, napi_callback_info info);
    napi_value SetComponentType0200(napi_env env, napi_callback_info info);
    napi_value SetComponentType0300(napi_env env, napi_callback_info info);

    // Contents related functions
    napi_value SetContents0100(napi_env env, napi_callback_info info);
    napi_value SetContents0200(napi_env env, napi_callback_info info);
    napi_value SetContents0300(napi_env env, napi_callback_info info);

    // Hint Text related functions
    napi_value SetHintText0100(napi_env env, napi_callback_info info);
    napi_value SetHintText0200(napi_env env, napi_callback_info info);
    napi_value SetHintText0300(napi_env env, napi_callback_info info);

    // Text related functions
    napi_value SetAccessibilityText0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityText0200(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityText0300(napi_env env, napi_callback_info info);

    // Description related functions
    napi_value SetAccessibilityDescription0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityDescription0200(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityDescription0300(napi_env env, napi_callback_info info);

    // Child Node IDs related functions
    napi_value SetChildNodeIds0100(napi_env env, napi_callback_info info);
    napi_value SetChildNodeIds0200(napi_env env, napi_callback_info info);
    napi_value SetChildNodeIds0300(napi_env env, napi_callback_info info);
    napi_value SetChildNodeIds0400(napi_env env, napi_callback_info info);

    // Operation Actions related functions
    napi_value SetOperationActions0100(napi_env env, napi_callback_info info);
    napi_value SetOperationActions0200(napi_env env, napi_callback_info info);
    napi_value SetOperationActions0300(napi_env env, napi_callback_info info);
    napi_value SetOperationActions0400(napi_env env, napi_callback_info info);

    // Screen Rect related functions
    napi_value SetScreenRect0100(napi_env env, napi_callback_info info);
    napi_value SetScreenRect0200(napi_env env, napi_callback_info info);
    napi_value SetScreenRect0300(napi_env env, napi_callback_info info);

//3
    // Boolean property setters (all follow the same pattern with 0100/0200 variants)
    napi_value SetCheckable0100(napi_env env, napi_callback_info info);
    napi_value SetCheckable0200(napi_env env, napi_callback_info info);

    napi_value SetChecked0100(napi_env env, napi_callback_info info);
    napi_value SetChecked0200(napi_env env, napi_callback_info info);

    napi_value SetFocusable0100(napi_env env, napi_callback_info info);
    napi_value SetFocusable0200(napi_env env, napi_callback_info info);

    napi_value SetFocused0100(napi_env env, napi_callback_info info);
    napi_value SetFocused0200(napi_env env, napi_callback_info info);

    napi_value SetVisible0100(napi_env env, napi_callback_info info);
    napi_value SetVisible0200(napi_env env, napi_callback_info info);

    napi_value SetAccessibilityFocused0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityFocused0200(napi_env env, napi_callback_info info);

    napi_value SetSelected0100(napi_env env, napi_callback_info info);
    napi_value SetSelected0200(napi_env env, napi_callback_info info);

    napi_value SetClickable0100(napi_env env, napi_callback_info info);
    napi_value SetClickable0200(napi_env env, napi_callback_info info);

    napi_value SetLongClickable0100(napi_env env, napi_callback_info info);
    napi_value SetLongClickable0200(napi_env env, napi_callback_info info);

    napi_value SetEnabled0100(napi_env env, napi_callback_info info);
    napi_value SetEnabled0200(napi_env env, napi_callback_info info);

    // Boolean property setters
    napi_value SetIsPassword0100(napi_env env, napi_callback_info info);
    napi_value SetIsPassword0200(napi_env env, napi_callback_info info);
    
    napi_value SetScrollable0100(napi_env env, napi_callback_info info);
    napi_value SetScrollable0200(napi_env env, napi_callback_info info);
    
    napi_value SetEditable0100(napi_env env, napi_callback_info info);
    napi_value SetEditable0200(napi_env env, napi_callback_info info);
    
    napi_value SetIsHint0100(napi_env env, napi_callback_info info);
    napi_value SetIsHint0200(napi_env env, napi_callback_info info);

    // Range info related functions
    napi_value SetRangeInfo0100(napi_env env, napi_callback_info info);
    napi_value SetRangeInfo0200(napi_env env, napi_callback_info info);
    napi_value SetRangeInfo0300(napi_env env, napi_callback_info info);

    // Grid info related functions
    napi_value SetGridInfo0100(napi_env env, napi_callback_info info);
    napi_value SetGridInfo0200(napi_env env, napi_callback_info info);
    napi_value SetGridInfo0300(napi_env env, napi_callback_info info);

    // Grid item info related functions
    napi_value SetGridItemInfo0100(napi_env env, napi_callback_info info);
    napi_value SetGridItemInfo0200(napi_env env, napi_callback_info info);
    napi_value SetGridItemInfo0300(napi_env env, napi_callback_info info);

    // Text selection related functions
    napi_value SetSelectedTextStart0100(napi_env env, napi_callback_info info);
    napi_value SetSelectedTextStart0200(napi_env env, napi_callback_info info);
    
    napi_value SetSelectedTextEnd0100(napi_env env, napi_callback_info info);
    napi_value SetSelectedTextEnd0200(napi_env env, napi_callback_info info);

    // Item index related functions
    napi_value SetCurrentItemIndex0100(napi_env env, napi_callback_info info);
    napi_value SetCurrentItemIndex0200(napi_env env, napi_callback_info info);

    napi_value SetStartItemIndex0100(napi_env env, napi_callback_info info);
    napi_value SetStartItemIndex0200(napi_env env, napi_callback_info info);
    
    napi_value SetEndItemIndex0100(napi_env env, napi_callback_info info);
    napi_value SetEndItemIndex0200(napi_env env, napi_callback_info info);
    
    napi_value SetItemCount0100(napi_env env, napi_callback_info info);
    napi_value SetItemCount0200(napi_env env, napi_callback_info info);
    
    napi_value SetAccessibilityOffset0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityOffset0200(napi_env env, napi_callback_info info);
    
    napi_value SetAccessibilityGroup0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityGroup0200(napi_env env, napi_callback_info info);
    
    napi_value SetAccessibilityLevel0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityLevel0200(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityLevel0300(napi_env env, napi_callback_info info);
    
    napi_value SetZIndex0100(napi_env env, napi_callback_info info);
    napi_value SetZIndex0200(napi_env env, napi_callback_info info);
    
    napi_value SetAccessibilityOpacity0100(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityOpacity0200(napi_env env, napi_callback_info info);
    napi_value SetAccessibilityOpacity0300(napi_env env, napi_callback_info info);
    
    napi_value SetBackgroundColor0100(napi_env env, napi_callback_info info);
    napi_value SetBackgroundColor0200(napi_env env, napi_callback_info info);
    napi_value SetBackgroundColor0300(napi_env env, napi_callback_info info);
    
    napi_value SetBackgroundImage0100(napi_env env, napi_callback_info info);
    napi_value SetBackgroundImage0200(napi_env env, napi_callback_info info);
    napi_value SetBackgroundImage0300(napi_env env, napi_callback_info info);

    // Element Info Functions
    napi_value SetBlur0100(napi_env env, napi_callback_info info);
    napi_value SetBlur0200(napi_env env, napi_callback_info info);
    napi_value SetBlur0300(napi_env env, napi_callback_info info);
    
    napi_value SetHitTestBehavior0100(napi_env env, napi_callback_info info);
    napi_value SetHitTestBehavior0200(napi_env env, napi_callback_info info);
    napi_value SetHitTestBehavior0300(napi_env env, napi_callback_info info);
    
    // Event Info Functions
    napi_value SetEventType0100(napi_env env, napi_callback_info info);
    napi_value SetEventType0200(napi_env env, napi_callback_info info);
    
    napi_value SetTextAnnouncedForAccessibility0100(napi_env env, napi_callback_info info);
    napi_value SetTextAnnouncedForAccessibility0200(napi_env env, napi_callback_info info);
    
    napi_value SetRequestFocusId0100(napi_env env, napi_callback_info info);
    napi_value SetRequestFocusId0200(napi_env env, napi_callback_info info);
    
    napi_value SetElementInfo0100(napi_env env, napi_callback_info info);
    napi_value SetElementInfo0200(napi_env env, napi_callback_info info);
    napi_value SetElementInfo0300(napi_env env, napi_callback_info info);
    
    // Action Functions
    napi_value ActionArgumentByKey0100(napi_env env, napi_callback_info info);
    napi_value ActionArgumentByKey0200(napi_env env, napi_callback_info info);

} // namespace AccessibilityTools

#endif // TEST1_H
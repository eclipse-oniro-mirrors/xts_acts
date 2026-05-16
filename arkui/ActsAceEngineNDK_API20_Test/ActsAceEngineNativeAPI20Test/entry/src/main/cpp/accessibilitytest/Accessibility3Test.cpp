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
#include <arkui/native_interface_accessibility.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace AccessibilityTools {
napi_value SetCheckable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool checkable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, checkable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetCheckable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool checkable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, checkable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChecked0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool checked = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, checked);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChecked0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool checked = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, checked);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetFocusable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool focusable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetFocusable(elementInfo, focusable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetFocusable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool focusable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetFocusable(elementInfo, focusable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetFocused0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool isFocused = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetFocused(elementInfo, isFocused);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetFocused0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool isFocused = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetFocused(elementInfo, isFocused);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetVisible0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool isVisible = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, isVisible);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetVisible0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool isVisible = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, isVisible);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityFocused0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool accessibilityFocused = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityFocused(elementInfo, accessibilityFocused);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityFocused0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool accessibilityFocused = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityFocused(elementInfo, accessibilityFocused);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelected0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool selected = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelected(elementInfo, selected);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelected0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool selected = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelected(elementInfo, selected);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetClickable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool clickable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, clickable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetClickable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool clickable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, clickable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetLongClickable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool longClickable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetLongClickable(elementInfo, longClickable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetLongClickable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool longClickable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetLongClickable(elementInfo, longClickable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEnabled0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool isEnabled = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, isEnabled);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEnabled0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool isEnabled = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, isEnabled);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
}

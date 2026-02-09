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

#include "accessibilitytest/AccessibilityTest.h"
#include <arkui/native_interface_accessibility.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace AccessibilityTools {
napi_value SetIsPassword0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool isPassword = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetIsPassword(elementInfo, isPassword);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetIsPassword0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool isPassword = false;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetIsPassword(elementInfo, isPassword);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetScrollable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool scrollable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetScrollable(elementInfo, scrollable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetScrollable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool scrollable = false;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetScrollable(elementInfo, scrollable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEditable0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool editable = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEditable(elementInfo, editable);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEditable0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool editable = false;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEditable(elementInfo, editable);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetIsHint0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool isHint = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetIsHint(elementInfo, isHint);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetIsHint0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool isHint = false;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetIsHint(elementInfo, isHint);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetRangeInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibleRangeInfo range = {
        .min = 0.0,
        .max = 100.0,
        .current = 50.0,
    };
    ArkUI_AccessibleRangeInfo* rangeInfo = reinterpret_cast<ArkUI_AccessibleRangeInfo*>(&range);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetRangeInfo(elementInfo, rangeInfo);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetRangeInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    ArkUI_AccessibleRangeInfo range = {
        .min = 0.0,
        .max = 100.0,
        .current = 50.0,
    };
    ArkUI_AccessibleRangeInfo* rangeInfo = reinterpret_cast<ArkUI_AccessibleRangeInfo*>(&range);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetRangeInfo(elementInfo, rangeInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetRangeInfo0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibleRangeInfo* rangeInfo = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetRangeInfo(elementInfo, rangeInfo);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibleGridInfo grid = {
        .rowCount = 4,
        .columnCount = 4,
        .selectionMode = 1,
    };
    ArkUI_AccessibleGridInfo* gridInfo = reinterpret_cast<ArkUI_AccessibleGridInfo*>(&grid);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridInfo(elementInfo, gridInfo);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    ArkUI_AccessibleGridInfo* gridInfo = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridInfo(elementInfo, gridInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridInfo0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    ArkUI_AccessibleGridInfo* gridInfo = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridInfo(elementInfo, gridInfo);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridItemInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibleGridItemInfo GridItem = {
        .heading = true,
        .selected = true,
        .columnIndex = 2,
        .rowIndex = 5,
        .columnSpan = 3,
        .rowSpan = 1,
    };
    ArkUI_AccessibleGridItemInfo* gridItem = reinterpret_cast<ArkUI_AccessibleGridItemInfo*>(&GridItem);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridItemInfo(elementInfo, gridItem);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridItemInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    ArkUI_AccessibleGridItemInfo GridItem = {
        .heading = true,
        .selected = true,
        .columnIndex = 2,
        .rowIndex = 5,
        .columnSpan = 3,
        .rowSpan = 1,
    };
    ArkUI_AccessibleGridItemInfo* gridItem = reinterpret_cast<ArkUI_AccessibleGridItemInfo*>(&GridItem);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridItemInfo(elementInfo, gridItem);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGridItemInfo0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    ArkUI_AccessibleGridItemInfo* gridItem = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetGridItemInfo(elementInfo, gridItem);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelectedTextStart0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t selectedTextStart = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelectedTextStart(elementInfo, selectedTextStart);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelectedTextStart0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t selectedTextStart = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelectedTextStart(elementInfo, selectedTextStart);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelectedTextEnd0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t selectedTextEnd = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelectedTextEnd(elementInfo, selectedTextEnd);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetSelectedTextEnd0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t selectedTextEnd = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetSelectedTextEnd(elementInfo, selectedTextEnd);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetCurrentItemIndex0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t currentItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetCurrentItemIndex(elementInfo, currentItemIndex);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetCurrentItemIndex0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t currentItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetCurrentItemIndex(elementInfo, currentItemIndex);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

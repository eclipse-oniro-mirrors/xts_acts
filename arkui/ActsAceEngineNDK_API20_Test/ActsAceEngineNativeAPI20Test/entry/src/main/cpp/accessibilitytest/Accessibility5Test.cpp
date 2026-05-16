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
napi_value SetStartItemIndex0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t startItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetStartItemIndex(elementInfo, startItemIndex);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetStartItemIndex0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t startItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetStartItemIndex(elementInfo, startItemIndex);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEndItemIndex0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t endItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEndItemIndex(elementInfo, endItemIndex);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEndItemIndex0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t endItemIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetEndItemIndex(elementInfo, endItemIndex);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetItemCount0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t itemCount = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetItemCount(elementInfo, itemCount);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetItemCount0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t itemCount = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetItemCount(elementInfo, itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityOffset0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t offset = 20;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityOffset(elementInfo, offset);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityOffset0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t offset = 20;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityOffset(elementInfo, offset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityGroup0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    bool accessibilityGroup = true;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup(elementInfo, accessibilityGroup);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityGroup0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    bool accessibilityGroup = false;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup(elementInfo, accessibilityGroup);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityLevel0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* accessibilityLevel = "basic";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(elementInfo, accessibilityLevel);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityLevel0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* accessibilityLevel = "basic";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(elementInfo, accessibilityLevel);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityLevel0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* accessibilityLevel = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(elementInfo, accessibilityLevel);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetZIndex0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t zIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetZIndex(elementInfo, zIndex);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetZIndex0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t zIndex = 1;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetZIndex(elementInfo, zIndex);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityOpacity0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    float opacity = 0.5f;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity(elementInfo, opacity);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityOpacity0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    float opacity = 0.5f;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity(elementInfo, opacity);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityOpacity0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    float opacity = NAN;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity(elementInfo, opacity);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundColor0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* backgroundColor = "#FF0000";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundColor(elementInfo, backgroundColor);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundColor0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* backgroundColor = "#FF0000";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundColor(elementInfo, backgroundColor);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundColor0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* backgroundColor = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundColor(elementInfo, backgroundColor);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundImage0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* backgroundImage = "media/icon.png";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundImage(elementInfo, backgroundImage);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundImage0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* backgroundImage = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundImage(elementInfo, backgroundImage);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBackgroundImage0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* backgroundImage = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBackgroundImage(elementInfo, backgroundImage);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

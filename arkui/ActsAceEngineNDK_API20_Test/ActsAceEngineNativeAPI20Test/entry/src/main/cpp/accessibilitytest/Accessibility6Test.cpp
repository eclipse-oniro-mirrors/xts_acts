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
napi_value SetBlur0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* blur = "10.0px";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBlur(elementInfo, blur);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBlur0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* blur = "10.0px";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBlur(elementInfo, blur);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetBlur0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* blur = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetBlur(elementInfo, blur);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHitTestBehavior0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* hitTestBehavior = "clickable";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior(elementInfo, hitTestBehavior);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHitTestBehavior0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* hitTestBehavior = "clickable";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior(elementInfo, hitTestBehavior);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHitTestBehavior0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* hitTestBehavior = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior(elementInfo, hitTestBehavior);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEventType0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    if (eventInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityEventType eventType = ArkUI_AccessibilityEventType(0x00000001);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetEventType0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = nullptr;
    ArkUI_AccessibilityEventType eventType = ArkUI_AccessibilityEventType(0x00000001);
    int32_t result = OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetTextAnnouncedForAccessibility0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    if (eventInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* textAnnouncedForAccessibility = "提交成功";
    int32_t result = OH_ArkUI_AccessibilityEventSetTextAnnouncedForAccessibility(eventInfo,
        textAnnouncedForAccessibility);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetTextAnnouncedForAccessibility0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = nullptr;
    const char* textAnnouncedForAccessibility = nullptr;
    int32_t result = OH_ArkUI_AccessibilityEventSetTextAnnouncedForAccessibility(eventInfo,
                                                                                 textAnnouncedForAccessibility);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetRequestFocusId0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    if (eventInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t requestFocusId = 1001;
    int32_t result = OH_ArkUI_AccessibilityEventSetRequestFocusId(eventInfo, requestFocusId);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetRequestFocusId0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = nullptr;
    int32_t requestFocusId = 0;
    int32_t result = OH_ArkUI_AccessibilityEventSetRequestFocusId(eventInfo, requestFocusId);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetElementInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    if (eventInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t result = OH_ArkUI_AccessibilityEventSetElementInfo(eventInfo, elementInfo);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetElementInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = nullptr;
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    int32_t result = OH_ArkUI_AccessibilityEventSetElementInfo(eventInfo, elementInfo);
        OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetElementInfo0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t result = OH_ArkUI_AccessibilityEventSetElementInfo(eventInfo, elementInfo);
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value ActionArgumentByKey0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityActionArguments* arguments = {};
    const char* searchKey;
    char* resultValue;

    int32_t result = OH_ArkUI_FindAccessibilityActionArgumentByKey(arguments, searchKey, &resultValue);

    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value ActionArgumentByKey0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityActionArguments* arguments = nullptr;
    const char* searchKey = nullptr;
    char* resultValue = nullptr;
    int32_t result = OH_ArkUI_FindAccessibilityActionArgumentByKey(arguments, searchKey, &resultValue);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
}

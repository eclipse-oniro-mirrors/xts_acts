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

napi_value SetElementId0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t elementId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, elementId);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetElementId0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t elementId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, elementId);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetParentId0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    int32_t elementId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, elementId);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetParentId0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    int32_t parentId = 1234;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, parentId);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetComponentType0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* componentType = "ComponentType";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, componentType);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetComponentType0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* componentType = "ComponentType";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, componentType);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetComponentType0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* componentType = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, componentType);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetContents0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* contents = "Contents";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, contents);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetContents0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* contents = "Contents";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, contents);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetContents0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* contents = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, contents);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHintText0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* hintText = "辅助文本";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHintText(elementInfo, hintText);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHintText0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* hintText = "辅助文本";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHintText(elementInfo, hintText);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetHintText0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* hintText = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetHintText(elementInfo, hintText);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityText0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* accessibilityText = "辅助文本";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(elementInfo, accessibilityText);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityText0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* accessibilityText = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(elementInfo, accessibilityText);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityText0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const char* accessibilityText = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(elementInfo, accessibilityText);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityDescription0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* accessibilityDescription = "accessibilityDescription";
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription(elementInfo,
        accessibilityDescription);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityDescription0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const char* accessibilityDescription = "accessibilityDescription";
    int32_t result =
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription(elementInfo, accessibilityDescription);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetAccessibilityDescription0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const char* accessibilityDescription = nullptr;
    int32_t result =
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription(elementInfo, accessibilityDescription);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChildNodeIds0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const int32_t childCount = 3;
    int64_t childNodeIds[3] =  {1, 2, 3};
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, childCount, childNodeIds);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChildNodeIds0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const int32_t childCount = 3;
    int64_t childNodeIds[3] =  {1, 2, 3};
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, childCount, childNodeIds);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChildNodeIds0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t childCount = 0;
    int64_t childNodeIds[3] =  {1, 2, 3};
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, childCount, childNodeIds);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetChildNodeIds0400(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t childCount = 3;
    int64_t* childNodeIds = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, childCount, childNodeIds);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetOperationActions0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_NEXT_HTML_ITEM),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetOperationActions0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_NEXT_HTML_ITEM),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetOperationActions0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 0;
    ArkUI_AccessibleAction action = {
        .actionType = ArkUI_Accessibility_ActionType(ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_NEXT_HTML_ITEM),
    };
    ArkUI_AccessibleAction* operationActions = &action;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetOperationActions0400(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    const int32_t operationCount = 1;
    ArkUI_AccessibleAction* operationActions = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo,
                                                                          operationCount, operationActions);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetScreenRect0100(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        napi_value retValue;
        napi_create_int32(env, RESULT_BAD_PARAMETER, &retValue);
        return retValue;
    }
    ArkUI_AccessibleRect rect = {
        .leftTopX = 100,
        .leftTopY = 200,
        .rightBottomX = 300,
        .rightBottomY = 400
    };
    ArkUI_AccessibleRect* screenRect = reinterpret_cast<ArkUI_AccessibleRect*>(&rect);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, screenRect);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetScreenRect0200(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = nullptr;
    ArkUI_AccessibleRect rect = {
        .leftTopX = 100,
        .leftTopY = 200,
        .rightBottomX = 300,
        .rightBottomY = 400
    };
    ArkUI_AccessibleRect* screenRect = reinterpret_cast<ArkUI_AccessibleRect*>(&rect);
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, screenRect);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetScreenRect0300(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityElementInfo *elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    ArkUI_AccessibleRect* screenRect = nullptr;
    int32_t result = OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, screenRect);
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ACCESSIBILITY_NATIVE_RESULT_BAD_PARAMETER ?
                      PARAM_NEGATIVE_2 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

}

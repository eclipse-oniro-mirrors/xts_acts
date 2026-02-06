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
#include "ComponentApiTest.h"


namespace ComponentApiTest {

napi_value CheckResult(napi_env env, std::string expectStr, std::string result)
{
    std::string assertStr = "assert equal failed, expect is " + expectStr + " and result is " + result;
    napi_throw_error((env), nullptr, assertStr.c_str());
    napi_value errorResult = nullptr;
    napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
    return errorResult;
}

napi_value TestCustomDialogHoverModeArea(napi_env env, napi_callback_info info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setHoverModeArea(customDialog, ARKUI_HOVER_MODE_AREA_TYPE_BOTTOM);
    if (ret != SUCCESS) {
        return CheckResult(env, std::to_string(SUCCESS), std::to_string(ret));
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestCustomDialogKeyboardAvoidMode(napi_env env, napi_callback_info info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setKeyboardAvoidMode(customDialog, ARKUI_KEYBOARD_AVOID_MODE_NONE);
    if (ret != SUCCESS) {
        return CheckResult(env, std::to_string(SUCCESS), std::to_string(ret));
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value RegisterLayoutCallbackOnNodeTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *g_nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    auto column = g_nodeAPI->createNode(ARKUI_NODE_COLUMN);
    int customData = 42;
    int result = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(column, &customData, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_INSPECTOR_NATIVE_RESULT_SUCCESSFUL ? 0 : result, &retValue);
    return retValue;
}

napi_value RegisterLayoutCallbackOnNodeTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *g_nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    auto column = nullptr;
    ArkUI_InspectorErrorCode errcode = ARKUI_INSPECTOR_NATIVE_RESULT_BAD_PARAMETER;
    int result = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(column, 0, nullptr);
    int ret = -1;
    if (result == errcode) {
        ret = 0;
    }
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

} // namespace ComponentApiTest
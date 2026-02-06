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

#include "arkui/native_dialog.h"
#include "NativeDialogTestcase.h"

napi_value ArkUILevelModeEmbedded(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    retValue = OH_ArkUI_CustomDialog_SetLevelMode(options, ARKUI_LEVEL_MODE_EMBEDDED);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIImmersiveModeExtend(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    retValue = OH_ArkUI_CustomDialog_SetImmersiveMode(options, ARKUI_IMMERSIVE_MODE_EXTEND);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIRegisterOnWillDismissWithUserData(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_1 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->create();
    char *userData = "userData";
    retValue = nativeDialogAPI->registerOnWillDismissWithUserData(handle, userData,
                                                                  [](ArkUI_DialogDismissEvent* event) {});
    nativeDialogAPI->dispose(handle);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUINativeDialogAPI1(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_2 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_2 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_2"));
    unsigned long size = sizeof(nativeDialogAPI->nativeDialogAPI1);
    if (size != 0) {
        retValue = 0;
    }
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUISetKeyboardAvoidDistance(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_2 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_2 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_2"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    retValue = nativeDialogAPI->setKeyboardAvoidDistance(handle, 1.0f, ARKUI_LENGTH_METRIC_UNIT_VP);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUINativeDialogAPI2(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    unsigned long size = sizeof(nativeDialogAPI->nativeDialogAPI2);
    if (size != 0) {
        retValue = 0;
    }
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUISetLevelOrder(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    retValue = nativeDialogAPI->setLevelOrder(handle, 0);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIRegisterOnWillAppear(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    char *userData = "userData";
    retValue = nativeDialogAPI->registerOnWillAppear(handle, userData, [](void* userData) {});
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIRegisterOnDidAppear(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    char *userData = "userData";
    retValue = nativeDialogAPI->registerOnDidAppear(handle, userData, [](void* userData) {});
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIRegisterOnWillDisappear(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    char *userData = "userData";
    retValue = nativeDialogAPI->registerOnWillDisappear(handle, userData, [](void* userData) {});
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUIRegisterOnDidDisappear(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    char *userData = "userData";
    retValue = nativeDialogAPI->registerOnDidDisappear(handle, userData, [](void* userData) {});
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

napi_value ArkUISetFocusable(napi_env env, napi_callback_info info)
{
    int32_t retValue = -1;
    ArkUI_NativeDialogAPI_3 *nativeDialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    ArkUI_NativeDialogHandle handle = nativeDialogAPI->nativeDialogAPI1.create();
    retValue = nativeDialogAPI->setFocusable(handle, true);
    napi_value result;
    napi_create_int32(env, retValue, &result);
    return result;
}

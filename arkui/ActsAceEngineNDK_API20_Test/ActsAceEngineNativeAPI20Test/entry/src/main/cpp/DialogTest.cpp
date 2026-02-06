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
#include "DialogTest.h"
#include "common/Common.h"
#include <arkui/native_dialog.h>
struct ArkUiDialogDismissEvent {
    void *userData;
    int32_t reason = -1;
    bool blockDismiss = false;
};
napi_value OpenDialog()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    int32_t ret = OH_ArkUI_CustomDialog_OpenDialog(options, nullptr);
    return nullptr;
}
napi_value DialogDismissBackPress(napi_env env, napi_callback_info info)
{
    OpenDialog();
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 0, false});
    int32_t ret = OH_ArkUI_DialogDismissEvent_GetDismissReason((ArkUI_DialogDismissEvent*)nEvent);
    if (ret == DIALOG_DISMISS_BACK_PRESS) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
napi_value DialogDismissTouchOutside(napi_env env, napi_callback_info info)
{
    OpenDialog();
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 1, false});
    int32_t ret = OH_ArkUI_DialogDismissEvent_GetDismissReason((ArkUI_DialogDismissEvent*)nEvent);
    if (ret == DIALOG_DISMISS_TOUCH_OUTSIDE) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
napi_value DialogDismissCloseButton(napi_env env, napi_callback_info info)
{
    OpenDialog();
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 2, false});
    int32_t ret = OH_ArkUI_DialogDismissEvent_GetDismissReason((ArkUI_DialogDismissEvent*)nEvent);
    if (ret == DIALOG_DISMISS_CLOSE_BUTTON) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
napi_value DialogDismissSlideDown(napi_env env, napi_callback_info info)
{
    OpenDialog();
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 3, false});
    int32_t ret = OH_ArkUI_DialogDismissEvent_GetDismissReason((ArkUI_DialogDismissEvent*)nEvent);
    if (ret == DIALOG_DISMISS_SLIDE_DOWN) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
napi_value DialogModelTest_001(napi_env env, napi_callback_info info)
{
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 0, false});
    nEvent = nullptr;
    OH_ArkUI_DialogDismissEvent_SetShouldBlockDismiss((ArkUI_DialogDismissEvent*)nEvent, true);
    do {
        napi_value result = nullptr;
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } while (0);
}
napi_value DialogModelTest_002(napi_env env, napi_callback_info info)
{
    ArkUiDialogDismissEvent *nEvent = new ArkUiDialogDismissEvent({nullptr, 0, false});
    void *ret = OH_ArkUI_DialogDismissEvent_GetUserData((ArkUI_DialogDismissEvent*)nEvent);
    nEvent = nullptr;
    ret = OH_ArkUI_DialogDismissEvent_GetUserData((ArkUI_DialogDismissEvent*)nEvent);
    do {
        napi_value result = nullptr;
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } while (0);
}
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

#include "dialog/DialogXComponent.h"

namespace DialogXComponent {

constexpr int32_t BUTTON_CLICK_ID = 1;
bool g_isShown = false;
ArkUI_NativeDialogHandle dialogController;
ArkUI_NodeHandle buttonNode;
XC ColumnComponent = XC(ARKUI_NODE_COLUMN);
XC ImageComponentOne = XC(ARKUI_NODE_IMAGE);
std::unordered_map<ArkUI_DialogState, int32_t> g_dialogStateMap = {};

napi_value ShowDialog(napi_env env, napi_callback_info info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    if (!dialogController) {
        dialogController = dialogAPI->create();
    }
    auto contentNode = CreateDialogContent();
    dialogAPI->setContent(dialogController, contentNode);
    dialogAPI->setContentAlignment(dialogController, static_cast<int32_t>(ARKUI_ALIGNMENT_BOTTOM), 0, 0);
    dialogAPI->setBackgroundColor(dialogController, 0xffffffff);
    dialogAPI->setCornerRadius(dialogController, PARAM_6, PARAM_6, PARAM_6, PARAM_6);
    dialogAPI->setModalMode(dialogController, false);
    dialogAPI->setAutoCancel(dialogController, true);
    dialogAPI->show(dialogController, false);
    return nullptr;
}

napi_value CloseDialog(napi_env env, napi_callback_info info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = reinterpret_cast<ArkUI_NativeDialogAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_1"));
    dialogAPI->close(dialogController);
    return nullptr;
}

ArkUI_NodeHandle CreateDialogContent()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue textWidthValue[] = {{.f32 = 300}};
    ArkUI_AttributeItem textWidthItem = {.value = textWidthValue,
                                         .size = sizeof(textWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_WIDTH, &textWidthItem);
    ArkUI_NumberValue textHeightValue[] = {{.f32 = 300}};
    ArkUI_AttributeItem textHeightItem = {.value = textHeightValue,
                                          .size = sizeof(textWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_HEIGHT, &textHeightItem);
    ArkUI_NodeHandle span = nodeAPI->createNode(ARKUI_NODE_SPAN);
    ArkUI_AttributeItem spanItem = {.string = "这是一个弹窗"};
    nodeAPI->setAttribute(span, NODE_SPAN_CONTENT, &spanItem);
    ArkUI_NodeHandle imageSpan = nodeAPI->createNode(ARKUI_NODE_IMAGE_SPAN);
    ArkUI_AttributeItem imageSpanItem = {.string = "/resources/rawfile/tardis.jpg"};
    nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_SRC, &imageSpanItem);
    ArkUI_NumberValue imageSpanWidthValue[] = {{.f32 = 300}};
    ArkUI_AttributeItem imageSpanWidthItem = {.value = imageSpanWidthValue,
                                              .size = sizeof(textWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(imageSpan, NODE_WIDTH, &imageSpanWidthItem);
    ArkUI_NumberValue imageSpanHeightValue[] = {{.f32 = 200}};
    ArkUI_AttributeItem imageSpanHeightItem = {.value = imageSpanHeightValue,
                                               .size = sizeof(textWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(imageSpan, NODE_HEIGHT, &imageSpanHeightItem);
    nodeAPI->addChild(text, span);
    nodeAPI->addChild(text, imageSpan);
    return text;
}

ArkUI_DialogState CheckDialogState(int32_t DialogState)
{
    ArkUI_DialogState Temp = ArkUI_DialogState(PARAM_NEGATIVE_2);
    switch (DialogState) {
        case DIALOG_UNINITIALIZED:
        case DIALOG_INITIALIZED:
        case DIALOG_APPEARING:
        case DIALOG_APPEARED:
        case DIALOG_DISAPPEARING:
        case DIALOG_DISAPPEARED:
            Temp = ArkUI_DialogState(PARAM_0);
        default:
            break;
    }
    return Temp;
}

napi_value CustomDialogGetStateOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    ArkUI_DialogState DialogState = ArkUI_DialogState(PARAM_NEGATIVE_2);
    if (OH_ArkUI_CustomDialog_GetState(dialogController, &DialogState) == ARKUI_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value CustomDialogGetStateParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_CustomDialog_GetState(nullptr, nullptr) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value CustomDialogGetState(napi_env env, napi_callback_info info)
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
    int32_t DialogState = PARAM_NEGATIVE_2;
    napi_get_value_int32(env, args[0], &DialogState);
    napi_value retValue = 0;
    napi_create_int32(env, CheckDialogState(DialogState), &retValue);
    return retValue;
}

};
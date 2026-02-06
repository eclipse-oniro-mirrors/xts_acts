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
#include "DragAndDrop2Test.h"
#include <arkui/native_dialog.h>
#include "common/Common.h"
napi_value DragAndDropTest201(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetScaleMode(
        previewOptions, ArkUI_DragPreviewScaleMode::ARKUI_DRAG_PREVIEW_SCALE_DISABLED) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest202(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    ArkUI_DragPreviewScaleMode scaleMode = ArkUI_DragPreviewScaleMode::ARKUI_DRAG_PREVIEW_SCALE_AUTO;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetScaleMode(option, scaleMode);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest203(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled(previewOptions, true) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest204(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled(option, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest205(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled(previewOptions, true) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest206(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled(option, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest207(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled(previewOptions, true) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest208(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled(option, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest209(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetBadgeNumber(previewOptions, 2147483647) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest210(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetBadgeNumber(option, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest211(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled(previewOptions, true) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest212(napi_env env, napi_callback_info info)
{
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled(option, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest213(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragPreviewOption Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_SetNodeDragPreviewOption(text, previewOptions) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest214(napi_env env, napi_callback_info info)
{
    auto *dragPreviewOption = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_SetNodeDragPreviewOption(nullptr, dragPreviewOption);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest215(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetPointerId(dragAction, 1) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest216(napi_env env, napi_callback_info info)
{
    ArkUI_DragAction *dragAction = nullptr;
    auto returnValue = OH_ArkUI_DragAction_SetPointerId(dragAction, 1);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest217(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    uint8_t data[960000];
    size_t dataSize = 960000;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
    std::vector<OH_PixelmapNative *> pixelVector;
    pixelVector.push_back(pixelmap);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetPixelMaps(dragAction, pixelVector.data(), pixelVector.size()) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest218(napi_env env, napi_callback_info info)
{
    ArkUI_DragAction *dragAction = nullptr;
    auto returnValue = OH_ArkUI_DragAction_SetPixelMaps(dragAction, nullptr, 0);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest219(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointX(dragAction, TOUCHPOINTXY) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest220(napi_env env, napi_callback_info info)
{
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(nullptr);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointX(dragAction, 1.0);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest221(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointY(dragAction, TOUCHPOINTXY) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest222(napi_env env, napi_callback_info info)
{
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(nullptr);
    auto returnValue = OH_ArkUI_DragAction_SetTouchPointY(dragAction, 1.0);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest223(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);

    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
    OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);

    auto returnValue = OH_ArkUI_DragAction_SetData(dragAction, data) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest224(napi_env env, napi_callback_info info)
{
    ArkUI_DragAction *dragAction = nullptr;
    OH_UdmfData *data = OH_UdmfData_Create();
    auto returnValue = OH_ArkUI_DragAction_SetData(dragAction, data);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest225(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto returnValue = OH_ArkUI_DragAction_SetDragPreviewOption(dragAction, previewOptions) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest226(napi_env env, napi_callback_info info)
{
    ArkUI_DragAction *dragAction = nullptr;
    ArkUI_DragPreviewOption *option = nullptr;
    auto returnValue = OH_ArkUI_DragAction_SetDragPreviewOption(dragAction, option);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest227(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    auto callback = [](ArkUI_DragAndDropInfo *dragAndDropInfo, void *userData) -> void {};
    auto returnValue = OH_ArkUI_DragAction_RegisterStatusListener(dragAction, nullptr, callback) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest228(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_DragAction_RegisterStatusListener(
        nullptr, nullptr, [](ArkUI_DragAndDropInfo *dragAndDropInfo, void *userData) -> void {
        });
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest229(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    auto returnValue = OH_ArkUI_StartDrag(dragAction) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest230(napi_env env, napi_callback_info info)
{
    ArkUI_DragAction *dragAction = nullptr;
    auto returnValue = OH_ArkUI_StartDrag(dragAction);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest231(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithNode(text, true) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest232(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithNode(nullptr, false);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest233(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setDragEventStrictReportWidthNode Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithContext(context, false) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest234(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_SetDragEventStrictReportWithContext(nullptr, false);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest235(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_setNodeAllowedDropDataTypes Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    std::vector<const char *> strlist;
    strlist.push_back("general.plain-text");
    auto returnValue = OH_ArkUI_SetNodeAllowedDropDataTypes(text, strlist.data(), strlist.size()) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest236(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_SetNodeAllowedDropDataTypes(nullptr, nullptr, -1);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest237(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_disallowNodeAnyDropDataTypes Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_DisallowNodeAnyDropDataTypes(text) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest238(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_DisallowNodeAnyDropDataTypes(nullptr);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest239(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    do {
        if ((env == nullptr) || (info == nullptr)) {
            return nullptr;
        }
    } while (0);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_allowNodeAllDropDataTypes Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_AllowNodeAllDropDataTypes(text) == ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest240(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_AllowNodeAllDropDataTypes(nullptr);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest241(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_3 *dialogAPI3 = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    auto customDialog = dialogAPI3->nativeDialogAPI1.create();

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dialog = OH_ArkUI_CustomDialog_CreateOptions(column2);
    OH_ArkUI_CustomDialog_SetBackgroundBlurStyle(dialog, ARKUI_BLUR_STYLE_REGULAR);
    ArkUI_NumberValue dialog_BlurStyleOptions_value[] = {{.i32 = ARKUI_COLOR_MODE_LIGHT},
                                                         {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE},
                                                         {.f32 = 1},
                                                         {.u32 = 20},
                                                         {.u32 = 20},
                                                         {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_ACTIVE},
                                                         {.u32 = 0x00FF0000}};
    ArkUI_AttributeItem dialog_BlurStyleOptions_item = {
        dialog_BlurStyleOptions_value, sizeof(dialog_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue)};
    auto returnValue = OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions(dialog, &dialog_BlurStyleOptions_item);
    if ((returnValue) != (SUCCESS)) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest242(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions(nullptr, nullptr);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value DragAndDropTest243(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_3 *dialogAPI3 = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    auto customDialog = dialogAPI3->nativeDialogAPI1.create();

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dialog = OH_ArkUI_CustomDialog_CreateOptions(column2);
    OH_ArkUI_CustomDialog_SetBackgroundBlurStyle(dialog, ARKUI_BLUR_STYLE_REGULAR);
    ArkUI_NumberValue dialog_BlurStyleOptions_value[] = {{.i32 = ARKUI_COLOR_MODE_LIGHT},
                                                         {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE},
                                                         {.f32 = 1},
                                                         {.u32 = 20},
                                                         {.u32 = 20},
                                                         {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_ACTIVE},
                                                         {.u32 = 0x00FF0000}};
    ArkUI_AttributeItem dialog_BlurStyleOptions_item = {
        dialog_BlurStyleOptions_value, sizeof(dialog_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue dialog_Effect_value[] = {{.f32 = 0},          {.f32 = 0}, {.f32 = 0.0001},
                                               {.u32 = 0x66FFFFFF}, {.i32 = 0}, {.u32 = 300},
                                               {.u32 = 300},        {.i32 = 1}, {.u32 = 0x00FF0000}};
    ArkUI_AttributeItem dialog_Effect_item = {dialog_Effect_value,
                                              sizeof(dialog_Effect_value) / sizeof(ArkUI_NumberValue)};
    auto returnValue = OH_ArkUI_CustomDialog_SetBackgroundEffect(dialog, &dialog_Effect_item) ==
                       ARKUI_ERROR_CODE_NO_ERROR;
    if (!returnValue) {
        std::string assertStr = "assert equal failed, expect is " + std::to_string(SUCCESS) + " and result is " +
                                std::to_string(returnValue);
        napi_throw_error((env), nullptr, assertStr.c_str());
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value DragAndDropTest244(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_CustomDialog_SetBackgroundEffect(nullptr, nullptr);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value DragAndDropTest245(napi_env env, napi_callback_info info)
{
    ArkUI_NodeEvent *event = nullptr;
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    char stringArray[LENGTH][MAXSTRLEN];
    char *dataTypes[MAXSTRLEN];
    for (int i = 0; i < LENGTH; i++) {
        dataTypes[i] = stringArray[i];
    }
    auto returnValue = OH_ArkUI_DragEvent_GetDataTypes(nullptr, nullptr, -1, MAXSTRLEN);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

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
#include "DragAndDrop1Test.h"
#include "common/Common.h"
napi_value DragAndDropTest101(napi_env env, napi_callback_info info)
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
    content_item.string = "drag_SetNodeDragPreview Test";
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
    auto returnValue = OH_ArkUI_SetNodeDragPreview(text, pixelmap) == ARKUI_ERROR_CODE_NO_ERROR;
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
napi_value DragAndDropTest102(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    auto returnValue = OH_ArkUI_SetNodeDragPreview(nullptr, pixelmap);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
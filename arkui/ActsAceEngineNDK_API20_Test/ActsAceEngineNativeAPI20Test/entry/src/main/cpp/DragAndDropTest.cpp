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
#include "DragAndDropTest.h"
#include "common/Common.h"
napi_value DragAndDropTest01(napi_env env, napi_callback_info info)
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
    content_item.string = "drag_setNodeDraggable Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto returnValue = OH_ArkUI_SetNodeDraggable(text, true) == ARKUI_ERROR_CODE_NO_ERROR;
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

napi_value DragAndDropTest02(napi_env env, napi_callback_info info)
{
    auto returnValue = OH_ArkUI_SetNodeDraggable(nullptr, true);
    int ret = -1;
    if (returnValue == ARKUI_ERROR_CODE_PARAM_INVALID) {
        ret = 0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

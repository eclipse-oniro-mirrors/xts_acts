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

#include "ImageAltTest.h"
#include <arkui/native_interface.h>
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define SECOND_MIDDLE_VALUE                                                                                            \
    "https://application-dev/reference/apis-arkui/arkui-ts/figures/edgewidths.png"
#define THIRD_MIDDLE_VALUE "./resources/base/media/fail.png"

namespace ArkUICapiTest {
napi_value ImageAltTest::imageAltTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageAltTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAltTest",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue columnPercentWith[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentWithItem = { columnPercentWith,
        sizeof(columnPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &columnPercentWithItem);
    ArkUI_NumberValue columnPercentHeight[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentHeightItem = { columnPercentHeight,
        sizeof(columnPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &columnPercentHeightItem);

    auto image1 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    auto image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue width_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = 80}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image1, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(image1, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(image1, NODE_MARGIN, &margin_item);
    nodeAPI->setAttribute(image2, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(image2, NODE_HEIGHT, &height_item);
    nodeAPI->setAttribute(image2, NODE_MARGIN, &margin_item);

    const char *value = SECOND_MIDDLE_VALUE;
    const char *value1 = FIRST_MIDDLE_VALUE;
    const char *value2 = THIRD_MIDDLE_VALUE;
    ArkUI_AttributeItem srcItem = {};
    srcItem.string = value;
    nodeAPI->setAttribute(image1, NODE_IMAGE_SRC, &srcItem);
    ArkUI_AttributeItem holderItem1 = {};
    holderItem1.string = value1;
    nodeAPI->setAttribute(image1, NODE_IMAGE_ALT_PLACEHOLDER, &holderItem1);
    ArkUI_AttributeItem errorItem1 = {};
    errorItem1.string = value2;
    nodeAPI->setAttribute(image1, NODE_IMAGE_ALT_ERROR, &errorItem1);
    ArkUI_AttributeItem textId1 = {.string = "image001"};
    nodeAPI->setAttribute(image1, NODE_ID, &textId1);
    nodeAPI->setAttribute(image2, NODE_IMAGE_SRC, &srcItem);
    ArkUI_AttributeItem holderItem2 = {};
    holderItem2.string = nullptr;
    nodeAPI->setAttribute(image2, NODE_IMAGE_ALT_PLACEHOLDER, &holderItem2);
    ArkUI_AttributeItem errorItem2 = {};
    errorItem2.string = nullptr;
    nodeAPI->setAttribute(image2, NODE_IMAGE_ALT_ERROR, &errorItem2);
    ArkUI_AttributeItem textId2 = {.string = "image002"};
    nodeAPI->setAttribute(image2, NODE_ID, &textId2);

    nodeAPI->addChild(column, image1);
    nodeAPI->addChild(column, image2);
    
        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
            INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageAltTest",
                         "OH_NativeXComponent_AttachNativeRootNode failed");
        }
        napi_value exports;
        if (napi_create_object(env, &exports) != napi_ok) {
            napi_throw_type_error(env, nullptr, "napi_create_object failed");
            return nullptr;
        }
        return exports;
    }
}
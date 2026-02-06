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

#include "ButtonTest.h"
#include <arkui/native_interface.h>
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#define TEST_BUTTON_COMPONENT_NUMBER 5

namespace ArkUICapiTest {
napi_value ButtonTest::buttonTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonTest",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue columnPercentWith[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentWithItem = { columnPercentWith,
        sizeof(columnPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &columnPercentWithItem);
    ArkUI_NumberValue columnPercentHeight[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentHeightItem = { columnPercentHeight,
        sizeof(columnPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &columnPercentHeightItem);

    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem textId1 = {.string = "button001"};
    nodeAPI->setAttribute(button1, NODE_ID, &textId1);
    // button入参-label属性
    ArkUI_AttributeItem label_item = {.string = "click"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &label_item);

    // button属性-type
    ArkUI_NumberValue type_value[] = {{.i32 = ARKUI_BUTTON_TYPE_NORMAL}};
    ArkUI_AttributeItem type_item = {type_value, 1};
    nodeAPI->setAttribute(button1, NODE_BUTTON_TYPE, &type_item);

    // button属性-minFontScale
    ArkUI_NumberValue min_font_value[] = {{.f32 = 0.5}};
    ArkUI_AttributeItem min_font_item = {min_font_value, 1};
    nodeAPI->setAttribute(button1, NODE_BUTTON_MIN_FONT_SCALE, &min_font_item);

    // button属性-maxFontScale
    ArkUI_NumberValue max_font_value[] = {{.f32 = 2}};
    ArkUI_AttributeItem max_font_item = {max_font_value, 1};
    nodeAPI->setAttribute(button1, NODE_BUTTON_MAX_FONT_SCALE, &max_font_item);

    nodeAPI->addChild(column, button1);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}  // namespace ArkUICapiTest
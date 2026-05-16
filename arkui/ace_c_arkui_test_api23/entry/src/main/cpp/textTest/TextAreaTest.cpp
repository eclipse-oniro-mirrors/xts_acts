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

#include "TextAreaTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <hilog/log.h>

#define HILOG_USE_FLOAT 1

static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NodeHandle textArea = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    if (nodeAPI != nullptr) {
        nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
    }
}

napi_value TextAreaTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                 "%{public}s", xComponentID);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB  222--1");
            
            auto setNodeId = [&](ArkUI_NodeHandle nodeHandle, const char* id) {
                ArkUI_AttributeItem IDValueItem = {.string = id};
                nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
            };
            
            auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            
            auto textAreaA = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
            auto textAreaB = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
            auto textAreaC = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
            auto textAreaD = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
            
            setNodeId(textAreaA, "textAreaA");
            setNodeId(textAreaB, "textAreaB");
            setNodeId(textAreaC, "textAreaC");
            setNodeId(textAreaD, "textAreaD");
        
            ArkUI_AttributeItem textItem4 = {.string = "ရှည်လျားသောသမိုင်းရှိရှည်လျား"};
            nodeAPI->setAttribute(textAreaA, NODE_TEXT_AREA_TEXT, &textItem4);
            nodeAPI->setAttribute(textAreaB, NODE_TEXT_AREA_TEXT, &textItem4);
            nodeAPI->setAttribute(textAreaC, NODE_TEXT_AREA_TEXT, &textItem4);
            nodeAPI->setAttribute(textAreaD, NODE_TEXT_AREA_TEXT, &textItem4);;
        
            ArkUI_NumberValue textWeightValue[] = {{.f32 = 100}};
            ArkUI_AttributeItem textWeightItem = {
                .value = textWeightValue,
                .size = sizeof(textWeightValue) / sizeof(ArkUI_NumberValue)
            };
            nodeAPI->setAttribute(textAreaA, NODE_WIDTH, &textWeightItem);
            nodeAPI->setAttribute(textAreaB, NODE_WIDTH, &textWeightItem);
            nodeAPI->setAttribute(textAreaC, NODE_WIDTH, &textWeightItem);
            nodeAPI->setAttribute(textAreaD, NODE_WIDTH, &textWeightItem);
            
            ArkUI_NumberValue textHeightValue[] = {{.f32 = 100}};
            ArkUI_AttributeItem textHeightItem = {
                .value = textHeightValue,
                .size = sizeof(textHeightValue) / sizeof(ArkUI_NumberValue)
            };
            nodeAPI->setAttribute(textAreaA, NODE_HEIGHT, &textHeightItem);
            nodeAPI->setAttribute(textAreaB, NODE_HEIGHT, &textHeightItem);
            nodeAPI->setAttribute(textAreaC, NODE_HEIGHT, &textHeightItem);
            nodeAPI->setAttribute(textAreaD, NODE_HEIGHT, &textHeightItem);
            
            ArkUI_NumberValue textLineHeightValue[] = {{.f32 = 10}};
            ArkUI_AttributeItem textLineHeightItem = {
                .value = textLineHeightValue,
                .size = sizeof(textLineHeightValue) / sizeof(ArkUI_NumberValue)
            };
            nodeAPI->setAttribute(textAreaA, NODE_TEXT_LINE_HEIGHT, &textLineHeightItem);
            nodeAPI->setAttribute(textAreaB, NODE_TEXT_LINE_HEIGHT, &textLineHeightItem);
            nodeAPI->setAttribute(textAreaC, NODE_TEXT_LINE_HEIGHT, &textLineHeightItem);
            nodeAPI->setAttribute(textAreaD, NODE_TEXT_LINE_HEIGHT, &textLineHeightItem);
            
            ArkUI_NumberValue textIncludePaddingValue1[] = {{.i32 = 0}};
            ArkUI_NumberValue textIncludePaddingValue2[] = {{.i32 = 1}};
            ArkUI_AttributeItem textIncludePaddingItem1 = {
                .value = textIncludePaddingValue1,
                .size = sizeof(textIncludePaddingValue1) / sizeof(ArkUI_NumberValue)
            };
            ArkUI_AttributeItem textIncludePaddingItem2 = {
                .value = textIncludePaddingValue2,
                .size = sizeof(textIncludePaddingValue2) / sizeof(ArkUI_NumberValue)
            };
            
            ArkUI_NumberValue textFallbackSpacingValue1[] = {{.i32 = 0}};
            ArkUI_NumberValue textFallbackSpacingValue2[] = {{.i32 = 1}};
            ArkUI_AttributeItem textFallbackSpacingItem1 = {
                .value = textFallbackSpacingValue1,
                .size = sizeof(textFallbackSpacingValue1) / sizeof(ArkUI_NumberValue)
            };
            ArkUI_AttributeItem textFallbackSpacingItem2 = {
                .value = textFallbackSpacingValue2,
                .size = sizeof(textFallbackSpacingValue2) / sizeof(ArkUI_NumberValue)
            };
            
            nodeAPI->setAttribute(textAreaA, NODE_TEXT_AREA_INCLUDE_FONT_PADDING, &textIncludePaddingItem1);
            nodeAPI->setAttribute(textAreaB, NODE_TEXT_AREA_INCLUDE_FONT_PADDING, &textIncludePaddingItem2);
            nodeAPI->setAttribute(textAreaC, NODE_TEXT_AREA_FALLBACK_LINE_SPACING, &textFallbackSpacingItem1);
            nodeAPI->setAttribute(textAreaD, NODE_TEXT_AREA_FALLBACK_LINE_SPACING, &textFallbackSpacingItem2);
            
            nodeAPI->addChild(column, textAreaA);
            nodeAPI->addChild(column, textAreaB);
            nodeAPI->addChild(column, textAreaC);
            nodeAPI->addChild(column, textAreaD);
        
            nodeAPI->addChild(scroll, column);
     
            std::string id(xComponentID);
            OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, ArkUICapiTest::LOG_PRINT_DOMAIN, "Manager", "nodeAPI functions are null");
        }
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, ArkUICapiTest::LOG_PRINT_DOMAIN, "Manager", "nodeAPI is nullptr");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

} // namespace ArkUITextAreaTest
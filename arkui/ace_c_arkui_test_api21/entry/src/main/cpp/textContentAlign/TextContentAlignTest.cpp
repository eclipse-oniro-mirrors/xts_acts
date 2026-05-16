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

#include "TextContentAlignTest.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_dialog.h>
#include <cstdint>
#include <string>
 
namespace ArkUICapiTest {

    napi_value TextContentAlignTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "TextContentAlignTest", "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto spaceColumn1 = nodeAPI->createNode(ARKUI_NODE_ROW);
        auto spaceColumn2 = nodeAPI->createNode(ARKUI_NODE_ROW);
        ArkUI_NumberValue columnHeightValue[] = {{.f32 = 30}};
        ArkUI_AttributeItem columnHeightItem = {.value = columnHeightValue, .size = sizeof(columnHeightValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(spaceColumn1, NODE_HEIGHT, &columnHeightItem);
        nodeAPI->setAttribute(spaceColumn2, NODE_HEIGHT, &columnHeightItem);
        auto spaceText = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem spaceItem = {.string = "                            "};
        nodeAPI->setAttribute(spaceText, NODE_TEXT_CONTENT, &spaceItem);
        nodeAPI->addChild(spaceColumn1, spaceText);
        nodeAPI->addChild(spaceColumn2, spaceText);
        
        auto textA = nodeAPI->createNode(ARKUI_NODE_TEXT);
        auto textB = nodeAPI->createNode(ARKUI_NODE_TEXT);
        auto textC = nodeAPI->createNode(ARKUI_NODE_TEXT);

        ArkUI_AttributeItem id_itemA = {.string = "textTop"};
        nodeAPI->setAttribute(textA, NODE_ID, &id_itemA);
        ArkUI_AttributeItem id_itemB = {.string = "textCenter"};
        nodeAPI->setAttribute(textB, NODE_ID, &id_itemB);
        ArkUI_AttributeItem id_itemC = {.string = "textBottom"};
        nodeAPI->setAttribute(textC, NODE_ID, &id_itemC);
        
        ArkUI_NumberValue textWeightValue[] = {{.f32 = 160}};
        ArkUI_AttributeItem textWeightItem = {.value = textWeightValue, .size = sizeof(textWeightValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textA, NODE_WIDTH, &textWeightItem);
        nodeAPI->setAttribute(textB, NODE_WIDTH, &textWeightItem);
        nodeAPI->setAttribute(textC, NODE_WIDTH, &textWeightItem);
        
        ArkUI_NumberValue textHeightValue[] = {{.f32 = 60}};
        ArkUI_AttributeItem textHeightItem = {.value = textHeightValue, .size = sizeof(textHeightValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(textA, NODE_HEIGHT, &textHeightItem);
        nodeAPI->setAttribute(textB, NODE_HEIGHT, &textHeightItem);
        nodeAPI->setAttribute(textC, NODE_HEIGHT, &textHeightItem);
        
        ArkUI_NumberValue fontSizeValue[] = {16};
        ArkUI_AttributeItem fontSizeItem = {fontSizeValue, 1};
        nodeAPI->setAttribute(textA, NODE_FONT_SIZE, &fontSizeItem);
        nodeAPI->setAttribute(textB, NODE_FONT_SIZE, &fontSizeItem);
        nodeAPI->setAttribute(textC, NODE_FONT_SIZE, &fontSizeItem);
        
        ArkUI_NumberValue bgColorValue[] = {{.u32 = 0xff00ff00}};
        ArkUI_AttributeItem bgColorItem = {.value = bgColorValue, .size = 1};
        nodeAPI->setAttribute(textA, NODE_BACKGROUND_COLOR, &bgColorItem);
        nodeAPI->setAttribute(textB, NODE_BACKGROUND_COLOR, &bgColorItem);
        nodeAPI->setAttribute(textC, NODE_BACKGROUND_COLOR, &bgColorItem);
        
        ArkUI_AttributeItem item = {.string = "这是一个长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"};
        nodeAPI->setAttribute(textA, NODE_TEXT_CONTENT, &item);
        nodeAPI->setAttribute(textB, NODE_TEXT_CONTENT, &item);
        nodeAPI->setAttribute(textC, NODE_TEXT_CONTENT, &item);
        
        //ARKUI_TEXT_CONTENT_ALIGN_TOP
        ArkUI_NumberValue textContentAlignTop[] = {{.u32 = ARKUI_TEXT_CONTENT_ALIGN_TOP}};
        ArkUI_AttributeItem textContentAlignItemTop = {textContentAlignTop, 1};
        nodeAPI->setAttribute(textA, NODE_TEXT_CONTENT_ALIGN, &textContentAlignItemTop);
        
        //ARKUI_TEXT_CONTENT_ALIGN_CENTER
        ArkUI_NumberValue textContentAlignCenter[] = {{.u32 = ARKUI_TEXT_CONTENT_ALIGN_CENTER}};
        ArkUI_AttributeItem textContentAlignItemCenter = {textContentAlignCenter, 1};
        nodeAPI->setAttribute(textB, NODE_TEXT_CONTENT_ALIGN, &textContentAlignItemCenter);
        
        //ARKUI_TEXT_CONTENT_ALIGN_BOTTOM
        ArkUI_NumberValue textContentAlignBottom[] = {{.u32 = ARKUI_TEXT_CONTENT_ALIGN_BOTTOM}};
        ArkUI_AttributeItem textContentAlignItemBottom = {textContentAlignBottom, 1};
        nodeAPI->setAttribute(textC, NODE_TEXT_CONTENT_ALIGN, &textContentAlignItemBottom);
        
        nodeAPI->addChild(column, textA);
        nodeAPI->addChild(column, spaceColumn1);
        nodeAPI->addChild(column, textB);
        nodeAPI->addChild(column, spaceColumn2);
        nodeAPI->addChild(column, textC);
    
        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column)
        == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextContentAlignTest",
                "OH_NativeXComponent_AttachNativeRootNode failed");
        }

        napi_value exports;
        if (napi_create_object(env, &exports) != napi_ok) {
            napi_throw_type_error(env, nullptr, "napi_create_object failed");
            return nullptr;
        }

        return exports;
    }
} // namespace ArkUICapiTest
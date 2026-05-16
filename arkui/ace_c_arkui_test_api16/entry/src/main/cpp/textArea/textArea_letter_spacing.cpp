/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "textArea_letter_spacing.h"
#include <arkui/native_node.h>
#include <string>

namespace ArkUICapiTest {

static ArkUI_NodeHandle text6;
static ArkUI_NodeHandle text7;
static ArkUI_NodeHandle column;
static ArkUI_NodeHandle textarea;
static ArkUI_NodeHandle textinput;

napi_value TextAreaLetterSpacing::textAreaLetterSpacing001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    textarea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem textarea1 = {.string = "textarea"};
    nodeAPI->setAttribute(textarea, NODE_ID, &textarea1);
    ArkUI_NumberValue textarealetterspacing[] = {{.f32 = 1}};
    ArkUI_AttributeItem textarealetterspacingitem = {textarealetterspacing, 1};
    nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING, &textarealetterspacingitem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_AREA_LETTER_SPACING content:%{public}d",
                    nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING)->value[0].f32);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING)->value[0].f32, 1);

    ArkUI_NumberValue textarealetterspacing2[] = {{.f32 = -5}};
    ArkUI_AttributeItem textarealetterspacingitem2 = {textarealetterspacing2, 1};
    nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING, &textarealetterspacingitem2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_AREA_LETTER_SPACING content:%{public}d",
                    nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING)->value[0].f32);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_LETTER_SPACING)->value[0].f32, -5);

    ArkUI_NumberValue textareaEnablePreviewTextValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem textareaEnablePreviewTextItem = {textareaEnablePreviewTextValue, 1};
    nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT, &textareaEnablePreviewTextItem);
    nodeAPI->registerNodeEvent(textarea, NODE_TEXT_AREA_ON_CHANGE_WITH_PREVIEW_TEXT, 23, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT content:%{public}d",
                    nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value[0].u32, 1);

    ArkUI_NumberValue textareaEnablePreviewTextValue2[] = {{.i32 = 3}};
    ArkUI_AttributeItem textareaEnablePreviewTextItem2 = {textareaEnablePreviewTextValue2, 1};
    nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT, &textareaEnablePreviewTextItem2);
    nodeAPI->registerNodeEvent(textarea, NODE_TEXT_AREA_ON_CHANGE_WITH_PREVIEW_TEXT, 23, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT content:%{public}d",
                    nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value[0].u32, 1);

    text7 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem7 = {.string = "textArea succ"};
    nodeAPI->setAttribute(text7, NODE_TEXT_CONTENT, &textItem7);
    ArkUI_AttributeItem textItem8 = {.string = "text7"};
    nodeAPI->setAttribute(text7, NODE_ID, &textItem8);
    
    nodeAPI->addChild(column, textarea);
    nodeAPI->addChild(column, text7);
    
    auto onclick =
        [](ArkUI_NodeEvent *event) {
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 onclick succ");
            
            if (OH_ArkUI_NodeEvent_GetTargetId(event) == 23) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 OH_ArkUI_NodeEvent_GetTargetId == 23 succ");
                ArkUI_TextChangeEvent* textChangeEvent = OH_ArkUI_NodeEvent_GetTextChangeEvent(event);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 onNODE_TEXT_AREA_ON_CHANGE_WITH_PREVIEW_TEXT回调 content:%{public}s, previewText:%{public}s, offset:%{public}d",
                    textChangeEvent ->pStr, textChangeEvent ->pExtendStr, textChangeEvent ->number);
                if(strcmp(textChangeEvent ->pStr, "a") == 0 && strcmp(textChangeEvent ->pExtendStr, "") == 0 && textChangeEvent ->number == -1){
                    ArkUI_NumberValue value[] = {{.u32 = 0xffe31111}};
                    ArkUI_AttributeItem NODE_FONT_COLORItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
                    nodeAPI->setAttribute(text7, NODE_BACKGROUND_COLOR, &NODE_FONT_COLORItem);
                }
            }
        
        };
    nodeAPI->registerNodeEventReceiver(onclick);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value TextAreaLetterSpacing::textInputLetterSpacing002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    text6 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem6 = {.string = "textInput succ"};
    nodeAPI->setAttribute(text6, NODE_TEXT_CONTENT, &textItem6);
    ArkUI_AttributeItem textItem5 = {.string = "text6"};
    nodeAPI->setAttribute(text6, NODE_ID, &textItem5);
    
    textinput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem textinput1 = {.string = "textinput"};
    nodeAPI->setAttribute(textinput, NODE_ID, &textinput1);
    ArkUI_NumberValue textinputletterspacing[] = {{.i32 = 0}};
    ArkUI_AttributeItem textinputletterspacingitem = {textinputletterspacing, 1};
    nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_LETTER_SPACING, &textinputletterspacingitem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_INPUT_LETTER_SPACING content:%{public}d",
                    nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_LETTER_SPACING)->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_LETTER_SPACING)->value[0].u32, 0);
    ArkUI_NumberValue EnablePreviewTextValue[] = {{.i32 = -1}};
    ArkUI_AttributeItem EnablePreviewTextItem = {EnablePreviewTextValue, 1};
    nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT, &EnablePreviewTextItem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT content:%{public}d",
                    nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT)->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT)->value[0].u32, 1);

    ArkUI_NumberValue EnablePreviewTextValue2[] = {{.i32 = 0}};
    ArkUI_AttributeItem EnablePreviewTextItem2 = {EnablePreviewTextValue2, 1};
    nodeAPI->setAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT, &EnablePreviewTextItem2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT content:%{public}d",
                    nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT)->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(textinput, NODE_TEXT_INPUT_ENABLE_PREVIEW_TEXT)->value[0].u32, 0);
    
    nodeAPI->registerNodeEvent(textinput, NODE_TEXT_INPUT_ON_CHANGE_WITH_PREVIEW_TEXT, 20, nullptr);
    
    nodeAPI->addChild(column, textinput);
    nodeAPI->addChild(column, text6);
    
    auto onclick =
        [](ArkUI_NodeEvent *event) {
            auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
                OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 onclick succ");

            if (OH_ArkUI_NodeEvent_GetTargetId(event) == 20) {
                ArkUI_TextChangeEvent* textChangeEvent = OH_ArkUI_NodeEvent_GetTextChangeEvent(event);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "textAreaLetterSpacing001 onNODE_TEXT_INPUT_ON_CHANGE_WITH_PREVIEW_TEXT回调 content:%{public}s, previewText:%{public}s, offset:%{public}d",
                    textChangeEvent ->pStr, textChangeEvent ->pExtendStr, textChangeEvent ->number);
                if(strcmp(textChangeEvent ->pStr, "a") == 0 && strcmp(textChangeEvent ->pExtendStr, "") == 0 && textChangeEvent ->number == -1){
                    ArkUI_NumberValue value[] = {{.u32 = 0xffe31111}};
                    ArkUI_AttributeItem NODE_FONT_COLORItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
                    nodeAPI->setAttribute(text6, NODE_BACKGROUND_COLOR, &NODE_FONT_COLORItem);
                }
            }      
        };
    nodeAPI->registerNodeEventReceiver(onclick);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "textAreaLetterSpacing001",
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
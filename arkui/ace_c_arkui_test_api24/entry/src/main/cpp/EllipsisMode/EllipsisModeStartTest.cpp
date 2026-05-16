/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include "EllipsisModeStartTest.h"

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle Text = nullptr;
static ArkUI_NodeHandle TextInput = nullptr;
static ArkUI_NodeHandle TextArea = nullptr;
static int g_optionsIndex = 0;
static int g_changeNumeber = 3;
namespace ArkUICapiTest {

    napi_value EllipsisModeStartTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        ArkUI_NumberValue fontSizeValue[] = {16};
        ArkUI_AttributeItem fontSizeItem = {fontSizeValue, 1};
        ArkUI_NumberValue marginValue[] = {16};
        ArkUI_AttributeItem marginItem = {marginValue, 1};
        ArkUI_NumberValue textOverFlowValue[] = {{.i32 = ARKUI_TEXT_OVERFLOW_ELLIPSIS}};
        ArkUI_AttributeItem textOverFlowItem = {textOverFlowValue, 1};
        ArkUI_NumberValue styleArray[] = {{.i32 = ARKUI_TEXTINPUT_STYLE_INLINE}};
        ArkUI_AttributeItem styleItem = {styleArray, 1};
        ArkUI_NumberValue maxLinesValue[] = {{.i32 = 3}};
        ArkUI_AttributeItem maxLinesItem = {maxLinesValue, 1};
        ArkUI_AttributeItem textItem = {
                .string = "Many people read on digital devices like cell phones and e-books. The fast pace of life "
                          "leaves many people no time to sit and read a whole book, so making use of fragmented time "
                          "to read is sure tobe a trend. Fragmented reading has its advantages. People can get hold of "
                          "large amounts of information, knowledge, and entertainment in a short time. Digital reading "
                          "is faster and more interactive than traditional deep reading."};
        Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_NumberValue TextEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
        ArkUI_AttributeItem LABEL_Item = {&TextEllipsisModeItem, 1};
        ArkUI_AttributeItem textId = {.string = "text1"};
        nodeAPI->setAttribute(Text, NODE_TEXT_ELLIPSIS_MODE, &LABEL_Item);
        nodeAPI->setAttribute(Text, NODE_ID, &textId);
        nodeAPI->setAttribute(Text, NODE_TEXT_CONTENT, &textItem);
        nodeAPI->setAttribute(Text, NODE_FONT_SIZE, &fontSizeItem);
        nodeAPI->setAttribute(Text, NODE_MARGIN, &marginItem);
        nodeAPI->setAttribute(Text, NODE_TEXT_MAX_LINES, &maxLinesItem);
        nodeAPI->setAttribute(Text, NODE_TEXT_OVERFLOW, &textOverFlowItem);
        nodeAPI->addChild(Column, Text);

        TextInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
        ArkUI_NumberValue TextInputEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
        ArkUI_AttributeItem LABEL_Item2 = {&TextInputEllipsisModeItem, 1};
        ArkUI_AttributeItem textInputId = {.string = "textInput1"};
        nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_ELLIPSIS_MODE, &LABEL_Item2);
        nodeAPI->setAttribute(TextInput, NODE_ID, &textInputId);
        nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_TEXT, &textItem);
        nodeAPI->setAttribute(TextInput, NODE_FONT_SIZE, &fontSizeItem);
        nodeAPI->setAttribute(TextInput, NODE_MARGIN, &marginItem);
        nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_STYLE, &styleItem);
        nodeAPI->setAttribute(TextInput, NODE_TEXT_MAX_LINES, &maxLinesItem);
        nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_TEXT_OVERFLOW, &textOverFlowItem);
        nodeAPI->addChild(Column, TextInput);

        TextArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
        ArkUI_NumberValue TextAreaEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
        ArkUI_AttributeItem LABEL_Item3 = {&TextAreaEllipsisModeItem, 1};
        ArkUI_AttributeItem textAreaId = {.string = "textArea1"};
        nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_ELLIPSIS_MODE, &LABEL_Item3);
        nodeAPI->setAttribute(TextArea, NODE_ID, &textAreaId);
        nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_TEXT, &textItem);
        nodeAPI->setAttribute(TextArea, NODE_FONT_SIZE, &fontSizeItem);
        nodeAPI->setAttribute(TextArea, NODE_MARGIN, &marginItem);
        nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_MAX_LINES, &maxLinesItem);
        nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_TEXT_OVERFLOW, &textOverFlowItem);
        nodeAPI->addChild(Column, TextArea);

        nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
                auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
                auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
                ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
                OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
                ArkUI_NumberValue TextEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
                ArkUI_AttributeItem LABEL_Item = {&TextEllipsisModeItem, 1};
                ArkUI_NumberValue TextInputEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
                ArkUI_AttributeItem LABEL_Item2 = {&TextInputEllipsisModeItem, 1};
                ArkUI_NumberValue TextAreaEllipsisModeItem = {.i32 = ARKUI_ELLIPSIS_MODE_MULTILINE_START};
                ArkUI_AttributeItem LABEL_Item3 = {&TextAreaEllipsisModeItem, 1};
                switch (eventType) {
                case NODE_ON_TOUCH_INTERCEPT: {
                    nodeAPI->setAttribute(Text, NODE_TEXT_ELLIPSIS_MODE, &LABEL_Item);
                    auto ret = nodeAPI->getAttribute(Text, NODE_TEXT_ELLIPSIS_MODE);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textEllipsisMode",
                                 "aaa textEllipsisMode %{public}u", ret->value->i32);
                    nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_ELLIPSIS_MODE, &LABEL_Item2);
                    auto ret1 = nodeAPI->getAttribute(TextInput, NODE_TEXT_INPUT_ELLIPSIS_MODE);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textInputEllipsisMode",
                                 "aaa textEllipsisMode %{public}u", ret1->value->i32);
                    nodeAPI->setAttribute(TextArea, NODE_TEXT_ELLIPSIS_MODE, &LABEL_Item3);
                    auto ret2 = nodeAPI->getAttribute(TextArea, NODE_TEXT_ELLIPSIS_MODE);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "textAreaEllipsisMode",
                                 "aaa textEllipsisMode %{public}u", ret2->value->i32);
                    break;
                }
                default: {
                    break;
                }
                }
            });

        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                     Column) == INVALID_PARAM) {
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
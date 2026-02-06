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

#include "TextAreaCompressLeadingPunctuationTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

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
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

static auto SetWidth(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle, float width)
{
    ArkUI_NumberValue width_value[] = { { .f32 = width } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    return nodeHandle;
}

static auto SetHeight(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle, float height)
{
    ArkUI_NumberValue height_value[] = { { .f32 = height } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);
    return nodeHandle;
}

static auto SetBackgroundColor(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle nodeHandle, uint32_t color)
{
    ArkUI_NumberValue color_value[] = { { .u32 = color } };
    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color_item);
    return nodeHandle;
}

static auto SetDialog(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle)
{
    nodeHandle = SetWidth(nodeAPI, nodeHandle, SIZE_200);
    nodeHandle = SetHeight(nodeAPI, nodeHandle, SIZE_300);
    nodeHandle = SetBackgroundColor(nodeAPI, nodeHandle, COLOR_BLUE);
    return nodeHandle;
}

static auto SetId(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle, const char* id)
{
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);
    return nodeHandle;
}


static auto SetButton(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& nodeHandle, const char* id)
{
    nodeHandle = SetWidth(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = SetHeight(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = SetBackgroundColor(nodeAPI, nodeHandle, COLOR_RED);
    nodeHandle = SetId(nodeAPI, nodeHandle, id);
    return nodeHandle;
}


static void OnEventReceive(ArkUI_NodeEvent* event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
}

napi_value TextAreaCompressLeadingPunctuationTest::CreateNativeNode(napi_env env, napi_callback_info info)
 {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info( env , info , &argc , args , nullptr , nullptr );  
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto ColumnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);

    //创建button组件并绑定ONClick事件
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    IDTest(button, "buttonCompressLeadingPunctuation");
    std::string labelStr = "行首符号缩进属性false";
    ArkUI_AttributeItem LABEL_Item = {.string = labelStr.c_str()};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, 0, nullptr);
    
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    IDTest(button1, "buttonCompressLeadingPunctuation1");
    std::string labelStr1 = "行首符号缩进属性true";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, 1, nullptr);

    nodeAPI->addChild(Column, textArea);
    IDTest(textArea, "TextAreaCompressLeadingPunctuation");
    ArkUI_AttributeItem item20;
    item20.string = "【HarmonyOS】【\n\u3016\u3016\u3016\u3016\u3016\n\u300A《压》《缩》《测》《试》";
    nodeAPI->setAttribute( textArea, NODE_TEXT_AREA_TEXT, &item20 );

    ArkUI_NumberValue value21[] = {{.i32 = false}};
    ArkUI_AttributeItem item21 = {value21, sizeof(value21)/ sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_COMPRESS_LEADING_PUNCTUATION , &item21);
    
    nodeAPI->addChild(ColumnParent, Column);
    nodeAPI->addChild(ColumnParent, button);
    nodeAPI->addChild(ColumnParent, button1);
    
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (eventType) {
            case NODE_ON_CLICK_EVENT: {
                switch (targetId) {
                    case 0: {
                        ArkUI_NumberValue value21[] = {{.i32 = false}};
                        ArkUI_AttributeItem item21 = {value21, sizeof(value21)/ sizeof(ArkUI_NumberValue)};
                        nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_COMPRESS_LEADING_PUNCTUATION , &item21);
                        } break;
                    case 1: {
                        ArkUI_NumberValue value21[] = {{.i32 = true}};
                        ArkUI_AttributeItem item21 = {value21, sizeof(value21)/ sizeof(ArkUI_NumberValue)};
                        nodeAPI->setAttribute( textArea , NODE_TEXT_AREA_COMPRESS_LEADING_PUNCTUATION , &item21 );
                        } break;
                }
                } break;
                default:
                    break;
            }
        });

    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), ColumnParent) ==
        INVALID_PARAM) {
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICApiDemo
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

#include "TextGetCharacterTest.h"
#include <cstdint>
#include <iostream>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/styled_string.h>
#include <hilog/log.h>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NodeHandle textArea = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle Text11 = nullptr;
static ArkUI_NodeHandle Text22 = nullptr;
static ArkUI_NodeHandle Text33 = nullptr;

namespace ArkUICApiDemo {

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

napi_value TextGetCharacterTest::CreateNativeNode(napi_env env, napi_callback_info info) {
    static int offsetX = 150;
    static int offsetY = 50;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);  
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, ArkUICapiTest::LOG_PRINT_DOMAIN, "CalendarPickerMinMaxDateTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);

    //创建button组件并绑定ONClick事件
    auto buttonA = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem btnLabelA = {.string = "0,1"};
    nodeAPI->setAttribute(buttonA, NODE_BUTTON_LABEL, &btnLabelA);
    nodeAPI->registerNodeEvent(buttonA, NODE_ON_CLICK, 0, nullptr);
    std::string idValue = "buttonA";
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(buttonA, NODE_ID, &idValueItem);
    IDTest(buttonA, "buttonA");
    nodeAPI->addChild(row1, buttonA);

    auto buttonB = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem btnLabelB = {.string = "ErrorCode"};
    nodeAPI->setAttribute(buttonB, NODE_BUTTON_LABEL, &btnLabelB);
    nodeAPI->registerNodeEvent(buttonB, NODE_ON_CLICK, 1, nullptr);
    std::string idValueB = "buttonB";
    ArkUI_AttributeItem idValueItemB = {.string = idValueB.c_str()};
    nodeAPI->setAttribute(buttonB, NODE_ID, &idValueItemB);
    IDTest(buttonB, "buttonB");
    nodeAPI->addChild(row1, buttonB);

    ArkUI_AttributeItem item0;
    item0.string = "23456🎄🐀🙂🧭abcd~!@#$%^&*(\n中文\n！￥👩‍👧‍👦🏛️";
    nodeAPI->setAttribute(text,NODE_TEXT_CONTENT, &item0);

    Text11 = nodeAPI->createNode(ARKUI_NODE_TEXT);  
    std::string idValue1 = "Text11";
    ArkUI_AttributeItem idValueItem1 = {.string = idValue1.c_str()};
    nodeAPI->setAttribute(Text11, NODE_ID, &idValueItem1); 
    IDTest(Text11, "Text11");

    Text22 = nodeAPI->createNode(ARKUI_NODE_TEXT);  
    std::string idValue2 = "Text22";
    ArkUI_AttributeItem idValueItem2 = {.string = idValue2.c_str()};
    nodeAPI->setAttribute(Text22, NODE_ID, &idValueItem2); 
    IDTest(Text22, "Text22");
    
    Text33 = nodeAPI->createNode(ARKUI_NODE_TEXT);  
    std::string idValue3 = "Text33";
    ArkUI_AttributeItem idValueItem3 = {.string = idValue3.c_str()};
    nodeAPI->setAttribute(Text33, NODE_ID, &idValueItem3); 
    IDTest(Text33, "Text33");

    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, Text11);
    nodeAPI->addChild(column, Text22);
    nodeAPI->addChild(column, Text33);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        switch (eventType) {
            case NODE_ON_CLICK: {
                switch (targetId) {
                    case 0: {
                        auto *layoutManager = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
                        ArkUI_TextLayoutManager *manager = (ArkUI_TextLayoutManager *)layoutManager->object;

                        OH_Drawing_PositionAndAffinity *outPos2;
                        // text
                        OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinate(manager, offsetX, offsetY, &outPos2);
                        size_t position2 = OH_Drawing_GetPositionFromPositionAndAffinity(outPos2);
                        size_t affinity2 = OH_Drawing_GetAffinityFromPositionAndAffinity(outPos2);
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "range",
                                    "Text positon = "
                                    "%{public}zu affinity = %{public}zu",
                                    position2, affinity2);
                        ArkUI_AttributeItem item11;
                        item11.string = "Text positon=0 affinity=1";
                        nodeAPI->setAttribute(Text11, NODE_TEXT_CONTENT, &item11);
                        // text
                        auto *charRange = new (std::nothrow) Boundary(0, 1);
                        OH_Drawing_Range *charRanges = (OH_Drawing_Range *)(charRange);
                        OH_Drawing_Range *outGlyphRange;
                        OH_Drawing_Range *outActualCharRange;
                        OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange(manager, charRanges, &outGlyphRange,
                            &outActualCharRange);
                        size_t glyphStart = OH_Drawing_GetStartFromRange(outGlyphRange);
                        size_t glyphEnd = OH_Drawing_GetEndFromRange(outGlyphRange);
                        size_t actualCharStart = OH_Drawing_GetStartFromRange(outActualCharRange);
                        size_t actualCharEnd = OH_Drawing_GetEndFromRange(outActualCharRange);
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "range",
                                    "Text glyphStart = "
                                    "%{public}zu glyphEnd = %{public}zu actualCharStart = %{public}zu actualCharEnd = "
                                    "%{public}zu",
                                    glyphStart, glyphEnd, actualCharStart, actualCharEnd);
                        ArkUI_AttributeItem item22;
                        item22.string = "Text glyphStart=0 glyphEnd=1 actualCharStart=0 actualCharEnd=1";
                        nodeAPI->setAttribute(Text22, NODE_TEXT_CONTENT, &item22);
                        // text
                        auto *glyphRange = new (std::nothrow) Boundary(0, 1);
                        OH_Drawing_Range *glyphRanges = (OH_Drawing_Range *)(glyphRange);
                        OH_Drawing_Range *outCharRange;
                        OH_Drawing_Range *outActualGlyphRange;
                        OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange(manager, glyphRanges, &outCharRange,
                            &outActualGlyphRange);
                        size_t charStart = OH_Drawing_GetStartFromRange(outCharRange);
                        size_t charEnd = OH_Drawing_GetEndFromRange(outCharRange);
                        size_t actualGlyphStart = OH_Drawing_GetStartFromRange(outActualGlyphRange);
                        size_t actualGlyphEnd = OH_Drawing_GetEndFromRange(outActualGlyphRange);
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN, "range","Text charStart = "
                            "%{public}zu charEnd = %{public}zu actualGlyphStart = %{public}zu actualGlyphEnd "
                            "= %{public}zu", charStart, charEnd, actualGlyphStart, actualGlyphEnd);
                        ArkUI_AttributeItem item33;
                        item33.string = "Text charStart=0 charEnd=1 actualGlyphStart=0 actualGlyphEnd=1";
                        nodeAPI->setAttribute(Text33, NODE_TEXT_CONTENT, &item33);
                        } break;
                        case 1: {
                        auto *layoutManager = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
                        ArkUI_TextLayoutManager *manager = (ArkUI_TextLayoutManager *)layoutManager->object;

                        OH_Drawing_PositionAndAffinity *outPos2;
                        // text
                        auto ret = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinate(nullptr, 150, 50, &outPos2);
                        if (ARKUI_ERROR_CODE_NO_ERROR == ret) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d", ret); 
                            } else if (ARKUI_ERROR_CODE_PARAM_INVALID == ret) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d", ret);
                            ArkUI_AttributeItem item11;
                            item11.string = "ARKUI_ERROR_CODE_PARAM_INVALID";
                            nodeAPI->setAttribute(Text11, NODE_TEXT_CONTENT, &item11);
                            }
                        // text
                        auto *charRange = new (std::nothrow) Boundary(0, 1);
                        OH_Drawing_Range *charRanges = (OH_Drawing_Range *)(charRange);
                        OH_Drawing_Range *outGlyphRange;
                        OH_Drawing_Range *outActualCharRange;
                        auto ret1 = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange(
                            nullptr, charRanges, &outGlyphRange,&outActualCharRange);
                        if (ARKUI_ERROR_CODE_NO_ERROR == ret1) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d", ret1); 
                            } else if (ARKUI_ERROR_CODE_PARAM_INVALID == ret1) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d", ret1);
                            ArkUI_AttributeItem item22;
                            item22.string = "ARKUI_ERROR_CODE_PARAM_INVALID";
                            nodeAPI->setAttribute(Text22, NODE_TEXT_CONTENT, &item22);
                            }
                        // text
                        auto *glyphRange = new (std::nothrow) Boundary(0, 1);
                        OH_Drawing_Range *glyphRanges = (OH_Drawing_Range *)(glyphRange);
                        OH_Drawing_Range *outCharRange;
                        OH_Drawing_Range *outActualGlyphRange;
                        auto ret2 = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange(
                            nullptr, glyphRanges, &outCharRange,&outActualGlyphRange);
                        if (ARKUI_ERROR_CODE_NO_ERROR == ret2) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d",ret2); 
                            } else if (ARKUI_ERROR_CODE_PARAM_INVALID == ret2) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, ArkUICapiTest::LOG_PRINT_DOMAIN,
                            "Manager", "errorCode : register area ret=%{public}d",ret2);
                            ArkUI_AttributeItem item33;
                            item33.string = "ARKUI_ERROR_CODE_PARAM_INVALID";
                            nodeAPI->setAttribute(Text33, NODE_TEXT_CONTENT, &item33);
                            }
                        } break;
                    }
                } break;
                default:
            break;
            }
        });

    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(
        ArkUICapiTest::PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
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
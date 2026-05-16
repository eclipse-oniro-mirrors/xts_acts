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

#include "ChainWeightTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>

namespace ArkUICapiTest {
static ArkUI_NodeHandle row1 = nullptr;
static ArkUI_NodeHandle row2 = nullptr;
static ArkUI_NodeHandle row3 = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle button1 = nullptr;
static float g_chainWeight = 1;
static float g_chainWeight1 = 0;
static float g_chainWeightRow = 2;

// 设置Button文本
static auto ContentTest(ArkUI_NodeHandle &nodeHandle, std::string isContent)
{
    std::string contentStr = isContent;
    ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &contentItem);
}

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

// 设置背景色
static auto BackGroundColorTest(ArkUI_NodeHandle &nodeHandle, uint32_t isColorTest)
{
    ArkUI_NumberValue color1[] = {{.u32 = isColorTest}};
    ArkUI_AttributeItem color1_item = {color1, sizeof(color1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color1_item);
}

static auto ChainWeight(ArkUI_NodeHandle &nodeHandle, float isHor, float isVer)
{
    ArkUI_NumberValue value[] = {{.f32 = isHor}, {.f32 = isVer}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_CHAIN_WEIGHT, &valueItem);
}

static auto HeightAndWidth(ArkUI_NodeHandle &nodeHandle, float isWidth, float isHeight)
{
    ArkUI_NumberValue WidthValue[] = {isWidth};
    ArkUI_AttributeItem WidthItem = {WidthValue, PARAM_1};
    ArkUI_NumberValue HeightValue[] = {isHeight};
    ArkUI_AttributeItem HeightItem = {HeightValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &WidthItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &HeightItem);
}

static auto HeightAndWidthPercent(ArkUI_NodeHandle &nodeHandle, float isWidthPercent, float isHeightPercent)
{
    ArkUI_NumberValue WidthPercentValue[] = {isWidthPercent};
    ArkUI_AttributeItem WidthItemPercent = {WidthPercentValue, PARAM_1};
    ArkUI_NumberValue HeightPercentValue[] = {isHeightPercent};
    ArkUI_AttributeItem HeightPercentItem = {HeightPercentValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &WidthItemPercent);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT_PERCENT, &HeightPercentItem);
}

napi_value ChainWeightTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    HeightAndWidthPercent(column, PARAM_1, PARAM_1);
    
    auto relativeContainer = nodeAPI->createNode(ARKUI_NODE_RELATIVE_CONTAINER);
    HeightAndWidth(relativeContainer, PARAM_90, PARAM_90);

    row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    row3 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row4 = nodeAPI->createNode(ARKUI_NODE_ROW);

    //设置ID
    IDTest(row1, "rowChainWeightCapi1");
    IDTest(row2, "rowChainWeightCapi2");
    IDTest(row3, "rowChainWeightCapi3");
    //设置宽高
    HeightAndWidth(row1, SIZE_30, SIZE_30);
    HeightAndWidth(row2, SIZE_30, SIZE_30);
    HeightAndWidth(row3, SIZE_30, SIZE_30);
    //设置背景颜色
    BackGroundColorTest(row1, 0xFF333300);
    BackGroundColorTest(row2, 0xFFCC0000);
    BackGroundColorTest(row3, 0x6699FF00);
    //设置Row1alignRules
    auto alignRulesRow1 = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRulesRow1, "__container__", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetStart(alignRulesRow1, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_START);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignRulesRow1, "rowChainWeightCapi2", ARKUI_HORIZONTAL_ALIGNMENT_START);
    ArkUI_AttributeItem alignRulesRow1_item = {.object = alignRulesRow1};
    nodeAPI->setAttribute(row1, NODE_ALIGN_RULES, &alignRulesRow1_item);
    //设置Row2alignRules
    auto alignRulesRow2 = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRulesRow2, "__container__", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignRulesRow2, "rowChainWeightCapi3", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetStart(alignRulesRow2, "rowChainWeightCapi1", ARKUI_HORIZONTAL_ALIGNMENT_END);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignRulesRow2, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_END);
    ArkUI_AttributeItem alignRulesRow2_item = {.object = alignRulesRow2};
    nodeAPI->setAttribute(row2, NODE_ALIGN_RULES, &alignRulesRow2_item);
    //设置Row3alignRules
    auto alignRulesRow3 = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRulesRow3, "rowChainWeightCapi2", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignRulesRow3, "__container__", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    ArkUI_AttributeItem alignRulesRow3_item = {.object = alignRulesRow3};
    nodeAPI->setAttribute(row3, NODE_ALIGN_RULES, &alignRulesRow3_item);
    //设置Row1chainMode
    ArkUI_NumberValue row1ChainMode[] = {
        {.i32 = ARKUI_AXIS_HORIZONTAL},
        {.i32 = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_PACKED}
    };
    ArkUI_AttributeItem row1ChainMode_item = {row1ChainMode, sizeof(row1ChainMode) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(row1, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &row1ChainMode_item);
    //设置Row2chainMode
    ArkUI_NumberValue row2ChainMode[] = {
        {.i32 = ARKUI_AXIS_VERTICAL},
        {.i32 = ARKUI_RELATIVE_LAYOUT_CHAIN_STYLE_PACKED}
    };
    ArkUI_AttributeItem row2ChainMode_item = {row2ChainMode, sizeof(row1ChainMode) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(row2, NODE_RELATIVE_LAYOUT_CHAIN_MODE, &row2ChainMode_item);
    //设置ChainWeight
    ChainWeight(row1, g_chainWeight, g_chainWeight1);
    ChainWeight(row2, g_chainWeightRow, g_chainWeightRow);
    ChainWeight(row3, g_chainWeight1, g_chainWeight);
    
    auto Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto Text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    // 设置文本内容
    ContentTest(Text1, "row1");
    ContentTest(Text2, "row2");
    ContentTest(Text3, "row3");
    
    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "-5";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    IDTest(button1, "button-5");
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->addChild(row4, button1);

    nodeAPI->addChild(row1, Text1);
    nodeAPI->addChild(row2, Text2);
    nodeAPI->addChild(row3, Text3);
    nodeAPI->addChild(relativeContainer, row1);
    nodeAPI->addChild(relativeContainer, row2);
    nodeAPI->addChild(relativeContainer, row3);
    nodeAPI->addChild(column, relativeContainer);
    nodeAPI->addChild(column, row4);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (targetId == PARAM_0) {
            g_chainWeightRow = PARAM_NEGATIVE_5;
            ChainWeight(row2, g_chainWeightRow, g_chainWeightRow);
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}
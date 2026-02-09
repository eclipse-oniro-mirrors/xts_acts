/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "../manager/plugin_manager.h"
#include "ScrollBarMarginTest.h"

#define PARAM_NUMBER 1
#define LENGTH 64
#define STRLENGTH 0
#define ABNORMAL_PARAM 1000
#define PARAM_ERROR 401
#define PARAM_015 0.15
#define PARAM_020 0.20
#define PARAM_01 0.1
#define PARAM_02 0.2
#define PARAM_20 20.0
#define PARAM_999 999.0
#define PARAM_NEGATIVE_5 (-5.0)
#define PARAM_NEGATIVE_10 (-10.0)
namespace ArkUICapiTest {

static ArkUI_NodeHandle BasicSet1(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // Create Component
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    // Nested components
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(scroll, column);

    // Set basic properties of sub components
    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH_PERCENT, &button_width_item);
    
    ArkUI_NumberValue button_height_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_height_item = {button_height_value,
                                              sizeof(button_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT_PERCENT, &button_height_item);

    // Set scroll basic properties
    ArkUI_NumberValue length_value[] = {{.f32 = PARAM_020}};
    ArkUI_AttributeItem length_item = {length_value, sizeof(length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH_PERCENT, &length_item);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT_PERCENT, &length_item);
    
    ArkUI_NumberValue scroll_color_value[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem color_item = {scroll_color_value, sizeof(scroll_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &color_item);
    
    ArkUI_NumberValue attribute_value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON}};
    ArkUI_AttributeItem attribute_item = {attribute_value, sizeof(attribute_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &attribute_item);

    return scroll;
}

static ArkUI_NodeHandle BasicSet2(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // Create Component
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    // Nested components
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(grid, column);

    // Set basic properties of sub components
    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH_PERCENT, &button_width_item);
    
    ArkUI_NumberValue button_height_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_height_item = {button_height_value,
                                              sizeof(button_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT_PERCENT, &button_height_item);

    // Set grid basic properties
    ArkUI_NumberValue length_value[] = {{.f32 = PARAM_020}};
    ArkUI_AttributeItem length_item = {length_value, sizeof(length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(grid, NODE_WIDTH_PERCENT, &length_item);
    nodeAPI->setAttribute(grid, NODE_HEIGHT_PERCENT, &length_item);
    
    ArkUI_NumberValue scroll_color_value[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem color_item = {scroll_color_value, sizeof(scroll_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(grid, NODE_BACKGROUND_COLOR, &color_item);
    
    ArkUI_NumberValue attribute_value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON}};
    ArkUI_AttributeItem attribute_item = {attribute_value, sizeof(attribute_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(grid, NODE_SCROLL_BAR_DISPLAY_MODE, &attribute_item);

    return grid;
}

static ArkUI_NodeHandle BasicSet3(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // Create Component
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    // Nested components
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(waterFlow, column);

    // Set basic properties of sub components
    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH_PERCENT, &button_width_item);
    
    ArkUI_NumberValue button_height_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_height_item = {button_height_value,
                                              sizeof(button_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT_PERCENT, &button_height_item);

    // Set waterFlow basic properties
    ArkUI_NumberValue length_value[] = {{.f32 = PARAM_020}};
    ArkUI_AttributeItem length_item = {length_value, sizeof(length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(waterFlow, NODE_WIDTH_PERCENT, &length_item);
    nodeAPI->setAttribute(waterFlow, NODE_HEIGHT_PERCENT, &length_item);
    
    ArkUI_NumberValue scroll_color_value[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem color_item = {scroll_color_value, sizeof(scroll_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(waterFlow, NODE_BACKGROUND_COLOR, &color_item);
    
    ArkUI_NumberValue attribute_value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON}};
    ArkUI_AttributeItem attribute_item = {attribute_value, sizeof(attribute_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(waterFlow, NODE_SCROLL_BAR_DISPLAY_MODE, &attribute_item);

    return waterFlow;
}

static ArkUI_NodeHandle BasicSet4(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // Create Component
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    // Nested components
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(list, column);

    // Set basic properties of sub components
    ArkUI_NumberValue button_width_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH_PERCENT, &button_width_item);
    
    ArkUI_NumberValue button_height_value[] = {{.f32 = PARAM_015}};
    ArkUI_AttributeItem button_height_item = {button_height_value,
                                              sizeof(button_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_HEIGHT_PERCENT, &button_height_item);

    // Set list basic properties
    ArkUI_NumberValue length_value[] = {{.f32 = PARAM_020}};
    ArkUI_AttributeItem length_item = {length_value, sizeof(length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH_PERCENT, &length_item);
    nodeAPI->setAttribute(list, NODE_HEIGHT_PERCENT, &length_item);
    
    ArkUI_NumberValue scroll_color_value[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem color_item = {scroll_color_value, sizeof(scroll_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_BACKGROUND_COLOR, &color_item);
    
    ArkUI_NumberValue attribute_value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON}};
    ArkUI_AttributeItem attribute_item = {attribute_value, sizeof(attribute_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE, &attribute_item);

    return list;
}

napi_value ScrollScrollBarMarginTest::CreateNativeNodeScrollBarMargin(napi_env env, napi_callback_info info)
{
    // Get id
    size_t argc = PARAM_NUMBER;
    napi_value args[PARAM_NUMBER] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = LENGTH;
    size_t strLength = STRLENGTH;
    char xComponentID[LENGTH] = {STRLENGTH};
    napi_get_value_string_utf8(env, args[STRLENGTH], xComponentID, length, &strLength);

    // Create nodeAPI
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto scroll1 = BasicSet1(nodeAPI);
    auto scroll2 = BasicSet1(nodeAPI);
    auto scroll3 = BasicSet1(nodeAPI);
    auto scroll4 = BasicSet1(nodeAPI);
    auto grid1 = BasicSet2(nodeAPI);
    auto grid2 = BasicSet2(nodeAPI);
    auto grid3 = BasicSet2(nodeAPI);
    auto grid4 = BasicSet2(nodeAPI);
    auto waterFlow1 = BasicSet3(nodeAPI);
    auto waterFlow2 = BasicSet3(nodeAPI);
    auto waterFlow3 = BasicSet3(nodeAPI);
    auto waterFlow4 = BasicSet3(nodeAPI);
    auto list1 = BasicSet4(nodeAPI);
    auto list2 = BasicSet4(nodeAPI);
    auto list3 = BasicSet4(nodeAPI);
    auto list4 = BasicSet4(nodeAPI);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row3 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row4 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, row2);
    nodeAPI->addChild(column, row3);
    nodeAPI->addChild(column, row4);
    nodeAPI->addChild(row1, scroll1);
    nodeAPI->addChild(row1, scroll2);
    nodeAPI->addChild(row1, scroll3);
    nodeAPI->addChild(row1, scroll4);
    nodeAPI->addChild(row2, grid1);
    nodeAPI->addChild(row2, grid2);
    nodeAPI->addChild(row2, grid3);
    nodeAPI->addChild(row2, grid4);
    nodeAPI->addChild(row3, waterFlow1);
    nodeAPI->addChild(row3, waterFlow2);
    nodeAPI->addChild(row3, waterFlow3);
    nodeAPI->addChild(row3, waterFlow4);
    nodeAPI->addChild(row4, list1);
    nodeAPI->addChild(row4, list2);
    nodeAPI->addChild(row4, list3);
    nodeAPI->addChild(row4, list4);

    //id
    ArkUI_AttributeItem textId1 = {.string = "scroll_001"};
    ArkUI_AttributeItem textId2 = {.string = "scroll_002"};
    ArkUI_AttributeItem textId3 = {.string = "scroll_003"};
    ArkUI_AttributeItem textId4 = {.string = "scroll_004"};
    ArkUI_AttributeItem textId5 = {.string = "grid_001"};
    ArkUI_AttributeItem textId6 = {.string = "grid_002"};
    ArkUI_AttributeItem textId7 = {.string = "grid_003"};
    ArkUI_AttributeItem textId8 = {.string = "grid_004"};
    ArkUI_AttributeItem textId9 = {.string = "waterFlow_001"};
    ArkUI_AttributeItem textId10 = {.string = "waterFlow_002"};
    ArkUI_AttributeItem textId11 = {.string = "waterFlow_003"};
    ArkUI_AttributeItem textId12 = {.string = "waterFlow_004"};
    ArkUI_AttributeItem textId13 = {.string = "list_001"};
    ArkUI_AttributeItem textId14 = {.string = "list_002"};
    ArkUI_AttributeItem textId15 = {.string = "list_003"};
    ArkUI_AttributeItem textId16 = {.string = "list_004"};
    nodeAPI->setAttribute(scroll1, NODE_ID, &textId1);
    nodeAPI->setAttribute(scroll2, NODE_ID, &textId2);
    nodeAPI->setAttribute(scroll3, NODE_ID, &textId3);
    nodeAPI->setAttribute(scroll4, NODE_ID, &textId4);
    nodeAPI->setAttribute(grid1, NODE_ID, &textId5);
    nodeAPI->setAttribute(grid2, NODE_ID, &textId6);
    nodeAPI->setAttribute(grid3, NODE_ID, &textId7);
    nodeAPI->setAttribute(grid4, NODE_ID, &textId8);
    nodeAPI->setAttribute(waterFlow1, NODE_ID, &textId9);
    nodeAPI->setAttribute(waterFlow2, NODE_ID, &textId10);
    nodeAPI->setAttribute(waterFlow3, NODE_ID, &textId11);
    nodeAPI->setAttribute(waterFlow4, NODE_ID, &textId12);
    nodeAPI->setAttribute(list1, NODE_ID, &textId13);
    nodeAPI->setAttribute(list2, NODE_ID, &textId14);
    nodeAPI->setAttribute(list3, NODE_ID, &textId15);
    nodeAPI->setAttribute(list4, NODE_ID, &textId16);

    ArkUI_NumberValue scroll_bar_margin_value1[] = {{ .f32 = PARAM_10 }, { .f32 = PARAM_20 }};
    ArkUI_AttributeItem bar_margin_item1 = {scroll_bar_margin_value1,
                                            sizeof(scroll_bar_margin_value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll1, NODE_SCROLL_BAR_MARGIN, &bar_margin_item1);
    nodeAPI->setAttribute(grid1, NODE_SCROLL_BAR_MARGIN, &bar_margin_item1);
    nodeAPI->setAttribute(waterFlow1, NODE_SCROLL_BAR_MARGIN, &bar_margin_item1);
    nodeAPI->setAttribute(list1, NODE_SCROLL_BAR_MARGIN, &bar_margin_item1);
    
    ArkUI_NumberValue scroll_bar_margin_value2[] = {{ .f32 = PARAM_01 }, { .f32 = PARAM_02 }};
    ArkUI_AttributeItem bar_margin_item2 = {scroll_bar_margin_value2,
                                            sizeof(scroll_bar_margin_value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll2, NODE_SCROLL_BAR_MARGIN, &bar_margin_item2);
    nodeAPI->setAttribute(grid2, NODE_SCROLL_BAR_MARGIN, &bar_margin_item2);
    nodeAPI->setAttribute(waterFlow2, NODE_SCROLL_BAR_MARGIN, &bar_margin_item2);
    nodeAPI->setAttribute(list2, NODE_SCROLL_BAR_MARGIN, &bar_margin_item2);
    
    ArkUI_NumberValue scroll_bar_margin_value3[] = {{ .f32 = PARAM_NEGATIVE_5 }, { .f32 = PARAM_NEGATIVE_10 }};
    ArkUI_AttributeItem bar_margin_item3 = {scroll_bar_margin_value3,
                                            sizeof(scroll_bar_margin_value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll3, NODE_SCROLL_BAR_MARGIN, &bar_margin_item3);
    nodeAPI->setAttribute(grid3, NODE_SCROLL_BAR_MARGIN, &bar_margin_item3);
    nodeAPI->setAttribute(waterFlow3, NODE_SCROLL_BAR_MARGIN, &bar_margin_item3);
    nodeAPI->setAttribute(list3, NODE_SCROLL_BAR_MARGIN, &bar_margin_item3);
    
    ArkUI_NumberValue scroll_bar_margin_value4[] = {{ .f32 = PARAM_999 }, { .f32 = PARAM_999 }};
    ArkUI_AttributeItem bar_margin_item4 = {scroll_bar_margin_value4,
                                            sizeof(scroll_bar_margin_value4) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll4, NODE_SCROLL_BAR_MARGIN, &bar_margin_item4);
    nodeAPI->setAttribute(grid4, NODE_SCROLL_BAR_MARGIN, &bar_margin_item4);
    nodeAPI->setAttribute(waterFlow4, NODE_SCROLL_BAR_MARGIN, &bar_margin_item4);
    nodeAPI->setAttribute(list4, NODE_SCROLL_BAR_MARGIN, &bar_margin_item4);

    // Mount components
    std::string idScroll(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idScroll), column) ==
        PARAM_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollScrollBarTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
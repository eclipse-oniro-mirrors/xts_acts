/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "GridAttrsTest.h"
#include "component/TextComponentTest.h"

namespace ArkUICapiTest {
napi_value TestGridItemStyle001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridRowsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    
    for (int i = 0; i < PARAM_6; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);

        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        gridItem->SetFontSize(SIZE_10);
        if (i == 0) {
            ArkUI_NumberValue value_number[] = {{.i32 = GRID_ITEM_STYLE_PLAIN} };
            ArkUI_AttributeItem attribute_item = { value_number, sizeof(value_number) / sizeof(ArkUI_NumberValue)};
            auto ret = gridItem->setAttribute(NODE_GRID_ITEM_STYLE, &attribute_item);
            ASSERT_EQ(ret, SUCCESS);
            
            auto itemStyle = gridItem->getAttribute(NODE_GRID_ITEM_STYLE)->value->i32;
            ASSERT_EQ(itemStyle, GRID_ITEM_STYLE_PLAIN);
        }
        text->SetTextContent("A");
       
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    NAPI_END;
}

napi_value TestGridItemStyle002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridRowsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    
    for (int i = 0; i < PARAM_6; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);

        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        gridItem->SetFontSize(SIZE_10);
        if (i == 0) {
            ArkUI_NumberValue value_number[] = {{.i32 = GRID_ITEM_STYLE_NONE} };
            ArkUI_AttributeItem attribute_item = { value_number, sizeof(value_number) / sizeof(ArkUI_NumberValue)};
            auto ret = gridItem->setAttribute(NODE_GRID_ITEM_STYLE, &attribute_item);
            ASSERT_EQ(ret, SUCCESS);
            
            auto itemStyle = gridItem->getAttribute(NODE_GRID_ITEM_STYLE)->value->i32;
            ASSERT_EQ(itemStyle, GRID_ITEM_STYLE_NONE);
        }
        text->SetTextContent("A");
       
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    NAPI_END;
}

napi_value TestGridItemStyle003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridRowsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    
    for (int i = 0; i < PARAM_6; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);

        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        gridItem->SetFontSize(SIZE_10);
        if (i == 0) {
            ArkUI_NumberValue value_number[] = {{.i32 = GRID_ITEM_STYLE_NONE} };
            ArkUI_AttributeItem attribute_item = { value_number, sizeof(value_number) / sizeof(ArkUI_NumberValue)};
            auto ret = gridItem->setAttribute(NODE_GRID_ITEM_STYLE, &attribute_item);
            ASSERT_EQ(ret, SUCCESS);

            ArkUI_NumberValue error_value[] = {{.i32 = PARAM_2} };
            attribute_item = { error_value, sizeof(error_value) / sizeof(ArkUI_NumberValue)};
            ret = gridItem->setAttribute(NODE_GRID_ITEM_STYLE, &attribute_item);
            ASSERT_EQ(ret, INVALID_PARAM);
            
            auto itemStyle = gridItem->getAttribute(NODE_GRID_ITEM_STYLE)->value->i32;
            ASSERT_EQ(itemStyle, GRID_ITEM_STYLE_NONE);
        }
        text->SetTextContent("A");
       
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    NAPI_END;
}

napi_value TestGridItemAlignment001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    ArkUI_NumberValue alignItems[] = {{.i32 = GRID_ITEM_ALIGNMENT_STRETCH}};
    ArkUI_AttributeItem align_item = {alignItems, sizeof(alignItems) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ALIGN_ITEMS, &align_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, GRID_ITEM_ALIGNMENT_STRETCH);
    NAPI_END;
}

napi_value TestGridItemAlignment002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    ArkUI_NumberValue alignItems[] = {{.i32 = GRID_ITEM_ALIGNMENT_DEFAULT}};
    ArkUI_AttributeItem align_item = { alignItems, sizeof(alignItems) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ALIGN_ITEMS, &align_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, GRID_ITEM_ALIGNMENT_DEFAULT);
    NAPI_END;
}

napi_value TestGridItemAlignment003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    ArkUI_NumberValue alignItems[] = {{.i32 = PARAM_2}};
    ArkUI_AttributeItem align_item = {alignItems, sizeof(alignItems) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ALIGN_ITEMS, &align_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(ret1, GRID_ITEM_ALIGNMENT_DEFAULT);
    NAPI_END;
}

//创建，判断值
napi_value TestGridLayoutOptions001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    uint32_t irregularIndexes2[] = {PARAM_3, PARAM_6};
    OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, PARAM_2);
    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);
    int32_t size = PARAM_4;
    auto getValue = OH_ArkUI_GridLayoutOptions_GetIrregularIndexes(option, irregularIndexes2, &size);
    ASSERT_EQ(getValue, SUCCESS);
    ASSERT_EQ(size, PARAM_2);
    size = PARAM_1;
    getValue = OH_ArkUI_GridLayoutOptions_GetIrregularIndexes(option, irregularIndexes2, &size);
    ASSERT_EQ(getValue, ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR);
    NAPI_END;
}

//销毁
napi_value TestGridLayoutOptions002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    uint32_t irregularIndexes2[] = {PARAM_4, PARAM_7};
    OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, PARAM_4);
    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_GridLayoutOptions_Dispose(option);
    OH_ArkUI_GridLayoutOptions_Dispose(nullptr);
    NAPI_END;
}

//异常
napi_value TestGridLayoutOptions003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    uint32_t irregularIndexes2[] = {PARAM_3, PARAM_6};
    OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, PARAM_2);
    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);

    int32_t size1 = PARAM_4;
    auto getValue1 = OH_ArkUI_GridLayoutOptions_GetIrregularIndexes(option, irregularIndexes2, &size1);
    ASSERT_EQ(getValue1, ARKUI_ERROR_CODE_NO_ERROR);

    auto getValue2 = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, size1);
    ASSERT_EQ(getValue2, ARKUI_ERROR_CODE_NO_ERROR);

    int32_t size2 = PARAM_1;
    auto getValue3 = OH_ArkUI_GridLayoutOptions_GetIrregularIndexes(option, irregularIndexes2, &size2);
    ASSERT_EQ(getValue3, ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR);

    auto option1 = nullptr;
    auto getValue4 = OH_ArkUI_GridLayoutOptions_GetIrregularIndexes(option1, irregularIndexes2, &size2);
    ASSERT_EQ(getValue4, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto option2 = nullptr;
    auto getValue5 = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option2, irregularIndexes2, size2);
    ASSERT_EQ(getValue5, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TestGridLayoutOptions004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    uint32_t irregularIndexes2[] = {PARAM_3, PARAM_6};
    auto  getValue = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, PARAM_NEGATIVE_1);
    ASSERT_EQ(getValue, INVALID_PARAM);
    auto  getValue1 = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, nullptr, PARAM_3);
    ASSERT_EQ(getValue1, INVALID_PARAM);
    auto  getValue2 = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(nullptr, irregularIndexes2, PARAM_3);
    ASSERT_EQ(getValue2, INVALID_PARAM);
    OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes2, PARAM_3);
    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestRegisterGetIrregularSizeByIndexCallback001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "CreatGrid2");

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_450);
    grid->SetHeight(SIZE_300);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    
    for (int i = 0; i < PARAM_6; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(SIZE_50);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        text->SetTextContent("A");

        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    uint32_t irregularIndexes[] = {0, 7};
    auto ret1 = OH_ArkUI_GridLayoutOptions_SetIrregularIndexes(option, irregularIndexes, 2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "CreatGrid2 ret:%{public}d", ret1);
    std::string* str = new std::string("CreatGrid2");
    void* userData = static_cast<void*>(str);

    OH_ArkUI_GridLayoutOptions_RegisterGetIrregularSizeByIndexCallback(option, userData,
        [](int32_t itemIndex, void *userData) -> ArkUI_GridItemSize {
        uint32_t rowSpan = PARAM_1;
        uint32_t columnSpan = PARAM_4;
        if (userData) {
            std::string* str = static_cast<std::string*>(userData);
        }
        if (itemIndex == PARAM_0) {
            rowSpan = PARAM_1;
            columnSpan = PARAM_2;
            return {rowSpan, columnSpan};
        }
        return {rowSpan, columnSpan};
    });
    grid->SetGridLayoutOptions(option);
    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid->GetComponent(), NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

napi_value TestRegisterGetRectByIndexCallback001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    grid->SetGridColumnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridRowsTemplate("1fr 1fr 1fr 1fr 1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_10);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);

    for (int i = 0; i < PARAM_6; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(SIZE_3);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        gridItem->SetFontSize(SIZE_10);
        ArkUI_NumberValue value_number[] = {{.i32 = GRID_ITEM_STYLE_PLAIN} };
        ArkUI_AttributeItem attribute_item = { value_number, sizeof(value_number) / sizeof(ArkUI_NumberValue)};
        gridItem->setAttribute(NODE_GRID_ITEM_STYLE, &attribute_item);
        
        auto itemStyle = gridItem->getAttribute(NODE_GRID_ITEM_STYLE)->value->i32;
        text->SetTextContent("A");
       
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    
    auto option = OH_ArkUI_GridLayoutOptions_Create();
    ASSERT_OBJ_NE(option, nullptr);
    std::string* str = new std::string("CreatGrid3");
    void* userDataWorld = static_cast<void*>(str);
    OH_ArkUI_GridLayoutOptions_RegisterGetRectByIndexCallback(option, userDataWorld,
        [](int32_t itemIndex, void *userData) -> ArkUI_GridItemRect {
        if (userData) {
            std::string* str = static_cast<std::string*>(userData);
        }

        uint32_t rowStart = PARAM_0;
        uint32_t columnStart = PARAM_0;
        uint32_t rowSpan = PARAM_1;
        uint32_t columnSpan = PARAM_1;
        if (itemIndex == PARAM_0) {
            rowStart = PARAM_0;
            columnStart = PARAM_0;
            rowSpan = PARAM_1;
            columnSpan = PARAM_1;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        } else if (itemIndex == PARAM_1) {
            rowStart = PARAM_0;
            columnStart = PARAM_1;
            rowSpan = PARAM_2;
            columnSpan = PARAM_3;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        } else if (itemIndex == PARAM_2) {
            rowStart = PARAM_0;
            columnStart = PARAM_3;
            rowSpan = PARAM_3;
            columnSpan = PARAM_3;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        } else if (itemIndex == PARAM_3) {
            rowStart = PARAM_3;
            columnStart = PARAM_0;
            rowSpan = PARAM_3;
            columnSpan = PARAM_3;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        } else if (itemIndex == PARAM_4) {
            rowStart = PARAM_4;
            columnStart = PARAM_3;
            rowSpan = PARAM_2;
            columnSpan = PARAM_2;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        } else {
            rowStart = PARAM_5;
            columnStart = PARAM_5;
            rowSpan = PARAM_1;
            columnSpan = PARAM_1;
            return ArkUI_GridItemRect{rowStart, columnStart, rowSpan, columnSpan};
        }
    });
    grid->SetGridLayoutOptions(option);
    OH_ArkUI_GridLayoutOptions_Dispose(option);

    ArkUI_AttributeItem item = { .object = option };
    auto ret = nodeAPI->setAttribute(grid->GetComponent(), NODE_GRID_LAYOUT_OPTIONS, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
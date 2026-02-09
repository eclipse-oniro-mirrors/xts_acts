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

#include "lazyforeach_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <thread>

#include "../component/column_component.h"
#include "../component/grid_component.h"
#include "../component/text_component.h"
#include "../component/button_component.h"
#include "../component/row_component.h"

namespace ArkUIAniTest {

std::shared_ptr<ItemAdapter<GridItemComponent>> GetNodeAdapter(std::shared_ptr<ColumnComponent> column)
{
    auto temp = dynamic_cast<GridComponent*>(column->GetChildren().front().get());
    return temp->GetAdapter();
}

void SetBackgroundColor(ArkUI_NodeHandle node, uint32_t color)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue backgroundColorValue[] = { { .u32 = color } };
    ArkUI_AttributeItem backgroundColorItem = { backgroundColorValue,
        sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &backgroundColorItem);
}

void SetWidthHeight(ArkUI_NodeHandle node, float width, float height)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue widthValue[] = { { .f32 = width } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(node, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue heightValue[] = { { .f32 = height } };
    ArkUI_AttributeItem heightItem = { heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(node, NODE_HEIGHT, &heightItem);
}

std::shared_ptr<ColumnComponent> CreateNewColumn()
{
    auto col = std::make_shared<ColumnComponent>();
    col->SetWidth(PARAM_100);
    col->SetHeight(PARAM_80);
    col->SetBackgroundColor(COLOR_YELLOW);
    return col;
}

std::shared_ptr<ButtonComponent> CreateButton()
{
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetId("btn");
    btn->SetWidth(PARAM_100);
    btn->SetHeight(PARAM_50);
    return btn;
}

ArkUI_NodeHandle CreateGridItem(int32_t index)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    SetBackgroundColor(gridItem, COLOR_YELLOW);
    SetWidthHeight(gridItem, PARAM_50, PARAM_50);
    ArkUI_NumberValue borderValue[] = { { .f32 = PARAM_5 } };
    ArkUI_AttributeItem borderItem = { borderValue, sizeof(borderValue) / sizeof(ArkUI_NumberValue) };
    ArkUI_NumberValue borderColorValue[] = { { .u32 = COLOR_GRAY } };
    ArkUI_AttributeItem borderColorItem = { borderColorValue,
        sizeof(borderColorValue) / sizeof(ArkUI_NumberValue) };
    std::string id = "gridItem" + std::to_string(index);
    ArkUI_AttributeItem item = { nullptr, PARAM_0, id.c_str() };
    nodeAPI->setAttribute(gridItem, NODE_ID, &item);
    nodeAPI->setAttribute(gridItem, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->setAttribute(gridItem, NODE_BORDER_COLOR, &borderColorItem);
    return gridItem;
}

void OnAdapterEventNodeId(ArkUI_NodeAdapterEvent* event)
{
    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (type == NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER) {
        int32_t index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER",
            "index is %{public}d", index);
        auto gridItem = CreateGridItem(index);
        OH_ArkUI_NodeAdapterEvent_SetItem(event, gridItem);
        if (OH_ArkUI_NodeAdapterEvent_SetNodeId(event, index) == ARKUI_ERROR_CODE_NO_ERROR) {
            SetBackgroundColor(gridItem, COLOR_GREEN);
        }
    }
}

void OnAdapterEventItemIndex(ArkUI_NodeAdapterEvent* event)
{
    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (type == NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER) {
        int32_t index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
        auto gridItem = CreateGridItem(index);
        OH_ArkUI_NodeAdapterEvent_SetItem(event, gridItem);
        if (index == PARAM_0) {
            SetBackgroundColor(gridItem, COLOR_GREEN);
        }
    }
}

void OnAdapterEventSetItem(ArkUI_NodeAdapterEvent* event)
{
    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (type == NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER) {
        int32_t index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER",
            "index is %{public}d", index);
        auto gridItem = CreateGridItem(index);
        if (OH_ArkUI_NodeAdapterEvent_SetItem(event, gridItem) == ARKUI_ERROR_CODE_NO_ERROR) {
            SetBackgroundColor(gridItem, COLOR_GREEN);
        }
    }
}

void OnAdapterEventGetType(ArkUI_NodeAdapterEvent* event)
{
    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (type == NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER) {
        int32_t index = OH_ArkUI_NodeAdapterEvent_GetItemIndex(event);
        auto gridItem = CreateGridItem(index);
        OH_ArkUI_NodeAdapterEvent_SetItem(event, gridItem);
        SetBackgroundColor(gridItem, COLOR_GREEN);
    }
}

ArkUI_NodeHandle CreateGridByNodeAPI(std::string id, void (*receiver)(ArkUI_NodeAdapterEvent* event))
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue marginValue[] = { { .f32 = PARAM_5 } };
    ArkUI_AttributeItem marginItem = { marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue) };
    ArkUI_NumberValue borderValue[] = { { .f32 = PARAM_5 } };
    ArkUI_AttributeItem borderItem = { borderValue, sizeof(borderValue) / sizeof(ArkUI_NumberValue) };
    ArkUI_AttributeItem columnsTemplateItem = { .string = "1fr 1fr 1fr 1fr 1fr" };
    ArkUI_AttributeItem rowTemplateItem = { .string = "1fr 1fr 1fr 1fr" };
    ArkUI_NumberValue columnsGapValue[] = { { .f32 = PARAM_10 } };
    ArkUI_AttributeItem columnsGapItem = { columnsGapValue, sizeof(columnsGapValue) / sizeof(ArkUI_NumberValue) };
    ArkUI_NumberValue rowsGapValue[] = { { .f32 = PARAM_5 } };
    ArkUI_AttributeItem rowsGapItem = { rowsGapValue, sizeof(rowsGapValue) / sizeof(ArkUI_NumberValue) };
    auto adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, receiver);
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, PARAM_14);
    ArkUI_AttributeItem adapterItem { .object = adapter };
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    SetBackgroundColor(grid, COLOR_RED);
    SetWidthHeight(grid, PARAM_450, PARAM_180);
    ArkUI_AttributeItem item = { nullptr, PARAM_0, id.c_str() };
    nodeAPI->setAttribute(grid, NODE_ID, &item);
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_TEMPLATE, &columnsTemplateItem);
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &rowTemplateItem);
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &columnsGapItem);
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_GAP, &rowsGapItem);
    nodeAPI->setAttribute(grid, NODE_GRID_NODE_ADAPTER, &adapterItem);
    nodeAPI->setAttribute(grid, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->setAttribute(grid, NODE_MARGIN, &marginItem);
    return grid;
}

void CustomGrid(std::shared_ptr<GridComponent> grid)
{
    grid->SetWidth(PARAM_105);
    grid->SetGridColumnsTemplate("1fr");
    grid->SetGridCachedCount(PARAM_60);
    grid->GetAdapter()->RegisterRemovedNodeCallback(
        [grid](std::shared_ptr<Component> node) { grid->SetBackgroundColor(COLOR_RED); });
};

// OH_ArkUI_NodeAdapterEvent_GetType
void LazyForEachTest::CreateNativeNodeGetType(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = CreateNewColumn();
    column->AddChild(std::make_shared<GridComponent>(CreateGridByNodeAPI("grid", &OnAdapterEventGetType)));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_SetItem
void LazyForEachTest::CreateNativeNodeSetItem(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = CreateNewColumn();
    column->AddChild(std::make_shared<GridComponent>(CreateGridByNodeAPI("grid", &OnAdapterEventSetItem)));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_SetNodeId
void LazyForEachTest::CreateNativeNodeNodeId(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = CreateNewColumn();
    column->AddChild(std::make_shared<GridComponent>(CreateGridByNodeAPI("grid", &OnAdapterEventNodeId)));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_GetItemIndex
void LazyForEachTest::CreateNativeNodeItemIndex(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = CreateNewColumn();
    column->AddChild(std::make_shared<GridComponent>(CreateGridByNodeAPI("grid", &OnAdapterEventItemIndex)));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_GetUserData
void LazyForEachTest::CreateNativeNodeGetUserData(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto change = [](std::shared_ptr<GridComponent> grid) {
        auto adapter = grid->GetAdapter();
        grid->SetBackgroundColor(COLOR_RED);
        adapter->SetNodeAdapterEvent([grid](ArkUI_NodeAdapterEvent* event) {
            OH_ArkUI_NodeAdapterEvent_GetUserData(event);
            grid->SetBackgroundColor(COLOR_GREEN);
        });
    };
    auto col1 = CreateGrid(change);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, col1->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapter_GetAllItems
void LazyForEachTest::CreateNativeNodeGetAllItems(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateGrid<6>([](std::shared_ptr<GridComponent>) {});
    col1->SetId("colGetAllItems");
    col1->SetBackgroundColor(COLOR_RED);
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row2->AddChild(btn1);
    column->AddChild(row2);
    column->AddChild(row1);
    btn1->RegisterOnClick([col1]() {
        auto adapter1 = GetNodeAdapter(col1)->GetAdapter();
        ArkUI_NodeHandle* items = nullptr;
        uint32_t size = 0;
        if (OH_ArkUI_NodeAdapter_GetAllItems(adapter1, &items, &size) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapter_ReloadAllItems
void LazyForEachTest::CreateNativeNodeReloadAllItems(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateGrid<6>([](std::shared_ptr<GridComponent>) {});
    col1->SetId("col");
    col1->SetBackgroundColor(COLOR_RED);
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row2->AddChild(btn1);
    column->AddChild(row2);
    column->AddChild(row1);
    btn1->RegisterOnClick([col1]() {
        auto adapter1 = GetNodeAdapter(col1)->GetAdapter();
        if (OH_ArkUI_NodeAdapter_ReloadAllItems(adapter1) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

//OH_ArkUI_NodeAdapter_ReloadItem
void LazyForEachTest::CreateNativeNodeReloadItem(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto customGrid = [](std::shared_ptr<GridComponent> grid) {
        grid->SetWidth(PARAM_105);
        grid->SetGridColumnsTemplate("1fr");
        grid->SetGridCachedCount(PARAM_3);
    };
    auto col1 = CreateGrid<PARAM_9>(customGrid);
    col1->SetId("col");
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row3 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row3->AddChild(btn1);
    column->AddChild(row3);
    column->AddChild(row1);
    std::vector<std::shared_ptr<ColumnComponent>> columns = { col1 };
    btn1->RegisterOnClick([col1]() {
        auto adapter = GetNodeAdapter(col1)->GetAdapter();
        if (OH_ArkUI_NodeAdapter_ReloadItem(adapter, PARAM_0, PARAM_1) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapter_InsertItem
void LazyForEachTest::CreateNativeNodeInsertItem(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto customGrid = [](std::shared_ptr<GridComponent> grid) {
        grid->SetWidth(PARAM_105);
        grid->SetGridColumnsTemplate("1fr");
        grid->SetGridCachedCount(PARAM_3);
    };
    auto col1 = CreateGrid<PARAM_9>(customGrid);
    col1->SetId("col");
    col1->SetBackgroundColor(COLOR_RED);
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row2->AddChild(btn1);
    column->AddChild(row1);
    column->AddChild(row2);
    btn1->RegisterOnClick([col1]() {
        auto adapter = GetNodeAdapter(col1)->GetAdapter();
        if (OH_ArkUI_NodeAdapter_InsertItem(adapter, PARAM_0, PARAM_1) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapter_MoveItem
void LazyForEachTest::CreateNativeNodeMoveItem(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto customGrid = [](std::shared_ptr<GridComponent> grid) {
        grid->SetWidth(PARAM_105);
        grid->SetGridColumnsTemplate("1fr");
        grid->SetGridCachedCount(PARAM_3);
    };
    auto col1 = CreateGrid<PARAM_9>(customGrid);
    col1->SetId("col");
    col1->SetBackgroundColor(COLOR_RED);
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row4 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row4->AddChild(btn1);
    column->AddChild(row1);
    column->AddChild(row4);
    btn1->RegisterOnClick([col1]() {
        auto adapter = GetNodeAdapter(col1)->GetAdapter();
        if (OH_ArkUI_NodeAdapter_MoveItem(adapter, PARAM_0, PARAM_1) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapter_RemoveItem
void LazyForEachTest::CreateNativeNodeRemoveItem(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto customGrid = [](std::shared_ptr<GridComponent> grid) {
        grid->SetWidth(PARAM_105);
        grid->SetGridColumnsTemplate("1fr");
        grid->SetGridCachedCount(PARAM_3);
    };
    auto col1 = CreateGrid<PARAM_9>(customGrid);
    col1->SetId("ColRemoveItem");
    col1->SetBackgroundColor(COLOR_RED);
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row2->AddChild(btn1);
    column->AddChild(row1);
    column->AddChild(row2);
    btn1->RegisterOnClick([col1]() {
        auto adapter = GetNodeAdapter(col1)->GetAdapter();
        if (OH_ArkUI_NodeAdapter_RemoveItem(adapter, PARAM_0, PARAM_1) == ARKUI_ERROR_CODE_NO_ERROR) {
            col1->SetBackgroundColor(COLOR_GREEN);
        }
    });
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_GetHostNode
void LazyForEachTest::CreateNativeNodeHostNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto change = [](std::shared_ptr<GridComponent> grid) {
        auto adapter = grid->GetAdapter();
        grid->SetBackgroundColor(COLOR_RED);
        adapter->SetNodeAdapterEvent([](ArkUI_NodeAdapterEvent* event) {
            auto node = OH_ArkUI_NodeAdapterEvent_GetHostNode(event);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LazyForEachTest", "GetHostNode");
            if (!node) {
                return;
            }
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LazyForEachTest", "SetBackgroundColor");
            SetBackgroundColor(node, COLOR_GREEN);
        });
    };
    auto col1 = CreateGrid(change);
    col1->GetChildren().front()->SetId("gridHostNode");

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, col1->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// OH_ArkUI_NodeAdapterEvent_GetRemovedNode
void LazyForEachTest::CreateNativeNodeGetRemovedNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto customGrid = [](std::shared_ptr<GridComponent> grid) {
        grid->SetWidth(PARAM_105);
        grid->SetGridColumnsTemplate("1fr");
        grid->SetGridCachedCount(PARAM_60);
        grid->GetAdapter()->RegisterRemovedNodeCallback([grid](std::shared_ptr<Component> node) {
                grid->SetBackgroundColor(COLOR_GREEN);
            }
        );
    };
    auto col1 = CreateGrid(customGrid);
    col1->GetChildren().front()->SetId("gridGetRemovedNode");
    auto btn1 = CreateButton();
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row2->AddChild(btn1);
    column->AddChild(row1);
    column->AddChild(row2);
    btn1->RegisterOnClick([col1]() {
        auto adapter = (dynamic_cast<GridComponent*>(col1->GetChildren().front().get()))->GetAdapter();
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeGetRemovedNode", "ReloadItem");
        adapter->ReloadItem(PARAM_1, CreateNewColumn());
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICApiDemo
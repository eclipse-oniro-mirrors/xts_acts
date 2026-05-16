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

#include "../common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <vector>
#include "grid/NodeXtsGridTest.h"
#include "grid/GridAttributeTest.h"

namespace ArkUICapiTest {
const char* MY_GRID_LOG = "nativeGridTest";
static auto tester = new NodeXTSGridTest();

void TestNodeGridColumnsTemplate001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem columnItem = {.string = "1fr"};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_TEMPLATE, &columnItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE001 %{public}s", result->string);
}

void TestNodeGridColumnsTemplate002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE002 %{public}s", result->string);
}

void TestNodeGridRowsTemplate001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem rowItem = {.string = "1fr"};
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &rowItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_TEMPLATE001 %{public}s", result->string);
}

void TestNodeGridRowsTemplate002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_TEMPLATE002 %{public}s", result->string);
}

void TestNodeGridColumnsGap001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue columnsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem columnsGapItem = {columnsGapValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &columnsGapItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_GAP001 %{public}f", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnsGap002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_GAP002 %{public}f", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridRowsGap001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue rowsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowsGapItem = {rowsGapValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_GAP, &rowsGapItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_GAP001 %{public}f", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridRowsGap002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_GAP002 %{public}f", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridCachedCount001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .i32 = 20 } };
    ArkUI_AttributeItem cachedCountItem = { .value = sizeArray, .size = 1};
    nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &cachedCountItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_CACHED_COUNT001 %{public}d", result->value->i32);
    if(result->value[0].i32 != 20) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridCachedCount002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_CACHED_COUNT002 %{public}d", result->value->i32);
    if(result->value[0].i32 != 20) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridFocusWrapMode001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue focusWrapModeValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem focusWrapModeItem = {focusWrapModeValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE, &focusWrapModeItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_FOCUS_WRAP_MODE001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridFocusWrapMode002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_FOCUS_WRAP_MODE002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridSyncLoad001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue syncLoadValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem syncLoadItem = {syncLoadValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_SYNC_LOAD, &syncLoadItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_SYNC_LOAD001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridSyncLoad002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_SYNC_LOAD002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridAlignItems001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue alignItemValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem alignItem = {alignItemValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_ALIGN_ITEMS, &alignItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ALIGN_ITEMS001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ALIGN_ITEMS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridAlignItems002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ALIGN_ITEMS002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ALIGN_ITEMS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnTemplateItemFillPolicy001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemFillPolicyValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemFillPolicyValueItem = {itemFillPolicyValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY, &itemFillPolicyValueItem);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnTemplateItemFillPolicy002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridItemStyle001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &gridItem, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemStyleValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemStyleItem = {itemStyleValue, 1};
    nodeAPI->setAttribute(gridItem, NODE_GRID_ITEM_STYLE, &itemStyleItem);
    auto result = nodeAPI->getAttribute(gridItem, NODE_GRID_ITEM_STYLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ITEM_STYLE001 %{public}d", result->value->i32);
}

void TestNodeGridItemStyle002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &gridItem, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(gridItem, NODE_GRID_ITEM_STYLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ITEM_STYLE002 %{public}d", result->value->i32);
}

void TestNodeGridEvent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_SCROLL_INDEX, NODE_GRID_ON_SCROLL_INDEX, nullptr);
}

void TestNodeGridEvent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_GRID_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "RegisterEvent NODE_GRID_ON_SCROLL_INDEX");
        }
    });
}

void TestNodeGridEvent101(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_SCROLL_INDEX, NODE_GRID_ON_SCROLL_INDEX, nullptr);
    nodeAPI->unregisterNodeEvent(grid, NODE_GRID_ON_SCROLL_INDEX);
}

void TestNodeGridEvent102(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_GRID_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "UnRegisterEvent NODE_GRID_ON_SCROLL_INDEX");
        }
    });
}

void TestNodeGridEvent003(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_WILL_SCROLL, NODE_GRID_ON_WILL_SCROLL, nullptr);
}

void TestNodeGridEvent004(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_GRID_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "RegisterEvent NODE_GRID_ON_WILL_SCROLL");
        }
    });
}

void TestNodeGridEvent103(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_WILL_SCROLL, NODE_GRID_ON_WILL_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(grid, NODE_GRID_ON_WILL_SCROLL);
}

void TestNodeGridEvent104(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_GRID_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "UnRegisterEvent NODE_GRID_ON_WILL_SCROLL");
        }
    });
}

void TestNodeGridEvent005(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_DID_SCROLL, NODE_GRID_ON_DID_SCROLL, nullptr);
}

void TestNodeGridEvent006(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_GRID_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "RegisterEvent NODE_GRID_ON_DID_SCROLL");
        }
    });
}

void TestNodeGridEvent105(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_DID_SCROLL, NODE_GRID_ON_DID_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(grid, NODE_GRID_ON_DID_SCROLL);
}

void TestNodeGridEvent106(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_GRID_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "UnRegisterEvent NODE_GRID_ON_DID_SCROLL");
        }
    });
}

void TestNodeGridEvent007(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_SCROLL_BAR_UPDATE, NODE_GRID_ON_SCROLL_BAR_UPDATE, nullptr);
}

void TestNodeGridEvent008(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_GRID_ON_SCROLL_BAR_UPDATE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "RegisterEvent NODE_GRID_ON_SCROLL_BAR_UPDATE");
        }
    });
}

void TestNodeGridEvent107(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->registerNodeEvent(grid, NODE_GRID_ON_SCROLL_BAR_UPDATE, NODE_GRID_ON_SCROLL_BAR_UPDATE, nullptr);
    nodeAPI->unregisterNodeEvent(grid, NODE_GRID_ON_SCROLL_BAR_UPDATE);
}

void TestNodeGridEvent108(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle grid)
{
    nodeAPI->addNodeEventReceiver(grid, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_GRID_ON_SCROLL_BAR_UPDATE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_GRID_LOG, "UnRegisterEvent NODE_GRID_ON_SCROLL_BAR_UPDATE");
        }
    });
}

void TestNodeInitGridAttribute003(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Grid capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonGridID"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    nodeList.push_back(grid);
    nodeList.push_back(button);
    nodeAPI->addChild(grid, gridItem);
    TestNodeGridColumnsGap001(nodeAPI, grid, button);
    TestNodeGridRowsGap001(nodeAPI, grid, button);
    TestNodeGridCachedCount001(nodeAPI, grid, button);
    TestNodeGridFocusWrapMode001(nodeAPI, grid, button);
    TestNodeGridSyncLoad001(nodeAPI, grid, button);
    TestNodeGridAlignItems001(nodeAPI, grid, button);
    TestNodeGridColumnTemplateItemFillPolicy001(nodeAPI, grid, button);
    TestNodeGridItemStyle001(nodeAPI, gridItem, button);
    TestNodeGridEvent001(nodeAPI, grid);
    TestNodeGridEvent003(nodeAPI, grid);
    TestNodeGridEvent005(nodeAPI, grid);
    TestNodeGridEvent007(nodeAPI, grid);
}

void TestNodeInitGridAttribute103(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto grid = nodeList[0];
    auto button = nodeList[1];
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    nodeAPI->addChild(grid, gridItem);
    if (grid) {
        // 主线程读属性
        TestNodeGridColumnsGap002(nodeAPI, grid, button);
        TestNodeGridRowsGap002(nodeAPI, grid, button);
        TestNodeGridCachedCount002(nodeAPI, grid, button);
        TestNodeGridFocusWrapMode002(nodeAPI, grid, button);
        TestNodeGridSyncLoad002(nodeAPI, grid, button);
        TestNodeGridAlignItems002(nodeAPI, grid, button);
        TestNodeGridColumnTemplateItemFillPolicy002(nodeAPI, grid, button);
        TestNodeGridItemStyle002(nodeAPI, gridItem, button);
        TestNodeGridEvent002(nodeAPI, grid);
        TestNodeGridEvent004(nodeAPI, grid);
        TestNodeGridEvent006(nodeAPI, grid);
        TestNodeGridEvent008(nodeAPI, grid);
    }
}

void TestNodeGridColumnsTemplate011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem columnItem = {.string = "1fr"};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_TEMPLATE, &columnItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_COLUMN_TEMPLATE);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE011 %{public}s", result->string);
}

void TestNodeGridColumnsTemplate012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE012 %{public}s", result->string);
}

void TestNodeGridRowsTemplate011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem rowItem = {.string = "1fr"};
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_TEMPLATE, &rowItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_TEMPLATE011 %{public}s", result->string);
}

void TestNodeGridRowsTemplate012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_TEMPLATE012 %{public}s", result->string);
}

void TestNodeGridColumnsGap011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue columnsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem columnsGapItem = {columnsGapValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_GAP, &columnsGapItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_COLUMN_GAP);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_GAP011 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnsGap012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_GAP012 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridRowsGap011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue rowsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowsGapItem = {rowsGapValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_ROW_GAP, &rowsGapItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_ROW_GAP);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_GAP011 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridRowsGap012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ROW_GAP012 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridCachedCount011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .i32 = 20 } };
    ArkUI_AttributeItem cachedCountItem = { .value = sizeArray, .size = 1};
    nodeAPI->setAttribute(grid, NODE_GRID_CACHED_COUNT, &cachedCountItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_CACHED_COUNT);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_CACHED_COUNT011 %{public}d", result->value->i32);
    if(result->value[0].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridCachedCount012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_CACHED_COUNT012 %{public}d", result->value->i32);
}

void TestNodeGridFocusWrapMode011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue focusWrapModeValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem focusWrapModeItem = {focusWrapModeValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE, &focusWrapModeItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_FOCUS_WRAP_MODE011 %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridFocusWrapMode012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_FOCUS_WRAP_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_FOCUS_WRAP_MODE012 %{public}d", result->value->i32);
}

void TestNodeGridSyncLoad011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue syncLoadValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem syncLoadItem = {syncLoadValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_SYNC_LOAD, &syncLoadItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_SYNC_LOAD);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_SYNC_LOAD011 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridSyncLoad012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_SYNC_LOAD012 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridAlignItems011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue alignItemValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem alignItem = {alignItemValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_ALIGN_ITEMS, &alignItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_ALIGN_ITEMS);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ALIGN_ITEMS011 %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ALIGN_ITEMS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridAlignItems012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_ALIGN_ITEMS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ALIGN_ITEMS012 %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_ALIGN_ITEMS is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnTemplateItemFillPolicy011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemFillPolicyValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemFillPolicyValueItem = {itemFillPolicyValue, 1};
    nodeAPI->setAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY, &itemFillPolicyValueItem);
    nodeAPI->resetAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY011 %{public}d", result->value->i32);
    if(result->value->i32 != -1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridColumnTemplateItemFillPolicy012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &grid, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(grid, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY012 %{public}d", result->value->i32);
    if(result->value->i32 != -1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeGridItemStyle011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &gridItem, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemStyleValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemStyleItem = {itemStyleValue, 1};
    nodeAPI->setAttribute(gridItem, NODE_GRID_ITEM_STYLE, &itemStyleItem);
    nodeAPI->resetAttribute(gridItem, NODE_GRID_ITEM_STYLE);
    auto result = nodeAPI->getAttribute(gridItem, NODE_GRID_ITEM_STYLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ITEM_STYLE011 %{public}d", result->value->i32);
}

void TestNodeGridItemStyle012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &gridItem, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(gridItem, NODE_GRID_ITEM_STYLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_GRID_ITEM_STYLE012 %{public}d", result->value->i32);
}

void TestNodeInitGridAttribute013(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "Grid3 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonGridID3"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto grid = nodeAPI->createNode(ARKUI_NODE_GRID);
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    nodeList.push_back(grid);
    nodeList.push_back(button);
    nodeAPI->addChild(grid, gridItem);
    TestNodeGridColumnsGap011(nodeAPI, grid, button);
    TestNodeGridRowsGap011(nodeAPI, grid, button);
    TestNodeGridCachedCount011(nodeAPI, grid, button);
    TestNodeGridFocusWrapMode011(nodeAPI, grid, button);
    TestNodeGridSyncLoad011(nodeAPI, grid, button);
    TestNodeGridAlignItems011(nodeAPI, grid, button);
    TestNodeGridColumnTemplateItemFillPolicy011(nodeAPI, grid, button);
    TestNodeGridItemStyle011(nodeAPI, gridItem, button);
    TestNodeGridEvent101(nodeAPI, grid);
    TestNodeGridEvent103(nodeAPI, grid);
    TestNodeGridEvent105(nodeAPI, grid);
    TestNodeGridEvent107(nodeAPI, grid);
}

void TestNodeInitGridAttribute113(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto grid = nodeList[2];
    auto button = nodeList[3];
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    nodeAPI->addChild(grid, gridItem);
    if (grid) {
        // 主线程读属性
        TestNodeGridColumnsGap012(nodeAPI, grid, button);
        TestNodeGridRowsGap012(nodeAPI, grid, button);
        TestNodeGridCachedCount012(nodeAPI, grid, button);
        TestNodeGridFocusWrapMode012(nodeAPI, grid, button);
        TestNodeGridSyncLoad012(nodeAPI, grid, button);
        TestNodeGridAlignItems012(nodeAPI, grid, button);
        TestNodeGridColumnTemplateItemFillPolicy012(nodeAPI, grid, button);
        TestNodeGridItemStyle012(nodeAPI, gridItem, button);
        TestNodeGridEvent102(nodeAPI, grid);
        TestNodeGridEvent104(nodeAPI, grid);
        TestNodeGridEvent106(nodeAPI, grid);
        TestNodeGridEvent108(nodeAPI, grid);
    }
}

void TestNodeInitGridAttribute114(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto grid = nodeList[6];
    auto button = nodeList[7];
    if (grid) {
        // 主线程读属性
        TestNodeGridColumnsTemplate012(nodeAPI, grid, button);
        TestNodeGridRowsTemplate012(nodeAPI, grid, button);
    }
}

void RunOnSubThreadGrid(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitGridAttribute003(nodeAPI, nodeList);
    TestNodeInitGridAttribute013(nodeAPI, nodeList);
}

void RunOnUIThreadGrid(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThreadGrid中保存到nodeList中的组件
    TestNodeInitGridAttribute103(nodeAPI, nodeList);
    TestNodeInitGridAttribute113(nodeAPI, nodeList);
}


napi_value GridAttributeTest::CreateNativeGridNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTreeGrid(env, info, RunOnUIThreadGrid, RunOnSubThreadGrid);
}

napi_value GridAttributeTest::DisposeNativeGridNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTreeGrid(env, info);
}
}
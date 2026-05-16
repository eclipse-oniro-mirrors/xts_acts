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

#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <vector>
#include "waterFlow/NodeXtsWaterFlowTest.h"
#include "waterFlow/WaterFlowAttributeTest.h"

namespace ArkUICapiTest {
const char* MY_WATERFLOW_LOG = "nativeWaterFlowTest";
static auto tester = new NodeXTSWaterFlowTest();

void TestNodeWaterFlowLayoutDirection001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem layoutDirectionItem = {layoutDirectionValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_DIRECTION001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowLayoutDirection002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_DIRECTION002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnsTemplate001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem columnItem = {.string = "1fr"};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE, &columnItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE001 %{public}s", result->string);
}

void TestNodeWaterFlowColumnsTemplate002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE002 %{public}s", result->string);
}

void TestNodeWaterFlowRowsTemplate001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem rowItem = {.string = "1fr"};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE, &rowItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_TEMPLATE001 %{public}s", result->string);
}


void TestNodeWaterFlowRowsTemplate002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_TEMPLATE002 %{public}s", result->string);
}

void TestNodeWaterFlowColumnsGap001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue columnsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem columnsGapItem = {columnsGapValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &columnsGapItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_GAP001 %{public}f ", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_GAP 001 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnsGap002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_GAP002 %{public}f ", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_GAP 002 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowRowsGap001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue rowsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowsGapItem = {rowsGapValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP, &rowsGapItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_GAP001 %{public}f ", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowRowsGap002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_GAP002 %{public}f ", result->value->f32);
    if(result->value->f32 != 10) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowCachedCount001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .i32 = 20 }, { .i32 = 1 } };
    ArkUI_AttributeItem cachedCountItem = { .value = sizeArray, .size = 2};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_CACHED_COUNT001 %{public}d %{public}d ", result->value[0].i32, result->value[1].i32);
    if(result->value[0].i32 != 20 || result->value[1].i32 != 1 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_CACHED_COUNT1 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowCachedCount002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_CACHED_COUNT002 %{public}d %{public}d ", result->value[0].i32, result->value[1].i32);
    if(result->value[0].i32 != 20 || result->value[1].i32 != 1 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_CACHED_COUNT2 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowItemConstraintSize001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .f32 = 20 }, { .f32 = 100 }, { .f32 = 20 }, { .f32 = 100 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { .value = sizeArray, .size = 4};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE001 %{public}f %{public}f %{public}f %{public}f", result->value[0].f32, result->value[1].f32, result->value[2].f32, result->value[3].f32);
    if(result->value[0].f32 != 20 || result->value[1].f32 != 100 || result->value[2].f32 != 20 || result->value[3].f32 != 100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowItemConstraintSize002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE002 %{public}f %{public}f %{public}f %{public}f", result->value[0].f32, result->value[1].f32, result->value[2].f32, result->value[3].f32);
    if(result->value[0].f32 != 20 || result->value[1].f32 != 100 || result->value[2].f32 != 20 || result->value[3].f32 != 100) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowLayoutMode001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue layoutModeValue[] = { { .i32 = 0 } };
    ArkUI_AttributeItem layoutModeItem = {layoutModeValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE, &layoutModeItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_MODE001 %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowLayoutMode002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_MODE002 %{public}d", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowSyncLoad001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue syncLoadValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem syncLoadItem = {syncLoadValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD, &syncLoadItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_SYNC_LOAD001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowSyncLoad002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_SYNC_LOAD002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnTemplateItemFillPolicy001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemFillPolicyValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemFillPolicyValueItem = {itemFillPolicyValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY, &itemFillPolicyValueItem);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY001 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnTemplateItemFillPolicy002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY002 %{public}d", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterflowEvent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_ON_WILL_SCROLL, NODE_ON_WILL_SCROLL, nullptr);
}

void TestNodeWaterflowEvent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "RegisterEvent NODE_ON_WILL_SCROLL");
        }
    });
}

void TestNodeWaterflowEvent101(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_ON_WILL_SCROLL, NODE_ON_WILL_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(waterflow, NODE_ON_WILL_SCROLL);
}

void TestNodeWaterflowEvent102(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "UnRegisterEvent NODE_ON_WILL_SCROLL");
        }
    });
}

void TestNodeWaterflowEvent003(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_WATER_FLOW_ON_DID_SCROLL, NODE_WATER_FLOW_ON_DID_SCROLL, nullptr);
}

void TestNodeWaterflowEvent004(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_WATER_FLOW_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "RegisterEvent NODE_WATER_FLOW_ON_DID_SCROLL");
        }
    });
}

void TestNodeWaterflowEvent103(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_WATER_FLOW_ON_DID_SCROLL, NODE_WATER_FLOW_ON_DID_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(waterflow, NODE_WATER_FLOW_ON_DID_SCROLL);
}

void TestNodeWaterflowEvent104(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "UnRegisterEvent NODE_WATER_FLOW_ON_DID_SCROLL");
        }
    });
}

void TestNodeWaterflowEvent005(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_WATER_FLOW_ON_SCROLL_INDEX, NODE_WATER_FLOW_ON_SCROLL_INDEX, nullptr);
}

void TestNodeWaterflowEvent006(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_WATER_FLOW_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "RegisterEvent NODE_WATER_FLOW_ON_DID_SCROLL");
        }
    });
}

void TestNodeWaterflowEvent105(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->registerNodeEvent(waterflow, NODE_WATER_FLOW_ON_SCROLL_INDEX, NODE_WATER_FLOW_ON_SCROLL_INDEX, nullptr);
    nodeAPI->unregisterNodeEvent(waterflow, NODE_WATER_FLOW_ON_SCROLL_INDEX);
}

void TestNodeWaterflowEvent106(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle waterflow)
{
    nodeAPI->addNodeEventReceiver(waterflow, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_WATER_FLOW_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_WATERFLOW_LOG, "UnRegisterEvent NODE_WATER_FLOW_ON_SCROLL_INDEX");
        }
    });
}

void TestNodeInitWaterFlowAttribute002(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "WaterFlow capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonWaterFlowID1"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    nodeList.push_back(waterFlow);
    nodeList.push_back(button);
    TestNodeWaterFlowLayoutDirection001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowColumnsTemplate001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowRowsTemplate001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowColumnsGap001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowRowsGap001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowCachedCount001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowItemConstraintSize001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowLayoutMode001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowSyncLoad001(nodeAPI, waterFlow, button);
    TestNodeWaterFlowColumnTemplateItemFillPolicy001(nodeAPI, waterFlow, button);
    TestNodeWaterflowEvent001(nodeAPI, waterFlow);
    TestNodeWaterflowEvent003(nodeAPI, waterFlow);
    TestNodeWaterflowEvent005(nodeAPI, waterFlow);
}

void TestNodeInitWaterFlowAttribute102(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto waterFlow = nodeList[0];
    auto button = nodeList[1];
    if (waterFlow) {
        // 主线程读属性
        TestNodeWaterFlowLayoutDirection002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnsTemplate002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowRowsTemplate002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnsGap002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowRowsGap002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowCachedCount002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowItemConstraintSize002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowLayoutMode002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowSyncLoad002(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnTemplateItemFillPolicy002(nodeAPI, waterFlow, button);
        TestNodeWaterflowEvent002(nodeAPI, waterFlow);
        TestNodeWaterflowEvent004(nodeAPI, waterFlow);
        TestNodeWaterflowEvent006(nodeAPI, waterFlow);
    }
}

void TestNodeWaterFlowLayoutDirection011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue layoutDirectionValue[] = { { .i32 = 0 } };
    ArkUI_AttributeItem layoutDirectionItem = {layoutDirectionValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION, &layoutDirectionItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_DIRECTION011 %{public}d ", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowLayoutDirection012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_DIRECTION);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_DIRECTION012 %{public}d ", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_DIRECTION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnsTemplate011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem columnItem = {.string = "1fr"};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE, &columnItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE011 %{public}s", result->string);
}

void TestNodeWaterFlowColumnsTemplate012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE012 %{public}s", result->string);
}

void TestNodeWaterFlowRowsTemplate011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_AttributeItem rowItem = {.string = "1fr"};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE, &rowItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_TEMPLATE011 %{public}s", result->string);
}


void TestNodeWaterFlowRowsTemplate012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_TEMPLATE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_TEMPLATE012 %{public}s", result->string);
}

void TestNodeWaterFlowColumnsGap011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue columnsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem columnsGapItem = {columnsGapValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP, &columnsGapItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_GAP011 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_GAP 011 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnsGap012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_GAP012 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_GAP 012 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowRowsGap011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue rowsGapValue[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowsGapItem = {rowsGapValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP, &rowsGapItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_GAP011 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowRowsGap012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ROW_GAP);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ROW_GAP012 %{public}f ", result->value->f32);
    if(result->value->f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_ROW_GAP is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowCachedCount011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .i32 = 20 }, { .i32 = 1 } };
    ArkUI_AttributeItem cachedCountItem = { .value = sizeArray, .size = 2};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT, &cachedCountItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_CACHED_COUNT011 %{public}d  %{public}d", result->value[0].i32, result->value[1].i32);
    if(result->value[0].i32 != 1 || result->value[1].i32 != 0 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_CACHED_COUNT3 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowCachedCount012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_CACHED_COUNT);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_CACHED_COUNT012 %{public}d  %{public}d", result->value[0].i32, result->value[1].i32);
    if(result->value[0].i32 != 1 || result->value[1].i32 != 0 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_CACHED_COUNT4 is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowItemConstraintSize011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue sizeArray[] = { { .f32 = 20 }, { .f32 = 100 }, { .f32 = 20 }, { .f32 = 100 } };
    ArkUI_AttributeItem itemConstraintSizeItem = { .value = sizeArray, .size = 4};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &itemConstraintSizeItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE011 %{public}f  %{public}f  %{public}f  %{public}f",
      result->value[0].f32, result->value[1].f32, result->value[2].f32, result->value[3].f32);
}

void TestNodeWaterFlowItemConstraintSize012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE012 %{public}f  %{public}f  %{public}f  %{public}f",
      result->value[0].f32, result->value[1].f32, result->value[2].f32, result->value[3].f32);
}

void TestNodeWaterFlowLayoutMode011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue layoutModeValue[] = { { .i32 = 0 } };
    ArkUI_AttributeItem layoutModeItem = {layoutModeValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE, &layoutModeItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_MODE011 %{public}d ", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowLayoutMode012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_LAYOUT_MODE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_LAYOUT_MODE012 %{public}d ", result->value->i32);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_LAYOUT_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowSyncLoad011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue syncLoadValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem syncLoadItem = {syncLoadValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD, &syncLoadItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_SYNC_LOAD011 %{public}d ", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowSyncLoad012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SYNC_LOAD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_SYNC_LOAD012 %{public}d ", result->value->i32);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnTemplateItemFillPolicy011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue itemFillPolicyValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem itemFillPolicyValueItem = {itemFillPolicyValue, 1};
    nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY, &itemFillPolicyValueItem);
    nodeAPI->resetAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY011 %{public}d", result->value->i32);
    if(result->value->i32 != -1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeWaterFlowColumnTemplateItemFillPolicy012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &waterFlow, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gyt", "NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY012 %{public}d", result->value->i32);
    if(result->value->i32 != -1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_WATER_FLOW_COLUMN_TEMPLATE_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeInitWaterFlowAttribute012(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "WaterFlow2 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonWaterFlowID2"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto waterFlow = nodeAPI->createNode(ARKUI_NODE_WATER_FLOW);
    nodeList.push_back(waterFlow);
    nodeList.push_back(button);
    TestNodeWaterFlowLayoutDirection011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowColumnsTemplate011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowRowsTemplate011(nodeAPI, waterFlow,button);
    TestNodeWaterFlowColumnsGap011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowRowsGap011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowCachedCount011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowItemConstraintSize011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowLayoutMode011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowSyncLoad011(nodeAPI, waterFlow, button);
    TestNodeWaterFlowColumnTemplateItemFillPolicy011(nodeAPI, waterFlow, button);
    TestNodeWaterflowEvent101(nodeAPI, waterFlow);
    TestNodeWaterflowEvent103(nodeAPI, waterFlow);
    TestNodeWaterflowEvent105(nodeAPI, waterFlow);
}

void TestNodeInitWaterFlowAttribute112(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto waterFlow = nodeList[2];
    auto button = nodeList[3];
    if (waterFlow) {
        // 主线程读属性
        TestNodeWaterFlowLayoutDirection012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnsTemplate012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowRowsTemplate012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnsGap012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowRowsGap012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowCachedCount012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowItemConstraintSize012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowLayoutMode012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowSyncLoad012(nodeAPI, waterFlow, button);
        TestNodeWaterFlowColumnTemplateItemFillPolicy012(nodeAPI, waterFlow, button);
        TestNodeWaterflowEvent102(nodeAPI, waterFlow);
        TestNodeWaterflowEvent104(nodeAPI, waterFlow);
        TestNodeWaterflowEvent106(nodeAPI, waterFlow);
    }
}

void RunOnSubThreadWaterFlow(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitWaterFlowAttribute002(nodeAPI, nodeList);
    TestNodeInitWaterFlowAttribute012(nodeAPI, nodeList);
}

void RunOnUIThreadWaterFlow(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThreadWaterFlow中保存到nodeList中的组件
    TestNodeInitWaterFlowAttribute102(nodeAPI, nodeList);
    TestNodeInitWaterFlowAttribute112(nodeAPI, nodeList);
}

napi_value WaterFlowAttributeTest::CreateNativeWaterFlowNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTreeWaterFlow(env, info, RunOnUIThreadWaterFlow, RunOnSubThreadWaterFlow);
}

napi_value WaterFlowAttributeTest::DisposeNativeWaterFlowNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTreeWaterFlow(env, info);
}
}
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

#include "grid_component.h"
#include <cstdint>
#include "common/commonDragEvent.h"
namespace ArkUICapiTest {

void GridComponent::SetGridColumnsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_TEMPLATE, &item);
}
void GridComponent::SetGridRowsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_TEMPLATE, &item);
}
void GridComponent::SetGridColumnsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_GAP, &item);
}
void GridComponent::SetGridRowsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_GAP, &item);
}

void GridComponent::SetGridLayoutOptions(ArkUI_GridLayoutOptions* option)
{
    ArkUI_AttributeItem item = { .object = option };
    auto size =  item.size;
    _nodeAPI->setAttribute(_component, NODE_GRID_LAYOUT_OPTIONS, &item);
}

void GridComponent::ResetGridLayoutOptions()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_LAYOUT_OPTIONS);
}

ArkUI_GridLayoutOptions* GridComponent::GetGridLayoutOptions()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest", "GetGridLayoutOptions begin");
    auto item = _nodeAPI->getAttribute(_component, NODE_GRID_LAYOUT_OPTIONS);
    if (item == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest", "GetGridLayoutOptions -1");
        return nullptr;
    }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest", "GetGridLayoutOptions end");
    return reinterpret_cast<ArkUI_GridLayoutOptions*>(item->object);
}

void GridComponent::OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventMap_.find(eventType) != eventMap_.end()) {
        eventMap_[eventType](event);
    }
}

int32_t GridComponent::SetGridEditMode(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    return _nodeAPI->setAttribute(_component, NODE_GRID_EDIT_MODE, &item);
}

int32_t GridComponent::GetGridEditMode()
{
    int32_t value = -1;
    auto getValue =  _nodeAPI->getAttribute(_component, NODE_GRID_EDIT_MODE);
    if (getValue) {
        value = getValue->value->i32;
    }
    return value;
}

void GridComponent::ResetGridEditMode()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_EDIT_MODE);
}

int32_t GridComponent::SetGridMultiSelectable(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    return _nodeAPI->setAttribute(_component, NODE_GRID_MULTI_SELECTABLE, &item);
}

int32_t GridComponent::GetGridMultiSelectable()
{
    int32_t value = -1;
    auto getValue =  _nodeAPI->getAttribute(_component, NODE_GRID_MULTI_SELECTABLE);
    if (getValue) {
        value = getValue->value->i32;
    }
    return value;
}

void GridComponent::ResetGridMultiSelectable()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_MULTI_SELECTABLE);
}

int32_t GridComponent::SetGridDragAnimation(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    return _nodeAPI->setAttribute(_component, NODE_GRID_DRAG_ANIMATION, &item);
}

int32_t GridComponent::GetGridDragAnimation()
{
    int32_t value = -1;
    auto getValue =  _nodeAPI->getAttribute(_component, NODE_GRID_DRAG_ANIMATION);
    if (getValue) {
        value = getValue->value->i32;
    }
    return value;
}

void GridComponent::ResetGridDragAnimation()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_DRAG_ANIMATION);
}

int32_t GridItemComponent::SetGridItemSelectable(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    return _nodeAPI->setAttribute(_component, NODE_GRID_ITEM_SELECTABLE, &item);
}

int32_t GridItemComponent::GetGridItemSelectable()
{
    int32_t value = -1;
    auto getValue =  _nodeAPI->getAttribute(_component, NODE_GRID_ITEM_SELECTABLE);
    if (getValue) {
        value = getValue->value->i32;
    }
    return value;
}

void GridItemComponent::ResetGridItemSelectable()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_ITEM_SELECTABLE);
}

int32_t GridItemComponent::SetGridItemSelected(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    return _nodeAPI->setAttribute(_component, NODE_GRID_ITEM_SELECTED, &item);
}

int32_t GridItemComponent::GetGridItemSelected()
{
    int32_t value = -1;
    auto getValue =  _nodeAPI->getAttribute(_component, NODE_GRID_ITEM_SELECTED);
    if (getValue) {
        value = getValue->value->i32;
    }
    return value;
}

void GridItemComponent::ResetGridItemSelected()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_ITEM_SELECTED);
}

void GridItemComponent::SetGridItemOnSelect(OnItemSelect onItemSelect)
{
    auto callback = [onItemSelect](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onItemSelect) {
            bool selected = result->data[0].i32;
            onItemSelect(selected);
        }
    };
    eventMap_[NODE_GRID_ITEM_ON_SELECT] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ITEM_ON_SELECT, 0, nullptr);
}


void GridComponent::SetOnItemDragStart(OnItemDragStart onItemDragStart)
{
    auto callback = [onItemDragStart, this](ArkUI_NodeEvent* event) {
        ArkUI_NumberValue drag_value[] = {{.i32 = dragStartValue_ }};
        auto ret = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, drag_value, 1);
        if (onItemDragStart) {
            ArkUI_NumberValue value[PARAM_3];
            OH_ArkUI_NodeEvent_GetNumberValue(event, 0, value);
            OH_ArkUI_NodeEvent_GetNumberValue(event, 1, value);
            OH_ArkUI_NodeEvent_GetNumberValue(event, 2, value);
            auto x = value[PARAM_0].f32;
            auto y = value[PARAM_1].f32;
            auto index = value[PARAM_2].i32;
            onItemDragStart(x, y, index);
        }
    };
    eventMap_[NODE_GRID_ON_ITEM_DRAG_START] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_ITEM_DRAG_START, 0, nullptr);
}

void GridComponent::SetOnItemDragEnter(OnItemDragEnter onItemDragEnter)
{
    auto callback = [onItemDragEnter](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onItemDragEnter) {
            float x = result->data[0].f32;
            float y = result->data[1].f32;
            onItemDragEnter(x, y);
        }
    };
    eventMap_[NODE_GRID_ON_ITEM_DRAG_ENTER] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_ITEM_DRAG_ENTER, 0, nullptr);
}

void GridComponent::SetOnItemDragMove(OnItemDragMove onItemDragMove)
{
    auto callback = [onItemDragMove](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onItemDragMove) {
            float x = result->data[0].f32;
            float y = result->data[1].f32;
            int32_t itemIndex = result->data[2].i32;
            int32_t insertIndex = result->data[3].i32;
            onItemDragMove(x, y, itemIndex, insertIndex);
        }
    };
    eventMap_[NODE_GRID_ON_ITEM_DRAG_MOVE] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_ITEM_DRAG_MOVE, 0, nullptr);
}

void GridComponent::SetOnItemDragLeave(OnItemDragLeave onItemDragLeave)
{
    auto callback = [onItemDragLeave](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onItemDragLeave) {
            float x = result->data[0].f32;
            float y = result->data[1].f32;
            int32_t itemIndex = result->data[2].i32;
            onItemDragLeave(x, y, itemIndex);
        }
    };
    eventMap_[NODE_GRID_ON_ITEM_DRAG_LEAVE] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_ITEM_DRAG_LEAVE, 0, nullptr);
}

void GridComponent::SetOnItemDrop(OnItemDrop onItemDrop)
{
    auto callback = [onItemDrop](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onItemDrop) {
            float x = result->data[0].f32;
            float y = result->data[1].f32;
            int32_t itemIndex = result->data[2].i32;
            int32_t insertIndex = result->data[3].i32;
            bool isSuccess = result->data[4].i32;
            onItemDrop(x, y, itemIndex, insertIndex, isSuccess);
        }
    };
    eventMap_[NODE_GRID_ON_ITEM_DROP] = callback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_ITEM_DROP, 0, nullptr);
}

void GridComponent::SetDragStartReturnValue(int32_t value)
{
    dragStartValue_ = value;
}

int32_t GridComponent::GetDragStartReturnValue()
{
    return dragStartValue_;
}
} // namespace ArkUICapiTest
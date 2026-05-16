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
#include <vector>
#include <hilog/log.h>
#include "list/NodeXtsListTest.h"
#include "list/ListAttributeTest.h"

namespace ArkUICapiTest {
const char* MY_LIST_LOG = "nativeListTest";
static auto tester = new NodeXTSListTest();

void TestNodeListDirection001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListDirectionValue[] = { { .i32 = ARKUI_AXIS_VERTICAL } };
    ArkUI_AttributeItem ListDirectionItem = {ListDirectionValue, 1};
    nodeAPI->setAttribute(list, NODE_LIST_DIRECTION, &ListDirectionItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_DIRECTION);
    if(result->value->i32!= ARKUI_AXIS_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set  NODE_LIST_DIRECTION is error"};
        nodeAPI->setAttribute(button,  NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListDirection002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_DIRECTION);
    if(result->value->i32 != ARKUI_AXIS_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set  NODE_LIST_DIRECTION  is error"};
        nodeAPI->setAttribute(button,  NODE_BUTTON_LABEL , &buttonLabel);
    }
}

void TestNodeListSticky001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListStickyValue[] = { {.i32 = ARKUI_STICKY_STYLE_HEADER} };
    ArkUI_AttributeItem ListStickyItem = { ListStickyValue, sizeof(ListStickyValue) / sizeof(ArkUI_NumberValue),  };
    nodeAPI->setAttribute(list, NODE_LIST_STICKY, &ListStickyItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STICKY);
    if(result->value->i32 != ArkUI_StickyStyle::ARKUI_STICKY_STYLE_HEADER) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STICKY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSticky002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STICKY);
    if(result->value->i32 != ArkUI_StickyStyle::ARKUI_STICKY_STYLE_HEADER) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STICKY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListCachedCount001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListCachedCountValue[] = { { .i32 = 1 }, { .i32 = 1 }  };
    ArkUI_AttributeItem ListCachedCountItem = { ListCachedCountValue, sizeof(ListCachedCountValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_CACHED_COUNT, &ListCachedCountItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_CACHED_COUNT);
    if(result->value[0].i32 != 1 || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListCachedCount002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_CACHED_COUNT);
    if(result->value[0].i32 != 1 || result->value[1].i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListAlignListItem001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListAlignListItemValue[] = {  { .i32 = ARKUI_LIST_ITEM_ALIGNMENT_CENTER } };
    ArkUI_AttributeItem ListAlignListItemItem = { ListAlignListItemValue, sizeof(ListAlignListItemValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_ALIGN_LIST_ITEM, &ListAlignListItemItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    if(result->value[0].i32 != ARKUI_LIST_ITEM_ALIGNMENT_CENTER ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ALIGN_LIST_ITEM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListAlignListItem002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    if(result->value[0].i32 != ARKUI_LIST_ITEM_ALIGNMENT_CENTER ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ALIGN_LIST_ITEM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAlign001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListScrollSnapAlignValue[] = { { .i32 = ARKUI_SCROLL_SNAP_ALIGN_CENTER }};
    ArkUI_AttributeItem ListScrollSnapAlignItem = { ListScrollSnapAlignValue, sizeof(ListScrollSnapAlignValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN, &ListScrollSnapAlignItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    if(result->value->i32 != ArkUI_ScrollSnapAlign::ARKUI_SCROLL_SNAP_ALIGN_CENTER) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ALIGN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAlign002(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    if(result->value->i32 != ArkUI_ScrollSnapAlign::ARKUI_SCROLL_SNAP_ALIGN_CENTER) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ALIGN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListMaintainVisibleContentPosition001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListMaintainVisibleContentPositionValue[] = { { .i32 = true }};
    ArkUI_AttributeItem ListMaintainVisibleContentPositionItem = { ListMaintainVisibleContentPositionValue, sizeof(ListMaintainVisibleContentPositionValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION, &ListMaintainVisibleContentPositionItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    if(result->value->i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListMaintainVisibleContentPosition002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    if(result->value->i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListStackFromEnd001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListStackFromEndValue[] = { { .i32 = true }};
    ArkUI_AttributeItem ListStackFromEndItem = { ListStackFromEndValue, sizeof(ListStackFromEndValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_STACK_FROM_END, &ListStackFromEndItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STACK_FROM_END);
    if(result->value->i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STACK_FROM_END is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListStackFromEnd002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STACK_FROM_END);
    if(result->value->i32 != true) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STACK_FROM_END is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListFocusWrapMode001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListFocusWrapModeValue[] = { { .i32 = ARKUI_FOCUS_WRAP_MODE_DEFAULT }};
    ArkUI_AttributeItem ListFocusWrapModeItem = { ListFocusWrapModeValue, sizeof(ListFocusWrapModeValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_FOCUS_WRAP_MODE, &ListFocusWrapModeItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_FOCUS_WRAP_MODE);
    if(result->value->i32 != ArkUI_FocusWrapMode::ARKUI_FOCUS_WRAP_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListFocusWrapMode002(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_FOCUS_WRAP_MODE);
    if(result->value->i32 != ArkUI_FocusWrapMode::ARKUI_FOCUS_WRAP_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSyncLoad001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListSyncLoadValue[] = { { .i32 = 0 }};
    ArkUI_AttributeItem ListSyncLoadItem = { ListSyncLoadValue, sizeof(ListSyncLoadValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SYNC_LOAD, &ListSyncLoadItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SYNC_LOAD);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSyncLoad002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SYNC_LOAD);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAnimationSpeed001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListScrollSnapAnimationSpeedValue[] = { { .i32 = ARKUI_SCROLL_SNAP_ANIMATION_NORMAL }};
    ArkUI_AttributeItem ListScrollSnapAnimationSpeedItem = { ListScrollSnapAnimationSpeedValue, sizeof(ListScrollSnapAnimationSpeedValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED, &ListScrollSnapAnimationSpeedItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED);
    if(result->value->i32 != ArkUI_ScrollSnapAnimationSpeed::ARKUI_SCROLL_SNAP_ANIMATION_NORMAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAnimationSpeed002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED);
    if(result->value->i32 != ArkUI_ScrollSnapAnimationSpeed::ARKUI_SCROLL_SNAP_ANIMATION_NORMAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListLanesItemFillPolicy001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListLanesItemFillPolicyValue[] = { { .i32 =0 }, {.f32 = 0.0 }};
    ArkUI_AttributeItem ListLanesItemFillPolicyItem = { ListLanesItemFillPolicyValue, sizeof(ListLanesItemFillPolicyValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &ListLanesItemFillPolicyItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY);
    if(result->value[0].i32 != 0 || result->value[1].f32 != 0.0 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_LANES_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListLanesItemFillPolicy002(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY);
    if(result->value[0].i32 != 0 ||result->value[1].f32 != 0.0 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set1 NODE_LIST_LANES_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListItemGroupSetDivider001(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListItemGroupSetDividerValue[] = { { .u32 = 0x08000000 }, {.f32 = 5}, {.f32 = 0} , {.f32 = 0}};
    ArkUI_AttributeItem ListItemGroupSetDividerItem = { ListItemGroupSetDividerValue, sizeof(ListItemGroupSetDividerValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_ITEM_GROUP_SET_DIVIDER, &ListItemGroupSetDividerItem);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ITEM_GROUP_SET_DIVIDER);
    if(result->value[0].u32 != 0x08000000 ||result->value[1].f32 != 5 ||result->value[2].f32 != 0 ||result->value[3].f32 != 0  ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ITEM_GROUP_SET_DIVIDER is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListItemGroupSetDivider002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ITEM_GROUP_SET_DIVIDER);
    if(result->value[0].u32 != 0x08000000 ||result->value[1].f32 != 5 ||result->value[2].f32 != 0 ||result->value[3].f32 != 0  ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ITEM_GROUP_SET_DIVIDER is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListDirection011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListDirectionValue[] = { { .i32 = ARKUI_AXIS_VERTICAL } };
    ArkUI_AttributeItem ListDirectionItem = {ListDirectionValue, 1};
    nodeAPI->setAttribute(list, NODE_LIST_DIRECTION, &ListDirectionItem);
    nodeAPI->resetAttribute(list, NODE_LIST_DIRECTION);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_DIRECTION);
    if(result->value->i32!= ARKUI_AXIS_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set  NODE_LIST_DIRECTION is error"};
        nodeAPI->setAttribute(button,  NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListDirection012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_DIRECTION);
    if(result->value->i32 != ARKUI_AXIS_VERTICAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set  NODE_LIST_DIRECTION  is error"};
        nodeAPI->setAttribute(button,  NODE_BUTTON_LABEL , &buttonLabel);
    }
}

void TestNodeListSticky011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListStickyValue[] = { {.i32 = ARKUI_STICKY_STYLE_HEADER} };
    ArkUI_AttributeItem ListStickyItem = { ListStickyValue, sizeof(ListStickyValue) / sizeof(ArkUI_NumberValue),  };
    nodeAPI->setAttribute(list, NODE_LIST_STICKY, &ListStickyItem);
    nodeAPI->resetAttribute(list, NODE_LIST_STICKY);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STICKY);
    if(result->value->i32 != ArkUI_StickyStyle::ARKUI_STICKY_STYLE_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STICKY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSticky012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STICKY);
    if(result->value->i32 != ArkUI_StickyStyle::ARKUI_STICKY_STYLE_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STICKY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListCachedCount011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListCachedCountValue[] = { { .i32 = 1 }, { .i32 = 1 }  };
    ArkUI_AttributeItem ListCachedCountItem = { ListCachedCountValue, sizeof(ListCachedCountValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_CACHED_COUNT, &ListCachedCountItem);
    nodeAPI->resetAttribute(list, NODE_LIST_CACHED_COUNT);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_CACHED_COUNT);
    if(result->value[1].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListCachedCount012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_CACHED_COUNT);
    if(result->value[1].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_CACHED_COUNT is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListAlignListItem011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListAlignListItemValue[] = {  { .i32 = ARKUI_LIST_ITEM_ALIGNMENT_CENTER } };
    ArkUI_AttributeItem ListAlignListItemItem = { ListAlignListItemValue, sizeof(ListAlignListItemValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_ALIGN_LIST_ITEM, &ListAlignListItemItem);
    nodeAPI->resetAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    if(result->value[0].i32 != ARKUI_LIST_ITEM_ALIGNMENT_START ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ALIGN_LIST_ITEM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListAlignListItem012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    if(result->value[0].i32 != ARKUI_LIST_ITEM_ALIGNMENT_START ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_ALIGN_LIST_ITEM is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}



void TestNodeListInitialIndex011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListInitialIndexValue[] = { { .i32 = 8 }};
    ArkUI_AttributeItem ListInitialIndexItem = { ListInitialIndexValue, sizeof(ListInitialIndexValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_INITIAL_INDEX, &ListInitialIndexItem);
    nodeAPI->resetAttribute(list, NODE_LIST_INITIAL_INDEX);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_INITIAL_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListInitialIndex012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX);
    if(result->value[0].i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_INITIAL_INDEX is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListLanes011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListLanesValue[] = { { .u32 = 3 }, {.f32 = 20.0}, {.f32 = 30.0},{.f32 = 20.0} };
    ArkUI_AttributeItem ListLanesItem = { ListLanesValue, sizeof(ListLanesValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_LANES, &ListLanesItem);
    nodeAPI->resetAttribute(list, NODE_LIST_LANES);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_LANES);
    if(result->value[0].u32 != 1  || result->value[3].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_LANES is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListLanes012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list,  NODE_LIST_LANES);
    if(result->value[0].u32 != 1  || result->value[3].f32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_LANES is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAlign011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListScrollSnapAlignValue[] = { { .i32 = ARKUI_SCROLL_SNAP_ALIGN_CENTER }};
    ArkUI_AttributeItem ListScrollSnapAlignItem = { ListScrollSnapAlignValue, sizeof(ListScrollSnapAlignValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN, &ListScrollSnapAlignItem);
    nodeAPI->resetAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    if(result->value->i32 != ArkUI_ScrollSnapAlign::ARKUI_SCROLL_SNAP_ALIGN_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ALIGN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAlign012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ALIGN);
    if(result->value->i32 != ArkUI_ScrollSnapAlign::ARKUI_SCROLL_SNAP_ALIGN_NONE) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ALIGN is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListMaintainVisibleContentPosition011(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListMaintainVisibleContentPositionValue[] = { { .i32 = 1}};
    ArkUI_AttributeItem ListMaintainVisibleContentPositionItem = { ListMaintainVisibleContentPositionValue, sizeof(ListMaintainVisibleContentPositionValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION, &ListMaintainVisibleContentPositionItem);
    nodeAPI->resetAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListMaintainVisibleContentPosition012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_MAINTAIN_VISIBLE_CONTENT_POSITION is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListStackFromEnd011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListStackFromEndValue[] = { { .i32 = 1 }};
    ArkUI_AttributeItem ListStackFromEndItem = { ListStackFromEndValue, sizeof(ListStackFromEndValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_STACK_FROM_END, &ListStackFromEndItem);
    nodeAPI->resetAttribute(list,  NODE_LIST_STACK_FROM_END);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STACK_FROM_END);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STACK_FROM_END is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListStackFromEnd012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_STACK_FROM_END);
    if(result->value->i32 != 0) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_STACK_FROM_END is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListFocusWrapMode011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListFocusWrapModeValue[] = { { .i32 = ARKUI_FOCUS_WRAP_MODE_DEFAULT }};
    ArkUI_AttributeItem ListFocusWrapModeItem = { ListFocusWrapModeValue, sizeof(ListFocusWrapModeValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_FOCUS_WRAP_MODE, &ListFocusWrapModeItem);
    nodeAPI->resetAttribute(list, NODE_LIST_FOCUS_WRAP_MODE);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_FOCUS_WRAP_MODE);
    if(result->value->i32 != ArkUI_FocusWrapMode::ARKUI_FOCUS_WRAP_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListFocusWrapMode012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_FOCUS_WRAP_MODE);
    if(result->value->i32 != ArkUI_FocusWrapMode::ARKUI_FOCUS_WRAP_MODE_DEFAULT) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_FOCUS_WRAP_MODE is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSyncLoad011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListSyncLoadValue[] = { { .i32 = 0 }};
    ArkUI_AttributeItem ListSyncLoadItem = { ListSyncLoadValue, sizeof(ListSyncLoadValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SYNC_LOAD, &ListSyncLoadItem);
    nodeAPI->resetAttribute(list, NODE_LIST_SYNC_LOAD);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SYNC_LOAD);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListSyncLoad012(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SYNC_LOAD);
    if(result->value->i32 != 1) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SYNC_LOAD is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAnimationSpeed011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListScrollSnapAnimationSpeedValue[] = { { .i32 = ARKUI_SCROLL_SNAP_ANIMATION_NORMAL }};
    ArkUI_AttributeItem ListScrollSnapAnimationSpeedItem = { ListScrollSnapAnimationSpeedValue, sizeof(ListScrollSnapAnimationSpeedValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED, &ListScrollSnapAnimationSpeedItem);
    nodeAPI->resetAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED);
    if(result->value->i32 != ArkUI_ScrollSnapAnimationSpeed::ARKUI_SCROLL_SNAP_ANIMATION_NORMAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListScrollSnapAnimationSpeed012(ArkUI_NativeNodeAPI_1 *nodeAPI,ArkUI_NodeHandle &list,  ArkUI_NodeHandle &button)
{
    auto result = nodeAPI->getAttribute(list, NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED);
    if(result->value->i32 != ArkUI_ScrollSnapAnimationSpeed::ARKUI_SCROLL_SNAP_ANIMATION_NORMAL) {
        ArkUI_AttributeItem buttonLabel = {.string = "set NODE_LIST_SCROLL_SNAP_ANIMATION_SPEED is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}

void TestNodeListLanesItemFillPolicy011(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list, ArkUI_NodeHandle &button)
{
    ArkUI_NumberValue ListLanesItemFillPolicyValue[] = { { .i32 = ARKUI_ITEMFILLPOLICY_NONE }, {.f32 = 1 }};
    ArkUI_AttributeItem ListLanesItemFillPolicyItem = { ListLanesItemFillPolicyValue, sizeof(ListLanesItemFillPolicyValue) / sizeof(ArkUI_NumberValue), };
    nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &ListLanesItemFillPolicyItem);
    nodeAPI->resetAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY);
    auto result = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY);
    if(result->value[1].f32 != 0 ) {
        ArkUI_AttributeItem buttonLabel = {.string = "set1 NODE_LIST_LANES_ITEMFILLPOLICY is error"};
        nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    }
}
//list事件
void TestNodeListEvent001(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_SCROLL_INDEX, NODE_LIST_ON_SCROLL_INDEX, nullptr);
}

void TestNodeListEvent002(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_LIST_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "RegisterEvent NODE_LIST_ON_SCROLL_INDEX");
        }
    });
}

void TestNodeListEvent101(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_SCROLL_INDEX, NODE_LIST_ON_SCROLL_INDEX, nullptr);
    nodeAPI->unregisterNodeEvent(list, NODE_LIST_ON_SCROLL_INDEX);
}

void TestNodeListEvent102(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_LIST_ON_SCROLL_INDEX) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "UnRegisterEvent NODE_LIST_ON_SCROLL_INDEX");
        }
    });
}

void TestNodeListEvent003(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_WILL_SCROLL, NODE_LIST_ON_WILL_SCROLL, nullptr);
}

void TestNodeListEvent004(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_LIST_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "RegisterEvent NODE_LIST_ON_WILL_SCROLL");
        }
    });
}


void TestNodeListEvent103(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_WILL_SCROLL, NODE_LIST_ON_WILL_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(list, NODE_LIST_ON_WILL_SCROLL);
}

void TestNodeListEvent104(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_LIST_ON_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "UnRegisterEvent NODE_LIST_ON_WILL_SCROLL");
        }
    });
}

void TestNodeListEvent005(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_DID_SCROLL, NODE_LIST_ON_DID_SCROLL, nullptr);
}

void TestNodeListEvent006(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_LIST_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "RegisterEvent NODE_LIST_ON_DID_SCROLL");
        }
    });
}

void TestNodeListEvent105(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_DID_SCROLL, NODE_LIST_ON_DID_SCROLL, nullptr);
    nodeAPI->unregisterNodeEvent(list, NODE_LIST_ON_DID_SCROLL);
}

void TestNodeListEvent106(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_LIST_ON_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "UnRegisterEvent NODE_LIST_ON_WILL_SCROLL");
        }
    });
}

void TestNodeListEvent007(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, nullptr);
}

void TestNodeListEvent008(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "RegisterEvent NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE");
        }
    });
}

void TestNodeListEvent107(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE, nullptr);
    nodeAPI->unregisterNodeEvent(list, NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE);
}

void TestNodeListEvent108(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle list)
{
    nodeAPI->addNodeEventReceiver(list, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) != NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LIST_LOG, "UnRegisterEvent NODE_LIST_ON_SCROLL_VISIBLE_CONTENT_CHANGE");
        }
    });
}

void TestNodeInitListAttribute001(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonLabel = {.string = "List1 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonListID1"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    nodeList.push_back(list);
    nodeList.push_back(button);
    TestNodeListDirection001(nodeAPI, list,button);
    TestNodeListSticky001(nodeAPI, list,button);
    TestNodeListCachedCount001(nodeAPI, list,button);
    TestNodeListAlignListItem001(nodeAPI, list,button);
    TestNodeListScrollSnapAlign001(nodeAPI, list,button);
    TestNodeListMaintainVisibleContentPosition001(nodeAPI, list,button);
    TestNodeListStackFromEnd001(nodeAPI, list,button);
    TestNodeListFocusWrapMode001(nodeAPI, list,button);
    TestNodeListSyncLoad001(nodeAPI, list,button);
    TestNodeListScrollSnapAnimationSpeed001(nodeAPI, list,button);
    TestNodeListLanesItemFillPolicy001(nodeAPI, list,button);
    TestNodeListItemGroupSetDivider001(nodeAPI, list,button);
    TestNodeListEvent001(nodeAPI, list);
    TestNodeListEvent003(nodeAPI, list);
    TestNodeListEvent005(nodeAPI, list);
    TestNodeListEvent007(nodeAPI, list);
}

void TestNodeInitListAttribute101(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto list = nodeList[0];
    auto button = nodeList[1];
    if (list) {
        // 主线程读属性
        TestNodeListDirection002(nodeAPI, list,button);
        TestNodeListSticky002(nodeAPI, list,button);
        TestNodeListCachedCount002(nodeAPI, list,button);
        TestNodeListAlignListItem002(nodeAPI,list, button);
        TestNodeListScrollSnapAlign002(nodeAPI, list,button);
        TestNodeListMaintainVisibleContentPosition002(nodeAPI, list,button);
        TestNodeListStackFromEnd002(nodeAPI, list,button);
        TestNodeListFocusWrapMode002(nodeAPI,list, button);
        TestNodeListSyncLoad002(nodeAPI,list, button);
        TestNodeListScrollSnapAnimationSpeed002(nodeAPI, list,button);
        TestNodeListLanesItemFillPolicy002(nodeAPI, list,button);
        TestNodeListItemGroupSetDivider002(nodeAPI,list, button);
        TestNodeListEvent002(nodeAPI, list);
        TestNodeListEvent004(nodeAPI, list);
        TestNodeListEvent006(nodeAPI, list);
        TestNodeListEvent008(nodeAPI, list);
    }
}

void TestNodeInitListAttribute011(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    
    ArkUI_AttributeItem buttonLabel = {.string = "List3 capi is successful"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    ArkUI_AttributeItem idItem = {.string = "buttonListID3"};
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    nodeList.push_back(list);
    nodeList.push_back(button);
    TestNodeListDirection011(nodeAPI, list,button);
    TestNodeListSticky011(nodeAPI, list,button);
    TestNodeListCachedCount011(nodeAPI, list,button);
    TestNodeListAlignListItem011(nodeAPI, list,button);
    TestNodeListInitialIndex011(nodeAPI,list, button);
    TestNodeListLanes011(nodeAPI, list,button);
    TestNodeListScrollSnapAlign011(nodeAPI,list, button);
    TestNodeListMaintainVisibleContentPosition011(nodeAPI, list,button);
    TestNodeListStackFromEnd011(nodeAPI, list,button);
    TestNodeListFocusWrapMode011(nodeAPI, list,button);
    TestNodeListSyncLoad011(nodeAPI,list, button);
    TestNodeListScrollSnapAnimationSpeed011(nodeAPI, list,button);
    TestNodeListEvent101(nodeAPI, list);
    TestNodeListEvent103(nodeAPI, list);
    TestNodeListEvent105(nodeAPI, list);
    TestNodeListEvent107(nodeAPI, list);
}

void TestNodeInitListAttribute111(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    auto list = nodeList[2];
    auto button = nodeList[3];
    if (list) {
        TestNodeListDirection012(nodeAPI, list,button);
        TestNodeListSticky012(nodeAPI, list,button);
        TestNodeListCachedCount012(nodeAPI, list,button);
        TestNodeListAlignListItem012(nodeAPI, list,button);
        TestNodeListInitialIndex012(nodeAPI, list,button);
        TestNodeListLanes012(nodeAPI, list,button);
        TestNodeListScrollSnapAlign012(nodeAPI, list,button);
        TestNodeListMaintainVisibleContentPosition012(nodeAPI, list,button);
        TestNodeListStackFromEnd012(nodeAPI, list,button);
        TestNodeListFocusWrapMode012(nodeAPI, list,button);
        TestNodeListSyncLoad012(nodeAPI,list, button);
        TestNodeListScrollSnapAnimationSpeed012(nodeAPI, list,button);
        TestNodeListEvent102(nodeAPI, list);
        TestNodeListEvent104(nodeAPI, list);
        TestNodeListEvent106(nodeAPI, list);
        TestNodeListEvent108(nodeAPI, list);
    }
}

void RunOnSubThreadList(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    TestNodeInitListAttribute001(nodeAPI, nodeList);
    TestNodeInitListAttribute011(nodeAPI, nodeList);
}

void RunOnUIThreadList(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle>& nodeList)
{
    // 获取在RunOnSubThreadList中保存到nodeList中的组件
    TestNodeInitListAttribute101(nodeAPI, nodeList);
    TestNodeInitListAttribute111(nodeAPI, nodeList);

}

napi_value ListAttributeTest::CreateNativeListNode(napi_env env, napi_callback_info info)
{
    return tester->CreateCNodeTreeList(env, info, RunOnUIThreadList, RunOnSubThreadList);
}

napi_value ListAttributeTest::DisposeNativeListNode(napi_env env, napi_callback_info info)
{
    // 释放组件
    return tester->DisposeCNodeTreeList(env, info);
}
}


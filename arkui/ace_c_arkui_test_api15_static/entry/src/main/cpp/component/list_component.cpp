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

#include "list_component.h"

namespace ArkUIAniTest {

void ListItemSwipeActionOption::SetStart(ArkUI_ListItemSwipeActionItem* item)
{
    OH_ArkUI_ListItemSwipeActionOption_SetStart(_option, item);
}

void ListItemSwipeActionOption::SetEnd(ArkUI_ListItemSwipeActionItem* item)
{
    OH_ArkUI_ListItemSwipeActionOption_SetEnd(_option, item);
}

void ListItemSwipeActionOption::SetEdgeEffect(ArkUI_ListItemSwipeEdgeEffect edgeEffect)
{
    OH_ArkUI_ListItemSwipeActionOption_SetEdgeEffect(_option, edgeEffect);
}

int32_t ListItemSwipeActionOption::GetEdgeEffect()
{
    return OH_ArkUI_ListItemSwipeActionOption_GetEdgeEffect(_option);
}

void ListItemSwipeActionOption::SetOnOffsetChange(OnOffsetChangeCallback callback)
{
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChange(_option, callback);
}

void ListItemSwipeActionOption::SetOnOffsetChangWithUserData(
    OnOffsetChangeWithUserDataCallback callback, void* userData)
{
    OH_ArkUI_ListItemSwipeActionOption_SetOnOffsetChangeWithUserData(_option, userData, callback);
}

int32_t ListChildrenMainSizeOption::SetDefaultMainSize(float defaultMainSize)
{
    return OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(_option, defaultMainSize);
}

float ListChildrenMainSizeOption::GetDefaultMainSize()
{
    return OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(_option);
}

void ListChildrenMainSizeOption::Resize(int32_t totalSize)
{
    OH_ArkUI_ListChildrenMainSizeOption_Resize(_option, totalSize);
}

int32_t ListChildrenMainSizeOption::Splice(int32_t index, int32_t deleteCount, int32_t addCount)
{
    return OH_ArkUI_ListChildrenMainSizeOption_Splice(_option, index, deleteCount, addCount);
}

int32_t ListChildrenMainSizeOption::UpdateSize(int32_t index, float mainSize)
{
    return OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(_option, index, mainSize);
}

float ListChildrenMainSizeOption::GetMainSize(int32_t index)
{
    return OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(_option, index);
}

void ListItemComponent::SetListItemSwiperAction(ListItemSwipeActionOption* option)
{
    ArkUI_AttributeItem item = { nullptr, PARAM_0, nullptr, option->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_SWIPE_ACTION, &item);
}

void ListComponent::SetListDirection(int32_t direction)
{
    ArkUI_NumberValue value[] = { { .i32 = direction } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_DIRECTION, &item);
}

void ListComponent::SetListSticky(int32_t stickyStyle)
{
    ArkUI_NumberValue value[] = { { .i32 = stickyStyle } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_STICKY, &item);
}

void ListComponent::SetListSpace(float space)
{
    ArkUI_NumberValue value[] = { { .f32 = space } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_SPACE, &item);
}

void ListComponent::SetListCachedCount(int32_t count)
{
    ArkUI_NumberValue value[] = { { .i32 = count } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_CACHED_COUNT, &item);
}

void ListComponent::SetListScrollToIndex(const std::vector<ArkUI_NumberValue>& data)
{
    ArkUI_AttributeItem item = { data.data(), static_cast<int32_t>(data.size()) };
    _nodeAPI->setAttribute(_component, NODE_LIST_SCROLL_TO_INDEX, &item);
}

void ListComponent::SetListAlignListItem(int32_t align)
{
    ArkUI_NumberValue value[] = { { .i32 = align } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_ALIGN_LIST_ITEM, &item);
}

void ListComponent::SetListChildrenMainSize(ListChildrenMainSizeOption* mainSize)
{
    ArkUI_AttributeItem item = { .object = mainSize->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_CHILDREN_MAIN_SIZE, &item);
    _childrenMainSize.reset(mainSize);
}

void ListComponent::SetListInitialIndex(int32_t index)
{
    ArkUI_NumberValue value[] = { { .i32 = index } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_INITIAL_INDEX, &item);
}

void ListComponent::SetListDivider(uint32_t color, float width, float distanceStart, float distanceEnd)
{
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = distanceStart },
        { .f32 = distanceEnd } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_LIST_DIVIDER, &item);
}

void ListItemGroupComponent::SetListItemGroupHeader(Component* node)
{
    ArkUI_AttributeItem item = { nullptr, PARAM_0, nullptr, node->GetComponent() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_HEADER, &item);
}

void ListItemGroupComponent::SetListItemGroupFooter(Component* node)
{
    ArkUI_AttributeItem item = { nullptr, PARAM_0, nullptr, node->GetComponent() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_FOOTER, &item);
}

void ListItemGroupComponent::SetListItemGroupDivider(
    uint32_t color, float width, float distanceStart, float distanceEnd)
{
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = width }, { .f32 = distanceStart },
        { .f32 = distanceEnd } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_SET_DIVIDER, &item);
}

void ListItemGroupComponent::SetListItemGroupChildrenMainSize(ListChildrenMainSizeOption* mainSize)
{
    ArkUI_AttributeItem item = { .object = mainSize->GetOption() };
    _nodeAPI->setAttribute(_component, NODE_LIST_ITEM_GROUP_CHILDREN_MAIN_SIZE, &item);
    _childrenMainSize.reset(mainSize);
}

void ListComponent::SetListScrollBar(int32_t barState)
{
    ArkUI_NumberValue value[] = { { .i32 = barState } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_DISPLAY_MODE, &item);
}

void ListComponent::SetListScrollBarWidth(float width)
{
    ArkUI_NumberValue value[] = { { .f32 = width } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_WIDTH, &item);
}

void ListComponent::SetListEdgeEffect(int32_t edgeEffect, bool alwaysEnabled)
{
    ArkUI_NumberValue value[] = { { .i32 = edgeEffect }, { .i32 = alwaysEnabled } };
    ArkUI_AttributeItem item = { value, PARAM_2 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_EDGE_EFFECT, &item);
}

void ListComponent::SetNestedScroll(int32_t forward, int32_t backward)
{
    ArkUI_NumberValue value[] = {{.i32 = forward}, {.i32 = backward}};
    ArkUI_AttributeItem item = {value, 2};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_NESTED_SCROLL, &item);
}

void ListComponent::SetScrollTo(float hOffset, float vOffset, const std::vector<int32_t>& optionalParams)
{
    auto value = new ArkUI_NumberValue[PARAM_2 + static_cast<int32_t>(optionalParams.size())];
    value[PARAM_0] = { .f32 = hOffset };
    value[PARAM_1] = { .f32 = vOffset };
    for (int32_t i = PARAM_0; i < optionalParams.size(); i++) {
        value[PARAM_2 + i] = { .i32 = optionalParams[i] };
    }
    ArkUI_AttributeItem item = { value, PARAM_2 + static_cast<int32_t>(optionalParams.size()) };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_OFFSET, &item);
}

void ListComponent::SetScrollPage(bool next, bool animation)
{
    ArkUI_NumberValue value[] = { { .i32 = next }, { .i32 = animation } };
    ArkUI_AttributeItem item = { value, PARAM_2 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_PAGE, &item);
}

void ListComponent::SetScrollBarWidth(float width)
{
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_WIDTH, &item);
}

void ListComponent::SetScrollBarColor(uint32_t color)
{
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_COLOR, &item);
}

void ListComponent::SetScrollBar(int32_t barState)
{
    ArkUI_NumberValue value[] = {{.i32 = barState}};
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_DISPLAY_MODE, &item);
}

void ListComponent::SetBackToTop(int32_t isBackToTop)
{
    ArkUI_NumberValue value[] = { { .i32 = isBackToTop } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BACK_TO_TOP, &item);
}

void ListComponent::SetScrollBy(float hDistance, float vDistance)
{
    ArkUI_NumberValue value[] = { { .f32 = hDistance }, { .f32 = vDistance } };
    ArkUI_AttributeItem item = { value, PARAM_2 };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BY, &item);
}

void ListComponent::SetListScrollToIndex(int32_t index)
{
    ArkUI_NumberValue value[] = { { .i32 = index } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_LIST_SCROLL_TO_INDEX, &item);
}

void ListComponent::SetListScrollToIndex(int32_t index, int32_t animation)
{
    ArkUI_NumberValue value[] = { { .i32 = index }, { .i32 = animation } };
    ArkUI_AttributeItem item = { value, PARAM_2 };
    _nodeAPI->setAttribute(_component, NODE_LIST_SCROLL_TO_INDEX, &item);
}

void ListComponent::SetListScrollToIndex(int32_t index, int32_t animation, int32_t alignment)
{
    ArkUI_NumberValue value[] = { { .i32 = index }, { .i32 = animation }, { .i32 = alignment } };
    ArkUI_AttributeItem item = { value, PARAM_3 };
    _nodeAPI->setAttribute(_component, NODE_LIST_SCROLL_TO_INDEX, &item);
}

void ListComponent::OnNodeEvenSwitchCaseOne(ArkUI_NodeEventType eventType, ArkUI_NodeComponentEvent* result)
{
    switch (eventType) {
        case NODE_SCROLL_EVENT_ON_SCROLL: {
            float horizontalOffset = result->data[PARAM_0].f32;
            float verticalOffset = result->data[PARAM_1].f32;
            if (_onScroll) {
                _onScroll(horizontalOffset, verticalOffset);
            }
            break;
        }
        case NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN: {
            if (_onScrollFrameBegin) {
                float offset = result->data[PARAM_0].f32;
                int32_t state = result->data[PARAM_1].i32;
                result->data[PARAM_0].f32 = _onScrollFrameBegin(offset, state);
            }
            break;
        }
        case NODE_SCROLL_EVENT_ON_SCROLL_START: {
            if (_onScrollStart) {
                _onScrollStart();
            }
            break;
        }
        case NODE_SCROLL_EVENT_ON_SCROLL_STOP: {
            if (_onScrollStop) {
                _onScrollStop();
            }
            break;
        }
        default: {
            break;
        }
    }
}

void ListComponent::OnNodeEvenSwitchCaseTwo(ArkUI_NodeEventType eventType, ArkUI_NodeComponentEvent* result)
{
    switch (eventType) {
        case NODE_LIST_ON_WILL_SCROLL: {
            float offset = result->data[PARAM_0].f32;
            int32_t state = result->data[PARAM_1].i32;
            int32_t source = result->data[PARAM_2].i32;
            if (_onWillScroll) {
                _onWillScroll(offset, state, source);
            }
            break;
        }
        case NODE_LIST_ON_DID_SCROLL: {
            float offset = result->data[PARAM_0].f32;
            int32_t state = result->data[PARAM_1].i32;
            if (_onDidScroll) {
                _onDidScroll(offset, state);
            }
            break;
        }
        case NODE_SCROLL_EVENT_ON_REACH_START: {
            if (_onReachStart) {
                _onReachStart();
            }
            break;
        }
        case NODE_SCROLL_EVENT_ON_REACH_END: {
            if (_onReachEnd) {
                _onReachEnd();
            }
            break;
        }
        case NODE_LIST_ON_SCROLL_INDEX: {
            if (_onScrollIndex) {
                int32_t first = result->data[PARAM_0].i32;
                int32_t last = result->data[PARAM_1].i32;
                int32_t subcomponent = result->data[PARAM_2].i32;
                _onScrollIndex(first, last, subcomponent);
            }
            break;
        }
        default: {
            break;
        }
    }
}

void ListComponent::OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    OnNodeEvenSwitchCaseOne(eventType, result);
    OnNodeEvenSwitchCaseTwo(eventType, result);
}

void ListComponent::SetOnScroll(OnScroll onScroll)
{
    _onScroll = onScroll;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL, PARAM_0, nullptr);
}

void ListComponent::SetOnScrollFrameBegin(OnScrollFrameBegin onScrollFrameBegin)
{
    _onScrollFrameBegin = onScrollFrameBegin;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, PARAM_0, nullptr);
}

void ListComponent::SetOnScrollStart(OnScrollStart onScrollStart)
{
    _onScrollStart = onScrollStart;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_START, PARAM_0, nullptr);
}

void ListComponent::SetOnScrollStop(OnScrollStop onScrollStop)
{
    _onScrollStop = onScrollStop;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_STOP, PARAM_0, nullptr);
}

void ListComponent::SetOnWillScroll(OnWillScroll onWillScroll)
{
    _onWillScroll = onWillScroll;
    _nodeAPI->registerNodeEvent(_component, NODE_LIST_ON_WILL_SCROLL, PARAM_0, nullptr);
}

void ListComponent::SetOnDidScroll(OnDidScroll onDidScroll)
{
    _onDidScroll = onDidScroll;
    _nodeAPI->registerNodeEvent(_component, NODE_LIST_ON_DID_SCROLL, PARAM_0, nullptr);
}

void ListComponent::SetOnReachStart(OnReachStart onReachStart)
{
    _onReachStart = onReachStart;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_START, PARAM_0, nullptr);
}

void ListComponent::SetOnReachEnd(OnReachEnd onReachEnd)
{
    _onReachEnd = onReachEnd;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_END, PARAM_0, nullptr);
}

void ListComponent::SetOnScrollIndex(ListOnScrollIndex onScrollIndex)
{
    _onScrollIndex = onScrollIndex;
    _nodeAPI->registerNodeEvent(_component, NODE_LIST_ON_SCROLL_INDEX, PARAM_0, nullptr);
}
} // namespace ArkUIAniTest
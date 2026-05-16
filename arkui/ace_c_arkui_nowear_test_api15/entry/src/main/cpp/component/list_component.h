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

#ifndef CAPIDEMO_LIST_COMPONENT_H
#define CAPIDEMO_LIST_COMPONENT_H
#include "component.h"
#include "node_adapter.h"

namespace ArkUICapiTest {

using OnScroll = std::function<void(float, float)>;
using OnScrollFrameBegin = std::function<float(float, int32_t)>;
using OnScrollStart = std::function<void()>;
using OnScrollStop = std::function<void()>;
using OnWillScroll = std::function<void(float, int32_t, int32_t)>;
using OnDidScroll = std::function<void(float, int32_t)>;
using OnReachStart = std::function<void()>;
using OnReachEnd = std::function<void()>;
using ListOnScrollIndex = std::function<void(int32_t, int32_t, int32_t)>;

//////////////////////////////////////ListItem///////////////////////////////////////
typedef void (*OnOffsetChangeCallback)(float offset);
typedef void (*OnOffsetChangeWithUserDataCallback)(float offset, void* userData);
typedef void (*OnFinish)(void* userData);

class ListItemSwipeActionOption {
public:
    explicit ListItemSwipeActionOption() : _option(OH_ArkUI_ListItemSwipeActionOption_Create()) {}
    ~ListItemSwipeActionOption()
    {
        OH_ArkUI_ListItemSwipeActionOption_Dispose(_option);
    }

    void SetStart(ArkUI_ListItemSwipeActionItem* item);
    void SetEnd(ArkUI_ListItemSwipeActionItem* item);
    // ArkUI_ListItemSwipeEdgeEffect
    void SetEdgeEffect(ArkUI_ListItemSwipeEdgeEffect edgeEffect);
    int32_t GetEdgeEffect();
    void SetOnOffsetChange(OnOffsetChangeCallback callback);
    void SetOnOffsetChangWithUserData(OnOffsetChangeWithUserDataCallback callback, void* userData);
    ArkUI_ListItemSwipeActionOption* GetOption()
    {
        return _option;
    }

private:
    ArkUI_ListItemSwipeActionOption* _option;
};

class ListItemComponent : public Component {
public:
    explicit ListItemComponent() : Component(ARKUI_NODE_LIST_ITEM) {}
    explicit ListItemComponent(ArkUI_NodeHandle handle) : Component(handle) {}

    void SetListItemSwiperAction(ListItemSwipeActionOption* option);
    std::shared_ptr<ListItemSwipeActionOption> GetSwipeActionOption() const
    {
        return _swipeActionOption;
    }
    void ReleaseSwipeActionOption()
    {
        _swipeActionOption.reset();
    }

private:
    std::shared_ptr<ListItemSwipeActionOption> _swipeActionOption;
};

///////////////////////////////////List///////////////////////////////////////

class ListChildrenMainSizeOption {
public:
    explicit ListChildrenMainSizeOption() : _option(OH_ArkUI_ListChildrenMainSizeOption_Create()) {}
    ~ListChildrenMainSizeOption()
    {
        OH_ArkUI_ListChildrenMainSizeOption_Dispose(_option);
    }
    int32_t SetDefaultMainSize(float defaultMainSize);
    float GetDefaultMainSize();
    void Resize(int32_t totalSize);
    int32_t UpdateSize(int32_t index, float mainSize);
    float GetMainSize(int32_t index);
    int32_t Add(int32_t start, int32_t addCount, std::vector<float> childrenSize);
    int32_t Delete(int32_t start, int32_t deleteCount);
    int32_t Update(int32_t start, int32_t updateCount, std::vector<float> childrenSize);
    ArkUI_ListChildrenMainSize* GetOption()
    {
        return _option;
    }

private:
    int32_t Splice(int32_t index, int32_t deleteCount, int32_t addCount);
    ArkUI_ListChildrenMainSize* _option;
};

class ListComponent : public Component {
public:
    explicit ListComponent() : Component(ARKUI_NODE_LIST) {}
    explicit ListComponent(ArkUI_NodeHandle handle) : Component(handle) {}

    void SetLazyAdapter(const std::shared_ptr<ItemAdapter<ListItemComponent>>& adapter)
    {
        ArkUI_AttributeItem item { nullptr, PARAM_0, nullptr, adapter->GetAdapter() };
        _nodeAPI->setAttribute(_component, NODE_LIST_NODE_ADAPTER, &item);
        _adapter = adapter;
    }

    void SetListDirection(int32_t direction);
    void SetListSticky(int32_t stickyStyle);
    void SetListSpace(float space);
    void SetListCachedCount(int32_t count);
    void SetScrollBarWidth(float width);
    void SetScrollBarColor(uint32_t color);
    void SetScrollBar(int32_t barState);
    void SetNestedScroll(int32_t forward, int32_t backward);
    /**
     * data[0].i32：The index value of the target element to be slid to in the current container.\n
     * data[1]?.i32：Set whether there is an action when sliding to the index value of a list item in the list, where
     * 1 indicates an action and 0 indicates no action. Default value: 0。\n
     * data[2]?.i32：ArkUI_ScrollAlignment
     */
    void SetListScrollToIndex(const std::vector<ArkUI_NumberValue>& data);
    void SetListAlignListItem(int32_t align);
    void SetListChildrenMainSize(ListChildrenMainSizeOption* mainSize);
    void SetListInitialIndex(int32_t index);
    void SetListDivider(uint32_t color, float width, float distanceStart, float distanceEnd);

    std::shared_ptr<ItemAdapter<ListItemComponent>> GetAdapter() const
    {
        return _adapter;
    }
    std::shared_ptr<ListChildrenMainSizeOption> GetSizeOption() const
    {
        return _childrenMainSize;
    }
    void ReleaseSizeOption()
    {
        _childrenMainSize.reset();
    }

    void SetListScrollBar(int32_t barState);
    void SetListScrollBarWidth(float width);
    void SetListEdgeEffect(int32_t edgeEffect, bool alwaysEnabled);
    void SetListScrollToIndex(int32_t index);
    void SetListScrollToIndex(int32_t index, int32_t animation);
    void SetListScrollToIndex(int32_t index, int32_t animation, int32_t alignment);
    void SetScrollTo(float hOffset, float vOffset, const std::vector<int32_t>& optionalParams);
    void SetScrollPage(bool next, bool animation);
    void OnNodeEvent(ArkUI_NodeEvent* event) override;
    void OnNodeEvenSwitchCaseOne(ArkUI_NodeEventType eventType, ArkUI_NodeComponentEvent* result);
    void OnNodeEvenSwitchCaseTwo(ArkUI_NodeEventType eventType, ArkUI_NodeComponentEvent* result);
    void SetOnScroll(OnScroll onScroll);
    void SetOnScrollFrameBegin(OnScrollFrameBegin onScrollFrameBegin);
    void SetOnScrollStart(OnScrollStart onScrollStart);
    void SetOnScrollStop(OnScrollStop onScrollStop);
    void SetOnWillScroll(OnWillScroll onWillScroll);
    void SetOnDidScroll(OnDidScroll onDidScroll);
    void SetOnReachStart(OnReachStart onReachStart);
    void SetOnReachEnd(OnReachEnd onReachEnd);
    void SetOnScrollIndex(ListOnScrollIndex onScrollIndex);
    void SetScrollBy(float hDistance, float vDistance);
    void SetBackToTop(int32_t isBackToTop);

private:
    std::shared_ptr<ItemAdapter<ListItemComponent>> _adapter;
    std::shared_ptr<ListChildrenMainSizeOption> _childrenMainSize;
    OnScroll _onScroll;
    OnScrollFrameBegin _onScrollFrameBegin;
    OnScrollStart _onScrollStart;
    OnScrollStop _onScrollStop;
    OnWillScroll _onWillScroll;
    OnDidScroll _onDidScroll;
    OnReachStart _onReachStart;
    OnReachEnd _onReachEnd;
    ListOnScrollIndex _onScrollIndex;
};

class ListItemGroupComponent : public Component {
public:
    explicit ListItemGroupComponent() : Component(ARKUI_NODE_LIST_ITEM_GROUP) {}
    explicit ListItemGroupComponent(ArkUI_NodeHandle handle) : Component(handle) {}

    void SetListItemGroupHeader(Component* node);
    void SetListItemGroupFooter(Component* node);
    void SetListItemGroupDivider(uint32_t color, float width, float distanceStart, float distanceEnd);
    void SetListItemGroupChildrenMainSize(ListChildrenMainSizeOption* mainSize);

    std::shared_ptr<ListChildrenMainSizeOption> GetSizeOption() const
    {
        return _childrenMainSize;
    }
    void ReleaseSizeOption()
    {
        _childrenMainSize.reset();
    }
private:
    std::shared_ptr<ListChildrenMainSizeOption> _childrenMainSize;
};

} // namespace ArkUICapiTest
#endif // CAPIDEMO_LIST_COMPONENT_H

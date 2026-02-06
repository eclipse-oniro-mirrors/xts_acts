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

#ifndef ARKUI_CAPI_DEMO_GRID_COMPONENT_H
#define ARKUI_CAPI_DEMO_GRID_COMPONENT_H

#include "ComponentTest.h"
#include "node_adapter.h"

namespace ArkUICapiTest {
using OnGridSReachStart = std::function<void()>;
using OnGridReachEnd = std::function<void()>;
using OnGridScrollFrameBegin = std::function<void(float, int32_t)>;
using OnGridScrollStop = std::function<void()>;
using OnGridScrollStart = std::function<void()>;
using OnGridWillScroll = std::function<void(float, int32_t, int32_t)>;
using OnGridDidScroll = std::function<void(float, int32_t)>;
using OnGridWillStopDragging =  std::function<void(float)>;
using OnGridScrollIndex = std::function<void(int32_t, int32_t)>;
using OnWillScroll = std::function<void(float, int32_t, int32_t)>;
using OnReachStart = std::function<void()>;
using OnReachEnd = std::function<void()>;
using OnScrollStop = std::function<void()>;
using OnScrollStart = std::function<void()>;
using OnDidScroll = std::function<void(float, int32_t)>;
using OnScrollFrameBegin = std::function<void(float, int32_t)>;
using OnScrollIndex = std::function<void(int32_t, int32_t)>;
using OnScrollBarUpdate = std::function<void()>;
using OnItemDragStart = std::function<void(float, float, int32_t)>;
using OnItemDragEnter = std::function<void(float, float)>;
using OnItemDragMove = std::function<void(float, float, int32_t, int32_t)>;
using OnItemDragLeave = std::function<void(float, float, int32_t)>;
using OnItemDrop = std::function<void(float, float, int32_t, int32_t, bool)>;
using OnItemSelect = std::function<void(bool)>;

class GridItemComponent : public Component {
public:
    GridItemComponent() : Component(ARKUI_NODE_GRID_ITEM) {}
    explicit GridItemComponent(ArkUI_NodeHandle handle) : Component(handle) {}
    int32_t SetGridItemSelectable(int32_t enable);
    int32_t GetGridItemSelectable();
    void ResetGridItemSelectable();
    int32_t SetGridItemSelected(int32_t selected);
    int32_t GetGridItemSelected();
    void ResetGridItemSelected();
    void SetGridItemOnSelect(OnItemSelect);
};

class GridComponent : public Component {
public:
    GridComponent() : Component(ARKUI_NODE_GRID) {}
    explicit GridComponent(ArkUI_NodeHandle handle) : Component(handle) {}

    void SetLazyAdapter(const std::shared_ptr<ItemAdapter<GridItemComponent>>& adapter)
    {
        ArkUI_AttributeItem item { nullptr, 0, nullptr, adapter->GetAdapter() };
        _nodeAPI->setAttribute(_component, NODE_GRID_NODE_ADAPTER, &item);
        adapter_ = adapter;
    }
    void SetColumnTemplateItemFillPolicy(int32_t fillType);
    int32_t GetColumnTemplateItemFillPolicy();
    void ResetColumnTemplateItemFillPolicy();
    void SetGridColumnsTemplate(const std::string& str);
    std::string GetGridColumnsTemplate();
    void ResetGridColumnsTemplate();
    void SetGridRowsTemplate(const std::string& str);
    void SetGridColumnsGap(float val);
    void SetGridRowsGap(float val);
    void SetGridCachedCount(int32_t cachedCount);

    void SetGridNestedScroll(int32_t forward, int32_t backward);
    void SetOnScrollIndex(OnScrollIndex onScrollIndex);
    void SetColumnsTemplate(const std::string& str);
    void SetRowsTemplate(const std::string& str);

    void SetGridScrollToIndex(int32_t index);
    void SetGridScrollToIndex(int32_t index, int32_t animation);
    void SetGridScrollToIndex(int32_t index, int32_t animation, int32_t alignment);
    void SetItemConstraintSize(float minWidth, float maxWidth, float minHeight, float maxHeight);

    void SetGridScrollBar(int32_t barState);
    void SetGridScrollBarWidth(float width);
    void SetGridScrollBarColor(uint32_t color);
    void SetGridEnableScrollInteraction(bool enableScrollInteraction);
    void SetGridFriction(float friction);
    void SetGridEdgeEffect(int32_t edgeEffect, bool alwaysEnabled);
    void SetScrollEdge(int32_t type);
    void SetScrollPage(bool next);
    void SetScrollPage(bool next, bool animation);
    void SetScrollBy(float hDistance, float vDistance);
    void SetOnWillScroll(OnWillScroll onWillScroll);
    void SetOnReachStart(OnReachStart onReachStart);
    void SetOnReachEnd(OnReachEnd onReachEnd);
    void SetOnScrollStart(OnScrollStart onScrollStart);
    void SetOnScrollStop(OnScrollStop onScrollStop);
    void SetOnDidScroll(OnDidScroll onDidScroll);
    /**
     * @brief Set the scroll position to the specified offset.
     * @param hOffset horizontal scrolling offset
     * @param vOffset vertical scrolling offset
     * @param optionalParams
     * [0] scrolling duration, in milliseconds.
     * [1] scrolling curve. The parameter type is ArkUI_AnimationCurve.
     * [2] whether to enable the default spring animation.
     * [3] sets whether scrolling can cross the boundary.
     * [4] canOverScroll.
     */
    void SetScrollTo(float hOffset, float vOffset, const std::vector<int32_t>& optionalParams);

    std::shared_ptr<ItemAdapter<GridItemComponent>> GetAdapter() const
    {
        return adapter_;
    }
    void ReleaseAdapter()
    {
        return adapter_.reset();
    }

    void OnNodeEvent(ArkUI_NodeEvent* event) override;
    void SetOnGridReachStart(OnGridSReachStart onGridSReachStart);
    void SetOnGridReachEnd(OnGridReachEnd onGridReachEnd);
    void SetOnGridScrollFrameBegin(OnGridScrollFrameBegin onGridScrollFrameBegin);
    void SetOnGridScrollStop(OnGridScrollStop onGridScrollStop);
    void SetOnGridScrollStart(OnGridScrollStart onGridScrollStart);
    void SetOnGridWillScroll (OnGridWillScroll onWillScroll);
    void SetOnGridDidScroll(OnGridDidScroll onDidScroll);
    void SetOnGridWillStopDragging(OnGridWillStopDragging onGridWillStopDragging);
    void SetBackToTop(int32_t isBackToTop);
    void SetOnGridScrollIndex(OnGridScrollIndex onGridScrollIndex);
    void SetOnScrollBarUpdate();
    void SetOnScrollBarUpdateReturn(ArkUI_NodeEvent* event, float offset, float length);
    void SetGridLayoutOptions(ArkUI_GridLayoutOptions* option);
    ArkUI_GridLayoutOptions* GetGridLayoutOptions();
    void ResetGridLayoutOptions();
    int32_t SetGridEditMode(int32_t enable);
    int32_t GetGridEditMode();
    void ResetGridEditMode();
    int32_t SetGridMultiSelectable(int32_t enable);
    int32_t GetGridMultiSelectable();
    void ResetGridMultiSelectable();
    int32_t SetGridDragAnimation(int32_t enable);
    int32_t GetGridDragAnimation();
    void ResetGridDragAnimation();
    
    void SetOnItemDragStart(OnItemDragStart onItemDragStart);
    void SetOnItemDragEnter(OnItemDragEnter onItemDragEnter);
    void SetOnItemDragMove(OnItemDragMove onItemDragMove);
    void SetOnItemDragLeave(OnItemDragLeave onItemDragLeave);
    void SetOnItemDrop(OnItemDrop onItemDrop);
    
    void SetDragStartReturnValue(int32_t value);
    int32_t GetDragStartReturnValue();
private:
    std::shared_ptr<ItemAdapter<GridItemComponent>> adapter_;
    int32_t dragStartValue_;
};

} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_GRID_COMPONENT_H
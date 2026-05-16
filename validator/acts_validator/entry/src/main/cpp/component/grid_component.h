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

#ifndef ARKUI_CAPI_DEMO_GRID_COMPONENT_H
#define ARKUI_CAPI_DEMO_GRID_COMPONENT_H

#include "component.h"
#include <cstdint>

namespace ArkUICapiTest {
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
    void SetGridColumnsTemplate(const std::string& str);
    void SetGridRowsTemplate(const std::string& str);
    void SetGridColumnsGap(float val);
    void SetGridRowsGap(float val);
    void OnNodeEvent(ArkUI_NodeEvent* event) override;

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
    int32_t dragStartValue_;
};

} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_GRID_COMPONENT_H
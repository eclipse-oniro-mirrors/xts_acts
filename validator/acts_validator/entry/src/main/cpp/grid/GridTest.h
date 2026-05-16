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

#ifndef GRID_TEST_H
#define GRID_TEST_H

#include "../common/common.h"
#include "../component/grid_component.h"
#include "../component/column_component.h"
#include <cstdint>

namespace ArkUICapiTest {

class GridTest {
public:
    ~GridTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    
private:
    static std::shared_ptr<GridComponent> CreatGrid();
    static std::shared_ptr<GridComponent> CreatGrid2();
    static std::shared_ptr<ColumnComponent> DragStartReturnColumn(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> EditModeColumn(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> MultiSelectableColumn(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> DragAnimationColumn(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> SelectableColumn(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> SelectedColumn(std::shared_ptr<GridComponent> grid);
    static int32_t editModeIndex_;
    static int32_t multiSelectableIndex_;
    static int32_t dragAnimationIndex_;
    static int32_t dragStartValueIndex_;
    static int32_t selectableIndex_;
    static int32_t selectedIndex_;
};
} // namespace ArkUICapiTest

#endif //CAPIDEMO_GRID_TEST_H

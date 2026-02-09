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

#ifndef GRID_DRAG_TEST_H
#define GRID_DRAG_TEST_H

#include "common/common.h"
#include "component/GridComponentTest.h"
#include "component/TextComponentTest.h"
#include "component/RowComponentTest.h"

namespace ArkUICapiTest {

class GridDragTest {
public:
    ~GridDragTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    
private:
    static std::shared_ptr<GridComponent> CreateGrid();
    static std::shared_ptr<GridComponent> CreateGrid_2();
    static std::shared_ptr<ColumnComponent> CreateCounterDisplay();
    static std::shared_ptr<GridComponent> OnGridTest();
    
    static void UpdateCounterTexts();
    static std::shared_ptr<GridComponent> CreateLeftGrid();
    static std::shared_ptr<ColumnComponent> DragStartReturnColumn(std::shared_ptr<GridComponent> grid);
    static std::vector<std::shared_ptr<TextComponent>> counterTexts_;
    static int32_t dragStartValueIndex_;
    static int32_t dragStartCount_;
    static int32_t dragEnterCount_;
    static int32_t dragMoveCount_;
    static int32_t dragLeaveCount_;
    static int32_t dropCount_;
    static int32_t selectCount_;
};
} // namespace ArkUICapiTest

#endif //CAPIDEMO_GRID_DRAG_TEST_H

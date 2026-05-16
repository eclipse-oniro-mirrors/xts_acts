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

#ifndef ARKUI_CAPI_XTS_GRID_FILLPOLICY_TEST_H
#define ARKUI_CAPI_XTS_GRID_FILLPOLICY_TEST_H

#include "common/common.h"
#include "component/GridComponentTest.h"

namespace ArkUICapiTest {

class GridTest {
public:
    ~GridTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    
private:
    static std::shared_ptr<ColumnComponent> BuildColumnsTemplateTest(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<ColumnComponent> BuildFillTypeTest(std::shared_ptr<GridComponent> grid);
    static std::shared_ptr<GridComponent> CreatGrid(int32_t type);
    static int32_t fillTypeIndex_;
    static int32_t columnsTemplateIndex_;
};
} // namespace ArkUICapiTest

#endif //CAPIDEMO_GRID_TEST_H
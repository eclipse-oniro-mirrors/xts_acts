/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "GridAttrsTest.h"
#include "GridAbilityTest.h"
#include "component/TextComponentTest.h"

namespace ArkUICapiTest {
constexpr int32_t GRID_ITEM_COUNT = 15;
//创建，判断值
napi_value TestGridEditMode001(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    // 测试editMode设置为true
    auto ret = grid->SetGridEditMode(1); // 直接调用组件方法
    ASSERT_EQ(ret, SUCCESS);
    
    // 获取属性值
    auto editModeValue = grid->GetGridEditMode();
    ASSERT_EQ(editModeValue, 1);
    
    // 测试设置为false
    ret = grid->SetGridEditMode(0);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(grid->GetGridEditMode(), 0);
    
    // 重置属性
    grid->ResetGridEditMode();
    ASSERT_EQ(grid->GetGridEditMode(), 0);
    
    NAPI_END;
}

napi_value TestGridEditMode002(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    // 测试editMode设置为-1
    auto ret = grid->SetGridEditMode(-1); // 直接调用组件方法
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto editModeValue = grid->GetGridEditMode();
    ASSERT_EQ(editModeValue, 0);
    
    // 测试设置为-2
    ret = grid->SetGridEditMode(-2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(grid->GetGridEditMode(), 0);
    
    // 重置属性
    grid->ResetGridEditMode();
    ASSERT_EQ(grid->GetGridEditMode(), 0);
    
    NAPI_END;
}

napi_value TestGridMultiSel001(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    // 测试multiSelectable设置为1
    auto ret = grid->SetGridMultiSelectable(1);
    ASSERT_EQ(ret, SUCCESS);
    
    auto multiSelValue = grid->GetGridMultiSelectable();
    ASSERT_EQ(multiSelValue, 1);
    
    // 测试设置为false
    ret = grid->SetGridMultiSelectable(0);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(grid->GetGridMultiSelectable(), 0);
    
    // 重置属性
    grid->ResetGridMultiSelectable();
    ASSERT_EQ(grid->GetGridMultiSelectable(), 0);
    
    NAPI_END;
}

napi_value TestGridMultiSel002(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    // 测试multiSelectable设置为-1
    auto ret = grid->SetGridMultiSelectable(-1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto multiSelValue = grid->GetGridMultiSelectable();
    ASSERT_EQ(multiSelValue, 0);
    
    NAPI_END;
}

napi_value TestGridDragAnimation001(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    auto ret = grid->SetGridDragAnimation(1);
    ASSERT_EQ(ret, SUCCESS);
    
    auto dragAnimationValue = grid->GetGridDragAnimation();
    ASSERT_EQ(dragAnimationValue, 1);
    
    // 测试设置为false
    ret = grid->SetGridDragAnimation(0);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(grid->GetGridDragAnimation(), 0);
    
    // 重置属性
    grid->ResetGridDragAnimation();
    ASSERT_EQ(grid->GetGridDragAnimation(), 0);
    
    NAPI_END;
}

napi_value TestGridDragAnimation002(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    
    // 测试multiSelectable设置为-1
    auto ret = grid->SetGridDragAnimation(-1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto dragAnimationValue = grid->GetGridDragAnimation();
    ASSERT_EQ(dragAnimationValue, 0);
    
    NAPI_END;
}

napi_value TestGridItemSelectable001(napi_env env, napi_callback_info info)
{
    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_300);
    grid->SetHeight(SIZE_300);
    for (int i = 0; i < GRID_ITEM_COUNT; i++) {
        auto gridItem = std::make_shared<GridItemComponent>();
        auto text = std::make_shared<TextComponent>();
        text->SetFontSize(PARAM_16);
        text->SetTextContent(std::to_string(i));
        text->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        text->SetPercentWidth(PARAM_0_POINT_8);
        text->SetPercentHeight(PARAM_0_POINT_2);
        text->SetBackgroundColor(COLOR_PINK);
        if (i == 0) {
            auto selectable = gridItem->GetGridItemSelectable();
            ASSERT_EQ(selectable, 1);
            auto ret = gridItem->SetGridItemSelectable(false);
            ASSERT_EQ(ret, SUCCESS);
            selectable = gridItem->GetGridItemSelectable();
            ASSERT_EQ(selectable, 0);
            gridItem->ResetGridItemSelectable();
            selectable = gridItem->GetGridItemSelectable();
            ASSERT_EQ(selectable, 1);
            ret = gridItem->SetGridItemSelectable(-1);
            ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
            selectable = gridItem->GetGridItemSelectable();
            ASSERT_EQ(selectable, 1);
            auto selected = gridItem->GetGridItemSelected();
            ASSERT_EQ(selected, 0);
            ret = gridItem->SetGridItemSelected(true);
            ASSERT_EQ(ret, SUCCESS);
            selected = gridItem->GetGridItemSelected();
            ASSERT_EQ(selected, 1);
            ret = gridItem->SetGridItemSelected(-1);
            ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
            selected = gridItem->GetGridItemSelected();
            ASSERT_EQ(selected, 1);
            gridItem->ResetGridItemSelected();
            selected = gridItem->GetGridItemSelected();
            ASSERT_EQ(selected, 0);
        }
    gridItem->AddChild(text);
    grid->AddChild(gridItem);
    }
    NAPI_END;
}
} // namespace ArkUICapiTest
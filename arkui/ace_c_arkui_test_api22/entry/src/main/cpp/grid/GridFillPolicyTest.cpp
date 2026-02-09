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

#include "GridFillPolicyTest.h"
#include "manager/PluginManagerTest.h"
#include "component/ButtonComponentTest.h"
#include "component/GridComponentTest.h"
#include "component/TextComponentTest.h"
#include "component/RowComponentTest.h"
#include "common/common.h"


namespace ArkUICapiTest {
constexpr int32_t GRID_ITEM_COUNT = 100;
constexpr int32_t GRID_ITEM_COUNT_80 = 80;
int32_t GridTest::fillTypeIndex_ = 0;

const std::vector<int32_t> fillTypePool = { ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_DEFAULT,
                                            ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_SM1MD2LG3,
                                            ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_NONE,
                                            ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_SM2MD3LG5,
                                            ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_SM1MD2LG3,
                                            4, ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_SM1MD2LG3, -1 };

std::shared_ptr<GridComponent> GridTest::CreatGrid(int32_t type)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetWidth(SIZE_200);
    grid->SetPercentHeight(PARAM_03);
    grid->SetColumnTemplateItemFillPolicy(ArkUI_ItemFillPolicy::ARKUI_ITEMFILLPOLICY_DEFAULT);
    // set columnsGap:NODE_GRID_COLUMN_GAP
    grid->SetGridColumnsGap(SIZE_10);
    // set rowGap:NODE_GRID_ROW_GAP
    grid->SetGridRowsGap(SIZE_5);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    grid->SetId("GridTemplate_FR");
    
    if (type == 1) {
        ArkUI_NumberValue value[] = {{.i32 = 1}};
        ArkUI_AttributeItem item = {value, 1};
        nodeAPI->setAttribute(grid->GetComponent(), NODE_GRID_FOCUS_WRAP_MODE, &item);
    }

    std::string message = "这是一段文字";
    std::string showMessage;
    for (int i = 0; i < GRID_ITEM_COUNT; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(PARAM_3);
        gridItem->SetBorderColor(COLOR_GRAY, COLOR_GRAY, COLOR_GRAY, COLOR_GRAY);
        showMessage += message;
        text->SetTextContent(showMessage);
        text->SetId("gridType_" + std::to_string(i));

        ArkUI_NumberValue focusable_value[] = {{.i32 = 1}};
        ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text->GetComponent(), NODE_FOCUSABLE, &focusable_item);

        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    return grid;
}

std::shared_ptr<ColumnComponent> GridTest::BuildFillTypeTest(std::shared_ptr<GridComponent> grid)
{
    auto columnsTempColumn = std::make_shared<ColumnComponent>();
    auto text = std::make_shared<TextComponent>();
    text->SetTextContent("fillType:,");
    auto getText = std::make_shared<TextComponent>();
    getText->SetTextContent("ItemFillPolicy: 0");
    getText->SetId("GridTemplate_STR0");

    auto button = std::make_shared<ButtonComponent>();
    button->SetPercentWidth(PARAM_03);
    button->SetPercentHeight(PARAM_003);
    button->SetId("ButtonSTR");
    button->SetLabel("fillType");
    button->RegisterOnClick([grid, text, getText]() {
         fillTypeIndex_ = (fillTypeIndex_ + 1) % fillTypePool.size();
         auto value = fillTypePool[fillTypeIndex_];
         text->SetTextContent("fillType: " + std::to_string(value));
         grid->SetColumnTemplateItemFillPolicy(value);
         auto getValue = grid->GetColumnTemplateItemFillPolicy();
         getText->SetTextContent("ItemFillPolicy: " + std::to_string(getValue));
    });
    
    auto resetButton = std::make_shared<ButtonComponent>();
    resetButton->SetPercentWidth(PARAM_03);
    resetButton->SetPercentHeight(PARAM_003);
    resetButton->SetId("ButtonRESTR");
    resetButton->SetLabel("resetFillType");
    resetButton->RegisterOnClick([grid, getText]() {
         grid->ResetColumnTemplateItemFillPolicy();
         auto getValue = grid->GetColumnTemplateItemFillPolicy();
         getText->SetTextContent("ItemFillPolicy: " + std::to_string(getValue));
    });
    columnsTempColumn->AddChild(text);
    columnsTempColumn->AddChild(getText);
    columnsTempColumn->AddChild(button);
    columnsTempColumn->AddChild(resetButton);
    return columnsTempColumn;
}


napi_value GridTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = CreatGrid(0);
    
    //fillType
    auto fillTypeColumn = BuildFillTypeTest(grid);
    auto column = new ColumnComponent();
    column->SetPercentWidth(1.0f);
    column->SetPercentHeight(1.0f);
    column->AddChild(grid);
    column->AddChild(fillTypeColumn);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                     "GridTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
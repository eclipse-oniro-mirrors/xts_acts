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

#include "GridTest.h"
#include <cstdint>
#include <string>
#include <napi/native_api.h>
#include <arkui/native_interface.h>
#include "common/commonDragEvent.h"

#include "PluginManagerTest.h"
#include "../component/button_component.h"
#include "../component/grid_component.h"
#include "../component/text_component.h"

namespace ArkUICapiTest {
constexpr int32_t GRID_ITEM_COUNT = 15;

template <typename T> inline std::vector<std::shared_ptr<T>> &GetKeepAliveContainer()
{
    static std::vector<std::shared_ptr<T>> keepAliveContainer;
    return keepAliveContainer;
}

std::shared_ptr<GridComponent> GridTest::CreatGrid()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = std::make_shared<GridComponent>();
    grid->SetGridColumnsTemplate("1fr 1fr 1fr");
    grid->SetPercentWidth(PARAM_1);
    grid->SetHeight(SIZE_80);
    grid->SetBorderColor(COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK);
    grid->SetBorderWidth(PARAM_1);
    grid->SetGridEditMode(PARAM_1);
    grid->SetDragStartReturnValue(PARAM_1);
    for (int i = 0; i < GRID_ITEM_COUNT; i++) {
        auto gridItem = std::make_shared<GridItemComponent>();
        auto text = std::make_shared<TextComponent>();
        text->SetFontSize(PARAM_16);
        text->SetTextContent(std::to_string(i));
        text->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
        text->SetWidth(SIZE_40);
        text->SetHeight(SIZE_40);
        text->SetBackgroundColor(COLOR_PINK);
        gridItem->AddChild(text);
        grid->AddChild(gridItem);
    }
    GetKeepAliveContainer<GridComponent>().emplace_back(grid);
    return grid;
}

napi_value GridTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto grid = CreatGrid();
    auto text = std::make_shared<TextComponent>();
    text->SetTextContent("拖拽后再拖回来");
    text->SetBackgroundColor(COLOR_PINK);
    grid->SetOnItemDragStart([grid](float x, float y, int32_t index) {
        grid->SetBackgroundColor(COLOR_RED);
    });
    grid->SetOnItemDragEnter([text](float x, float y) {
        text->SetTextContent("pass");
    });
    grid->SetOnItemDragMove([grid](float x, float y, int32_t index, int32_t insertIndex) {
        grid->SetBackgroundColor(COLOR_BLUE);
    });
    grid->SetOnItemDragLeave([grid](float x, float y, int32_t index) {
        grid->SetBackgroundColor(COLOR_PINK);
    });
    grid->SetOnItemDrop([grid](float x, float y, int32_t index, int32_t itemIndex, int32_t success) {
        grid->SetBackgroundColor(COLOR_YELLOW);
    });
    auto column = std::make_shared<ColumnComponent>();
    column->AddChild(grid);
    column->AddChild(text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest", "RootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
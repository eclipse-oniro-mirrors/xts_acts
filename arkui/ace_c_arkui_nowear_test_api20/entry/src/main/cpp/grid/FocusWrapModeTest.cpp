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

#include "FocusWrapModeTest.h"

#include <string>

#include "../manager/plugin_manager.h"
#include "../component/GridComponentTest.h"
#include "../component/TextComponentTest.h"
#include <arkui/native_type.h>
#include "common/common.h"

namespace ArkUICapiTest {
constexpr int32_t GRID_ITEM_COUNT = 4;
constexpr int32_t GRID_ITEM_COUNT_80 = 80;
constexpr int32_t FOCUS_ID = 2;

auto CreatGrid(int32_t type)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto grid = new GridComponent;

    grid->SetWidth(SIZE_150);
    grid->SetHeight(SIZE_120);
    grid->SetGridColumnsTemplate("1fr 1fr");
    grid->SetGridColumnsGap(SIZE_10);
    grid->SetGridRowsGap(SIZE_5);
    grid->SetBorderWidth(SIZE_5);
    grid->SetMargin(SIZE_5);
    if (type == 1) {
        ArkUI_NumberValue value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem item = { value, 1 };
        nodeAPI->setAttribute(grid->GetComponent(), NODE_GRID_FOCUS_WRAP_MODE, &item);
    }

    for (int i = 0; i < GRID_ITEM_COUNT; i++) {
        auto gridItem = new Component(ARKUI_NODE_GRID_ITEM);
       
        auto text = new TextComponent();
        gridItem->SetBackgroundColor(COLOR_YELLOW);
        gridItem->SetBorderWidth(SIZE_2);
        gridItem->SetWidth(SIZE_50);
        gridItem->SetHeight(SIZE_50);
        text->SetTextContent("A");
        if (i == FOCUS_ID) {
            gridItem->SetId("isFocus");
        }
        
        ArkUI_NumberValue focusable_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem focusable_item = { focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(text->GetComponent(), NODE_FOCUSABLE, &focusable_item);
        
        nodeAPI->addChild(gridItem->GetComponent(), text->GetComponent());
        nodeAPI->addChild(grid->GetComponent(), gridItem->GetComponent());
    }
    return grid;
}

napi_value FocusWrapModeTest::FocusWrapModeTest001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text1 = new TextComponent();
    text1->SetHeight(SIZE_50);
    text1->SetTextContent("方向键不可换行");
    nodeAPI->addChild(parentColumn, text1->GetComponent());
    auto grid1 = CreatGrid(0);
    grid1->SetId("focusWrapModeID0");
    nodeAPI->addChild(parentColumn, grid1->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest001",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value FocusWrapModeTest::FocusWrapModeTest002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text2 = new TextComponent();
    text2->SetHeight(SIZE_50);
    text2->SetTextContent("方向键可换行");
    nodeAPI->addChild(parentColumn, text2->GetComponent());
    auto grid1 = CreatGrid(1);
    grid1->SetId("focusWrapModeID1");
    nodeAPI->addChild(parentColumn, grid1->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value FocusWrapModeTest::FocusWrapModeTest003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text1 = new TextComponent();
    text1->SetHeight(SIZE_50);
    text1->SetTextContent("focusWrapMode:-1");
    nodeAPI->addChild(parentColumn, text1->GetComponent());
    auto grid1 = CreatGrid(-1);
    grid1->SetId("focusWrapModeID2");
    nodeAPI->addChild(parentColumn, grid1->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusWrapModeTest003",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
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

#include "list_scroll_bar_color_test.h"

#include <arkui/native_interface.h>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {

constexpr int SET_BACKGROUND_COLOR_TO_YELLOW = 1;
constexpr int SET_BACKGROUND_COLOR_TO_RED = 2;
constexpr int RESET_BACKGROUND_COLOR = 3;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto list = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == SET_BACKGROUND_COLOR_TO_YELLOW) {
        ArkUI_NumberValue color_value[] = {{.u32 = COLOR_YELLOW}};
        ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(list, NODE_SCROLL_BAR_COLOR, &color_item);
    } else if (eventId == SET_BACKGROUND_COLOR_TO_RED) {
        ArkUI_NumberValue color_value[] = {{.u32 = COLOR_RED}};
        ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(list, NODE_SCROLL_BAR_COLOR, &color_item);
    } else if (eventId == RESET_BACKGROUND_COLOR) {
        nodeAPI->resetAttribute(list, NODE_SCROLL_BAR_COLOR);
    }
}

static napi_value TestListScrollBarColor(napi_env env, napi_callback_info info, const char *listId, int32_t eventId)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue size_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem size_item = {size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH, &size_item);
    nodeAPI->setAttribute(list, NODE_HEIGHT, &size_item);
    ArkUI_AttributeItem id_item = {};
    id_item.string = listId;
    nodeAPI->setAttribute(list, NODE_ID, &id_item);
    nodeAPI->addChild(column, list);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(list, NODE_ON_CLICK, eventId, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollBarColorTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value ListScrollBarColorTest::TestListScrollBarColor001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "TestListScrollBarColor001");
    return TestListScrollBarColor(env, info, "listId1", SET_BACKGROUND_COLOR_TO_YELLOW);
}

napi_value ListScrollBarColorTest::TestListScrollBarColor002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "TestListScrollBarColor002");
    return TestListScrollBarColor(env, info, "listId2", SET_BACKGROUND_COLOR_TO_RED);
}

napi_value ListScrollBarColorTest::TestListScrollBarColor003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollBarColorTest", "TestListScrollBarColor003");
    return TestListScrollBarColor(env, info, "listId3", RESET_BACKGROUND_COLOR);
}
} // namespace ArkUICapiTest
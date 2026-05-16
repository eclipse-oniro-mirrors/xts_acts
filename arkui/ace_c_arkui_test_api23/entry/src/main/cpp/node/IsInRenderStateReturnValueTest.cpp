/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TestIsInRenderStateReturnValue001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle textNode;
    bool isOnRenderTree = false;
    auto result = OH_ArkUI_NativeModule_IsInRenderState(textNode, &isOnRenderTree);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh result 2 is %{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestIsInRenderStateReturnValue002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    bool isOnRenderTree = false;
    auto result = OH_ArkUI_NativeModule_IsInRenderState(text, &isOnRenderTree);

    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh on render tree state is %{public}d", isOnRenderTree);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh on render tree state is %{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(isOnRenderTree, false);

    auto result1 = OH_ArkUI_NativeModule_IsInRenderState(nullptr, &isOnRenderTree);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh on render tree state is %{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestMoveToParam001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    auto result1 = OH_ArkUI_NodeUtils_MoveTo(Text, column, 100000000);
    auto result2 = OH_ArkUI_NodeUtils_MoveTo(Text, column, 100000001);
    auto result3 = OH_ArkUI_NodeUtils_MoveTo(Text, column, -1);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 1 %{public}d", result1);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 2 %{public}d", result2);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 3 %{public}d", result3);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    ArkUI_NodeHandle btn = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto result4 = OH_ArkUI_NodeContent_InsertNode(nullptr, btn, 0);
    auto result5 = OH_ArkUI_NodeContent_InsertNode(nullptr, btn, 100000000);
    auto result6 = OH_ArkUI_NodeContent_InsertNode(nullptr, btn, 100000001);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 4 %{public}d", result4);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 5 %{public}d", result5);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 6 %{public}d", result6);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(result5, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(result6, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto result7 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(0, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "TestMoveToParam001 7 %{public}d", result7);
    ASSERT_EQ(result7, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest
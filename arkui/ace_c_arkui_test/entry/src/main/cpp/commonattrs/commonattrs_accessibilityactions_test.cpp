/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestCommonAttrsAccessibilityActions001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t accessibilityActions = ARKUI_ACCESSIBILITY_ACTION_CLICK;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ACCESSIBILITY_ACTIONS)->value[PARAM_0].u32, accessibilityActions);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityActions002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t accessibilityActions = ARKUI_ACCESSIBILITY_ACTION_PASTE;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ACCESSIBILITY_ACTIONS)->value[PARAM_0].u32, accessibilityActions);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityActions003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t accessibilityActions = PARAM_0;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityActions004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t accessibilityActions = PARAM_17;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static void OnAccessibilityActions(ArkUI_NodeEvent* event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_ACCESSIBILITY_ACTIONS_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnAccessibilityActionsTest", "OnEventReceive eventId: \
            %{public}d", eventId);
    }
}

static napi_value TestCommonAttrsAccessibilityActions005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    nodeAPI->registerNodeEvent(stack, NODE_ON_ACCESSIBILITY_ACTIONS, ON_ACCESSIBILITY_ACTIONS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnAccessibilityActions);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityActions006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t accessibilityActions = ARKUI_ACCESSIBILITY_ACTION_LONG_CLICK;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    auto ret = nodeAPI->resetAttribute(stack, NODE_ACCESSIBILITY_ACTIONS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ACCESSIBILITY_ACTIONS)->value[PARAM_0].u32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest

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

#include "common/common.h"

#include "commonattrs_focusontouch_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static auto CreateChildNodeFocusOnTouch(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t focusOnTouch)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue value[] = {{.i32 = focusOnTouch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(nodeHandle, NODE_FOCUS_ON_TOUCH, &valueItem);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_AttributeItem label_item = {.string = ""};
    nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &label_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceiveFocusOnTouch(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonAttrsFocusOnTouchTest",
        "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_FOCUS_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

void CommonAttrsFocusOnTouchTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeFocusOnTouch(nodeAPI, PARAM_1);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "btnFocusOnTouch";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveFocusOnTouch);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
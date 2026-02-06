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

#include "checkbox_enabled_test.h"
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int enabled, const char *id)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);

    if (enabled != SIZE_100) {
        ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);
    }

    // set id
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);

    // set background color
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    // set width
    ArkUI_NumberValue width_value[] = {{.f32 = CHECKBOX_WIDTH_WEAR}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    // set height
    ArkUI_NumberValue height_value[] = {{.f32 = CHECKBOX_HEIGHT_WEAR}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    // set focusable
    ArkUI_NumberValue focusable_value[] = {{.i32 = FOCUSABLE_TRUE}};
    ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_FOCUSABLE, &focusable_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxEnabledTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxEnabledTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxEnabledTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    uint32_t color = COLOR_RED;
    switch (eventId) {
        case ON_CLICK_EVENT_ID:
            color = COLOR_GREEN;
            break;
        case ON_FOCUS_EVENT_ID:
            color = COLOR_BLUE;
            break;
        case ON_BLUR_EVENT_ID:
            color = COLOR_YELLOW;
            break;
        default:
            break;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

void CheckboxEnabledTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // enabled checkbox
    auto checkboxClick = createChildNode(nodeAPI, PARAM_1, "OnClickEnabledCheckbox");
    auto checkboxFocus = createChildNode(nodeAPI, PARAM_1, "OnFocusEnabledCheckbox");
    auto checkboxBlur = createChildNode(nodeAPI, PARAM_1, "OnBlurEnabledCheckbox");

    // disabled checkbox
    auto checkboxDisabledClick = createChildNode(nodeAPI, PARAM_0, "OnClickDisabledCheckbox");
    auto checkboxDisabledFocus = createChildNode(nodeAPI, PARAM_0, "OnFocusDisabledCheckbox");
    auto checkboxDisabledBlur = createChildNode(nodeAPI, PARAM_0, "OnBlurDisabledCheckbox");

    // abnormal checkbox
    auto checkboxAbnormalClick = createChildNode(nodeAPI, PARAM_NEGATIVE_1, "OnClickAbnormalCheckbox");
    auto checkboxAbnormalFocus = createChildNode(nodeAPI, PARAM_NEGATIVE_1, "OnFocusAbnormalCheckbox");
    auto checkboxAbnormalBlur = createChildNode(nodeAPI, PARAM_NEGATIVE_1, "OnBlurAbnormalCheckbox");

    // set row height
    ArkUI_NumberValue row_height_value[] = {{.f32 = ROW_HEIGHT_WEAR}};
    ArkUI_AttributeItem row_height_item = {row_height_value, sizeof(row_height_value) / sizeof(ArkUI_NumberValue)};

    // set row width
    ArkUI_NumberValue row_width_value[] = {{.f32 = ROW_WIDTH_WEAR}};
    ArkUI_AttributeItem row_width_item = {row_width_value, sizeof(row_width_value) / sizeof(ArkUI_NumberValue)};

    // set row alignment
    ArkUI_NumberValue row_justify_content_value[] = {{.i32 = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND}};
    ArkUI_AttributeItem row_justify_content_item = {row_justify_content_value,
                                                    sizeof(row_justify_content_value) / sizeof(ArkUI_NumberValue)};

    auto rowFirst = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->setAttribute(rowFirst, NODE_WIDTH, &row_width_item);
    nodeAPI->setAttribute(rowFirst, NODE_HEIGHT, &row_height_item);
    nodeAPI->setAttribute(rowFirst, NODE_ROW_JUSTIFY_CONTENT, &row_justify_content_item);

    auto rowSecond = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->setAttribute(rowSecond, NODE_WIDTH, &row_width_item);
    nodeAPI->setAttribute(rowSecond, NODE_HEIGHT, &row_height_item);
    nodeAPI->setAttribute(rowSecond, NODE_ROW_JUSTIFY_CONTENT, &row_justify_content_item);

    auto rowThird = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->setAttribute(rowThird, NODE_WIDTH, &row_width_item);
    nodeAPI->setAttribute(rowThird, NODE_HEIGHT, &row_height_item);
    nodeAPI->setAttribute(rowThird, NODE_ROW_JUSTIFY_CONTENT, &row_justify_content_item);

    auto rowFourth = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->setAttribute(rowFourth, NODE_WIDTH, &row_width_item);
    nodeAPI->setAttribute(rowFourth, NODE_HEIGHT, &row_height_item);
    nodeAPI->setAttribute(rowFourth, NODE_ROW_JUSTIFY_CONTENT, &row_justify_content_item);

    nodeAPI->addChild(rowFirst, checkboxClick);
    nodeAPI->insertChildAfter(rowFirst, checkboxFocus, checkboxClick);
    nodeAPI->insertChildAfter(rowFirst, checkboxBlur, checkboxFocus);

    nodeAPI->addChild(rowSecond, checkboxDisabledClick);
    nodeAPI->insertChildAfter(rowSecond, checkboxDisabledFocus, checkboxDisabledClick);
    nodeAPI->insertChildAfter(rowSecond, checkboxDisabledBlur, checkboxDisabledFocus);

    nodeAPI->addChild(rowThird, checkboxAbnormalClick);
    nodeAPI->insertChildAfter(rowThird, checkboxAbnormalFocus, checkboxAbnormalClick);
    nodeAPI->insertChildAfter(rowThird, checkboxAbnormalBlur, checkboxAbnormalFocus);

    nodeAPI->addChild(column, rowFirst);
    nodeAPI->insertChildAfter(column, rowSecond, rowFirst);
    nodeAPI->insertChildAfter(column, rowThird, rowSecond);
    nodeAPI->insertChildAfter(column, rowFourth, rowThird);

    // Bind event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
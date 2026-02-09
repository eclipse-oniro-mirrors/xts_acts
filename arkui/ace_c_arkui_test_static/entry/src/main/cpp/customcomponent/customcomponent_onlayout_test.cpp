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

#include "customcomponent_onlayout_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static void OnEventReceive(ArkUI_NodeCustomEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnLayoutTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentOnLayoutTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnLayoutTest",
                 "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);

    if (eventId == ON_LAYOUT_EVENT_ID) {
        ArkUI_NumberValue backgroundColorValue[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                                   sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &backgroundColorItem);
        nodeAPI->layoutNode(nodeAPI->getChildAt(nodeHandler, PARAM_0), SIZE_10, SIZE_10);
        nodeAPI->layoutNode(nodeAPI->getChildAt(nodeHandler, PARAM_1), SIZE_100, SIZE_100);
    }
}

void CustomComponentOnLayoutTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto innerComponent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto innerComponentCompare = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue innerSizeValue[] = {{.f32 = SIZE_30}, {.f32 = SIZE_30}};
    ArkUI_AttributeItem innerSizeItem = {innerSizeValue, sizeof(innerSizeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(innerComponent, NODE_SIZE, &innerSizeItem);
    nodeAPI->setAttribute(innerComponentCompare, NODE_SIZE, &innerSizeItem);

    ArkUI_NumberValue innerBackgroundColorValue[] = {{.u32 = COLOR_BLUE}};
    ArkUI_AttributeItem innerBackgroundColorItem = {innerBackgroundColorValue,
                                                    sizeof(innerBackgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(innerComponent, NODE_BACKGROUND_COLOR, &innerBackgroundColorItem);
    nodeAPI->setAttribute(innerComponentCompare, NODE_BACKGROUND_COLOR, &innerBackgroundColorItem);

    ArkUI_NumberValue sizeValue[] = {{.f32 = SIZE_200}, {.f32 = SIZE_200}};
    ArkUI_AttributeItem sizeItem = {sizeValue, sizeof(sizeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(custom, NODE_SIZE, &sizeItem);

    ArkUI_NumberValue backgroundColorValue[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                               sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(custom, NODE_BACKGROUND_COLOR, &backgroundColorItem);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnLayoutTest";
    nodeAPI->setAttribute(custom, NODE_ID, &id_item);

    nodeAPI->addChild(custom, innerComponent);
    nodeAPI->addChild(custom, innerComponentCompare);
    nodeAPI->addChild(column, custom);

    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeCustomEvent(custom, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
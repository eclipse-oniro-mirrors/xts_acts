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

#include "refresh_offsetEvent_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#define ON_REFRESHING_EVENT_ID 1315
#define SIZE_140 140
namespace ArkUIAniTest {
static ArkUI_NodeHandle refresh1;
static ArkUI_NodeHandle refresh3;
static ArkUI_NativeNodeAPI_1 *nodeAPI1;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    int32_t eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (eventId == ON_REFRESHING_EVENT_ID) {
        auto refresh = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_YELLOW } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(refresh, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

static void BasicSet()
{
    refresh1 = nodeAPI1->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue offset_value[] = {{.f32 = SIZE_140}};
    ArkUI_NumberValue pull_value[] = {{.i32 = true}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem pull_item = {pull_value, sizeof(pull_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(refresh1, NODE_WIDTH, &width_item);
    nodeAPI1->setAttribute(refresh1, NODE_HEIGHT, &height_item);
    nodeAPI1->setAttribute(refresh1, NODE_REFRESH_OFFSET, &offset_item);
    nodeAPI1->setAttribute(refresh1, NODE_REFRESH_PULL_TO_REFRESH, &pull_item);
    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI1->setAttribute(refresh1, NODE_BACKGROUND_COLOR, &background_color_item);
}
static void BasicSet3()
{
    refresh3 = nodeAPI1->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue offset_value[] = {{.f32 = SIZE_140}};
    ArkUI_NumberValue pull_value[] = {{.i32 = true}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem pull_item = {pull_value, sizeof(pull_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(refresh3, NODE_WIDTH, &width_item);
    nodeAPI1->setAttribute(refresh3, NODE_HEIGHT, &height_item);
    nodeAPI1->setAttribute(refresh3, NODE_REFRESH_OFFSET, &offset_item);
    nodeAPI1->setAttribute(refresh3, NODE_REFRESH_PULL_TO_REFRESH, &pull_item);

    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI1->setAttribute(refresh3, NODE_BACKGROUND_COLOR, &background_color_item);
}
void RefreshOffsetTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);

    BasicSet();

    ArkUI_AttributeItem idItem;
    idItem.string = "RefreshOffsetChangeBigThanOffset";
    nodeAPI1->setAttribute(refresh1, NODE_ID, &idItem);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, refresh1);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
void RefreshOffsetTest::CreateNativeNodeLessThanOffset(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);

    BasicSet3();

    ArkUI_AttributeItem idItem;
    idItem.string = "RefreshOffsetChangeLessThanOffset";
    nodeAPI1->setAttribute(refresh3, NODE_ID, &idItem);

    nodeAPI1->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI1->registerNodeEvent(refresh3, NODE_REFRESH_ON_REFRESH, ON_REFRESHING_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, refresh3);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
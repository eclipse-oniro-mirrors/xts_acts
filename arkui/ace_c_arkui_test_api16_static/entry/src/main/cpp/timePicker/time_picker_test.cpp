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

#include "time_picker_test.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {
auto ShowPage(int32_t timepicker)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle timePicker = nodeAPI->createNode(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue cascadeValue[] = {{.i32 = timepicker}};
    ArkUI_AttributeItem cascadeItem = {cascadeValue, sizeof(cascadeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_TIME_PICKER_ENABLE_CASCADE, &cascadeItem);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_MARGIN, &margin_item);
    return timePicker;
}
auto ShowPage1()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle timePicker = nodeAPI->createNode(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue cascadeValue[] = {};
    ArkUI_AttributeItem cascadeItem = {cascadeValue, sizeof(cascadeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_TIME_PICKER_ENABLE_CASCADE, &cascadeItem);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_MARGIN, &margin_item);
    return timePicker;
}
void TimePickerTest::TimePickerTestEnableCascade(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto timePicker1 = ShowPage(true);
    auto timePicker2 = ShowPage(false);
    auto timePicker3 = ShowPage1();
    nodeAPI->addChild(column, timePicker1);
    nodeAPI->addChild(column, timePicker2);
    nodeAPI->addChild(column, timePicker3);
    ArkUI_AttributeItem textId1 = {.string = "timePicker_001"};
    ArkUI_AttributeItem textId2 = {.string = "timePicker_002"};
    ArkUI_AttributeItem textId3 = {.string = "timePicker_003"};
    nodeAPI->setAttribute(timePicker1, NODE_ID, &textId1);
    nodeAPI->setAttribute(timePicker2, NODE_ID, &textId2);
    nodeAPI->setAttribute(timePicker3, NODE_ID, &textId3);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // ArkUIAniTest

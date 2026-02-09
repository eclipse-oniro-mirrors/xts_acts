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

#include "grid_nodeadapter_test.h"
#include "../component/grid_component.h"
#include "../component/text_component.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <cassert>

namespace ArkUIAniTest {

ArkUI_NativeNodeAPI_1 *_nodeAPI2 = nullptr;

static void OnAdapterEventReceive(ArkUI_NodeAdapterEvent *event)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int type = OH_ArkUI_NodeAdapterEvent_GetType(event);
    if (NODE_ADAPTER_EVENT_ON_ADD_NODE_TO_ADAPTER == type) {
        auto text = std::make_shared<TextComponent>();
        text->SetBackgroundColor(COLOR_RED);
        text->SetId("text");
        OH_ArkUI_NodeAdapterEvent_SetItem(event, text->GetComponent());
    }
}

static void SetAdapter(ArkUI_NodeHandle handle, int32_t nodeCount)
{
    auto adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, &OnAdapterEventReceive);
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, nodeCount);
    ArkUI_AttributeItem adapterItem{.object = adapter};
    _nodeAPI2->setAttribute(handle, NODE_GRID_NODE_ADAPTER, &adapterItem);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    _nodeAPI2->setAttribute(handle, NODE_BACKGROUND_COLOR, &background_color_item);
}

void GridAdapterTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI2);
    auto grid = std::make_shared<GridComponent>();
    grid->SetId("grid");
    grid->SetWidth(SIZE_100);
    grid->SetHeight(SIZE_50);
    SetAdapter(grid->GetComponent(), PARAM_5);

    auto column = _nodeAPI2->createNode(ARKUI_NODE_COLUMN);
    _nodeAPI2->addChild(column, grid->GetComponent());

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
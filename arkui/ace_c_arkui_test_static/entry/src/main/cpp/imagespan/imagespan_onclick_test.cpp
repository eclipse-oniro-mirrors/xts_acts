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

#include "imagespan_onclick_test.h"

#include "../component/imagespan_component.h"
#include "../component/text_component.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

void ImagespanOnClickTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = new TextComponent();
    text->SetWidth(SIZE_200);
    text->SetHeight(SIZE_200);
    text->SetBackgroundColor(COLOR_GRAY);
    text->SetId("imageSpanClickText");
    
    auto imageSpan = new ImageSpanComponent();
    imageSpan->SetWidth(SIZE_200);
    imageSpan->SetHeight(SIZE_200);
    imageSpan->SetBorderWidth(SIZE_10);
    imageSpan->SetMargin(SIZE_10);
    imageSpan->SetImageSpanAlt("resource://media/green.jgp");
    imageSpan->SetId("imageSpanClick");
    imageSpan->RegisterOnClick([text]() { text->SetBackgroundColor(COLOR_RED); });

    nodeAPI->addChild(column, text->GetComponent());
    nodeAPI->addChild(text->GetComponent(), imageSpan->GetComponent());

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
}
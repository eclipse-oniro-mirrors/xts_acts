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

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


#include "../component/button_component.h"
#include "../component/column_component.h"
#include "../component/image_component.h"
#include "image_onfinish_test.h"
#include "../component/text_component.h"

namespace ArkUIAniTest {
ImageComponent* image;
TextComponent* text;
ColumnComponent* columnParent;
static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageOnFinishTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageOnFinishTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageOnFinishTest", "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (eventId == 1) {
        nodeAPI->removeChild(columnParent->GetComponent(), image->GetComponent());
    } else if (eventId == 0) {
        text->SetBackgroundColor(COLOR_RED);
    }
}

void ImageOnFinishTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    columnParent = new ColumnComponent();
    image = new ImageComponent();
    image->SetWidth(SIZE_100);
    image->SetHeight(SIZE_100);
    image->SetImageSrc("./resources/base/media/animated_circle_stop.svg");
    image->SetMargin(SIZE_10);
    text = new TextComponent();
    text->SetWidth(SIZE_200);
    text->SetHeight(SIZE_200);
    text->SetBackgroundColor(COLOR_GRAY);
    text->SetId("OnFinish");
    nodeAPI->registerNodeEvent(image->GetComponent(), NODE_IMAGE_ON_SVG_PLAY_FINISH, 0, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    columnParent->AddChild(std::shared_ptr<ImageComponent>(image));
    columnParent->AddChild(std::shared_ptr<TextComponent>(text));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, columnParent->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
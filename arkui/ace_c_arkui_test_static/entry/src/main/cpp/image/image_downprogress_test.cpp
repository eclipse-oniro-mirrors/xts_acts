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


#include "../component/column_component.h"
#include "../component/image_component.h"
#include "image_downprogress_test.h"
#include "../component/text_component.h"

namespace ArkUIAniTest {
ColumnComponent* column;
TextComponent* textShow;
static void OnEventReceive(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageDownProgressTest",
        "OnEventReceive eventType: %{public}d,NODE_IMAGE_ON_DOWNLOAD_PROGRESS=%{public}d", eventType,
        NODE_IMAGE_ON_DOWNLOAD_PROGRESS);
    ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    int32_t dlNow = result->data[0].u32;
    int32_t dlTotal = result->data[1].u32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ImageDownProgressTest", "dlNow: %{public}d,dlTotal=%{public}d",
        dlNow, dlTotal);
    textShow->SetBackgroundColor(COLOR_RED);
}

void ImageDownProgressTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    column = new ColumnComponent();
    auto image = new ImageComponent();
    image->SetWidth(SIZE_300);
    image->SetHeight(SIZE_300);
    image->SetObjectFit(ArkUI_ObjectFit::ARKUI_OBJECT_FIT_NONE);
    image->SetImageSrc("https://gitee.com/openharmony/docs/raw/master/zh-cn/application-dev/reference/apis-arkui/"
                       "arkui-ts/figures/edgewidths.png");
    nodeAPI->registerNodeEvent(image->GetComponent(), NODE_IMAGE_ON_DOWNLOAD_PROGRESS, 0, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    textShow = new TextComponent();
    textShow->SetBackgroundColor(COLOR_GRAY);
    textShow->SetWidth(SIZE_100);
    textShow->SetHeight(SIZE_100);
    textShow->SetId("downprogress");

    column->AddChild(std::shared_ptr<ImageComponent>(image));
    column->AddChild(std::shared_ptr<TextComponent>(textShow));
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest

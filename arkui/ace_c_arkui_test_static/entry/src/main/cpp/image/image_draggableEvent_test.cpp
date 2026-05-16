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

#include "image_draggableEvent_test.h"

#include <arkui/drag_and_drop.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_err_code.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <database/udmf/utd.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


#include "../component/column_component.h"
#include "../component/image_component.h"
#include "../component/row_component.h"
#include "../component/text_component.h"

namespace ArkUIAniTest {
TextComponent* textTrue;

static std::shared_ptr<ImageComponent> CreateImageNodeDrag(const std::string &id)
{
    auto dropImageAreaTrue = std::make_shared<ImageComponent>();
    dropImageAreaTrue->SetWidth(SIZE_200);
    dropImageAreaTrue->SetHeight(SIZE_200);
    dropImageAreaTrue->SetBorderWidth(SIZE_5);
    dropImageAreaTrue->SetMargin(SIZE_10);
    dropImageAreaTrue->SetId("dropImageAreaTrue");
    return dropImageAreaTrue;
}
static std::shared_ptr<ImageComponent> CreateImageNode(const std::string &id)
{
    auto imageTrue = std::make_shared<ImageComponent>();
    imageTrue->SetImageSrc("./resources/base/media/icon.png");
    imageTrue->SetWidth(SIZE_100);
    imageTrue->SetHeight(SIZE_100);
    imageTrue->SetImageDraggable(true);
    imageTrue->SetId("imageDragTrue");
    return imageTrue;
}
void ImageDraggableTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = new RowComponent();
    auto imageTrue = CreateImageNode("imageDragTrue");
    auto dropImageAreaTrue = CreateImageNodeDrag("dropImageAreaTrue");
    textTrue = new TextComponent();
    textTrue->SetWidth(SIZE_100);
    textTrue->SetHeight(SIZE_100);
    textTrue->SetBackgroundColor(COLOR_GRAY);
    textTrue->SetMargin(SIZE_10);
    textTrue->SetId("textTrue");
    nodeAPI->registerNodeEvent(dropImageAreaTrue->GetComponent(), NODE_ON_DROP, 0, nullptr);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (targetId == 0) {
            textTrue->SetBackgroundColor(COLOR_RED);
        }
    });

    row1->AddChild(std::shared_ptr<ImageComponent>(imageTrue));
    row1->AddChild(std::shared_ptr<ImageComponent>(dropImageAreaTrue));
    row1->AddChild(std::shared_ptr<TextComponent>(textTrue));

    nodeAPI->addChild(column, row1->GetComponent());
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
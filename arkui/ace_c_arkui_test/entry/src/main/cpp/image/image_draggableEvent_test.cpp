/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "../manager/plugin_manager.h"
#include "column_component.h"
#include "image_component.h"
#include "row_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
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
napi_value ImageDraggableTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "imageNODEIMAGEDRAGGABLETest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "imageNODEIMAGEDRAGGABLETest", "GetConimage env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

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
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "imageNODEIMAGEDRAGGABLETest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
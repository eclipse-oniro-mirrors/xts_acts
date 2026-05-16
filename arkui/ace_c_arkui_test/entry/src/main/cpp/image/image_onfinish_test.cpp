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

#include <string>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "column_component.h"
#include "image_component.h"
#include "image_onfinish_test.h"
#include "text_component.h"

namespace ArkUICapiTest {
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

napi_value ImageOnFinishTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageOnFinishTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageOnFinishTest", "GetConimage env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 columnParent->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageOnFinishTest",
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
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
#include "column_component.h"
#include "image_component.h"
#include "image_downprogress_test.h"
#include "text_component.h"

namespace ArkUICapiTest {
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

napi_value ImageDownProgressTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDownProgressTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDownProgressTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ImageDownProgressTest",
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

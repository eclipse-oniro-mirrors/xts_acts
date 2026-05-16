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

#include "swiper_adapter_test.h"
#include "swiper_component.h"
#include "text_component.h"
#include "../manager/plugin_manager.h"
#include <string>
#include <cassert>

namespace ArkUICapiTest {

ArkUI_NativeNodeAPI_1 *_nodeAPI = nullptr;

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
    _nodeAPI->setAttribute(handle, NODE_SWIPER_NODE_ADAPTER, &adapterItem);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    _nodeAPI->setAttribute(handle, NODE_BACKGROUND_COLOR, &background_color_item);
}

napi_value SwiperAdapterTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperAdapterTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetId("swiper");
    swiper->SetWidth(SIZE_100);
    swiper->SetHeight(SIZE_50);
    swiper->SetMargin(PARAM_10);
    swiper->SetSwiperAutoPlay(true);
    SetAdapter(swiper->GetComponent(), PARAM_5);

    auto column = _nodeAPI->createNode(ARKUI_NODE_COLUMN);
    _nodeAPI->addChild(column, swiper->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperAdapterTest",
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
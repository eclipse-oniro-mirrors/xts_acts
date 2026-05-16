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
#include "../component/swiper_component.h"
#include "../component/text_component.h"
#include "../manager/plugin_manager.h"
#include "swiper_common.h"
#include "swiper_onselect_test.h"
 
namespace ArkUICapiTest {
 
static std::shared_ptr<TextComponent> CreateTextNode(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    return text;
}
 
static std::shared_ptr<SwiperComponent> CreateSwiperNode(const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFF);
    const double half = 0.5;
    swiper->SetPercentWidth(half);
    swiper->SetPercentHeight(half);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(true);
    swiper->SetId(id);
    auto text = CreateTextNode(0xFFAFEEEE);
    auto text_second = CreateTextNode(0xFF00FF00);
    swiper->AddChild(text);
    swiper->AddChild(text_second);
    text->SetId("OnSelectTest");
    return swiper;
}
 
napi_value SwiperOnSelectTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnSelectTest", "CreateNativeNode");
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnSelectTest", "GetContext env or info is null");
        return nullptr;
    }
 
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto swiper = CreateSwiperNode("OnSelectTestSwiper");
    auto text = std::make_shared<TextComponent>();
    swiper->RegisterOnSelect([swiper, text](ArkUI_NodeEvent* event) {
        ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        std::string str = "Page: " + std::to_string(result->data[0].i32);
        text->SetTextContent(str);
        auto node = nodeAPI->getChildAt(nodeHandler, result->data[0].i32);
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_RED } };
        ArkUI_AttributeItem background_color_value_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_value_item);
    });
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, text->GetComponent());
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnSelectTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
 
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    
    return exports;
}
} // namespace ArkUICApiDemo
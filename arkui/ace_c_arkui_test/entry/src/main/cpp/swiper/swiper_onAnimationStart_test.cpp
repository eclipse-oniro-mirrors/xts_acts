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
#include "swiper_onAnimationStart_test.h"
#include "swiper_component.h"
#include "text_component.h"
#include "../manager/plugin_manager.h"
#include <string>
#define SIZE_800 800
namespace ArkUICapiTest {

static std::shared_ptr<TextComponent> CreateTextNode(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    return text;
}

static std::shared_ptr<SwiperComponent> CreateSwiperNode(const std::string &id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFFF);
    swiper->SetWidth(SIZE_200);
    swiper->SetHeight(SIZE_100);
    swiper->SetMargin(PARAM_20);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(true);
    swiper->SetSwiperIndex(PARAM_2);
    swiper->SetId(id);
    auto text = CreateTextNode(0xFFAFEEEE);
    auto text_second = CreateTextNode(0xFF00FF00);
    auto text_third = CreateTextNode(0xFFFF0000);
    auto text_fourth = CreateTextNode(0xFF0000FF);
    swiper->AddChild(text);
    swiper->AddChild(text_second);
    swiper->AddChild(text_third);
    swiper->AddChild(text_fourth);
    return swiper;
}

napi_value SwiperOnAnimationStartTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnAnimationStartTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnGestureSwipeTest", "GetContext info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text_start = std::make_shared<TextComponent>();
    text_start->SetTextContent("test");
    auto swiper = CreateSwiperNode("SwiperOnAnimationStart");
    swiper->RegisterOnAnimationStart([swiper](ArkUI_NodeEvent *event) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        ArkUI_NativeNodeAPI_1 *nodeAPI1 = nullptr;
        if (result->data[PARAM_0].i32 == PARAM_2 && result->data[PARAM_1].i32 == PARAM_3 &&
            result->data[PARAM_2].f32 == PARAM_0 && result->data[PARAM_3].f32 == SIZE_200 &&
            result->data[PARAM_4].f32 == PARAM_0) {
            swiper->SetBackgroundColor(COLOR_GREEN);
        }
    });

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, text_start->GetComponent());
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnAnimationStartTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
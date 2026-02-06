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

#include "swiper_onChange_test.h"
#include "swiper_component.h"
#include "text_component.h"
#include "../manager/plugin_manager.h"
#include <string>

#define ON_CHANGE_ID 6061
namespace ArkUICapiTest {

static std::shared_ptr<TextComponent> CreateTextNode(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    return text;
}
static std::shared_ptr<TextComponent> CreateTextNode2(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    return text;
}
static std::shared_ptr<SwiperComponent> CreateSwiperNode(const std::string &id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFF);
    swiper->SetWidth(SIZE_200);
    swiper->SetHeight(SIZE_100);
    swiper->SetMargin(PARAM_20);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(false);
    swiper->SetId(id);
    swiper->SetSwiperIndex(PARAM_1);
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
static std::shared_ptr<SwiperComponent> CreateSwiperNode2(const std::string &id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFF);
    swiper->SetWidth(SIZE_200);
    swiper->SetHeight(SIZE_100);
    swiper->SetMargin(PARAM_20);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(true);
    swiper->SetId(id);
    swiper->SetSwiperIndex(PARAM_2);
    auto text = CreateTextNode2(0xFFAFEEEE);
    auto text_second = CreateTextNode2(0xFF00FF00);
    auto text_third = CreateTextNode2(0xFFFF0000);
    auto text_fourth = CreateTextNode2(0xFF0000FF);
    swiper->AddChild(text);
    swiper->AddChild(text_second);
    swiper->AddChild(text_third);
    swiper->AddChild(text_fourth);
    return swiper;
}
napi_value SwiperOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto swiper = CreateSwiperNode("OnChangeTestSwiper");
    auto text = std::make_shared<TextComponent>();
    swiper->RegisterOnChange([swiper, text](ArkUI_NodeEvent *event) {
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        std::string str = "Page: " + std::to_string(result->data[PARAM_0].i32);
        text->SetTextContent(str);
        if (result->data[PARAM_0].i32 == PARAM_2) {
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, text->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperOnChangeTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value SwiperOnChangeTest::CreateNativeNodeSwipeToIndex(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestSwiperSwipeToIndex", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto swiper = CreateSwiperNode2("TestSwiperSwipeToIndex");
    auto text = std::make_shared<TextComponent>();
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, swiper->GetComponent());
    nodeAPI->addChild(column, text->GetComponent());
    auto index = 0;
    swiper->RegisterOnChange([swiper, index](ArkUI_NodeEvent *event) {
        swiper->SetSwiperToIndex(index, true);
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        std::string str = "Page: " + std::to_string(result->data[0].i32);
        if (result->data[PARAM_0].i32 == PARAM_0) {
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestSwiperSwipeToIndex",
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
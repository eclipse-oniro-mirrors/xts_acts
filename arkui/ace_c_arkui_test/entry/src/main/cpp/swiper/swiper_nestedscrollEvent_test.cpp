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

#include "swiper_nestedscrollEvent_test.h"
#include <string>
#include "../manager/plugin_manager.h"
#include "swiper_component.h"
#include "text_component.h"
#define SIZE_2000 2000
namespace ArkUICapiTest {

static std::shared_ptr<TextComponent> CreateText(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetBackgroundColor(color);
    text->SetMargin(PARAM_10);
    return text;
}

static std::shared_ptr<SwiperComponent> CreateParentSwiper()
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetBackgroundColor(0xFFFFFFFF);
    swiper->SetWidth(SIZE_250);
    swiper->SetHeight(SIZE_150);
    swiper->SetSwiperAutoPlay(false);
    swiper->SetSwiperLoop(false);
    swiper->SetMargin(PARAM_10);
    return swiper;
}

static std::shared_ptr<SwiperComponent> CreateSwiper(const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, PARAM_20);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, COLOR_YELLOW);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, COLOR_RED);
    swiper->SetSwiperIndicator(indicator);
    swiper->SetBackgroundColor(0xFFFFFFFF);
    swiper->SetWidth(SIZE_200);
    swiper->SetHeight(SIZE_100);
    swiper->SetMargin(PARAM_10);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(false);
    swiper->SetSwiperInterval(SIZE_2000);
    swiper->SetId(id);

    return swiper;
}
static std::shared_ptr<SwiperComponent> CreateChildSwiper(const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, PARAM_10);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, PARAM_10);
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, PARAM_10);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, PARAM_10);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, COLOR_BLUE);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, COLOR_YELLOW);
    swiper->SetSwiperIndicator(indicator);
    swiper->SetBackgroundColor(0xFFFFFFFF);
    swiper->SetWidth(SIZE_100);
    swiper->SetHeight(SIZE_50);
    swiper->SetMargin(PARAM_10);
    swiper->SetSwiperLoop(false);
    swiper->SetSwiperAutoPlay(true);
    swiper->SetSwiperInterval(SIZE_2000);
    swiper->SetId(id);
    auto text = CreateText(COLOR_GREEN);
    swiper->AddChild(text);
    return swiper;
}
napi_value SwiperNestedScrollTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperNestedScrollTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text_first = CreateText(0xFFAFEEEE);
    auto parentSwiper = CreateParentSwiper();
    auto swiper = CreateSwiper("SwiperNestedScroll");
    swiper->SetSwiperNestedScroll(ARKUI_SWIPER_NESTED_SRCOLL_SELF_ONLY);

    auto childSwiper = CreateChildSwiper("ChildSwiperNestedScroll");
    childSwiper->SetSwiperNestedScroll(ARKUI_SWIPER_NESTED_SRCOLL_SELF_ONLY);

    swiper->AddChild(childSwiper);
    parentSwiper->SetSwiperIndex(1);
    parentSwiper->AddChild(text_first);
    parentSwiper->AddChild(swiper);
    auto text = CreateText(COLOR_PINK);
    swiper->AddChild(text);
    swiper->RegisterOnChange([swiper](ArkUI_NodeEvent *event) {
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[PARAM_0].i32 == PARAM_1) {
            swiper->SetBackgroundColor(COLOR_GREEN);
        }
    });
    // parent node
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, parentSwiper->GetComponent());
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperNestedScrollTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value SwiperNestedScrollTest::CreateNativeNodeChild(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperNestedScrollTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text_first = CreateText(0xFFAFEEEE);
    auto parentSwiper = CreateParentSwiper();
    auto swiper = CreateSwiper("SwiperNestedScroll1");
    swiper->SetSwiperNestedScroll(ARKUI_SWIPER_NESTED_SRCOLL_SELF_FIRST);

    auto childSwiper = CreateChildSwiper("ChildSwiperNestedScroll");
    childSwiper->SetSwiperNestedScroll(ARKUI_SWIPER_NESTED_SRCOLL_SELF_FIRST);

    swiper->AddChild(childSwiper);
    parentSwiper->SetSwiperIndex(1);
    parentSwiper->AddChild(text_first);
    parentSwiper->AddChild(swiper);
    auto text = CreateText(COLOR_PINK);
    swiper->AddChild(text);
    swiper->RegisterOnChange([swiper](ArkUI_NodeEvent *event) {
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[PARAM_0].i32 == PARAM_1) {
            swiper->SetBackgroundColor(COLOR_GREEN);
        }
    });
    // parent node
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, parentSwiper->GetComponent());
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperNestedScrollTest",
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
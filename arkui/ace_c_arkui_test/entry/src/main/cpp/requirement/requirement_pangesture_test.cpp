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

#include "requirement_pangesture_test.h"

#include <arkui/native_gesture.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"
#include "swiper_component.h"

namespace ArkUICapiTest {

ArkUI_NativeNodeAPI_1* RequirementPanGestureTest::nodeAPI = nullptr;

static void OnEventGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto swipe = OH_ArkUI_GestureEvent_GetNode(event);
    ArkUI_NumberValue ColorValue[] = { { .u32 = COLOR_BLACK } };
    ArkUI_AttributeItem ColorItem = { ColorValue, sizeof(ColorValue) / sizeof(ArkUI_NumberValue) };
    RequirementPanGestureTest::nodeAPI->setAttribute(swipe, NODE_BACKGROUND_COLOR, &ColorItem);
}

static std::shared_ptr<TextComponent> CreateTextNodeToRequirement(uint32_t color)
{
    auto text = std::make_shared<TextComponent>();
    text->SetWidth(SIZE_30);
    text->SetHeight(SIZE_30);
    text->SetBackgroundColor(color);
    text->SetTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
    return text;
}

static auto CreateSwiperNodeToFirstRequirement(ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    swiper->SetHeight(SIZE_30);
    swiper->SetWidth(SIZE_30);
    swiper->SetBorderWidth(PARAM_1);
    swiper->SetId(id);
    swiper->SetMargin(DEFAULT_MARGIN);
    auto panGesture = gestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(swiper->GetComponent(), panGesture, NORMAL, NORMAL_GESTURE_MASK);
    return swiper;
}

static auto CreateSwiperNodeToSecondRequirement(ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id)
{
    auto swiper = std::make_shared<SwiperComponent>();
    auto text1 = CreateTextNodeToRequirement(COLOR_GREEN);
    auto text2 = CreateTextNodeToRequirement(COLOR_BLUE);
    auto text3 = CreateTextNodeToRequirement(COLOR_RED);
    std::vector<std::shared_ptr<TextComponent>> texts = { text1, text2, text3 };
    swiper->SetHeight(SIZE_30);
    swiper->SetWidth(SIZE_30);
    swiper->SetBorderWidth(PARAM_1);
    swiper->SetId(id);
    swiper->SetMargin(DEFAULT_MARGIN);
    for (auto text : texts) {
        swiper->AddChild(text);
    }
    auto panGesture = gestureAPI->createPanGesture(1, GESTURE_DIRECTION_ALL, 5);
    gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(swiper->GetComponent(), panGesture, NORMAL, NORMAL_GESTURE_MASK);
    return swiper;
}
static void createGesture(ArkUI_NativeGestureAPI_1* gestureAPI, ArkUI_NodeHandle columnP1, ArkUI_NodeHandle columnP2)
{
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP1, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper1")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP1, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper2")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP1, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper3")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP1, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper4")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP1, CreateSwiperNodeToSecondRequirement(gestureAPI, "swiper5")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP2, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper6")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP2, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper7")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP2, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper8")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP2, CreateSwiperNodeToFirstRequirement(gestureAPI, "swiper9")->GetComponent());
    RequirementPanGestureTest::nodeAPI->addChild(
        columnP2, CreateSwiperNodeToSecondRequirement(gestureAPI, "swiper10")->GetComponent());
}
napi_value RequirementPanGestureTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementPanGestureTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementPanGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, RequirementPanGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto columnP1 = RequirementPanGestureTest::nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto columnP2 = RequirementPanGestureTest::nodeAPI->createNode(ARKUI_NODE_COLUMN);
    createGesture(gestureAPI, columnP1, columnP2);
    auto row = RequirementPanGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    RequirementPanGestureTest::nodeAPI->addChild(row, columnP1);
    RequirementPanGestureTest::nodeAPI->addChild(row, columnP2);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementPanGestureTest",
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
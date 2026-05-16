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

#include "FinishAnimationTest.h"
#include <string>
#include <arkui/native_interface.h>
#include <memory>
#include "component/ColumnComponentTest.h"
#include "common/common.h"
#include "component/TextComponentTest.h"
#include "component/RowComponentTest.h"
#include "component/ListComponentTest.h"
#include "component/ButtonComponentTest.h"
#include "component/SwiperComponentTest.h"
#include "manager/PluginManagerTest.h"

constexpr float DURATION = 30000;
constexpr int32_t CURVE = 1;
constexpr int32_t AUTOPLAY = 1;
constexpr int32_t LOOP = 0;

static ArkUI_NodeHandle Text = nullptr;
namespace ArkUICapiTest {
 napi_value SwiperFinishAnimationTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperFinishAnimationTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto parentColumn = std::make_shared<ColumnComponent>();
    auto swiper = std::make_shared<SwiperComponent>();
    auto button = std::make_shared<ButtonComponent>();
    auto button2 = std::make_shared<ButtonComponent>();
    auto button3 = std::make_shared<ButtonComponent>();
    button->SetId("button1");
    button->SetLabel("StartStart");

    button2->SetId("button2");
    button3->SetId("button3");
    button3->SetLabel("init");
    int32_t eventId = OH_ArkUI_Swiper_FinishAnimation(nullptr);
    std::string str = std::to_string(eventId);
    button2->SetLabel(str);
    
    swiper->SetWidth(SIZE_300);
    swiper->SetHeight(SIZE_300);
    swiper->SetSwiperEffectMode(ARKUI_EDGE_EFFECT_FADE);
    swiper->RegisterOnAnimationStart([swiper, button, button3](ArkUI_NodeEvent *event) {
        int32_t eventId = OH_ArkUI_Swiper_FinishAnimation(swiper->GetComponent());
        std::string str = std::to_string(eventId);
        button3->SetLabel(str);
    });
    swiper->RegisterOnAnimationEnd([swiper, button](ArkUI_NodeEvent *event) {
        button->SetLabel("EndEnd");
    });
    swiper->SetSwiperCurve(CURVE);
    swiper->SetSwiperAutoPlay(AUTOPLAY);
    swiper->SetSwiperDuration(DURATION);
    swiper->SetSwiperLoop(LOOP);
    auto text1 = std::make_shared<TextComponent>();
    text1->SetBackgroundColor(0xFFAFEEEE);
    swiper->AddChild(text1);
    auto text2 = std::make_shared<TextComponent>();
    text2->SetBackgroundColor(0xFF800080);
    swiper->AddChild(text2);
    parentColumn->AddChild(swiper);
    parentColumn->AddChild(button);
    parentColumn->AddChild(button2);
    parentColumn->AddChild(button3);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperFinishAnimationTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}
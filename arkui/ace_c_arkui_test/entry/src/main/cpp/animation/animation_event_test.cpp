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
#include "animation_event_test.h"

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <string>

#include "../manager/plugin_manager.h"
#include "common/common.h"

namespace ArkUICapiTest {

std::shared_ptr<Component> CreateButtonWithId(const std::string& id)
{
    auto button = std::make_shared<Component>(ARKUI_NODE_BUTTON);
    button->SetWidth(PARAM_50);
    button->SetHeight(PARAM_50);
    button->SetMargin(PARAM_10);
    button->SetId(id);
    return button;
}

static void SetAnimateTo(ArkUI_NodeHandle column)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDuration(animateOption, SIZE_500);
    auto context = OH_ArkUI_GetContextByNode(column);
    auto contextCallback = ArkUI_ContextCallback { column,
        [](void* userData) {
            ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
            if (nodeHandle) {
                auto node = std::make_shared<Component>(nodeHandle);
                node->SetWidth(SIZE_100);
            }
        }
    };
    auto completeCallback = ArkUI_AnimateCompleteCallback { ARKUI_FINISH_CALLBACK_REMOVED,
        [](void* userData) {
            ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
            if (nodeHandle) {
                auto node = std::make_shared<Component>(nodeHandle);
                node->SetBackgroundColor(COLOR_GREEN);
            }
        },
        column };
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    animateAPI->animateTo(context, animateOption, &contextCallback, &completeCallback);
}

napi_value AnimationEventTest::TestAnimateOption001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimateOption001");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button = std::make_shared<Component>(ARKUI_NODE_BUTTON);
    button->SetWidth(PARAM_50);
    button->SetHeight(PARAM_50);
    button->SetMargin(PARAM_10);
    button->SetId("Button1");
    column->AddChild(button);
    auto column1 = std::make_shared<ColumnComponent>();
    column1->SetWidth(PARAM_50);
    column1->SetHeight(PARAM_50);
    column1->SetBorderWidth(PARAM_1);
    column1->SetId("Animation1");
    column->AddChild(column1);

    button->RegisterOnClick([column1]() { SetAnimateTo(column1->GetComponent()); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void RegisterOnFinishCallback(ArkUI_NodeHandle column)
{
    auto keyframeAnimateOption = OH_ArkUI_KeyframeAnimateOption_Create(1);
    OH_ArkUI_KeyframeAnimateOption_SetDuration(keyframeAnimateOption, SIZE_500, PARAM_0);
    OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(keyframeAnimateOption, column, [](void* userData) {
        ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_GREEN);
        }
    });
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    animateAPI->keyframeAnimateTo(context, keyframeAnimateOption);
}

napi_value AnimationEventTest::TestKeyframeAnimateOption012(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestKeyframeAnimateOption012");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button = std::make_shared<Component>(ARKUI_NODE_BUTTON);
    button->SetWidth(PARAM_50);
    button->SetHeight(PARAM_50);
    button->SetMargin(PARAM_10);
    button->SetId("Button2");
    column->AddChild(button);
    auto column2 = std::make_shared<ColumnComponent>();
    column2->SetWidth(PARAM_50);
    column2->SetHeight(PARAM_50);
    column2->SetBorderWidth(PARAM_1);
    column2->SetId("Animation2");
    column->AddChild(column2);

    button->RegisterOnClick([column2]() { RegisterOnFinishCallback(column2->GetComponent()); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void RegisterOnEventCallback(ArkUI_NodeHandle column)
{
    auto keyframeAnimateOption = OH_ArkUI_KeyframeAnimateOption_Create(1);
    OH_ArkUI_KeyframeAnimateOption_SetDuration(keyframeAnimateOption, SIZE_500, PARAM_0);
    OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(
        keyframeAnimateOption, column,
        [](void* userData) {
            ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
            if (nodeHandle) {
                auto node = std::make_shared<Component>(nodeHandle);
                node->SetWidth(SIZE_100);
            }
        },
        PARAM_0);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    animateAPI->keyframeAnimateTo(context, keyframeAnimateOption);
}

napi_value AnimationEventTest::TestKeyframeAnimateOption023(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestKeyframeAnimateOption023");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button = std::make_shared<Component>(ARKUI_NODE_BUTTON);
    button->SetWidth(PARAM_50);
    button->SetHeight(PARAM_50);
    button->SetMargin(PARAM_10);
    button->SetId("Button3");
    column->AddChild(button);
    auto column3 = std::make_shared<ColumnComponent>();
    column3->SetWidth(PARAM_50);
    column3->SetHeight(PARAM_50);
    column3->SetBorderWidth(PARAM_1);
    column3->SetId("Animation3");
    column->AddChild(column3);

    button->RegisterOnClick([column3]() { RegisterOnEventCallback(column3->GetComponent()); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static ArkUI_AnimatorHandle SetAnimator(ArkUI_NodeHandle column)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_20);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, PARAM_1000);
    OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(animatorOption, column, [](ArkUI_AnimatorOnFrameEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorOnFrameEvent_GetUserData(event));
        auto value = OH_ArkUI_AnimatorOnFrameEvent_GetValue(event);
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_BLUE);
        }
    });
    OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(animatorOption, column, [](ArkUI_AnimatorEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorEvent_GetUserData(event));
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_GREEN);
        }
    });
    OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(animatorOption, column, [](ArkUI_AnimatorEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorEvent_GetUserData(event));
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_RED);
        }
    });
    auto animator = animateAPI->createAnimator(context, animatorOption);
    return animator;
}

static ArkUI_AnimatorHandle SetAnimatorWithIterations(ArkUI_NodeHandle column)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_20);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, SIZE_500);
    OH_ArkUI_AnimatorOption_SetIterations(animatorOption, PARAM_3);
    OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(animatorOption, column, [](ArkUI_AnimatorEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorEvent_GetUserData(event));
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_GREEN);
        }
    });
    auto animator = animateAPI->createAnimator(context, animatorOption);
    return animator;
}

static ArkUI_AnimatorHandle SetAnimatorReverse(ArkUI_NodeHandle column)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, PARAM_1000);
    OH_ArkUI_AnimatorOption_SetBegin(animatorOption, PARAM_100);
    OH_ArkUI_AnimatorOption_SetEnd(animatorOption, PARAM_200);
    OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(animatorOption, column, [](ArkUI_AnimatorOnFrameEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorOnFrameEvent_GetUserData(event));
        auto value = OH_ArkUI_AnimatorOnFrameEvent_GetValue(event);
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetWidth(value);
        }
    });
    OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(animatorOption, column, [](ArkUI_AnimatorEvent* event) {
        auto nodeHandle = static_cast<ArkUI_NodeHandle>(OH_ArkUI_AnimatorEvent_GetUserData(event));
        if (nodeHandle) {
            auto node = std::make_shared<Component>(nodeHandle);
            node->SetBackgroundColor(COLOR_GREEN);
        }
    });
    auto animator = animateAPI->createAnimator(context, animatorOption);
    return animator;
}

napi_value AnimationEventTest::TestAnimatorOption047(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimatorOption047");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button1 = CreateButtonWithId("Play");
    column->AddChild(button1);
    auto button2 = CreateButtonWithId("Pause");
    column->AddChild(button2);
    auto column4 = std::make_shared<ColumnComponent>();
    column4->SetWidth(PARAM_100);
    column4->SetHeight(PARAM_100);
    column4->SetBorderWidth(PARAM_1);
    column4->SetId("Animation4");
    column->AddChild(column4);

    auto animator = SetAnimator(column4->GetComponent());
    button1->RegisterOnClick([animator]() { OH_ArkUI_Animator_Play(animator); });
    button2->RegisterOnClick([animator]() { OH_ArkUI_Animator_Pause(animator); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value AnimationEventTest::TestAnimatorOption050(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimatorOption050");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button1 = CreateButtonWithId("Play");
    column->AddChild(button1);
    auto button2 = CreateButtonWithId("Finish");
    column->AddChild(button2);
    auto column5 = std::make_shared<ColumnComponent>();
    column5->SetWidth(PARAM_100);
    column5->SetHeight(PARAM_100);
    column5->SetBorderWidth(PARAM_1);
    column5->SetId("Animation5");
    column->AddChild(column5);

    auto animator = SetAnimator(column5->GetComponent());
    button1->RegisterOnClick([animator]() { OH_ArkUI_Animator_Play(animator); });
    button2->RegisterOnClick([animator]() { OH_ArkUI_Animator_Finish(animator); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value AnimationEventTest::TestAnimatorOption053(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimatorOption053");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button1 = CreateButtonWithId("Play");
    column->AddChild(button1);
    auto button2 = CreateButtonWithId("Cancel");
    column->AddChild(button2);
    auto column6 = std::make_shared<ColumnComponent>();
    column6->SetWidth(PARAM_100);
    column6->SetHeight(PARAM_100);
    column6->SetBorderWidth(PARAM_1);
    column6->SetId("Animation6");
    column->AddChild(column6);

    auto animator = SetAnimator(column6->GetComponent());
    button1->RegisterOnClick([animator]() { OH_ArkUI_Animator_Play(animator); });
    button2->RegisterOnClick([animator]() { OH_ArkUI_Animator_Cancel(animator); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value AnimationEventTest::TestAnimatorOption056(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimatorOption056");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button = CreateButtonWithId("Play");
    column->AddChild(button);
    auto column7 = std::make_shared<ColumnComponent>();
    column7->SetWidth(PARAM_100);
    column7->SetHeight(PARAM_100);
    column7->SetBorderWidth(PARAM_1);
    column7->SetId("Animation7");
    column->AddChild(column7);

    auto animator = SetAnimatorWithIterations(column7->GetComponent());
    button->RegisterOnClick([animator]() { OH_ArkUI_Animator_Play(animator); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value AnimationEventTest::TestAnimatorOption062(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimationEventTest", "TestAnimatorOption062");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest", "GetContext env or info is null");
        return nullptr;
    }

    auto column = new ColumnComponent();
    auto button1 = CreateButtonWithId("Reverse");
    column->AddChild(button1);
    auto button2 = CreateButtonWithId("Pause");
    column->AddChild(button2);
    auto column8 = std::make_shared<ColumnComponent>();
    column8->SetWidth(PARAM_100);
    column8->SetHeight(PARAM_100);
    column8->SetBorderWidth(PARAM_1);
    column8->SetId("Animation8");
    column->AddChild(column8);

    auto animator = SetAnimatorReverse(column8->GetComponent());
    button1->RegisterOnClick([animator]() { OH_ArkUI_Animator_Reverse(animator); });
    button2->RegisterOnClick([animator]() { OH_ArkUI_Animator_Pause(animator); });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimationEventTest",
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
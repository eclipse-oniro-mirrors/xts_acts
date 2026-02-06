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
#include "animation_event_test.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


#include "common/common.h"

namespace ArkUIAniTest {

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

void AnimationEventTest::TestAnimateOption001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
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

void AnimationEventTest::TestKeyframeAnimateOption012(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column2->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
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

void AnimationEventTest::TestKeyframeAnimateOption023(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
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

void AnimationEventTest::TestAnimatorOption047(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void AnimationEventTest::TestAnimatorOption050(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void AnimationEventTest::TestAnimatorOption053(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void AnimationEventTest::TestAnimatorOption056(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void AnimationEventTest::TestAnimatorOption062(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

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

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest
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
#include "common/common.h"
#include "animator_event_test.h"

#include <string>
#include <arkui/native_animate.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_node_ani.h"

static ArkUI_AnimatorHandle animatorHandle = nullptr;
static ArkUI_AnimatorOption *animatorOption = nullptr;
static ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
static ArkUI_NodeHandle showContent = nullptr;
static ArkUI_NodeHandle stackToAnimator = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

static int NUMBER_1000 = 1000;
static int NUMBER_2 = 2;
static int NUMBER_3 = 3;
static int NUMBER_3000 = 3000;
static int NUMBER_100 = 100;
static int NUMBER_300 = 300;
static int NUMBER_50 = 50;

namespace ArkUIAniTest {

static void CreateAnimatorOption()
{
    animatorOption = OH_ArkUI_AnimatorOption_Create(NUMBER_3);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, NUMBER_3000);
    OH_ArkUI_AnimatorOption_SetBegin(animatorOption, NUMBER_100);
    OH_ArkUI_AnimatorOption_SetEnd(animatorOption, NUMBER_300);
    OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption, 0, NUMBER_50, 0);
}

static void OnEventReceive1(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish",
            "OnEventReceive: event is null");
        return;
    }
        
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == 1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    ArkUI_KeyframeAnimateOption *option = OH_ArkUI_KeyframeAnimateOption_Create(2);
    auto onFinishCode = OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(option, nullptr,
        [](void *userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish", "OnEventReceive");
    });

    OH_ArkUI_KeyframeAnimateOption_SetDuration(option, NUMBER_1000, 0);
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnEvent",
            "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == 1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    ArkUI_KeyframeAnimateOption *option = OH_ArkUI_KeyframeAnimateOption_Create(2);
    OH_ArkUI_KeyframeAnimateOption_SetDuration(option, NUMBER_1000, 0);
    OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, [](void *userData) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyframeRegisterOnEvent", "OnEventReceive");
    }, 0);
}

static void OnEventReceive3(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 0) {
        animatorHandle = animateApi->createAnimator(nullptr, animatorOption);
    }
    if (targetId == NUMBER_2) {
        auto code = OH_ArkUI_Animator_Play(animatorHandle);
    }
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 0) {
        animatorHandle = animateApi->createAnimator(nullptr, animatorOption);
    }
    if (targetId == NUMBER_2) {
        auto code = OH_ArkUI_Animator_Play(animatorHandle);
    }
    if (targetId == NUMBER_3) {
        auto code = OH_ArkUI_Animator_Finish(animatorHandle);
    }
}

static void OnEventReceive5(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == NUMBER_2) {
        auto code = OH_ArkUI_Animator_Play(animatorHandle);
    }
    if (targetId == 1) {
        auto code = OH_ArkUI_Animator_Cancel(animatorHandle);
    }
}

static void OnEventReceive6(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == NUMBER_2) {
        auto code = OH_ArkUI_Animator_Play(animatorHandle);
    }
    if (targetId == 1) {
        auto code = OH_ArkUI_AnimatorOption_SetIterations(animatorOption, 2);
    }
}

void AnimatorEventTest::testKeyframeRegisterOnFinish_001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    ArkUI_NumberValue widthValue[] = {380};
    ArkUI_AttributeItem withItem = {widthValue, 1};
    ArkUI_NumberValue heightValue[] = {900};
    ArkUI_AttributeItem heightItem = {heightValue, 1};

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->setAttribute(column, NODE_WIDTH, &withItem);
    nodeAPI->setAttribute(column, NODE_HEIGHT, &heightItem);

    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem NODE_BUTTON_LABEL_Item = {.string = "onClick"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &NODE_BUTTON_LABEL_Item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
    nodeAPI->addChild(column, button);

    ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceive1);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 1, nullptr);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void AnimatorEventTest::testKeyframeRegisterOnEvent_002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ArkUI_NumberValue widthValue[] = {380};
    ArkUI_AttributeItem withItem = {widthValue, 1};
    ArkUI_NumberValue heightValue1[] = {900};
    ArkUI_AttributeItem heightItem1 = {heightValue1, 1};

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->setAttribute(column, NODE_WIDTH, &withItem);
    nodeAPI->setAttribute(column, NODE_HEIGHT, &heightItem1);

    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem NODE_BUTTON_LABEL_Item = {.string = "onClick"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &NODE_BUTTON_LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 1, nullptr);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->addChild(column, button);
    ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 1, nullptr);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void CreateRegisterOnFrameCallback()
{
    OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(animatorOption, nullptr,
        [](ArkUI_AnimatorOnFrameEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFrame", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFrame",
                "OnEventReceive: event is null");
            return;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        float progress = OH_ArkUI_AnimatorOnFrameEvent_GetValue(event);
        void *userData = OH_ArkUI_AnimatorOnFrameEvent_GetUserData(event);

        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "showContent"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(showContent, NODE_BACKGROUND_COLOR, &background_color_item);

        ArkUI_NumberValue heightValue[] = {progress};
        ArkUI_AttributeItem heightItem = {heightValue, 1};

        nodeAPI->setAttribute(stackToAnimator, NODE_HEIGHT, &heightItem);

        ArkUI_NumberValue widthValue[] = {progress};
        ArkUI_AttributeItem widthItem = {widthValue, 1};

        nodeAPI->setAttribute(stackToAnimator, NODE_WIDTH, &widthItem);
    });
}

void AnimatorEventTest::testAnimatorRegisterOnFrame_003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    static ArkUI_NodeHandle create = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem createNODE_BUTTON_LABLE_Item = {.string = "create"};
    nodeAPI->setAttribute(create, NODE_BUTTON_LABEL, &createNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(create, NODE_ON_CLICK, 0, nullptr);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(create, NODE_BACKGROUND_COLOR, &background_color_item);
            
    static ArkUI_NodeHandle play = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem playNODE_BUTTON_LABLE_Item = {.string = "play"};
    nodeAPI->setAttribute(play, NODE_BUTTON_LABEL, &playNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(play, NODE_ON_CLICK, NUMBER_2, nullptr);
 
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    CreateAnimatorOption();
    CreateRegisterOnFrameCallback();
    nodeAPI->registerNodeEventReceiver(&OnEventReceive3);

    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, showContent);
    nodeAPI->addChild(column, stackToAnimator);
    nodeAPI->addChild(column, create);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void CreateRegisterOnFinishCallback()
{
    auto codeOnFinish = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(animatorOption, nullptr,
        [](ArkUI_AnimatorEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFinish", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFinish",
                "OnEventReceive: event is null");
            return;
        }
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "OnFinish"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(showContent, NODE_BACKGROUND_COLOR, &background_color_item);
    });
}

void AnimatorEventTest::testAnimatorRegisterOnFinish_004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row0 = nodeAPI->createNode(ARKUI_NODE_ROW);

    static ArkUI_NodeHandle play = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem playNODE_BUTTON_LABLE_Item = {.string = "play"};
    nodeAPI->setAttribute(play, NODE_BUTTON_LABEL, &playNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(play, NODE_ON_CLICK, NUMBER_2, nullptr);

    static ArkUI_NodeHandle finish = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem finishNODE_BUTTON_LABLE_Item = {.string = "finish"};
    nodeAPI->setAttribute(finish, NODE_BUTTON_LABEL, &finishNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(finish, NODE_ON_CLICK, NUMBER_3, nullptr);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    CreateAnimatorOption();
    CreateRegisterOnFinishCallback();
    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);
    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, showContent);
    nodeAPI->addChild(column, stackToAnimator);
    nodeAPI->addChild(column, row0);
    nodeAPI->addChild(row0, play);
    nodeAPI->addChild(row0, finish);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void CreateAnimatorRegisterOnCancelCallback()
{
    auto codeOnFinish = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(animatorOption, nullptr,
        [](ArkUI_AnimatorEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnCancel", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnCancel",
                "OnEventReceive: event is null");
            return;
        }
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "OnCancel"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(showContent, NODE_BACKGROUND_COLOR, &background_color_item);
    });
}

void AnimatorEventTest::testAnimatorRegisterOnCancel_005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row0 = nodeAPI->createNode(ARKUI_NODE_ROW);

    static ArkUI_NodeHandle play = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem playNODE_BUTTON_LABLE_Item = {.string = "play"};
    nodeAPI->setAttribute(play, NODE_BUTTON_LABEL, &playNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(play, NODE_ON_CLICK, NUMBER_2, nullptr);

    static ArkUI_NodeHandle cancel = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem cancelNODE_BUTTON_LABLE_Item = {.string = "cancel"};
    nodeAPI->setAttribute(cancel, NODE_BUTTON_LABEL, &cancelNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(cancel, NODE_ON_CLICK, 1, nullptr);
   
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    CreateAnimatorOption();
    CreateAnimatorRegisterOnCancelCallback();
    nodeAPI->registerNodeEventReceiver(&OnEventReceive5);
    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, showContent);
    nodeAPI->addChild(column, stackToAnimator);
    nodeAPI->addChild(column, row0);
    nodeAPI->addChild(row0, play);
    nodeAPI->addChild(row0, cancel);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

static void CreateAnimatorRegisterOnRepeatCallback()
{
    auto codeOnFinish = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(animatorOption, nullptr,
        [](ArkUI_AnimatorEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnRepeat", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnRepeat",
                "OnEventReceive: event is null");
            return;
        }
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "OnRepeat"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(showContent, NODE_BACKGROUND_COLOR, &background_color_item);
    });
}

void AnimatorEventTest::testAnimatorRegisterOnRepeat_006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row0 = nodeAPI->createNode(ARKUI_NODE_ROW);
            
    static ArkUI_NodeHandle play = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem playNODE_BUTTON_LABLE_Item = {.string = "play"};
    nodeAPI->setAttribute(play, NODE_BUTTON_LABEL, &playNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(play, NODE_ON_CLICK, NUMBER_2, nullptr);

    static ArkUI_NodeHandle repeat = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem repeatNODE_BUTTON_LABLE_Item = {.string = "repeat"};
    nodeAPI->setAttribute(repeat, NODE_BUTTON_LABEL, &repeatNODE_BUTTON_LABLE_Item);
    nodeAPI->registerNodeEvent(repeat, NODE_ON_CLICK, 1, nullptr);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    CreateAnimatorOption();
    CreateAnimatorRegisterOnRepeatCallback();

    nodeAPI->registerNodeEventReceiver(&OnEventReceive5);
    nodeAPI->addChild(scroll, column);
    nodeAPI->addChild(column, showContent);
    nodeAPI->addChild(column, stackToAnimator);
    nodeAPI->addChild(column, row0);
    nodeAPI->addChild(row0, play);
    nodeAPI->addChild(row0, repeat);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, scroll);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

} // namespace ArkUIAniTest
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
#include "common/common.h"
#include "animator_event_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include <arkui/native_animate.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

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

namespace ArkUICapiTest {

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

napi_value AnimatorEventTest::testKeyframeRegisterOnFinish_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish",
            "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnFinish",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value AnimatorEventTest::testKeyframeRegisterOnEvent_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyframeRegisterOnEvent", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnEvent",
            "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyframeRegisterOnEvent",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
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

napi_value AnimatorEventTest::testAnimatorRegisterOnFrame_003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFrame", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorFrame", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        scroll) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFrame",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
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

napi_value AnimatorEventTest::testAnimatorRegisterOnFinish_004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFinish", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorFinish", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        scroll) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnFinish",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
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

napi_value AnimatorEventTest::testAnimatorRegisterOnCancel_005(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnCancel", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorCancel", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        scroll) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnCancel",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
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

napi_value AnimatorEventTest::testAnimatorRegisterOnRepeat_006(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AnimatorRegisterOnRepeat", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRepeat", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        scroll) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AnimatorRegisterOnRepeat",
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
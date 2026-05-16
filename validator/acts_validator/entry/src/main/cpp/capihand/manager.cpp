/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <asm-generic/stat.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_gesture.h>
#include <hilog/log.h>

#include "manager.h"


namespace NativeXComponentSample {
Manager Manager::manager_;
ArkUI_NodeHandle refresh;

Manager::~Manager() {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    for (auto iter = nativeXComponentMap_.begin(); iter != nativeXComponentMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            iter->second = nullptr;
        }
    }
    nativeXComponentMap_.clear();

    for (auto iter = containerMap_.begin(); iter != containerMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    containerMap_.clear();
}

static ArkUI_AnimatorHandle animatorHandle = nullptr;
static ArkUI_AnimatorOption *animatorOption = nullptr;
static ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle showContent = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
static int32_t HandResult = 0;


struct AA {
    int32_t a;
};

static void PrintArkUI_AnimatorOption(ArkUI_AnimatorOption *option) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetDuration ==%{public}d",
                 OH_ArkUI_AnimatorOption_GetDuration(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetDelay ==%{public}d",
                 OH_ArkUI_AnimatorOption_GetDelay(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetIterations ==%{public}d",
                 OH_ArkUI_AnimatorOption_GetIterations(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetFill ==%{public}d",
                 OH_ArkUI_AnimatorOption_GetFill(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetDirection ==%{public}d",
                 OH_ArkUI_AnimatorOption_GetDirection(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetBegin ==%{public}f",
                 OH_ArkUI_AnimatorOption_GetBegin(option));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetEnd ==%{public}f",
                 OH_ArkUI_AnimatorOption_GetEnd(option));
    auto rateRange = OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange min ==%{public}d  max "
                 "==%{public}d  expected ==%{public}d",
                 rateRange->min, rateRange->max, rateRange->expected);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                 "CreateNativeNode OH_ArkUI_AnimatorOption_GetEasing ==%{public}p",
                 OH_ArkUI_AnimatorOption_GetCurve(option));
}

static void initCallback() {
    AA aa{3};
    OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(animatorOption, &aa, [](ArkUI_AnimatorOnFrameEvent *event) {
        float progress = OH_ArkUI_AnimatorOnFrameEvent_GetValue(event);
        char buffer[50];
        snprintf(buffer, sizeof(buffer), "%f", progress);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = strdup(buffer)};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode  OH_ArkUI_AnimatorOption_SetOnFrame = %{public}f", progress);

        ArkUI_NumberValue heightValue[] = {progress};
        ArkUI_AttributeItem heightItem = {heightValue, 1};
        nodeAPI->setAttribute(textInput, NODE_HEIGHT, &heightItem);

        ArkUI_NumberValue widthValue[] = {progress};
        ArkUI_AttributeItem widthItem = {widthValue, 1};
        nodeAPI->setAttribute(textInput, NODE_WIDTH, &widthItem);
    });
    OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(animatorOption, &aa, [](ArkUI_AnimatorEvent *event) {
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "回调OnFinish"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode  OH_ArkUI_AnimatorOption_SetOnFinish = %{public}p", userData);
    });

    OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(animatorOption, &aa, [](ArkUI_AnimatorEvent *event) {
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "回调OnCancel"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode  OH_ArkUI_AnimatorOption_SetOnCancel = %{public}p", userData);
    });

    OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(animatorOption, &aa, [](ArkUI_AnimatorEvent *event) {
        void *userData = OH_ArkUI_AnimatorEvent_GetUserData(event);
        ArkUI_AttributeItem ARKUI_NODE_TEXT_Item = {.string = "回调OnRepeat"};
        nodeAPI->setAttribute(showContent, NODE_TEXT_CONTENT, &ARKUI_NODE_TEXT_Item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "CreateNativeNode  OH_ArkUI_AnimatorOption_SetOnCancel = %{public}p", userData);
    });
}

static void createAnimatorOption() {
    animatorOption = OH_ArkUI_AnimatorOption_Create(0);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, 1000);
    OH_ArkUI_AnimatorOption_SetBegin(animatorOption, 100);
    OH_ArkUI_AnimatorOption_SetEnd(animatorOption, 300);
    auto curve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_EASE);

    OH_ArkUI_AnimatorOption_SetCurve(animatorOption, curve);
    initCallback();
}

static ArkUI_AnimatorOption *createAnimatorOptionKeyFrame() {
    static ArkUI_AnimatorOption *option = OH_ArkUI_AnimatorOption_Create(3);
    OH_ArkUI_AnimatorOption_SetDuration(option, 2000);
    OH_ArkUI_AnimatorOption_SetDelay(option, 0);
    OH_ArkUI_AnimatorOption_SetIterations(option, 1);
    OH_ArkUI_AnimatorOption_SetFill(option, ARKUI_ANIMATION_FILL_MODE_FORWARDS);
    OH_ArkUI_AnimatorOption_SetDirection(option, ARKUI_ANIMATION_DIRECTION_ALTERNATE);

    OH_ArkUI_AnimatorOption_SetKeyframe(option, 0.1, 20, 0);
    OH_ArkUI_AnimatorOption_SetKeyframe(option, 0.2, 30, 1);
    OH_ArkUI_AnimatorOption_SetKeyframe(option, 1, 90, 2);
    ArkUI_ExpectedFrameRateRange range{0, 60, 120};
    auto curve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_EASE);
    OH_ArkUI_AnimatorOption_SetCurve(option, curve);
    OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(option, &range);

    return option;
}

napi_value Manager::CreateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  1111");

    size_t argCnt = 2;
    napi_value args[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }

    if (argCnt < 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  2222 %{public}s", idStr);

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  3333333");


    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB  222--1");

            static ArkUI_ContextHandle context = nullptr;
            auto code = OH_ArkUI_GetContextFromNapiValue(env, args[1], &context);

            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  args[1] == %{public}p",
                         args[1]);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  code == %{public}d", code);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  context == %{public}p",
                         context);

            ArkUI_NumberValue widthValue[] = {450};
            ArkUI_AttributeItem widthItem = {widthValue, 1};
            ArkUI_NumberValue heightValue1[] = {700};
            ArkUI_AttributeItem heightItem1 = {heightValue1, 1};
            ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFFFF00}};
            ArkUI_AttributeItem colorItem = {colorValue, 1};

            ArkUI_NumberValue button_widthValue[] = {200};
            ArkUI_AttributeItem button_widthItem = {button_widthValue, 1};
            ArkUI_NumberValue button_heightValue1[] = {60};
            ArkUI_AttributeItem button_heightItem1 = {button_heightValue1, 1};
            ArkUI_NumberValue button_focusable[] = {{.i32 = true}};
            ArkUI_AttributeItem button_focusableItem = {button_focusable, 1};
            ArkUI_NumberValue button_defaultFocus[] = {{.i32 = true}};
            ArkUI_AttributeItem button_defaultFocusItem = {button_defaultFocus, 1};

            auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            nodeAPI->setAttribute(scroll, NODE_WIDTH, &widthItem);
            nodeAPI->setAttribute(scroll, NODE_HEIGHT, &heightItem1);
            nodeAPI->setAttribute(scroll, NODE_BACKGROUND_COLOR, &colorItem);
            
            auto stack = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(stack, NODE_WIDTH, &widthItem);
            nodeAPI->setAttribute(stack, NODE_HEIGHT, &heightItem1);
            nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &colorItem);

            ArkUI_NumberValue width1Value[] = {300};
            ArkUI_AttributeItem width1Item = {width1Value, 1};
            ArkUI_NumberValue height1Value1[] = {500};
            ArkUI_AttributeItem height1Item1 = {height1Value1, 1};
            ArkUI_NumberValue color1Value[] = {{.u32 = 0xFF00FF00}};
            ArkUI_AttributeItem color1Item = {color1Value, 1};

            auto innerColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(innerColumn, NODE_WIDTH, &width1Item);
            nodeAPI->setAttribute(innerColumn, NODE_HEIGHT, &height1Item1);
            nodeAPI->setAttribute(innerColumn, NODE_BACKGROUND_COLOR, &color1Item);
            auto innerList = nodeAPI->createNode(ARKUI_NODE_SCROLL);
            nodeAPI->setAttribute(innerList, NODE_WIDTH, &width1Item);
            nodeAPI->setAttribute(innerList, NODE_HEIGHT, &height1Item1);
            nodeAPI->setAttribute(innerList, NODE_BACKGROUND_COLOR, &color1Item);
            ArkUI_NumberValue value[] = {20};
            ArkUI_AttributeItem item = {value, 1};
            nodeAPI->setAttribute(innerList, NODE_SCROLL_BAR_WIDTH, &item);
            nodeAPI->addChild(stack, innerList);
            nodeAPI->addChild(innerList, innerColumn);
            
            ArkUI_NumberValue widthTextValue[] = {200};
            ArkUI_AttributeItem widthTextItem = {widthTextValue, 1};
            ArkUI_NumberValue heightTextValue1[] = {60};
            ArkUI_AttributeItem heighTextItem1 = {heightTextValue1, 1};
            auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            nodeAPI->setAttribute(text, NODE_WIDTH, &widthTextItem);
            nodeAPI->setAttribute(text, NODE_HEIGHT, &heighTextItem1);
            nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &color1Item);
            ArkUI_AttributeItem textContent = {.string = "0"};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textContent);

            auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            ArkUI_AttributeItem LABEL_Item4 = {.string = "单一手势+onTouch"};
                nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item4);
            nodeAPI->setAttribute(button, NODE_WIDTH, &button_widthItem);
            nodeAPI->setAttribute(button, NODE_HEIGHT, &button_heightItem1);
            ArkUI_NumberValue button_color1Value[] = {{.u32 = 0xFFFF0000}};
            ArkUI_AttributeItem button_color1Item = {button_color1Value, 1};
            nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &button_color1Item);
            nodeAPI->addChild(innerColumn, button);
            
            manager->button_ = button;
            
            auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            ArkUI_AttributeItem LABEL_Item2 = {.string = "并行手势组"};
                nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
            nodeAPI->setAttribute(button2, NODE_WIDTH, &button_widthItem);
            nodeAPI->setAttribute(button2, NODE_HEIGHT, &button_heightItem1);
            ArkUI_NumberValue button_color1Value2[] = {{.u32 = 0xFFFF0000}};
            ArkUI_AttributeItem button_color1Item2 = {button_color1Value2, 1};
            nodeAPI->setAttribute(button2, NODE_BACKGROUND_COLOR, &button_color1Item2);
            nodeAPI->addChild(innerColumn, button2);
            
            auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            ArkUI_AttributeItem LABEL_Item3 = {.string = "顺序手势组"};
                nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
            nodeAPI->setAttribute(button3, NODE_WIDTH, &button_widthItem);
            nodeAPI->setAttribute(button3, NODE_HEIGHT, &button_heightItem1);
            ArkUI_NumberValue button_color1Value3[] = {{.u32 = 0xFFFF0000}};
            ArkUI_AttributeItem button_color1Item3 = {button_color1Value3, 1};
            nodeAPI->setAttribute(button3, NODE_BACKGROUND_COLOR, &button_color1Item3);
            nodeAPI->addChild(innerColumn, button3);
            
            auto button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            ArkUI_AttributeItem LABEL_Item5 = {.string = "互斥手势组"};
                nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
            nodeAPI->setAttribute(button5, NODE_WIDTH, &button_widthItem);
            nodeAPI->setAttribute(button5, NODE_HEIGHT, &button_heightItem1);
            ArkUI_NumberValue button_color1Value5[] = {{.u32 = 0xFFFF0000}};
            ArkUI_AttributeItem button_color1Item5 = {button_color1Value5, 1};
            nodeAPI->setAttribute(button5, NODE_BACKGROUND_COLOR, &button_color1Item5);
            nodeAPI->addChild(innerColumn, button5);
            nodeAPI->addChild(innerColumn, text);
            
            

            nodeAPI->addNodeEventReceiver(button, [](ArkUI_NodeEvent *event) {
                auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
                switch (eventType) {
                    case NODE_TOUCH_EVENT: {
                        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                        ArkUI_InteractionHand hand1, hand2;
                        auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(uiInputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(uiInputEvent, &hand2);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent touch event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
                        break;
                    }
                    case NODE_ON_CLICK: {
                    auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                        ArkUI_InteractionHand hand1, hand2;
                        auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(uiInputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(uiInputEvent, &hand2);
                        HandResult = res2;
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent click event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
                        break;
                    }

                    default: {
                        break;
                    }
                }
            });
            



            nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, 0, nullptr);
            nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 0, nullptr);
   

            

            OH_NativeXComponent_AttachNativeRootNode(component, stack);
            nodeAPI->setAttribute(button, NODE_FOCUS_STATUS, &button_defaultFocusItem);
            
            auto gesture = gestureApi->createPanGesture(-1, GESTURE_DIRECTION_ALL, -1);



            auto onActionCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent pan event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
            };
        
            gestureApi->setGestureEventTarget(gesture, GESTURE_EVENT_ACTION_ACCEPT|GESTURE_EVENT_ACTION_UPDATE|GESTURE_EVENT_ACTION_END|GESTURE_EVENT_ACTION_CANCEL, button, onActionCallback);

            gestureApi->addGestureToNode(button, gesture, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);
            
            
            auto longPressGesture = gestureApi->createLongPressGesture(-1, 1, -1);
            auto tapGesture1 = gestureApi->createTapGesture(-1, 1 );
            auto tapGesture2 = gestureApi->createTapGesture(2,1 );
            auto RotationGesture = gestureApi->createRotationGesture(-1, 1);
            auto PinchGesture = gestureApi->createPinchGesture(-1, 1);
            auto Swipe = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_ALL,1);
            
            auto ontapActionCallback1 = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent tap1 event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
 auto onSwipeActionCallback1 = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent Swipe event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
            auto ontapActionCallback2 = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent tap2 event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };

            auto onLogPressActionCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent long event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };

            auto onRotationActionCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent rotate event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };

            auto onPinchActionCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent pinch event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
            gestureApi->setGestureEventTarget(longPressGesture,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, onLogPressActionCallback);
                gestureApi->setGestureEventTarget(Swipe,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, onSwipeActionCallback1);
            gestureApi->setGestureEventTarget(RotationGesture,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, onRotationActionCallback);
            gestureApi->setGestureEventTarget(PinchGesture,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, onPinchActionCallback);
            gestureApi->setGestureEventTarget(tapGesture1,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, ontapActionCallback1);
            
            gestureApi->setGestureEventTarget(tapGesture2,
                                              GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                                  GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                              button, ontapActionCallback2);

            gestureApi->addGestureToNode(button, longPressGesture, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);
            
             gestureApi->addGestureToNode(button, Swipe, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);

            gestureApi->addGestureToNode(button, RotationGesture, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);

            gestureApi->addGestureToNode(button, PinchGesture, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);
            gestureApi->addGestureToNode(button, tapGesture1, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);
            
            gestureApi->addGestureToNode(button, tapGesture2, ArkUI_GesturePriority::PARALLEL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);
            
            
            
            auto groupGesturePARALLEL = gestureApi->createGroupGesture(ArkUI_GroupGestureMode::PARALLEL_GROUP);
            auto groupGestureEXCLUSIVE = gestureApi->createGroupGesture(ArkUI_GroupGestureMode::EXCLUSIVE_GROUP);
            auto groupGestureSEQUENTIAL = gestureApi->createGroupGesture(ArkUI_GroupGestureMode::SEQUENTIAL_GROUP);
            
            auto longPressGesturePARALLEL = gestureApi->createLongPressGesture(-1, 1, -1);
            auto longPressGestureEXCLUSIVE = gestureApi->createLongPressGesture(-1, 1, -1);
            auto longPressGestureSEQUENTIAL = gestureApi->createLongPressGesture(-1, 1, -1);
            
            auto gesturePARALLEL = gestureApi->createPanGesture(-1, GESTURE_DIRECTION_ALL, -1);
            auto gestureEXCLUSIVE = gestureApi->createPanGesture(-1, GESTURE_DIRECTION_ALL, -1);
            auto gestureSEQUENTIAL = gestureApi->createPanGesture(-1, GESTURE_DIRECTION_ALL, -1);
            
            auto onLogPressActionPARALLELCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent PARALLEL long event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
            
            auto onPanActionPARALLELCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent PARALLEL pan event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
            };
            
            auto onLogPressActionEXCLUSIVECallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent EXCLUSIVE long event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
            
            auto onPanActionEXCLUSIVECallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent EXCLUSIVE pan event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
            };
            
            auto onLogPressActionSEQUENTIALCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1 = OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                OH_LOG_Print(
                    LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                    "handEvent SEQUENTIAL long event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d",
                    hand1, res1, hand2, res2);
            };
            
            auto onPanActionSEQUENTIALCallback = [](ArkUI_GestureEvent *event, void *extraParams) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  swipe trigger");
                auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
                ArkUI_InteractionHand hand1, hand2;
                auto res1= OH_ArkUI_PointerEvent_GetInteractionHandByIndex(inputEvent, 0, &hand1);
                        auto res2 = OH_ArkUI_PointerEvent_GetInteractionHand(inputEvent, &hand2);
                HandResult = res2;
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                            "handEvent SEQUENTIAL pan event hand1=%{public}d result1=%{public}d, hand2=%{public}d  result2=%{public}d", hand1,res1, hand2, res2);
            };
            
            gestureApi->setGestureEventTarget(longPressGesturePARALLEL,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button2, onLogPressActionPARALLELCallback);
            
            gestureApi->setGestureEventTarget(gesturePARALLEL,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button2, onPanActionPARALLELCallback);
            
            gestureApi->setGestureEventTarget(longPressGestureSEQUENTIAL,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button3, onLogPressActionSEQUENTIALCallback);
            
            gestureApi->setGestureEventTarget(gestureSEQUENTIAL,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button3, onPanActionSEQUENTIALCallback);
            
            gestureApi->setGestureEventTarget(longPressGestureEXCLUSIVE,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button5, onLogPressActionEXCLUSIVECallback);
            
            gestureApi->setGestureEventTarget(gestureEXCLUSIVE,
                                          GESTURE_EVENT_ACTION_ACCEPT | GESTURE_EVENT_ACTION_UPDATE |
                                              GESTURE_EVENT_ACTION_END | GESTURE_EVENT_ACTION_CANCEL,
                                          button5, onPanActionEXCLUSIVECallback);
            
            // 将单击手势添加到手势组
            if (gestureApi->addChildGesture) {
                gestureApi->addChildGesture(groupGesturePARALLEL, longPressGesturePARALLEL);
                gestureApi->addChildGesture(groupGesturePARALLEL, gesturePARALLEL);

                gestureApi->addChildGesture(groupGestureSEQUENTIAL, longPressGestureSEQUENTIAL);
                gestureApi->addChildGesture(groupGestureSEQUENTIAL, gestureSEQUENTIAL);

                gestureApi->addChildGesture(groupGestureEXCLUSIVE, longPressGestureEXCLUSIVE);
                gestureApi->addChildGesture(groupGestureEXCLUSIVE, gestureEXCLUSIVE);
            }
            
            gestureApi->addGestureToNode(button2, groupGesturePARALLEL, PRIORITY, NORMAL_GESTURE_MASK);
            gestureApi->addGestureToNode(button3, groupGestureSEQUENTIAL, PRIORITY, NORMAL_GESTURE_MASK);
            gestureApi->addGestureToNode(button5, groupGestureEXCLUSIVE, PRIORITY, NORMAL_GESTURE_MASK);
            
            
            
            
            
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  5555555");
    
    
    return nullptr;
}


napi_value Manager::UpdateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  1111");

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UpdateNativeNode napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "CreateNativeNode  1111 %{public}s", idStr);

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }


    if ((env == nullptr) || (info == nullptr || component == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  1111");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "UpdateNativeNode  333");
    return nullptr;
}


napi_value Manager::GetContext(napi_env env, napi_callback_info info) {
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext env or info is null");
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "GetContext napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_number) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    if (napi_get_value_int64(env, args[0], &value) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

void Manager::Export(napi_env env, napi_value exports) {
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: env or exports is null");
        return;
    }

    napi_value exportInstance = nullptr;
    if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_get_named_property fail");
        return;
    }

    OH_NativeXComponent *nativeXComponent = nullptr;
    if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_unwrap fail");
        return;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "Export: OH_NativeXComponent_GetXComponentId fail");
        return;
    }

    std::string id(idStr);
    auto manager = Manager::GetInstance();
    if ((manager != nullptr) && (nativeXComponent != nullptr)) {
        manager->SetNativeXComponent(id, nativeXComponent);
        auto container = manager->GetContainer(id);
        if (container != nullptr) {
            container->RegisterCallback(nativeXComponent);
        }
    }
}

void Manager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
    if (nativeXComponent == nullptr) {
        return;
    }

    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        nativeXComponentMap_[id] = nativeXComponent;
        return;
    }

    if (nativeXComponentMap_[id] != nativeXComponent) {
        OH_NativeXComponent *tmp = nativeXComponentMap_[id];
        tmp = nullptr;
        nativeXComponentMap_[id] = nativeXComponent;
    }
}

OH_NativeXComponent *Manager::GetNativeXComponent(const std::string &id) {
    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        return nullptr;
    }
    return nativeXComponentMap_[id];
}

Container *Manager::GetContainer(std::string &id) {
    if (containerMap_.find(id) == containerMap_.end()) {
        Container *instance = Container::GetInstance(id);
        containerMap_[id] = instance;
        return instance;
    }

    return containerMap_[id];
}
} // namespace NativeXComponentSample

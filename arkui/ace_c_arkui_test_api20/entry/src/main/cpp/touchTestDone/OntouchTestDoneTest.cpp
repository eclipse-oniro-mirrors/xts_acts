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

#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_key_event.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <cstdint>
#include <cstdio>
#include <hilog/log.h>
#include <string>
#include "OntouchTestDoneTest.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"

#define HEIGHT_PERCENT 0.8
#define WIDTH_PERCENT 0.9

#define HEIGHT_PERCENT_1 0.7
#define WIDTH_PERCENT_1 0.8

#define HEIGHT_PERCENT_2 0.6
#define WIDTH_PERCENT_2 0.7

#define HEIGHT_PERCENT_3 0.5
#define WIDTH_PERCENT_3 0.6

namespace ArkUICapiTest {
ArkUI_NodeHandle refresh;

static ArkUI_AnimatorHandle animatorHandle = nullptr;
static ArkUI_AnimatorOption *animatorOption = nullptr;
static ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle showContent = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;

napi_value OntouchTestDoneTest::CreateNativeNode(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "CreateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "CreateNativeNode  1111");

    size_t argCnt = 2;
    napi_value args[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "CreateNativeNode napi_get_cb_info failed");
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
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "CreateNativeNode  2222 %{public}s", idStr);

    auto manager = PluginManager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }
    std::string id(idStr);
    OH_NativeXComponent *component = manager->GetNativeXComponent(id);
    if (component == nullptr) {
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureApi);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OntouchTestDoneTest", "OnSurfaceCreatedCB  222--1");
            static ArkUI_ContextHandle context = nullptr;
            auto code = OH_ArkUI_GetContextFromNapiValue(env, args[1], &context);
            //stack
            ArkUI_NumberValue width_value[] = {{.f32 = WIDTH_PERCENT}};
            ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
            
            ArkUI_NumberValue height_value[] = {{.f32 = HEIGHT_PERCENT}};
            ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
            ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFF5F5F5}};
            ArkUI_AttributeItem colorItem1 = {colorValue, 1};
            ArkUI_NumberValue colorValue2[] = {{.u32 = 0xFF2FF3FF}};
            ArkUI_AttributeItem colorItem2 = {colorValue2, 1};
            ArkUI_NumberValue colorValue3[] = {{.u32 = 0xFF20F30F}};
            ArkUI_AttributeItem colorItem3 = {colorValue3, 1};
            ArkUI_NumberValue colorValue4[] = {{.u32 = 0xF2F2F3F0}};
            ArkUI_AttributeItem colorItem4 = {colorValue4, 1};
            ArkUI_NumberValue justifyValue[] = {0};
            ArkUI_AttributeItem justifyItem = {justifyValue, 1};

            auto stack = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(stack, NODE_WIDTH_PERCENT, &width_item);
            nodeAPI->setAttribute(stack, NODE_HEIGHT_PERCENT, &height_item);
            nodeAPI->setAttribute(stack, NODE_BACKGROUND_COLOR, &colorItem1);
            nodeAPI->setAttribute(stack, NODE_COLUMN_JUSTIFY_CONTENT, &justifyItem);
            ArkUI_AttributeItem stackId = {.string = "tap1"};
            nodeAPI->setAttribute(stack, NODE_ID, &stackId);

            //column 1
            ArkUI_NumberValue width_value_1[] = {{.f32 = WIDTH_PERCENT_1}};
            ArkUI_AttributeItem width_item_1 = {width_value_1, sizeof(width_value_1) / sizeof(ArkUI_NumberValue)};
            
            ArkUI_NumberValue height_value_1[] = {{.f32 = HEIGHT_PERCENT_1}};
            ArkUI_AttributeItem height_item_1 = {height_value_1, sizeof(height_value_1) / sizeof(ArkUI_NumberValue)};
            auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(column1, NODE_WIDTH_PERCENT, &width_item_1);
            nodeAPI->setAttribute(column1, NODE_HEIGHT_PERCENT, &height_item_1);
            nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &colorItem2);
            ArkUI_AttributeItem column1Id = {.string = "tap2"};
            nodeAPI->setAttribute(column1, NODE_ID, &column1Id);
            nodeAPI->addChild(stack, column1);
            
            ArkUI_NumberValue width_value_2[] = {{.f32 = WIDTH_PERCENT_2}};
            ArkUI_AttributeItem width_item_2 = {width_value_2, sizeof(width_value_2) / sizeof(ArkUI_NumberValue)};
            
            ArkUI_NumberValue height_value_2[] = {{.f32 = HEIGHT_PERCENT_2}};
            ArkUI_AttributeItem height_item_2 = {height_value_2, sizeof(height_value_2) / sizeof(ArkUI_NumberValue)};
            auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(column2, NODE_WIDTH_PERCENT, &width_item_2);
            nodeAPI->setAttribute(column2, NODE_HEIGHT_PERCENT, &height_item_2);
            nodeAPI->setAttribute(column2, NODE_BACKGROUND_COLOR, &colorItem3);
            ArkUI_AttributeItem column2Id = {.string = "tap3"};
            nodeAPI->setAttribute(column2, NODE_ID, &column2Id);
            nodeAPI->addChild(column1, column2);
            
            ArkUI_NumberValue width_value_3[] = {{.f32 = WIDTH_PERCENT_3}};
            ArkUI_AttributeItem width_item_3 = {width_value_3, sizeof(width_value_3) / sizeof(ArkUI_NumberValue)};
            
            ArkUI_NumberValue height_value_3[] = {{.f32 = HEIGHT_PERCENT_3}};
            ArkUI_AttributeItem height_item_3 = {height_value_3, sizeof(height_value_3) / sizeof(ArkUI_NumberValue)};
            auto column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(column3, NODE_WIDTH_PERCENT, &width_item_3);
            nodeAPI->setAttribute(column3, NODE_HEIGHT_PERCENT, &height_item_3);
            nodeAPI->setAttribute(column3, NODE_BACKGROUND_COLOR, &colorItem4);
            ArkUI_AttributeItem column3Id = {.string = "tap4"};
            nodeAPI->setAttribute(column3, NODE_ID, &column3Id);
            nodeAPI->addChild(column2, column3);
            
            static auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            ArkUI_AttributeItem TEXT_Item = {.string = "default"};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &TEXT_Item);
            ArkUI_AttributeItem textId = {.string = "textId"};
            nodeAPI->setAttribute(text, NODE_ID, &textId);
            nodeAPI->addChild(stack, text);

            auto tapGesture = gestureApi->createTapGesture(1, 1);
            auto tapGesture2 = gestureApi->createTapGesture(1, 1);
            auto tapGesture3 = gestureApi->createLongPressGesture(1, true,500);


            gestureApi->setGestureEventTarget(
                tapGesture, GESTURE_EVENT_ACTION_ACCEPT, column1, [](ArkUI_GestureEvent *event, void *extraParams) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "column1 tap is called");
                });
            gestureApi->addGestureToNode(column1, tapGesture, ArkUI_GesturePriority::NORMAL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);

            gestureApi->setGestureEventTarget(
                tapGesture2, GESTURE_EVENT_ACTION_ACCEPT, column2, [](ArkUI_GestureEvent *event, void *extraParams) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "column2 tap is called");
                });
            gestureApi->addGestureToNode(column2, tapGesture2, ArkUI_GesturePriority::NORMAL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);

            gestureApi->setGestureEventTarget(
                tapGesture3, GESTURE_EVENT_ACTION_ACCEPT, column3, [](ArkUI_GestureEvent *event, void *extraParams) {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "column3 LongPress is called");
                    std::string numLockText = "column3 LongPress is called";
                    ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
                });
            gestureApi->addGestureToNode(column3, tapGesture3, ArkUI_GesturePriority::NORMAL,
                                         ArkUI_GestureMask::NORMAL_GESTURE_MASK);

            auto onTouchTestDoneCallback = [](ArkUI_GestureEvent *event, ArkUI_GestureRecognizerHandleArray recognizers,
                                              int32_t count, void *userData) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone",
                             "touchTestDone count is %{public}d", count);
                for (int i = 0; i < count; i++) {
                    auto type = gestureApi->getGestureType(recognizers[i]);
                    if (type == ArkUI_GestureRecognizerType::TAP_GESTURE) {
                        OH_ArkUI_PreventGestureRecognizerBegin(recognizers[i]);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "i is %{public}d", i);
                    }
                }
            };
            OH_ArkUI_SetTouchTestDoneCallback(stack, nullptr, onTouchTestDoneCallback);

            nodeAPI->registerNodeEvent(stack, NODE_ON_CLICK, 0, nullptr);
            nodeAPI->addNodeEventReceiver(stack, [](ArkUI_NodeEvent *event) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "lyk---touchTestDone", "stack click tap is called");
                std::string numLockText = "stack click tap is called";
                ArkUI_AttributeItem updatedTEXT_Item = {.string = numLockText.c_str()};
                nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &updatedTEXT_Item);
            });
            OH_NativeXComponent_AttachNativeRootNode(component, stack);
        }
    }
    return nullptr;
}
} // namespace ArkUICapiTest
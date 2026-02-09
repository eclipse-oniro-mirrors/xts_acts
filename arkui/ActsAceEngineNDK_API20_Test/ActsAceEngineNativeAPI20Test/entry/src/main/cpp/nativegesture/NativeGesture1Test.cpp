/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include "common/Common.h"
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <cstdint>


namespace NativeGestureTest {
static ArkUI_NodeContentHandle g_content;
static ArkUI_NodeContentHandle g_content3;
static ArkUI_GestureRecognizer* g_recognizer;
static ArkUI_GestureRecognizer* g_recognizer2;
static ArkUI_GestureInterruptInfo* g_event;
static ArkUI_GestureEventTargetInfo* g_event1;
static ArkUI_GestureEventTargetInfo* g_event2;
static ArkUI_TouchRecognizerHandleArray g_touchHandles;
static int32_t g_touchHandlesSize;

napi_value CreateGestureNode1(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(g_content, column);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFC0CB }};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem item0 = { .string = "Column1" };
    nodeAPI->setAttribute(column, NODE_ID, &item0);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_ALL, PARAM_5);
    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_event = info;
        g_recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(g_event);
        OH_ArkUI_GetGestureEventTargetInfo(g_recognizer, &g_event1);
        OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers(g_event, &g_touchHandles, &g_touchHandlesSize);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    gestureApi->addGestureToNode(column, PanGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GetTouchRecognizers0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureInterruptInfo* interruptInfo;
    ArkUI_TouchRecognizerHandleArray* recognizers;
    int32_t* size;
    int32_t result = OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers(interruptInfo, recognizers, size);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetTouchRecognizers0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureInterruptInfo* interruptInfo = nullptr;
    ArkUI_TouchRecognizerHandleArray recognizers = nullptr;
    int32_t size = NULL;
    int32_t result = OH_ArkUI_GestureInterruptInfo_GetTouchRecognizers(interruptInfo, &recognizers, &size);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value CancelTouch0100(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    if (g_touchHandlesSize == 0) {
        napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
        return retValue;
    }
    int32_t result = OH_ArkUI_TouchRecognizer_CancelTouch(g_touchHandles[0], g_event);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value CancelTouch0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureInterruptInfo* interruptInfo = nullptr;
    ArkUI_TouchRecognizerHandle recognizers = nullptr;
    int32_t result = OH_ArkUI_TouchRecognizer_CancelTouch(recognizers, interruptInfo);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetFromInterruptInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizerHandleArray* responseChain;
    int32_t* count;
    int32_t result = OH_ArkUI_GetResponseRecognizersFromInterruptInfo(g_event, responseChain, count);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetFromInterruptInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureInterruptInfo* event = nullptr;
    ArkUI_GestureRecognizerHandleArray* responseChain = nullptr;
    int32_t* count = NULL;
    int32_t result = OH_ArkUI_GetResponseRecognizersFromInterruptInfo(event, responseChain, count);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGestureRecognizerEnabled0100(napi_env env, napi_callback_info info)
{
    bool enabled;
    int32_t result = OH_ArkUI_SetGestureRecognizerEnabled(g_recognizer, enabled);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGestureRecognizerEnabled0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizer* recognizer = nullptr;
    bool enabled = true;
    int32_t result = OH_ArkUI_SetGestureRecognizerEnabled(recognizer, enabled);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGestureRecognizerLimitFingerCount0100(napi_env env, napi_callback_info info)
{
    bool limitFingerCount = true;
    int32_t result = OH_ArkUI_SetGestureRecognizerLimitFingerCount(g_recognizer, limitFingerCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetGestureRecognizerLimitFingerCount0200(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createLongPressGesture(1, true, 500);
    bool limitFingerCount = true;
    int32_t result = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, limitFingerCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureRecognizerState0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizerState state;
    int32_t result = OH_ArkUI_GetGestureRecognizerState(g_recognizer, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureRecognizerState0200(napi_env env, napi_callback_info info)
{
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    ArkUI_GestureRecognizer* TapGesture = gestureApi->createTapGesture(1, 1);
    ArkUI_GestureRecognizerState state;
    int32_t result = OH_ArkUI_GetGestureRecognizerState(TapGesture, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureEventTargetInfo0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureEventTargetInfo* infor;
    int32_t result = OH_ArkUI_GetGestureEventTargetInfo(g_recognizer, &infor);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureEventTargetInfo0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureEventTargetInfo** infor;
    int32_t result = OH_ArkUI_GetGestureEventTargetInfo(nullptr, infor);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value CreateGestureNode3(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_content3);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    OH_ArkUI_NodeContent_AddNode(g_content3, Scroll);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFC0CB }};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(Scroll, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem item0 = { .string = "Scroll1" };
    nodeAPI->setAttribute(Scroll, NODE_ID, &item0);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(Scroll, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(Scroll, NODE_HEIGHT_PERCENT, &item1);
    ArkUI_NativeGestureAPI_1 *gestureApi = nullptr;
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto PanGesture = gestureApi->createPanGesture(1, GESTURE_DIRECTION_LEFT, PARAM_5);
    auto onInterruptCallback1 = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        g_recognizer2 =OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        OH_ArkUI_GetGestureEventTargetInfo(g_recognizer2, &g_event2);
        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    gestureApi->addGestureToNode(Scroll, PanGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(Scroll, onInterruptCallback1);
    bool ret = true;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(g_event2, &ret);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollBegin0100(napi_env env, napi_callback_info info)
{
    bool ret = true;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(g_event2, &ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollBegin0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureEventTargetInfo* TargetInfo = nullptr;
    bool* ret;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(TargetInfo, ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollBegin0300(napi_env env, napi_callback_info info)
{
    bool* ret;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollBegin(g_event1, ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER ?
                      PARAM_180001 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollEnd0100(napi_env env, napi_callback_info info)
{
    bool ret = true;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(g_event2, &ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollEnd0300(napi_env env, napi_callback_info info)
{
    bool* ret;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(g_event1, ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NON_SCROLLABLE_CONTAINER ?
                      PARAM_180001 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GestureEventTargetInfo_IsScrollEnd0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureEventTargetInfo* TargetInfo = nullptr;
    bool* ret;
    int32_t result = OH_ArkUI_GestureEventTargetInfo_IsScrollEnd(TargetInfo, ret);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetPanGestureDirectionMask0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureDirectionMask directionMask;
    int32_t result = OH_ArkUI_GetPanGestureDirectionMask(g_recognizer, &directionMask);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetPanGestureDirectionMask0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureDirectionMask directionMask = ArkUI_GestureDirection::GESTURE_DIRECTION_ALL;
    int32_t result = OH_ArkUI_GetPanGestureDirectionMask(nullptr, &directionMask);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureTag0100(napi_env env, napi_callback_info info)
{
    char buffer[100];
    int32_t bufferSize = sizeof(buffer);
    int32_t result1;
    int32_t result = OH_ArkUI_GetGestureTag(g_recognizer, buffer, bufferSize, &result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureTag0200(napi_env env, napi_callback_info info)
{
    char buffer[100];
    int32_t bufferSize = 100;
    int32_t result1 = 0;
    int32_t result = OH_ArkUI_GetGestureTag(nullptr, buffer, bufferSize, &result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureTag0300(napi_env env, napi_callback_info info)
{
    char buffer[0];
    int32_t bufferSize = sizeof(buffer);
    int32_t result1;
    int32_t result = OH_ArkUI_GetGestureTag(g_recognizer, buffer, bufferSize, &result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH ?
                      PARAM_180002 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureBindNodeId0100(napi_env env, napi_callback_info info)
{
    int32_t size = 256;
    char *nodeId = static_cast<char*>(malloc(size));
    int32_t *result1 = static_cast<int32_t*>(malloc(sizeof(int32_t)));
    int32_t result = OH_ArkUI_GetGestureBindNodeId(g_recognizer, nodeId, size, result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureBindNodeId0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizer* recognizer = nullptr;
    char* nodeId;
    int32_t size;
    int32_t* result1;
    int32_t result = OH_ArkUI_GetGestureBindNodeId(recognizer, nodeId, size, result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureBindNodeId0300(napi_env env, napi_callback_info info)
{
    int32_t size = 0;
    char *nodeId = static_cast<char*>(malloc(size));
    int32_t *result1 = static_cast<int32_t*>(malloc(sizeof(int32_t)));
    int32_t result = OH_ArkUI_GetGestureBindNodeId(g_recognizer, nodeId, size, result1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH ?
                      PARAM_180002 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
napi_value GetConflictRecognizers0200(napi_env env, napi_callback_info info)
{
    ArkUI_ParallelInnerGestureEvent* event = nullptr;
    ArkUI_GestureRecognizerHandleArray* array = nullptr;
    int32_t* size = nullptr;
    int32_t result = OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers(event, array, size);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

static void  Callback(ArkUI_GestureRecognizer * recognizer, void * userData) {}
napi_value SetArkUIGestureRecognizerDisposeNotify0100(napi_env env, napi_callback_info info)
{
    int value = 42;
    void* userData = &value;
    int32_t result = OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(g_recognizer, Callback, userData);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value SetArkUIGestureRecognizerDisposeNotify0200(napi_env env, napi_callback_info info)
{
    ArkUI_GestureRecognizer* recognizer = nullptr;
    ArkUI_GestureRecognizerDisposeNotifyCallback callback = nullptr;
    void* userData = nullptr;
    int32_t result = OH_ArkUI_SetArkUIGestureRecognizerDisposeNotify(recognizer, callback, userData);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? PARAM_401 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_DirectMask0100(napi_env env, napi_callback_info info)
{
    ArkUI_GestureDirectionMask directMask = GESTURE_DIRECTION_LEFT;
    int32_t result = OH_ArkUI_GetGestureParam_DirectMask(g_recognizer, &directMask);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_FingerCount0100(napi_env env, napi_callback_info info)
{
    int finger = 1;
    int32_t result = OH_ArkUI_GetGestureParam_FingerCount(g_recognizer, &finger);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value GetGestureParam_limitFingerCount0100(napi_env env, napi_callback_info info)
{
    bool isLimited = true;
    int32_t result = OH_ArkUI_GetGestureParam_limitFingerCount(g_recognizer, &isLimited);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
}
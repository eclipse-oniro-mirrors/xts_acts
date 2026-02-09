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

#include "getGestureParam.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/native_gesture.h>

namespace ArkUICapiTest {




typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;



typedef struct ArkUIGestureInterruptInfo_ {
    bool isSystemGesture;
    ArkUI_Int32 systemRecognizerType;
    void* event = nullptr;
    void* userData = nullptr;
    void* inputEvent = nullptr;
    void* gestureEvent = nullptr;
    void** responseLinkRecognizer = nullptr;
    ArkUI_Int32 count = 0;
    void** touchRecognizers = nullptr;
    ArkUI_Int32 touchRecognizerCnt = 0;
}ArkUIGestureInterruptInfo_;

struct ArkUIGestureEventTargetInfo_ {
    void* uiNode = nullptr;
};
typedef struct ArkUIGestureRecognizer_ {
    ArkUI_Int32 type = -1;
    void* gesture = nullptr;
    void* extraData = nullptr;
    void* attachNode = nullptr;
    bool capi = true;
    void* recognizer = nullptr;
    ArkUIGestureEventTargetInfo_ targetInfo = {};
}ArkUIGestureRecognizer_;

struct ArkUIAPIEventGestureAsyncEvent_ {
    ArkUI_Int32 subKind;
    ArkUI_Int32 repeat;
    ArkUI_Float32 x;
    ArkUI_Float32 y;
    ArkUI_Float32 angle;
    ArkUI_Float32 scale;
    ArkUI_Float32 pinchCenterX;
    ArkUI_Float32 pinchCenterY;
    ArkUI_Float32 speed;
    ArkUI_Int32 timestamp;
    ArkUI_Int32 source;
    ArkUI_Int32 pressure;
    ArkUI_Int32 tiltX;
    ArkUI_Int32 tiltY;
    ArkUI_Int32 sourceTool;
    ArkUI_Float32 velocityX;
    ArkUI_Float32 velocityY;
    ArkUI_Float32 velocity;
    void* rawPointerEvent;
};


typedef struct ArkUI_GestureInterruptInfo_ {
    ArkUIGestureInterruptInfo_ interruptData;
}ArkUI_GestureInterruptInfo_;

napi_value GetGestureParamTest::GetGestureParamTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    int figNums = 0;
    auto ret = OH_ArkUI_GetGestureParam_FingerCount(panGesture, &figNums);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_a", "GetGestureParam FingerCount invalid");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    NAPI_END;
} 

napi_value GetGestureParamTest::GetGestureParamTest_a1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_a1", "CreateNativeNode");
    //NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(1, GESTURE_DIRECTION_LEFT, 1);
    
    int figNums = 0;
    if(!panGesture)
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_a1", "GetGestureParam panGesture is nullptr ");
    auto ret = OH_ArkUI_GetGestureParam_FingerCount((ArkUI_GestureRecognizer*)panGesture, &figNums);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_a1", "GetGestureParam FingerCount ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);//无法构造成功场景，recognizer初始化为空导致校验失败，暂无接口对其赋值;其他接口同样原因。
    
    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);
    bool checkCount = false;
    int retrel = OH_ArkUI_GetGestureParam_limitFingerCount(panGesture, &checkCount);
    if(retrel == ARKUI_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_b", "GetGestureRecognizer limitFingerCount failed %{public}d", checkCount);
        ASSERT_EQ(checkCount, false);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_b", "GetGestureRecognizer  checkCount %{public}d, ret %{public}d", checkCount, retrel);
        ASSERT_EQ(checkCount, true);
    }
    NAPI_END;

}

napi_value GetGestureParamTest::GetGestureParamTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    bool checkCount = false;
    auto retrel = OH_ArkUI_GetGestureParam_repeat(panGesture, &checkCount);
    if(retrel != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_b", "GetGestureRecognizer repeat failed %{public}d", checkCount);
        ASSERT_EQ(checkCount, false);
    }

    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_distance(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_d", "GetGestureParam repeat failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_e(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_speed(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_e", "GetGestureParam speed failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}


napi_value GetGestureParamTest::GetGestureParamTest_f(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_duration(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_f", "GetGestureParam duration failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_g(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_angle(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_g", "GetGestureParam angle failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_h(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_distanceThreshold(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_h", "GetGestureParam angle failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}


napi_value GetGestureParamTest::GetGestureParamTest_i(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_i", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto panGesture = gestureAPI->createPanGesture(5, GESTURE_DIRECTION_DOWN, 5);

    auto ret = OH_ArkUI_GetGestureParam_DirectMask(panGesture, NULL);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_i", "GetGestureParam angle failed");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}


napi_value GetGestureParamTest::GetGestureParamTest_j(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_j", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    ArkUI_GestureInterruptInfo_* event = new ArkUI_GestureInterruptInfo_;
    char data[12] = "user data";
    event->interruptData.userData = data;
    auto* ret = OH_ArkUI_GestureInterrupter_GetUserData((ArkUI_GestureInterruptInfo*)event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_j", "get GetUserData ptr");
    ASSERT_STREQ((char*)ret, (char*)data);

    NAPI_END;
}

napi_value GetGestureParamTest::GetGestureParamTest_j1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_j1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //auto* panGesture = CreatePanGesture(5, (ArkUI_GestureDirectionMask)1, 5.21);
    auto* ret = OH_ArkUI_GestureInterrupter_GetUserData(nullptr);
    int check = 1;
    if(ret == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGestureParamTest_j1", "get GetUserData nullptr");
        check = 0;
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}
} // namespace ArkUICapiTest
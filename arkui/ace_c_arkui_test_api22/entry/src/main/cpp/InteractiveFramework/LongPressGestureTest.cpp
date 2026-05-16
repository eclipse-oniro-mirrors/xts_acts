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

#include "LongPressGestureTest.h"

#include <arkui/native_interface.h>
#include <arkui/native_gesture.h>
#include <arkui/native_type.h>

namespace ArkUICapiTest {

    napi_value LongPressGestureTest::SetAllowableMovement(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement", "CreateNativeNode");
        auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
        
        auto LongPressGesture = gestureAPI->createLongPressGesture(1, true, 100);
        int ret = OH_ArkUI_LongPressGesture_SetAllowableMovement(LongPressGesture, 0);
        
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement", "check SetAllowableMovement ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
        NAPI_END;
    }

    napi_value LongPressGestureTest::SetAllowableMovement_Invalid(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement_Invalid", "CreateNativeNode");
        
        int ret = OH_ArkUI_LongPressGesture_SetAllowableMovement(nullptr, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement_Invalid", "check SetAllowableMovement_Invalid ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
        NAPI_END;
    }

    napi_value LongPressGestureTest::SetAllowableMovement_notSup (napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement_notSup", "CreateNativeNode");
        auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
        
        auto tapGesture = gestureAPI->createTapGesture(1, 1);
        int ret = OH_ArkUI_LongPressGesture_SetAllowableMovement(tapGesture, 0.0);
        int expect_val = 0;
        if(ret == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED) //Varies depending on the specific type of equipment. 
            expect_val =  ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED;
        else 
            expect_val = ARKUI_ERROR_CODE_NO_ERROR;
        
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetAllowableMovement_notSup", "check SetAllowableMovement_notSup ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, expect_val);
        NAPI_END;
    }

    napi_value LongPressGestureTest::GetAllowableMovement_Invalid(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement_Invalid", "CreateNativeNode");
        
        int ret = OH_ArkUI_LongPressGesture_GetAllowableMovement(nullptr, nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement_Invalid", "check GetAllowableMovement_Invalid ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
        NAPI_END;
    }

    napi_value LongPressGestureTest::GetAllowableMovement(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement", "CreateNativeNode");
        auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
        
        auto panGesture = gestureAPI->createLongPressGesture(1, true, 100);
        double  vval = 0;
        int ret = OH_ArkUI_LongPressGesture_GetAllowableMovement(panGesture, &vval);
        
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement", "check GetAllowableMovement ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
        NAPI_END;
    }

    napi_value LongPressGestureTest::GetAllowableMovement_SUPPORTED(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement", "CreateNativeNode");
        auto gestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
        
        auto panGesture = gestureAPI->createTapGesture(1, 1);
        double  vval = 0.0;
        int ret = OH_ArkUI_LongPressGesture_GetAllowableMovement(panGesture, &vval);
        int expect_val = 0;
        if(ret == ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED) //Varies depending on the specific type of equipment. 
            expect_val =  ARKUI_ERROR_CODE_RECOGNIZER_TYPE_NOT_SUPPORTED;
        else 
            expect_val = ARKUI_ERROR_CODE_NO_ERROR;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAllowableMovement_SUPPORTED", "check GetAllowableMovement_SUPPORTED ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, expect_val);
        NAPI_END;
    }


    napi_value LongPressGestureTest::SetMeasureFromViewport(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMeasureFromViewport", "CreateNativeNode");
        auto option = OH_ArkUI_VisibleAreaEventOptions_Create();
        int ret = OH_ArkUI_VisibleAreaEventOptions_SetMeasureFromViewport(option, true);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMeasureFromViewport", "check SetMeasureFromViewport ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
        NAPI_END;
    }

    napi_value LongPressGestureTest::SetMeasureFromViewport_Invalid(napi_env env, napi_callback_info info)
    {
        NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMeasureFromViewport_Invalid", "CreateNativeNode");
        
        int ret = OH_ArkUI_VisibleAreaEventOptions_SetMeasureFromViewport(nullptr, true);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMeasureFromViewport_Invalid", "check SetMeasureFromViewport_Invalid ret: %{public}d   -----------------", ret);
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
        NAPI_END;
    }

}
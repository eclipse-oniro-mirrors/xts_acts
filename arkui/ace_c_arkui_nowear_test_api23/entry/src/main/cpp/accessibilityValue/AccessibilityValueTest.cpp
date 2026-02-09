/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "AccessibilityValueTest.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/native_interface_accessibility.h>
#include <map>

namespace ArkUICapiTest {

struct ArkUI_OptionalInt_ {
    int32_t isSet;
    int32_t value;
};
struct ArkUI_OptionalCharPtr_ {
    int32_t isSet;
    const char* value;
};

typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;

struct ArkUIFocusAxisEvent_ {
    ArkUI_Float64 absXValue;
    ArkUI_Float64 absYValue;
    ArkUI_Float64 absZValue;
    ArkUI_Float64 absRzValue;
    ArkUI_Float64 absHat0XValue;
    ArkUI_Float64 absHat0YValue;
    ArkUI_Float64 absBrakeValue;
    ArkUI_Float64 absGasValue;
    ArkUI_Float64 absRxValue;
    ArkUI_Float64 absRyValue;
    ArkUI_Float64 absThrottleValue;
    ArkUI_Float64 absRudderValue;
    ArkUI_Float64 absWheelValue;
    ArkUI_Float64 absHat1XValue;
    ArkUI_Float64 absHat1YValue;
    ArkUI_Float64 absHat2XValue;
    ArkUI_Float64 absHat2YValue;
    ArkUI_Float64 absHat3XValue;
    ArkUI_Float64 absHat3YValue;
};

struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUI_Int32 eventTypeId;
    void* inputEvent;
    bool isCloned = false;
};

napi_value AccessibilityValueTest::AccessibilityValueTest_d10(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d10", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d10", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.9;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_RX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d10", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d101(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d101", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_RX);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d101", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d11(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d11", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d11", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.0;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_RY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d11", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d111(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d111", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_RY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d111", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d12(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d12", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d12", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.1;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node,
                                                      UI_FOCUS_AXIS_EVENT_ABS_THROTTLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d12", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d121(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d121", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_THROTTLE);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d121", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d13(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d13", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d13", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.2;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_RUDDER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d13", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d131(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d131", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_RUDDER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d131", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d14(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d14", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d14", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.3;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_WHEEL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d14", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d141(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d141", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_WHEEL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d141", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d15(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d15", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d15", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.4;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT1X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d15", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d151(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d151", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT1X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d151", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d16(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d16", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d16", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.5;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT1Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d16", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d161(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d161", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT1Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d161", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d17(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d17", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d17", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.6;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT2X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d17", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d171(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d171", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT2X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d171", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d18(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d18", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d18", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.7;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT2Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d18", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d181(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d181", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT2Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d181", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d19(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d19", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d19", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.8;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT3X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d19", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d191(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d191", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT3X);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d191", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d20(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d20", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = C_FOCUS_AXIS_EVENT_ID;
    evt->absRxValue = DEFAULT_ABS_RX_VALUE;
    evt->absRyValue = DEFAULT_ABS_RY_VALUE;
    evt->absThrottleValue = DEFAULT_ABS_THROTTLE_VALUE;
    evt->absRudderValue = DEFAULT_ABS_RUDDER_VALUE;
    evt->absWheelValue = DEFAULT_ABS_WHEEL_VALUE;
    evt->absHat1XValue = DEFAULT_ABS_HAT1X_VALUE;
    evt->absHat1YValue = DEFAULT_ABS_HAT1Y_VALUE;
    evt->absHat2XValue = DEFAULT_ABS_HAT2X_VALUE;
    evt->absHat2YValue = DEFAULT_ABS_HAT2Y_VALUE;
    evt->absHat3XValue = DEFAULT_ABS_HAT3X_VALUE;
    evt->absHat3YValue = DEFAULT_ABS_HAT3Y_VALUE;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d20", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 2.9;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, UI_FOCUS_AXIS_EVENT_ABS_HAT3Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d20", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d201(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d201", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue(nullptr, UI_FOCUS_AXIS_EVENT_ABS_HAT3Y);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "AccessibilityValueTest_d201", "absRxValue nullptr = %{public}f", ret);
    ASSERT_EQ(ret, 0.0);
    
    NAPI_END;
}

typedef struct ArkUI_AccessibilityProviderCallbacksWithInstance_
{
    int32_t (*findAccessibilityNodeInfosById)(const char* instanceId, int64_t elementId,
                                              ArkUI_AccessibilitySearchMode mode,
                                              int32_t requestId,
                                              ArkUI_AccessibilityElementInfoList* elementList);
    
    int32_t (*findAccessibilityNodeInfosByText)(const char* instanceId, int64_t elementId, const char* text,
                                                int32_t requestId,
                                                ArkUI_AccessibilityElementInfoList* elementList);
    
    int32_t (*findFocusedAccessibilityNode)(const char* instanceId, int64_t elementId,
                                            ArkUI_AccessibilityFocusType focusType,
                                            int32_t requestId,
                                            ArkUI_AccessibilityElementInfo* elementInfo);
    
    int32_t (*findNextFocusAccessibilityNode)(const char* instanceId, int64_t elementId,
                                              ArkUI_AccessibilityFocusMoveDirection direction,
                                              int32_t requestId,
                                              ArkUI_AccessibilityElementInfo* elementInfo);
    
    int32_t (*executeAccessibilityAction)(const char* instanceId, int64_t elementId,
                                          ArkUI_Accessibility_ActionType action,
                                          ArkUI_AccessibilityActionArguments *actionArguments,
                                          int32_t requestId);
    
    int32_t (*clearFocusedFocusAccessibilityNode)(const char* instanceId);
    
    int32_t (*getAccessibilityNodeCursorPosition)(const char* instanceId, int64_t elementId,
                                                  int32_t requestId,
                                                  int32_t* index);
} ArkUI_AccessibilityProviderCallbacksWithInstance_;

int32_t findAccessibilityNodeInfosById_(const char* instanceId, int64_t elementId,
                                        ArkUI_AccessibilitySearchMode mode,
                                        int32_t requestId,
                                        ArkUI_AccessibilityElementInfoList* elementList)
{
    return 0;
}
    
int32_t findAccessibilityNodeInfosByText_(const char* instanceId, int64_t elementId, const char* text,
                                          int32_t requestId,
                                          ArkUI_AccessibilityElementInfoList* elementList)
{
    return 0;
}
    
int32_t findFocusedAccessibilityNode_(const char* instanceId, int64_t elementId,
                                      ArkUI_AccessibilityFocusType focusType,
                                      int32_t requestId,
                                      ArkUI_AccessibilityElementInfo* elementInfo)
{
    return 0;
}
    
int32_t findNextFocusAccessibilityNode_(const char* instanceId, int64_t elementId,
                                        ArkUI_AccessibilityFocusMoveDirection direction,
                                        int32_t requestId,
                                        ArkUI_AccessibilityElementInfo* elementInfo)
{
    return 0;
}
    
int32_t executeAccessibilityAction_(const char* instanceId, int64_t elementId,
                                    ArkUI_Accessibility_ActionType action,
                                    ArkUI_AccessibilityActionArguments *actionArguments,
                                    int32_t requestId)
{
    return 0;
}
    
int32_t clearFocusedFocusAccessibilityNode_(const char* instanceId)
{
    return 0;
}
    
int32_t getAccessibilityNodeCursorPosition_(const char* instanceId, int64_t elementId,
                                            int32_t requestId,
                                            int32_t* index)
{
    return 0;
}
} // namespace ArkUICapiTest
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

#include "accessibilityValue.h"
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
struct ArkUI_AccessibilityValue_ {
    ArkUI_OptionalInt_ min;
    ArkUI_OptionalInt_ max;
    ArkUI_OptionalInt_ current;
    ArkUI_OptionalInt_ rangeMin;
    ArkUI_OptionalInt_ rangeMax;
    ArkUI_OptionalInt_ rangeCurrent;
    ArkUI_OptionalCharPtr_ text;
};

napi_value AccessibilityValueTest::AccessibilityValueTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //ArkUI_AccessibilityValue_ *node = new ArkUI_AccessibilityValue_;
    ArkUI_AccessibilityValue *node = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetRangeMin(node, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_a", "SetRangeMin  1 done");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeMin(node);
    ASSERT_EQ(ret, 1);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_a1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    //ArkUI_AccessibilityValue_ *node = new ArkUI_AccessibilityValue_;
    ArkUI_AccessibilityValue *node = nullptr;
    OH_ArkUI_AccessibilityValue_SetRangeMin(node, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_a1", "set/get nullptr");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeMin(node);
    ASSERT_EQ(ret, -1);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityValue *node = OH_ArkUI_AccessibilityValue_Create();

    OH_ArkUI_AccessibilityValue_SetRangeMax(node, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_b", "SetRangeMax  2 done");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeMax(node);
    ASSERT_EQ(ret, 2);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_b1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityValue *node = nullptr;

    OH_ArkUI_AccessibilityValue_SetRangeMax(node, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_b1", "set/get nullptr");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeMax(node);
    ASSERT_EQ(ret, -1);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityValue *node = OH_ArkUI_AccessibilityValue_Create();

    OH_ArkUI_AccessibilityValue_SetRangeCurrent(node, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_c", "SetRangeCurrent  3 done");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeCurrent(node);
    ASSERT_EQ(ret, 3);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_c1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityValue *node = nullptr;

    OH_ArkUI_AccessibilityValue_SetRangeCurrent(node, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_c1", "set/get nullptr");
    auto ret = OH_ArkUI_AccessibilityValue_GetRangeCurrent(node);
    ASSERT_EQ(ret, -1);
    NAPI_END;
}
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
    ArkUI_Float64 tiltX;
    ArkUI_Float64 tiltY;
    ArkUI_Float64 pressure;
    ArkUI_Int32 toolType;
    ArkUI_Int64 timeStamp;
    ArkUI_Int32 subKind;
    ArkUI_Int32 sourceType;
    ArkUI_Int64 deviceId;
    ArkUI_Int32* pressedKeyCodes;
    ArkUI_Int32 keyCodesLength;
    ArkUI_Int32 targetDisplayId;
    bool stopPropagation;
    ArkUI_Float32 targetPositionX;
    ArkUI_Float32 targetPositionY;
    ArkUI_Float32 targetGlobalPositionX;
    ArkUI_Float32 targetGlobalPositionY;
    ArkUI_Float32 width;
    ArkUI_Float32 height;
    ArkUI_Uint64 modifierKeyState;
};
struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUI_Int32 eventTypeId;
    void* inputEvent;
    bool isCloned = false;
};

napi_value AccessibilityValueTest::AccessibilityValueTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.1;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d1", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d1", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.2;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d1", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d2(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d2", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d2", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.3;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d2", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d3(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d3", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d3", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.4;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d3", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d4(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d4", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d4", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.5;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 4);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d4", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d5(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d5", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d5", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.6;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 5);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d5", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d6(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d6", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d6", "preset RangeCurrent node done");
    
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.7;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 6);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d6", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_d7(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d7", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d7", "preset RangeCurrent node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 1.8;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 7);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d7", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_d8(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d8", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 4; //C_AXIS_EVENT_ID
    evt->absXValue = 1.1;
    evt->absYValue = 1.2;
    evt->absZValue = 1.3;
    evt->absRzValue = 1.4;
    evt->absGasValue = 1.5;
    evt->absBrakeValue = 1.6;
    evt->absHat0XValue = 1.7;
    evt->absHat0YValue = 1.8;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d8", "preset RangeCurrent node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 0.0f;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 7);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d8", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    NAPI_END;
}


napi_value AccessibilityValueTest::AccessibilityValueTest_d9(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d9", "CreateNativeNode");

    ArkUI_UIInputEvent *node = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d9", "preset RangeCurrent node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    double val = 0.0;
    double ret = OH_ArkUI_FocusAxisEvent_GetAxisValue((const ArkUI_UIInputEvent*)node, 7);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_d9", "GetRangeCurrent  %{public}f", ret);
    ASSERT_EQ(ret, val);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_e(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; //C_FOCUS_AXIS_EVENT_ID
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_FocusAxisEvent_SetStopPropagation((const ArkUI_UIInputEvent*)node, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e", "GetRangeCurrent  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_e1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e1", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e1", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_FocusAxisEvent_SetStopPropagation((const ArkUI_UIInputEvent*)node, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e1", "set nullptr");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_e2(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e2", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 0; //C_FOCUS_AXIS_EVENT_ID
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e2", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_FocusAxisEvent_SetStopPropagation((const ArkUI_UIInputEvent*)node, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_e2", "GetRangeCurrent  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


napi_value AccessibilityValueTest::AccessibilityValueTest_f(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_f", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->width = 2.2f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_f", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetWidth((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_f", "GetEventTargetWidth  %{public}f", ret);
    ASSERT_EQ((float)ret, 2.2f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_f1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetWidth(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_f1", "GetEventTargetWidth  %{public}f", ret);
    ASSERT_EQ((float)ret, 0.0f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_g(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_g", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->height = 2.3f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_g", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetHeight((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_g", "GetEventTargetHeight  %{public}f", ret);
    ASSERT_EQ(ret, 2.3f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_g1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_g1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetHeight(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_g1", "GetEventTargetHeight  %{public}f", ret);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_h(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_h", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->targetPositionX = 2.4f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_h", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetPositionX((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_h", "GetEventTargetPositionX  %{public}f", ret);
    ASSERT_EQ(ret, 2.4f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_h1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_h1", "CreateNativeNode");

    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetPositionX(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_h1", "GetEventTargetPositionX  %{public}f", ret);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_i(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_i", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->targetGlobalPositionX = 2.6f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_i", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionX((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_i", "GetEventTargetGlobalPositionX  %{public}f", ret);
    ASSERT_EQ(ret, 2.6f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_i1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_i1", "CreateNativeNode");

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionX(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_i1", "GetEventTargetGlobalPositionX  %{public}f", ret);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_j(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_j", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->targetGlobalPositionY = 2.7f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_j", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionY((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_j", "GetEventTargetGlobalPositionY  %{public}f", ret);
    ASSERT_EQ(ret, 2.7f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_j1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_j1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetGlobalPositionY(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_j1", "GetEventTargetGlobalPositionY  %{public}f", ret);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_k(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_k", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->modifierKeyState = 28;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_k", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetModifierKeyStates((const ArkUI_UIInputEvent*)node, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_k", "GetEventTargetGlobalPositionY  %{public}d", ret);
    ASSERT_EQ(ret, 28);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_k1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_k1", "CreateNativeNode");

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetModifierKeyStates(nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_k1", "GetEventTargetGlobalPositionY  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_l(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_l", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIFocusAxisEvent_ *evt = new ArkUIFocusAxisEvent_;
    node->eventTypeId = 6; 
    evt->targetPositionY = 2.5f;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_l", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetPositionY((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_l", "GetEventTargetPositionY  %{public}f", ret);
    ASSERT_EQ(ret, 2.5f);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_l1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_l1", "CreateNativeNode");

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_UIInputEvent_GetEventTargetPositionY(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_l1", "GetEventTargetPositionY  %{public}f", ret);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
struct ArkUIHoverEvent_ {
    ArkUI_Int32 targetDisplayId;
    ArkUI_Int32 subKind;
    ArkUI_Int32 isHover;
    ArkUI_Float32 targetPositionX;
    ArkUI_Float32 targetPositionY;
    ArkUI_Float32 targetGlobalPositionX;
    ArkUI_Float32 targetGlobalPositionY;
    ArkUI_Float64 tiltX;
    ArkUI_Float64 tiltY;
    ArkUI_Float64 rollAngle;
    ArkUI_Float32 width;
    ArkUI_Float32 height;
    ArkUI_Int64 timeStamp;
    ArkUI_Int32 sourceType;
    ArkUI_Int64 deviceId;
    ArkUI_Int32 toolType;
    ArkUI_Uint64 modifierKeyState;
    /**
     * @brief Prevents events from bubbling further to the parent node for processing.
     *
     */
    bool stopPropagation;
};

napi_value AccessibilityValueTest::AccessibilityValueTest_m(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_m", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIHoverEvent_ *evt = new ArkUIHoverEvent_;
    node->eventTypeId = 8; //C_HOVER_EVENT_ID 
    evt->isHover = 1;
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_m", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_HoverEvent_IsHovered((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_m", "IsHovered  %{public}d", ret);
    ASSERT_EQ(ret, 1);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_m1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_m1", "CreateNativeNode");

    auto ret = OH_ArkUI_HoverEvent_IsHovered(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_m1", "IsHovered  %{public}d", ret);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
typedef struct ArkUITouchPoint_ {
    ArkUI_Int32 id;
    ArkUI_Int64 pressedTime;
    ArkUI_Float32 screenX;
    ArkUI_Float32 screenY;
    ArkUI_Float32 windowX;
    ArkUI_Float32 windowY;
    ArkUI_Float64 globalDispalyX;
    ArkUI_Float64 globalDispalyY;
    ArkUI_Float32 nodeX;
    ArkUI_Float32 nodeY;
    ArkUI_Float64 pressure;
    ArkUI_Float32 contactAreaWidth;
    ArkUI_Float32 contactAreaHeight;
    ArkUI_Float64 tiltX;
    ArkUI_Float64 tiltY;
    ArkUI_Float64 rollAngle;
    ArkUI_Float32 toolX;
    ArkUI_Float32 toolY;
    ArkUI_Float32 toolWidth;
    ArkUI_Float32 toolHeight;
    ArkUI_Float32 rawX;
    ArkUI_Float32 rawY;
    ArkUI_Int32 toolType;
    ArkUI_Int32 operatingHand;
}ArkUITouchPoint_;


typedef struct ArkUIAxisEvent_ {
    ArkUI_Int32 action;
    ArkUI_Int64 timeStamp;
    ArkUITouchPoint_ actionTouchPoint;
    ArkUI_Int32 sourceType;
    ArkUI_Float64 horizontalAxis;
    ArkUI_Float64 verticalAxis;
    ArkUI_Float64 pinchAxisScale;
    ArkUI_Int32 targetDisplayId;
    ArkUI_Int32 subKind;
    bool propagation;
    ArkUI_Int32 scrollStep;
    ArkUI_Float32 targetPositionX;
    ArkUI_Float32 targetPositionY;
    ArkUI_Float32 targetGlobalPositionX;
    ArkUI_Float32 targetGlobalPositionY;
    ArkUI_Float32 width;
    ArkUI_Float32 height;
    ArkUI_Uint64 modifierKeyState;
    ArkUI_Int64 deviceId;
}ArkUIAxisEvent_;

napi_value AccessibilityValueTest::AccessibilityValueTest_n(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_n", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIAxisEvent_ *evt = new ArkUIAxisEvent_;
    node->eventTypeId = 4; //C_AXIS_EVENT_ID 
    node->inputEvent = (void*)evt;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_n", "preset node done");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    bool val = true;
    auto ret = OH_ArkUI_AxisEvent_SetPropagation((const ArkUI_UIInputEvent*)node, val);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_n", "SetPropagation  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_n1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_n1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    bool val = true;
    auto ret = OH_ArkUI_AxisEvent_SetPropagation(nullptr, val);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_n1", "SetPropagation  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_o(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_o", "CreateNativeNode");

    ArkUI_UIInputEvent_ *node = new ArkUI_UIInputEvent_;
    ArkUIAxisEvent_ *evt = new ArkUIAxisEvent_;
    node->eventTypeId = 4; //C_AXIS_EVENT_ID 
    evt->scrollStep = 1;
    node->inputEvent = (void*)(evt);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_o", "preset node done, scrollStep %{public}d ",
                ((ArkUIAxisEvent_*)node->inputEvent)->scrollStep);
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_AxisEvent_GetScrollStep((const ArkUI_UIInputEvent*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_o", "GetScrollStep  %{public}d", ret);
    ASSERT_EQ(ret, 1);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_o1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_o1", "CreateNativeNode");

    auto ret = OH_ArkUI_AxisEvent_GetScrollStep(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_o1", "GetScrollStep  %{public}d", ret);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}


typedef struct ArkUI_AccessibilityProviderCallbacksWithInstance_ {
    
    int32_t (*findAccessibilityNodeInfosById)(const char* instanceId, int64_t elementId,
        ArkUI_AccessibilitySearchMode mode, int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList);
    
    int32_t (*findAccessibilityNodeInfosByText)(const char* instanceId, int64_t elementId, const char* text,
        int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList);
    
    int32_t (*findFocusedAccessibilityNode)(const char* instanceId, int64_t elementId,
        ArkUI_AccessibilityFocusType focusType, int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo);
    
    int32_t (*findNextFocusAccessibilityNode)(
        const char* instanceId, int64_t elementId, ArkUI_AccessibilityFocusMoveDirection direction,
        int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo);
    
    int32_t (*executeAccessibilityAction)(const char* instanceId, int64_t elementId,
        ArkUI_Accessibility_ActionType action, ArkUI_AccessibilityActionArguments *actionArguments, int32_t requestId);
    
    int32_t (*clearFocusedFocusAccessibilityNode)(const char* instanceId);
    
    int32_t (*getAccessibilityNodeCursorPosition)(const char* instanceId, int64_t elementId,
        int32_t requestId, int32_t* index);
} ArkUI_AccessibilityProviderCallbacksWithInstance_;


int32_t findAccessibilityNodeInfosById_(const char* instanceId, int64_t elementId,
        ArkUI_AccessibilitySearchMode mode, int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList){
    return 0;
}
    
int32_t findAccessibilityNodeInfosByText_(const char* instanceId, int64_t elementId, const char* text,
        int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList){
    return 0;
}
    
int32_t findFocusedAccessibilityNode_(const char* instanceId, int64_t elementId,
        ArkUI_AccessibilityFocusType focusType, int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo){
    return 0;
}
    
int32_t findNextFocusAccessibilityNode_(
        const char* instanceId, int64_t elementId, ArkUI_AccessibilityFocusMoveDirection direction,
        int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo){
    return 0;
}
    
int32_t executeAccessibilityAction_(const char* instanceId, int64_t elementId,
        ArkUI_Accessibility_ActionType action, ArkUI_AccessibilityActionArguments *actionArguments, int32_t requestId){
    return 0;
}
    
int32_t clearFocusedFocusAccessibilityNode_(const char* instanceId){
    return 0;
}
    
int32_t getAccessibilityNodeCursorPosition_(const char* instanceId, int64_t elementId,
        int32_t requestId, int32_t* index){
    return 0;
}
napi_value AccessibilityValueTest::AccessibilityValueTest_p(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityProvider *provider_ = nullptr;
    ArkUI_NodeHandle xc = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    OH_NativeXComponent *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xc);
    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nativeXComponent, &provider_);
    if (provider_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p", "InterfaceDesignTest get provider is null");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p", "preset node done");
    
    ArkUI_AccessibilityProviderCallbacksWithInstance_* accessibilityProviderCallbacks_ = new ArkUI_AccessibilityProviderCallbacksWithInstance_();
    const char idStr[] = "1"; 
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosById = findAccessibilityNodeInfosById_;
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosByText = findAccessibilityNodeInfosByText_;
    accessibilityProviderCallbacks_->findFocusedAccessibilityNode = findFocusedAccessibilityNode_;
    accessibilityProviderCallbacks_->findNextFocusAccessibilityNode = findNextFocusAccessibilityNode_;
    accessibilityProviderCallbacks_->executeAccessibilityAction = executeAccessibilityAction_;
    accessibilityProviderCallbacks_->clearFocusedFocusAccessibilityNode = clearFocusedFocusAccessibilityNode_;
    accessibilityProviderCallbacks_->getAccessibilityNodeCursorPosition = getAccessibilityNodeCursorPosition_;
    ret = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(idStr, provider_, (ArkUI_AccessibilityProviderCallbacksWithInstance*)accessibilityProviderCallbacks_);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p", "ProviderRegister  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value AccessibilityValueTest::AccessibilityValueTest_p1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AccessibilityProvider *provider_ = nullptr; 
    OH_NativeXComponent *nativeXComponent = nullptr;
    ArkUI_NodeHandle xc = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nativeXComponent, &provider_);
    if (provider_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p1", "InterfaceDesignTest get provider is null");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p1", "preset node done");
    
    ArkUI_AccessibilityProviderCallbacksWithInstance_* accessibilityProviderCallbacks_ = new ArkUI_AccessibilityProviderCallbacksWithInstance_();
    const char idStr[] = "1"; 
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosById = findAccessibilityNodeInfosById_;
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosByText = findAccessibilityNodeInfosByText_;
    accessibilityProviderCallbacks_->findFocusedAccessibilityNode = findFocusedAccessibilityNode_;
    accessibilityProviderCallbacks_->findNextFocusAccessibilityNode = findNextFocusAccessibilityNode_;
    accessibilityProviderCallbacks_->executeAccessibilityAction = executeAccessibilityAction_;
    accessibilityProviderCallbacks_->clearFocusedFocusAccessibilityNode = clearFocusedFocusAccessibilityNode_;
    accessibilityProviderCallbacks_->getAccessibilityNodeCursorPosition = getAccessibilityNodeCursorPosition_;
    ret = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(idStr, provider_, (ArkUI_AccessibilityProviderCallbacksWithInstance*)accessibilityProviderCallbacks_);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AccessibilityValueTest_p", "ProviderRegister  %{public}d", ret);
    ASSERT_EQ(ret, -2);
    NAPI_END;
}
} // namespace ArkUICapiTest
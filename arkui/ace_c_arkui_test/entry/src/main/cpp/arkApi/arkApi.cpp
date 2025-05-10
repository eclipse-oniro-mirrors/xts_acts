/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_animate.h>
#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#define VALUE_0 10
#define VALUE_1 1000
#define VALUE_2 (-1000)

namespace ArkUICapiTest {

static napi_value TestArkUIAddApi001(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterUIInputEventCallback(nullptr, nullptr, ArkUI_UIInputEvent_Type::ARKUI_UIINPUTEVENT_TYPE_AXIS);
    napi_value result = nullptr;  
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}

static napi_value TestArkUIAddApi002(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetType(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi003(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_UIInputEvent_GetEventTime(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi004(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi005(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi006(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowX(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi007(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_PointerEvent_GetWindowY(nullptr);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi008(napi_env env, napi_callback_info info)
{
    auto ret2 = OH_ArkUI_PointerEvent_GetDisplayX(nullptr);
    ASSERT_EQ(ret2, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi009(napi_env env, napi_callback_info info)
{
    auto ret3 = OH_ArkUI_PointerEvent_GetDisplayY(nullptr);
    ASSERT_EQ(ret3, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi010(napi_env env, napi_callback_info info)
{
    auto ret4 = OH_ArkUI_AxisEvent_GetHorizontalAxisValue(nullptr);
    ASSERT_EQ(ret4, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi011(napi_env env, napi_callback_info info)
{
    auto ret5 = OH_ArkUI_AxisEvent_GetVerticalAxisValue(nullptr);
    ASSERT_EQ(ret5, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi012(napi_env env, napi_callback_info info)
{
    auto ret6 = OH_ArkUI_AxisEvent_GetPinchAxisScaleValue(nullptr);
    ASSERT_EQ(ret6, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi013(napi_env env, napi_callback_info info)
{
    auto ret6 = OH_ArkUI_AxisEvent_GetPinchAxisScaleValue(nullptr);
    ASSERT_EQ(ret6, 0.0f);
    NAPI_END;
}

static napi_value TestArkUIAddApi014(napi_env env, napi_callback_info info)
{
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGesture = gestureApi->createSwipeGesture(1, GESTURE_DIRECTION_HORIZONTAL,10);
    auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        auto ret10 = OH_ArkUI_LongPress_GetRepeatCount(event);
        auto actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        auto ret7 = OH_ArkUI_GetNodeHandleFromNapiValue(nullptr, nullptr, nullptr);
        auto offsetX = OH_ArkUI_PanGesture_GetOffsetX(nullptr);
        auto velocity = OH_ArkUI_PanGesture_GetVelocity(nullptr);
        auto velocityX = OH_ArkUI_PanGesture_GetVelocityX(nullptr);
        auto velocityY = OH_ArkUI_PanGesture_GetVelocityY(nullptr);
        auto rawInputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(nullptr);
        
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, 
        "Manager", "callback actionType: %{public}d, offsetX %{public}f, velocity %{public}f, velocityX %{public}f, velocityY %{public}f", 
        actionType, offsetX, velocity, velocityX, velocityY);
    };
    NAPI_START(column, ARKUI_NODE_COLUMN);
    gestureApi->setGestureEventTarget(swipeGesture,GESTURE_EVENT_ACTION_ACCEPT,column,onActionCallBack);
    NAPI_END;
}

static napi_value TestArkUIAddApi015(napi_env env, napi_callback_info info)
{
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetHeight(ret, VALUE_0);
    auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetHeight(ret);
    ASSERT_EQ(value, VALUE_0);
    NAPI_END;
}

static napi_value TestArkUIAddApi016(napi_env env, napi_callback_info info)
{
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetTop(ret, VALUE_0);
    auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetTop(ret);
    ASSERT_EQ(value, VALUE_0);
    NAPI_END;
}

static napi_value TestArkUIAddApi017(napi_env env, napi_callback_info info)
{
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetLeft(ret, VALUE_0);
    auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetLeft(ret);
    ASSERT_EQ(value, VALUE_0);
    NAPI_END;
}

static napi_value TestArkUIAddApi018(napi_env env, napi_callback_info info)
{
    char *content = "C textStyle Test";
    auto ret = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(content);
    OH_ArkUI_ImageAnimatorFrameInfo_SetDuration(ret, VALUE_0);
    auto value = OH_ArkUI_ImageAnimatorFrameInfo_GetDuration(ret);
    ASSERT_EQ(value, VALUE_0);
    NAPI_END;
}

static napi_value TestArkUIAddApi019(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[1];
    value[0].i32 = VALUE_0;
    ArkUI_AttributeItem item = { value, 1 };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ANIMATOR_ITERATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArkUIAddApi020(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[1];
    value[0].i32 = -1;
    ArkUI_AttributeItem item = { value, 1 };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ANIMATOR_ITERATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArkUIAddApi021(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[1];
    value[0].i32 = VALUE_1;
    ArkUI_AttributeItem item = { value, 1 };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ANIMATOR_DURATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArkUIAddApi022(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[1];
    value[0].i32 = VALUE_2;
    ArkUI_AttributeItem item = { value, 1 };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ANIMATOR_DURATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArkUIAddApi023(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[1];
    value[0].i32 = 0;
    ArkUI_AttributeItem item = { value, 1 };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ANIMATOR_DURATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArkUIAddApi024(napi_env env, napi_callback_info info)
{
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle content = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
    };
    OH_ArkUI_NodeContent_SetUserData(nullptr, nullptr);
    auto userData2 = OH_ArkUI_NodeContent_GetUserData(nullptr);
    OH_ArkUI_GetNodeContentFromNapiValue(nullptr, nullptr, nullptr);
    int32_t index = 0;
    ArkUI_NumberValue value[] = {{.f32 = 10.0f}};
    OH_ArkUI_NodeEvent_GetNumberValue(nullptr, index, value);
    int32_t size = 0;
    char* value1[size];
    OH_ArkUI_NodeEvent_GetStringValue(nullptr, index, value1, &size);
    int32_t size3 = 1;
    ArkUI_NumberValue value3[] = {{.i32 = 10}};
    OH_ArkUI_NodeEvent_SetReturnNumberValue(nullptr, value3, size3);
    OH_ArkUI_GestureEvent_GetNode(nullptr);
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_ArkUI_KeyframeAnimateOption_Create(0);
    OH_ArkUI_AnimatorOption_SetKeyframe(ret, 0.0, 0.0, 0);
    OH_ArkUI_AnimatorOption_GetKeyframeTime(ret, 0);
    OH_ArkUI_AnimatorOption_GetKeyframeValue(ret, 0);
    NAPI_END;
}

}

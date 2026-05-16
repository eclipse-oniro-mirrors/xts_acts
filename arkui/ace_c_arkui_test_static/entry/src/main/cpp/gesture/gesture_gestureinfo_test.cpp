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

#include "gesture_gestureinfo_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <cstdint>

namespace ArkUIAniTest {

ArkUI_NativeNodeAPI_1* GestureGestureInfoTest::nodeAPI = nullptr;
std::vector<int32_t> GestureGestureInfoTest::LongPressGesture = {};
std::vector<double> GestureGestureInfoTest::PanGesture = {};
std::vector<double> GestureGestureInfoTest::SwipeGesture = {};
std::vector<double> GestureGestureInfoTest::RotationGesture = {};
std::vector<double> GestureGestureInfoTest::PinchGesture = {};

static ani_object SetArrayAniDataWithGesture(const std::vector<int32_t>&values, ani_env* env)
{
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class intCls {};
    ani_method intCtor {};
    if (ANI_OK != env->FindClass("std.core.Double", &intCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Double error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(intCls, "<ctor>", "d:", &intCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find Int Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object intObj {};
        if (ANI_OK != env->Object_New(intCls, intCtor, &intObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, intObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set int error");
            return nullptr;
        }
    }
    return aniArray;
};


static ani_object SetArrayAniDataWithGesture(const std::vector<double>&values, ani_env* env)
{
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class doubleCls {};
    ani_method doubleCtor {};
    if (ANI_OK != env->FindClass("std.core.Double", &doubleCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Int error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(doubleCls, "<ctor>", "d:", &doubleCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find double Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object doubleObj {};
        if (ANI_OK != env->Object_New(doubleCls, doubleCtor, &doubleObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, doubleObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set double error");
            return nullptr;
        }
    }
    return aniArray;
};

static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}

static void PushBackFloatToData(std::vector<double>& data, double value)
{
    data.push_back(value);
}

static void OnEventLongPressGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto ret1 = OH_ArkUI_LongPress_GetRepeatCount(event);
    auto ret2 = OH_ArkUI_GestureEvent_GetActionType(event);
    PushBackIntToData(GestureGestureInfoTest::LongPressGesture, ret1);
    PushBackIntToData(GestureGestureInfoTest::LongPressGesture, ret2);
}

static void OnEventPanGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto ret1 = OH_ArkUI_PanGesture_GetVelocity(event);
    auto ret2 = OH_ArkUI_PanGesture_GetVelocityX(event);
    auto ret3 = OH_ArkUI_PanGesture_GetVelocityY(event);
    auto ret4 = OH_ArkUI_PanGesture_GetOffsetX(event);
    auto ret5 = OH_ArkUI_PanGesture_GetOffsetY(event);
    PushBackFloatToData(GestureGestureInfoTest::PanGesture, ret1);
    PushBackFloatToData(GestureGestureInfoTest::PanGesture, ret2);
    PushBackFloatToData(GestureGestureInfoTest::PanGesture, ret3);
    PushBackFloatToData(GestureGestureInfoTest::PanGesture, ret4);
    PushBackFloatToData(GestureGestureInfoTest::PanGesture, ret5);
}

static void OnEventSwipeGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto ret1 = OH_ArkUI_SwipeGesture_GetAngle(event);
    auto ret2 = OH_ArkUI_SwipeGesture_GetVelocity(event);
    PushBackFloatToData(GestureGestureInfoTest::SwipeGesture, ret1);
    PushBackFloatToData(GestureGestureInfoTest::SwipeGesture, ret2);
}

static void OnEventRotationGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto ret = OH_ArkUI_RotationGesture_GetAngle(event);
    PushBackFloatToData(GestureGestureInfoTest::RotationGesture, ret);
}

static void OnEventPinchGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto ret1 = OH_ArkUI_PinchGesture_GetScale(event);
    auto ret2 = OH_ArkUI_PinchGesture_GetCenterX(event);
    auto ret3 = OH_ArkUI_PinchGesture_GetCenterY(event);
    PushBackFloatToData(GestureGestureInfoTest::PinchGesture, ret1);
    PushBackFloatToData(GestureGestureInfoTest::PinchGesture, ret2);
    PushBackFloatToData(GestureGestureInfoTest::PinchGesture, ret3);
}

static std::shared_ptr<ButtonComponent> CreateButtonLongPressGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, bool repeatResult, int32_t durationNum)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetBackgroundColor(COLOR_RED);
    button->SetId(id);
    button->SetMargin(SIZE_10);
    auto longPressGesture = gestureAPI->createLongPressGesture(fingersNum, repeatResult, durationNum);
    gestureAPI->setGestureEventTarget(longPressGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventLongPressGesture);
    gestureAPI->addGestureToNode(button->GetComponent(), longPressGesture, NORMAL, NORMAL_GESTURE_MASK);
    return button;
}

static std::shared_ptr<ColumnComponent> CreateColumnPanGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, ArkUI_GestureDirectionMask directions, double distanceNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto panGesture = gestureAPI->createPanGesture(fingersNum, directions, distanceNum);
    gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventPanGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), panGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnPinchGestureNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id, int32_t fingersNum, double durationNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto pinchGesture = gestureAPI->createPinchGesture(fingersNum, durationNum);
    gestureAPI->setGestureEventTarget(pinchGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventPinchGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), pinchGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnRotationGestureNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id, int32_t fingersNum, double angleNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto rotationGesture = gestureAPI->createRotationGesture(fingersNum, angleNum);
    gestureAPI->setGestureEventTarget(rotationGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventRotationGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), rotationGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnSwipeGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, ArkUI_GestureDirectionMask directions, double speedNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto swipeGesture = gestureAPI->createSwipeGesture(fingersNum, directions, speedNum);
    gestureAPI->setGestureEventTarget(swipeGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventSwipeGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), swipeGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static auto CreateColumnNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto column = GestureGestureInfoTest::nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto Column = std::make_shared<ColumnComponent>();
    auto button1 = CreateButtonLongPressGestureNode(gestureAPI, "button1", PARAM_1, true, SIZE_500);
    auto column2 = CreateColumnPanGestureNode(gestureAPI, "column2", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    auto column3 = CreateColumnSwipeGestureNode(gestureAPI, "column3", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    auto column4 = CreateColumnRotationGestureNode(gestureAPI, "column4", PARAM_2, PARAM_1);
    auto column5 = CreateColumnPinchGestureNode(gestureAPI, "column5", PARAM_2, PARAM_5);
    std::vector<std::shared_ptr<ColumnComponent>> columns = { column2, column3, column4, column5 };
    for (auto button : columns) {
        Column->AddChild(button);
    }
    GestureGestureInfoTest::nodeAPI->addChild(column, button1->GetComponent());
    GestureGestureInfoTest::nodeAPI->addChild(column, Column->GetComponent());
    return column;
}

void GestureGestureInfoTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureGestureInfoTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto column = CreateColumnNode(gestureAPI);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
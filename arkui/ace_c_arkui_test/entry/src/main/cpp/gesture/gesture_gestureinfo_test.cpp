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

#include "gesture_gestureinfo_test.h"

#include <cstdint>

namespace ArkUICapiTest {

ArkUI_NativeNodeAPI_1* GestureGestureInfoTest::nodeAPI = nullptr;
std::vector<int32_t> GestureGestureInfoTest::LongPressGesture = {};
std::vector<double> GestureGestureInfoTest::PanGesture = {};
std::vector<double> GestureGestureInfoTest::SwipeGesture = {};
std::vector<double> GestureGestureInfoTest::RotationGesture = {};
std::vector<double> GestureGestureInfoTest::PinchGesture = {};

static napi_value SetArrayNapiDataWithGesture(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};

static napi_value SetArrayNapiDataWithGesture(const std::vector<double>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_double(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
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

napi_value GestureGestureInfoTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureGestureInfoTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto column = CreateColumnNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value GestureGestureInfoTest::GetGestureData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest", "GetGestureData");
    napi_value result;
    napi_create_array(env, &result);

    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithGesture(GestureGestureInfoTest::LongPressGesture, env));
    napi_set_element(env, result, PARAM_1, SetArrayNapiDataWithGesture(GestureGestureInfoTest::PanGesture, env));
    napi_set_element(env, result, PARAM_2, SetArrayNapiDataWithGesture(GestureGestureInfoTest::SwipeGesture, env));
    napi_set_element(env, result, PARAM_3, SetArrayNapiDataWithGesture(GestureGestureInfoTest::RotationGesture, env));
    napi_set_element(env, result, PARAM_4, SetArrayNapiDataWithGesture(GestureGestureInfoTest::PinchGesture, env));

    GestureGestureInfoTest::LongPressGesture.clear();
    GestureGestureInfoTest::PanGesture.clear();
    GestureGestureInfoTest::SwipeGesture.clear();
    GestureGestureInfoTest::RotationGesture.clear();
    GestureGestureInfoTest::PinchGesture.clear();
    return result;
}
} // namespace ArkUICapiTest
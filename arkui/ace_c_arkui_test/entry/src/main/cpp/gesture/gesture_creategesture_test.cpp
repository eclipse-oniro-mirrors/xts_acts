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

#include "gesture_creategesture_test.h"

#include <cstdint>

namespace ArkUICapiTest {

ArkUI_NativeNodeAPI_1* GestureCreateGestureTest::nodeAPI = nullptr;

static void OnEventGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto button = OH_ArkUI_GestureEvent_GetNode(event);
    ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
    GestureCreateGestureTest::nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &color_item);
}

static std::shared_ptr<ButtonComponent> CreateButtonToTapGestureNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id, int32_t countNum, int32_t fingersNum)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetBackgroundColor(COLOR_RED);
    button->SetId(id);
    button->SetMargin(SIZE_10);
    auto tapGesture = gestureAPI->createTapGesture(countNum, fingersNum);
    gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(button->GetComponent(), tapGesture, NORMAL, NORMAL_GESTURE_MASK);
    return button;
}

static std::shared_ptr<ButtonComponent> CreateButtonToLongPressGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, bool repeatResult, int32_t durationNum)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetBackgroundColor(COLOR_RED);
    button->SetId(id);
    button->SetMargin(SIZE_10);
    auto longPressGesture = gestureAPI->createLongPressGesture(fingersNum, repeatResult, durationNum);
    gestureAPI->setGestureEventTarget(longPressGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(button->GetComponent(), longPressGesture, NORMAL, NORMAL_GESTURE_MASK);
    return button;
}

static std::shared_ptr<ColumnComponent> CreateColumnToPanGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, ArkUI_GestureDirectionMask directions, double distanceNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto panGesture = gestureAPI->createPanGesture(fingersNum, directions, distanceNum);
    gestureAPI->setGestureEventTarget(panGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), panGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnToPinchGestureNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id, int32_t fingersNum, double durationNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto pinchGesture = gestureAPI->createPinchGesture(fingersNum, durationNum);
    gestureAPI->setGestureEventTarget(pinchGesture, GESTURE_EVENT_ACTION_UPDATE, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), pinchGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnToRotationGestureNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id, int32_t fingersNum, double angleNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto rotationGesture = gestureAPI->createRotationGesture(fingersNum, angleNum);
    gestureAPI->setGestureEventTarget(rotationGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), rotationGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ColumnComponent> CreateColumnToSwipeGestureNode(ArkUI_NativeGestureAPI_1* gestureAPI,
    const std::string& id, int32_t fingersNum, ArkUI_GestureDirectionMask directions, double speedNum)
{
    auto column = std::make_shared<ColumnComponent>();
    column->SetWidth(SIZE_150);
    column->SetHeight(SIZE_100);
    column->SetBackgroundColor(COLOR_RED);
    column->SetId(id);
    column->SetMargin(SIZE_10);
    auto swipeGesture = gestureAPI->createSwipeGesture(fingersNum, directions, speedNum);
    gestureAPI->setGestureEventTarget(swipeGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, &OnEventGesture);
    gestureAPI->addGestureToNode(column->GetComponent(), swipeGesture, NORMAL, NORMAL_GESTURE_MASK);
    return column;
}

static std::shared_ptr<ButtonComponent> CreateGestureGroupNode(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetBackgroundColor(COLOR_RED);
    button->SetId(id);
    button->SetMargin(SIZE_10);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    auto group = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    gestureAPI->addChildGesture(group, tapGesture);
    if (group) {
        button->SetBackgroundColor(COLOR_GREEN);
    }
    return button;
}

static auto CreateRowFirstNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto row = GestureCreateGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Column1 = std::make_shared<ColumnComponent>();
    auto Column2 = std::make_shared<ColumnComponent>();
    auto button1 = CreateButtonToTapGestureNode(gestureAPI, "button1", PARAM_1, PARAM_1);
    auto button2 = CreateButtonToTapGestureNode(gestureAPI, "button2", PARAM_1, PARAM_11);
    auto button3 = CreateButtonToTapGestureNode(gestureAPI, "button3", PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto button4 = CreateButtonToLongPressGestureNode(gestureAPI, "button4", PARAM_1, true, SIZE_500);
    auto button5 = CreateButtonToLongPressGestureNode(gestureAPI, "button5", PARAM_1, true, SIZE_500);
    auto button6 = CreateButtonToLongPressGestureNode(gestureAPI, "button6", PARAM_1, false, PARAM_1);
    auto button7 = CreateButtonToLongPressGestureNode(gestureAPI, "button7", PARAM_11, true, PARAM_NEGATIVE_1);
    auto button8 = CreateButtonToLongPressGestureNode(gestureAPI, "button8", PARAM_11, false, PARAM_NEGATIVE_1);
    auto button9 = CreateGestureGroupNode(gestureAPI, "button9");
    std::vector<std::shared_ptr<ButtonComponent>> buttons1 = { button1, button2, button3, button4 };
    std::vector<std::shared_ptr<ButtonComponent>> buttons2 = { button5, button6, button7, button8, button9 };
    for (auto button : buttons1) {
        Column1->AddChild(button);
    }
    for (auto button : buttons2) {
        Column2->AddChild(button);
    }
    GestureCreateGestureTest::nodeAPI->addChild(row, Column1->GetComponent());
    GestureCreateGestureTest::nodeAPI->addChild(row, Column2->GetComponent());
    return row;
}

static auto CreateRowSecondNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto row = GestureCreateGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Column1 = std::make_shared<ColumnComponent>();
    auto Column2 = std::make_shared<ColumnComponent>();
    auto column1 = CreateColumnToPanGestureNode(gestureAPI, "column1", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    auto column2 = CreateColumnToPanGestureNode(gestureAPI, "column2", PARAM_1, GESTURE_DIRECTION_HORIZONTAL, PARAM_10);
    auto column3 = CreateColumnToPanGestureNode(gestureAPI, "column3", PARAM_1, GESTURE_DIRECTION_VERTICAL, PARAM_10);
    auto column4 = CreateColumnToPanGestureNode(gestureAPI, "column4", PARAM_1, GESTURE_DIRECTION_LEFT, PARAM_10);
    auto column5 = CreateColumnToPanGestureNode(gestureAPI, "column5", PARAM_1, GESTURE_DIRECTION_RIGHT, PARAM_10);
    auto column6 = CreateColumnToPanGestureNode(gestureAPI, "column6", PARAM_1, GESTURE_DIRECTION_UP, PARAM_10);
    auto column7 = CreateColumnToPanGestureNode(gestureAPI, "column7", PARAM_1, GESTURE_DIRECTION_DOWN, PARAM_10);
    auto column8 = CreateColumnToPanGestureNode(gestureAPI, "column8", PARAM_1, GESTURE_DIRECTION_NONE, PARAM_10);
    auto column9 =
        CreateColumnToPanGestureNode(gestureAPI, "column9", PARAM_NEGATIVE_1, PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto column10 = CreateColumnToPanGestureNode(gestureAPI, "column10", PARAM_11, GESTURE_DIRECTION_ALL, PARAM_10);
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { column1, column2, column3, column4, column5 };
    std::vector<std::shared_ptr<ColumnComponent>> columns2 = { column6, column7, column8, column9, column10 };
    for (auto column : columns1) {
        Column1->AddChild(column);
    }
    for (auto column : columns2) {
        Column2->AddChild(column);
    }
    GestureCreateGestureTest::nodeAPI->addChild(row, Column1->GetComponent());
    GestureCreateGestureTest::nodeAPI->addChild(row, Column2->GetComponent());
    return row;
}

static auto CreateRowThirdNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto row = GestureCreateGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Column1 = std::make_shared<ColumnComponent>();
    auto Column2 = std::make_shared<ColumnComponent>();
    auto column1 = CreateColumnToPinchGestureNode(gestureAPI, "column1", PARAM_2, PARAM_5);
    auto column2 = CreateColumnToPinchGestureNode(gestureAPI, "column2", PARAM_6, PARAM_5);
    auto column3 = CreateColumnToPinchGestureNode(gestureAPI, "column3", PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto column4 = CreateColumnToRotationGestureNode(gestureAPI, "column4", PARAM_2, PARAM_1);
    auto column5 = CreateColumnToRotationGestureNode(gestureAPI, "column5", PARAM_6, PARAM_1);
    auto column6 = CreateColumnToRotationGestureNode(gestureAPI, "column6", PARAM_2, SIZE_400);
    auto column7 = CreateColumnToRotationGestureNode(gestureAPI, "column7", PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { column1, column2, column3, column4 };
    std::vector<std::shared_ptr<ColumnComponent>> columns2 = { column5, column6, column7 };
    for (auto columnChild : columns1) {
        Column1->AddChild(columnChild);
    }
    for (auto columnChild : columns2) {
        Column2->AddChild(columnChild);
    }
    GestureCreateGestureTest::nodeAPI->addChild(row, Column1->GetComponent());
    GestureCreateGestureTest::nodeAPI->addChild(row, Column2->GetComponent());
    return row;
}

static auto CreateRowFourthNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto row = GestureCreateGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Column1 = std::make_shared<ColumnComponent>();
    auto Column2 = std::make_shared<ColumnComponent>();
    auto column1 = CreateColumnToSwipeGestureNode(gestureAPI, "column1", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    auto column2 =
        CreateColumnToSwipeGestureNode(gestureAPI, "column2", PARAM_1, GESTURE_DIRECTION_HORIZONTAL, PARAM_100);
    auto column3 =
        CreateColumnToSwipeGestureNode(gestureAPI, "column3", PARAM_1, GESTURE_DIRECTION_VERTICAL, PARAM_100);
    auto column4 = CreateColumnToSwipeGestureNode(gestureAPI, "column4", PARAM_1, GESTURE_DIRECTION_LEFT, PARAM_100);
    auto column5 = CreateColumnToSwipeGestureNode(gestureAPI, "column5", PARAM_1, GESTURE_DIRECTION_RIGHT, PARAM_100);
    auto column6 = CreateColumnToSwipeGestureNode(gestureAPI, "column6", PARAM_1, GESTURE_DIRECTION_UP, PARAM_100);
    auto column7 = CreateColumnToSwipeGestureNode(gestureAPI, "column7", PARAM_1, GESTURE_DIRECTION_DOWN, PARAM_100);
    auto column8 = CreateColumnToSwipeGestureNode(gestureAPI, "column8", PARAM_1, GESTURE_DIRECTION_NONE, PARAM_100);
    auto column9 =
        CreateColumnToSwipeGestureNode(gestureAPI, "column9", PARAM_NEGATIVE_1, PARAM_NEGATIVE_1, PARAM_NEGATIVE_1);
    auto column10 = CreateColumnToSwipeGestureNode(gestureAPI, "column10", PARAM_11, GESTURE_DIRECTION_ALL, PARAM_100);
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { column1, column2, column3, column4, column5 };
    std::vector<std::shared_ptr<ColumnComponent>> columns2 = { column6, column7, column8, column9, column10 };
    for (auto column : columns1) {
        Column1->AddChild(column);
    }
    for (auto column : columns2) {
        Column2->AddChild(column);
    }
    GestureCreateGestureTest::nodeAPI->addChild(row, Column1->GetComponent());
    GestureCreateGestureTest::nodeAPI->addChild(row, Column2->GetComponent());
    return row;
}

static auto CreateColumnFifthNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto column = GestureCreateGestureTest::nodeAPI->createNode(ARKUI_NODE_ROW);
    auto Column = std::make_shared<ColumnComponent>();
    auto column1 = CreateColumnToRotationGestureNode(gestureAPI, "rotationGestureWithColumn1", PARAM_2, PARAM_0);
    auto column2 = CreateColumnToSwipeGestureNode(
        gestureAPI, "swipeGestureWithColumn1", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    auto column3 = CreateColumnToSwipeGestureNode(
        gestureAPI, "swipeGestureWithColumn2", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    auto column4 =
        CreateColumnToPanGestureNode(gestureAPI, "panGestureWithColumn1", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    auto column5 =
        CreateColumnToPanGestureNode(gestureAPI, "panGestureWithColumn2", PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    std::vector<std::shared_ptr<ColumnComponent>> columns = { column1, column2, column3, column4, column5 };
    for (auto column : columns) {
        Column->AddChild(column);
    }
    GestureCreateGestureTest::nodeAPI->addChild(column, Column->GetComponent());
    return column;
}

napi_value GestureCreateGestureTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureCreateGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto row = CreateRowFirstNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value GestureCreateGestureTest::CreateNativeNode1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "CreateNativeNode1");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureCreateGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto row = CreateRowSecondNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value GestureCreateGestureTest::CreateNativeNode2(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "CreateNativeNode2");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureCreateGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto row = CreateRowThirdNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value GestureCreateGestureTest::CreateNativeNode3(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "CreateNativeNode3");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureCreateGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto row = CreateRowFourthNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), row) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value GestureCreateGestureTest::CreateNativeNode4(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "CreateNativeNode4");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureCreateGestureTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto column = CreateColumnFifthNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureCreateGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
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

#include <arkui/native_gesture.h>
#include "ani/ani.h"

#include "common/common.h"

namespace ArkUIAniTest {

static ani_double TestAddChildGesture001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, tapGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddChildGesture002(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto longPressGesture = gestureAPI->createLongPressGesture(PARAM_1, true, PARAM_1000);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, longPressGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddChildGesture003(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto panGesture = gestureAPI->createPanGesture(PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, panGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddChildGesture004(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto pinchGesture = gestureAPI->createPinchGesture(PARAM_2, PARAM_5);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, pinchGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddChildGesture005(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto rotationGesture = gestureAPI->createRotationGesture(PARAM_2, PARAM_1);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, rotationGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddChildGesture006(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto swipeGesture = gestureAPI->createSwipeGesture(PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    int32_t ret = gestureAPI->addChildGesture(gestureGroup, swipeGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    gestureAPI->addChildGesture(gestureGroup, tapGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, tapGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture002(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto swipeGesture = gestureAPI->createSwipeGesture(PARAM_1, GESTURE_DIRECTION_ALL, PARAM_100);
    gestureAPI->addChildGesture(gestureGroup, swipeGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, swipeGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture003(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto longPressGesture = gestureAPI->createLongPressGesture(PARAM_1, true, PARAM_1000);
    gestureAPI->addChildGesture(gestureGroup, longPressGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, longPressGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture004(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto panGesture = gestureAPI->createPanGesture(PARAM_1, GESTURE_DIRECTION_ALL, PARAM_10);
    gestureAPI->addChildGesture(gestureGroup, panGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, panGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture005(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto pinchGesture = gestureAPI->createPinchGesture(PARAM_2, PARAM_5);
    gestureAPI->addChildGesture(gestureGroup, pinchGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, pinchGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveChildGesture006(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto gestureGroup = gestureAPI->createGroupGesture(SEQUENTIAL_GROUP);
    auto rotationGesture = gestureAPI->createRotationGesture(PARAM_2, PARAM_1);
    gestureAPI->addChildGesture(gestureGroup, rotationGesture);
    int32_t ret = gestureAPI->removeChildGesture(gestureGroup, rotationGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestSetGestureEventTarget001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestSetGestureEventTarget002(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_UPDATE, nullptr, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestSetGestureEventTarget003(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_END, nullptr, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestSetGestureEventTarget004(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_CANCEL, nullptr, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, NORMAL, NORMAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode002(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, PRIORITY, NORMAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode003(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, PARALLEL, NORMAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode004(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, NORMAL, IGNORE_INTERNAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode005(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, PRIORITY, IGNORE_INTERNAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestAddGestureToNode006(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    int32_t ret = gestureAPI->addGestureToNode(button, tapGesture, PARALLEL, IGNORE_INTERNAL_GESTURE_MASK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestRemoveGestureFromNode001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    gestureAPI->addGestureToNode(button, tapGesture, PARALLEL, IGNORE_INTERNAL_GESTURE_MASK);
    int32_t ret = gestureAPI->removeGestureFromNode(button, tapGesture);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestSetGestureInterrupterToNode001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    int32_t ret = gestureAPI->setGestureInterrupterToNode(button, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestDisposeToNode001(ani_env* env, ani_object info, ani_object NodeContent)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    gestureAPI->dispose(tapGesture);
    tapGesture = nullptr;
    ASSERT_OBJ(tapGesture, nullptr);
    NAPI_END;
}
} // namespace ArkUIAniTest
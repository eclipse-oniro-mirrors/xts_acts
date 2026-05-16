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

#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <cstdint>
#include <string>

namespace ArkUICapiTest {

static napi_value TestContainerPickerEnableHapticFeedback001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int enableHapticFeedback = true;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue enableHapticFeedbackValue[] = { { .i32 = enableHapticFeedback } };
    ArkUI_AttributeItem enableHapticFeedbackItem = { enableHapticFeedbackValue,
        sizeof(enableHapticFeedbackValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK, &enableHapticFeedbackItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK)
              ->value[PARAM_0].i32, enableHapticFeedback);
    NAPI_END;
}
static napi_value TestContainerPickerEnableHapticFeedback002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int enableHapticFeedback = false;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue enableHapticFeedbackValue[] = { { .i32 = enableHapticFeedback } };
    ArkUI_AttributeItem enableHapticFeedbackItem = { enableHapticFeedbackValue,
        sizeof(enableHapticFeedbackValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK, &enableHapticFeedbackItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK)
              ->value[PARAM_0].i32, enableHapticFeedback);
    NAPI_END;
}
static napi_value TestContainerPickerEnableHapticFeedback003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    int enableHapticFeedback = PARAM_NEGATIVE_1;
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_NumberValue enableHapticFeedbackValue[] = { { .i32 = enableHapticFeedback } };
    ArkUI_AttributeItem enableHapticFeedbackItem = { enableHapticFeedbackValue,
        sizeof(enableHapticFeedbackValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK, &enableHapticFeedbackItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK)
                  ->value[PARAM_0].i32, enableHapticFeedback);
    }
    NAPI_END;
}
static napi_value TestContainerPickerEnableHapticFeedback004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, true);
    NAPI_END;
}
} // namespace ArkUICapiTest

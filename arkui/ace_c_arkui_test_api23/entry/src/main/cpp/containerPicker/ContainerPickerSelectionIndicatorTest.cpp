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

#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <cstdint>
#include <string>

#include "common/common.h"
#include "manager/PluginManagerTest.h"

namespace ArkUICapiTest {

static napi_value TestContainerPickerSelectionIndicator001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32, PARAM_1_POINT_0);
    OH_ArkUI_PickerIndicatorStyle_Dispose(Style);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_1);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32,
            PARAM_1_POINT_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, nullptr);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = 0x00000000,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, 0x00000000);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    ASSERT_EQ(
        nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32, PARAM_1_POINT_0);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_NEGATIVE_1,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32,
            PARAM_NEGATIVE_1);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32,
            PARAM_1_POINT_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_NEGATIVE_1,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32,
            PARAM_NEGATIVE_1);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32,
            PARAM_1_POINT_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_NEGATIVE_1,
        .bottomRightRadius = PARAM_1_POINT_0 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32,
            PARAM_NEGATIVE_1);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32,
            PARAM_1_POINT_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator008(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorBackground background = { .backgroundColor = COLOR_RED,
        .topLeftRadius = PARAM_5,
        .topRightRadius = PARAM_10,
        .bottomLeftRadius = PARAM_0,
        .bottomRightRadius = PARAM_NEGATIVE_1 };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(Style, &background);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].u32, COLOR_RED);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].f32, PARAM_5);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_5].f32,
            PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator009(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_10,
        .dividerColor = COLOR_BLUE,
        .startMargin = PARAM_10,
        .endMargin = PARAM_0,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, 1);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, COLOR_BLUE);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    OH_ArkUI_PickerIndicatorStyle_Dispose(nullptr);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator010(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_BACKGROUND);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_10,
        .dividerColor = COLOR_BLUE,
        .startMargin = PARAM_10,
        .endMargin = PARAM_0,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_0);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32, PARAM_10);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, COLOR_BLUE);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator011(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, nullptr);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator012(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_NEGATIVE_1,
        .dividerColor = COLOR_BLUE,
        .startMargin = PARAM_10,
        .endMargin = PARAM_0,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_1);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32,
            PARAM_NEGATIVE_1);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, COLOR_BLUE);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator013(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_10,
        .dividerColor = 0x00000000,
        .startMargin = PARAM_10,
        .endMargin = PARAM_0,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, 1);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, 0x00000000);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator014(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_10,
        .dividerColor = COLOR_BLUE,
        .startMargin = PARAM_NEGATIVE_1,
        .endMargin = PARAM_0,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_1);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32, PARAM_10);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, COLOR_BLUE);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32,
            PARAM_NEGATIVE_1);
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32, PARAM_0);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator015(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(ARKUI_PICKER_INDICATOR_DIVIDER);
    ArkUI_PickerIndicatorDivider divider = {
        .strokeWidth = PARAM_10,
        .dividerColor = COLOR_BLUE,
        .startMargin = PARAM_10,
        .endMargin = PARAM_NEGATIVE_1,
    };
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_ErrorCode ret = OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(Style, &divider);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = Style };
    auto ret1 = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    if (nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_0].i32, PARAM_1);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_1].f32, PARAM_10);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_2].u32, COLOR_BLUE);
        ASSERT_NE(
            nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_3].f32, PARAM_10);
        ASSERT_NE(nodeAPI->getAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR)->value[PARAM_4].f32,
            PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator016(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto containerPicker = nodeAPI->createNode(ARKUI_NODE_PICKER);
    ArkUI_AttributeItem selectionIndicatorItem = { .object = nullptr };
    auto ret = nodeAPI->setAttribute(containerPicker, NODE_PICKER_SELECTION_INDICATOR, &selectionIndicatorItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestContainerPickerSelectionIndicator017(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_PickerIndicatorStyle* Style = OH_ArkUI_PickerIndicatorStyle_Create(static_cast<ArkUI_PickerIndicatorType>(5));
    ASSERT_EQ((uint64_t)Style, 0);
    NAPI_END;
}
} // namespace ArkUICapiTest

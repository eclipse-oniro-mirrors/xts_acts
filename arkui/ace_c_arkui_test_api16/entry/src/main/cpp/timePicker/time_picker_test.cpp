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

#include "time_picker_test.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>

namespace ArkUICapiTest {
auto ShowPage(int32_t timepicker)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle timePicker = nodeAPI->createNode(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue cascadeValue[] = {{.i32 = timepicker}};
    ArkUI_AttributeItem cascadeItem = {cascadeValue, sizeof(cascadeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_TIME_PICKER_ENABLE_CASCADE, &cascadeItem);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_MARGIN, &margin_item);
    return timePicker;
}
auto ShowPage1()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle timePicker = nodeAPI->createNode(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue cascadeValue[] = {};
    ArkUI_AttributeItem cascadeItem = {cascadeValue, sizeof(cascadeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_TIME_PICKER_ENABLE_CASCADE, &cascadeItem);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(timePicker, NODE_MARGIN, &margin_item);
    return timePicker;
}
napi_value TimePickerTest::TimePickerTestEnableCascade(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TimePickerTest", "CreateNativeNode");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, ArkUICapiTest::LOG_PRINT_DOMAIN, "CalendarPickerMinMaxDateTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto timePicker1 = ShowPage(true);
    auto timePicker2 = ShowPage(false);
    auto timePicker3 = ShowPage1();
    nodeAPI->addChild(column, timePicker1);
    nodeAPI->addChild(column, timePicker2);
    nodeAPI->addChild(column, timePicker3);
    ArkUI_AttributeItem textId1 = {.string = "timePicker_001"};
    ArkUI_AttributeItem textId2 = {.string = "timePicker_002"};
    ArkUI_AttributeItem textId3 = {.string = "timePicker_003"};
    nodeAPI->setAttribute(timePicker1, NODE_ID, &textId1);
    nodeAPI->setAttribute(timePicker2, NODE_ID, &textId2);
    nodeAPI->setAttribute(timePicker3, NODE_ID, &textId3);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "swiperAutoPlayTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // ArkUICapiTest

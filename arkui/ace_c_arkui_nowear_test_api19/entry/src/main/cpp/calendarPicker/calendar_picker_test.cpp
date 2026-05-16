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
#include "calendar_picker_test.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>

namespace ArkUICapiTest {
static ArkUI_NodeHandle CreateSubNode(ArkUI_NativeNodeAPI_1 *nodeAPI, std::string rangeDate)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CALENDAR_PICKER);
    ArkUI_NumberValue width_value[] = {{.f32 = 150}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue height_value[] = {{.f32 = 50}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);
    ArkUI_NumberValue borderWidth_value[] = {{.f32 = 2}};
    ArkUI_AttributeItem borderWidth_value_item = {borderWidth_value,
        sizeof(borderWidth_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BORDER_WIDTH, &borderWidth_value_item);
    ArkUI_AttributeItem content_item = {.string = rangeDate.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_CALENDAR_PICKER_DISABLED_DATE_RANGE, &content_item);
    auto c = nodeAPI->getAttribute(nodeHandle, NODE_CALENDAR_PICKER_DISABLED_DATE_RANGE);
    return nodeHandle;
}

napi_value CalendarPickerTest::CalendarPickerMarkTodayTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "calendarPickerMarkTodayTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "calendarPickerMarkTodayTest",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto calendarPicker1 =
        CreateSubNode(nodeAPI, "2025-01-07,2025-01-09,2025-07-01,2100-12-31");
    auto calendarPicker2 =
        CreateSubNode(nodeAPI, "1970-01-01,2020-11-10,2021-01-,2021-01-15");
    auto calendarPicker3 =
        CreateSubNode(nodeAPI, "2025-01-07,2025-01-09,2025-07-01,2100-12-31");
    auto calendarPicker4 =
        CreateSubNode(nodeAPI, "null,undefied,2025-07-01,2100-12-31");
    auto a = nodeAPI->getAttribute(calendarPicker4, NODE_CALENDAR_PICKER_END);
    auto b = nodeAPI->getAttribute(calendarPicker1, NODE_CALENDAR_PICKER_DISABLED_DATE_RANGE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerMinMaxDateTest",
        "hh CalendarPicker  %{public}s", b->string);
    ArkUI_NumberValue markValue[] = {{.i32 = true}};
    ArkUI_AttributeItem markItem = {markValue, sizeof(markValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker1, NODE_CALENDAR_PICKER_MARK_TODAY, &markItem);
    nodeAPI->setAttribute(calendarPicker2, NODE_CALENDAR_PICKER_MARK_TODAY, &markItem);
    ArkUI_NumberValue markFalseValue[] = {{.i32 = false}};
    ArkUI_AttributeItem markFalseItem = {markFalseValue, sizeof(markFalseValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker3, NODE_CALENDAR_PICKER_MARK_TODAY, &markFalseItem);
    nodeAPI->setAttribute(calendarPicker4, NODE_CALENDAR_PICKER_MARK_TODAY, &markFalseItem);
    ArkUI_AttributeItem textId1 = {.string = "calendarPicker_001"};
    ArkUI_AttributeItem textId2 = {.string = "calendarPicker_002"};
    ArkUI_AttributeItem textId3 = {.string = "calendarPicker_003"};
    ArkUI_AttributeItem textId4 = {.string = "calendarPicker_004"};
    nodeAPI->setAttribute(calendarPicker1, NODE_ID, &textId1);
    nodeAPI->setAttribute(calendarPicker2, NODE_ID, &textId2);
    nodeAPI->setAttribute(calendarPicker3, NODE_ID, &textId3);
    nodeAPI->setAttribute(calendarPicker4, NODE_ID, &textId4);
    nodeAPI->addChild(column, calendarPicker1);
    nodeAPI->addChild(column, calendarPicker2);
    nodeAPI->addChild(column, calendarPicker3);
    nodeAPI->addChild(column, calendarPicker4);
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
} // namespace ArkUICapiTest
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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestCalendarPickerWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float width = 300;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static napi_value TestCalendarPickerWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float width = -100;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(calendarPicker, NODE_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(calendarPicker, NODE_WIDTH)->value[PARAM_0].f32, width);
    }
    NAPI_END;
}

static napi_value TestCalendarPickerWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(calendarPicker, ARKUI_NODE_CALENDAR_PICKER);
    float width = 500;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(calendarPicker, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(calendarPicker, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static napi_value TestCalendarPickerWidth004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CALENDAR_PICKER);
    int result = OH_ArkUI_NodeUtils_GetNodeType(g_handle);
    napi_create_int32(env, result == ARKUI_NODE_CALENDAR_PICKER ? 0 : 1, &retValue);
    return retValue;
}

} // namespace ArkUICapiTest

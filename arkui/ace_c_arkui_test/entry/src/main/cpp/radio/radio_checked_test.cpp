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

static napi_value TestRadioChecked001(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);
    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_CHECKED)->value[PARAM_0].i32, true);
    NAPI_END;
}

static napi_value TestRadioChecked002(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);
    ArkUI_NumberValue value[] = {{.i32 = -1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(radio, NODE_RADIO_CHECKED)->value[PARAM_0].i32, -1);
    NAPI_END;
}

static napi_value TestRadioChecked003(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);
    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_CHECKED)->value[PARAM_0].i32, false);
    NAPI_END;
}
static napi_value TestRadioChecked004(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
static napi_value TestRadioChecked005(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);
    ArkUI_NumberValue value[] = {{.i32 = 1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(radio, NODE_RADIO_CHECKED);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_CHECKED)->value[PARAM_0].i32, false);
    NAPI_END;
}

static napi_value TestRadioChecked006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto radio1 = nodeAPI->createNode(ARKUI_NODE_RADIO);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "radio1";
    nodeAPI->setAttribute(radio1, NODE_ID, &idItem);
    auto radio2 = nodeAPI->createNode(ARKUI_NODE_RADIO);
    ArkUI_AttributeItem idItem2 = {};
    idItem2.string = "radio2";
    nodeAPI->setAttribute(radio2, NODE_ID, &idItem2);
    
    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "test";
    ArkUI_NumberValue value2[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    value_item2.string = "test";
    auto ret1 = nodeAPI->setAttribute(radio1, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret1, SUCCESS);
    auto ret2 = nodeAPI->setAttribute(radio2, NODE_RADIO_CHECKED, &value_item2);
    ASSERT_EQ(ret2, SUCCESS);

    nodeAPI->setAttribute(radio1, NODE_RADIO_GROUP, &value_item);
    nodeAPI->setAttribute(radio2, NODE_RADIO_GROUP, &value_item2);

    ASSERT_EQ(nodeAPI->getAttribute(radio1, NODE_RADIO_CHECKED)->value[PARAM_0].i32, false);
    ASSERT_EQ(nodeAPI->getAttribute(radio2, NODE_RADIO_CHECKED)->value[PARAM_0].i32, true);
    NAPI_END;
}
static napi_value TestRadioChecked007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto radio1 = nodeAPI->createNode(ARKUI_NODE_RADIO);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "radio1";
    nodeAPI->setAttribute(radio1, NODE_ID, &idItem);
    auto radio2 = nodeAPI->createNode(ARKUI_NODE_RADIO);
    ArkUI_AttributeItem idItem2 = {};
    idItem2.string = "radio2";
    nodeAPI->setAttribute(radio2, NODE_ID, &idItem2);
    
    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "test1";
    ArkUI_NumberValue value2[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    value_item2.string = "test2";
    auto ret1 = nodeAPI->setAttribute(radio1, NODE_RADIO_CHECKED, &value_item);
    ASSERT_EQ(ret1, SUCCESS);
    auto ret2 = nodeAPI->setAttribute(radio2, NODE_RADIO_CHECKED, &value_item2);
    ASSERT_EQ(ret2, SUCCESS);

    nodeAPI->setAttribute(radio1, NODE_RADIO_GROUP, &value_item);
    nodeAPI->setAttribute(radio2, NODE_RADIO_GROUP, &value_item2);

    ASSERT_EQ(nodeAPI->getAttribute(radio1, NODE_RADIO_CHECKED)->value[PARAM_0].i32, true);
    ASSERT_EQ(nodeAPI->getAttribute(radio2, NODE_RADIO_CHECKED)->value[PARAM_0].i32, true);
    NAPI_END;
}
} // namespace ArkUICapiTest
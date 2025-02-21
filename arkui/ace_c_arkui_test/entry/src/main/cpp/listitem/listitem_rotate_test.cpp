/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance rotate the License.
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

static napi_value TestListItemRotate001(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float rotateX = SIZE_100;
    float rotateY = SIZE_100;
    float rotateZ = SIZE_100;
    float angle = SIZE_90;
    float perspective = SIZE_100;
    ArkUI_NumberValue value[PARAM_5] = {
        {.f32 = rotateX}, {.f32 = rotateY}, {.f32 = rotateZ}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_ROTATE, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_0].f32, rotateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_1].f32, rotateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_2].f32, rotateZ);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestListItemRotate002(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float rotateX = PARAM_0;
    float rotateY = PARAM_0;
    float rotateZ = PARAM_0;
    float angle = PARAM_0;
    float perspective = PARAM_0;
    auto listItemDefault = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_ROTATE)->value[PARAM_0].f32, rotateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_ROTATE)->value[PARAM_1].f32, rotateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_ROTATE)->value[PARAM_2].f32, rotateZ);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestListItemRotate003(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float rotateX = SIZE_100;
    float rotateY = SIZE_100;
    float rotateZ = SIZE_100;
    float angle = PARAM_0;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[PARAM_5] = {
        {.f32 = rotateX}, {.f32 = rotateY}, {.f32 = rotateZ}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_ROTATE, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_0].f32, rotateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_1].f32, rotateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_2].f32, rotateZ);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestListItemRotate004(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float rotateX = PARAM_0;
    float rotateY = PARAM_0;
    float rotateZ = PARAM_0;
    float angle = SIZE_90;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[PARAM_5] = {
        {.f32 = rotateX}, {.f32 = rotateY}, {.f32 = rotateZ}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_ROTATE, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_0].f32, rotateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_1].f32, rotateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_2].f32, rotateZ);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestListItemRotate005(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float rotateX = PARAM_0;
    float rotateY = PARAM_0;
    float rotateZ = PARAM_0;
    float angle = PARAM_0;
    float perspective = SIZE_100;
    ArkUI_NumberValue value[PARAM_5] = {
        {.f32 = rotateX}, {.f32 = rotateY}, {.f32 = rotateZ}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_ROTATE, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_0].f32, rotateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_1].f32, rotateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_2].f32, rotateZ);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}
} // namespace ArkUICapiTest

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

static napi_value TestListListDirection001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    ASSERT_EQ(NULL_PARAM, NULL_PARAM);
    NAPI_END;
}

static napi_value TestListListDirection002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t listDirection = ARKUI_AXIS_HORIZONTAL;
    ArkUI_NumberValue value[] = {{.i32 = listDirection}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_DIRECTION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_DIRECTION)->value[PARAM_0].i32, listDirection);
    NAPI_END;
}

static napi_value TestListListDirection003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t listDirection = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = listDirection}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_DIRECTION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(NULL_PARAM, NULL_PARAM);
    NAPI_END;
}

static napi_value TestListListDirection004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t listDirection = PARAM_2;
    ArkUI_NumberValue value[] = {{.i32 = listDirection}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_DIRECTION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(NULL_PARAM, NULL_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest

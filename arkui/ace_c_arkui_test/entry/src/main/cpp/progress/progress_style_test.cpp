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

static napi_value TestProgressStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_LINEAR);
    NAPI_END;
}

static napi_value TestProgressStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_PROGRESS_TYPE_RING}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(progress, NODE_PROGRESS_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_RING);
    NAPI_END;
}

static napi_value TestProgressStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_PROGRESS_TYPE_ECLIPSE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(progress, NODE_PROGRESS_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_ECLIPSE);
    NAPI_END;
}

static napi_value TestProgressStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_PROGRESS_TYPE_SCALE_RING}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(progress, NODE_PROGRESS_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_SCALE_RING);
    NAPI_END;
}

static napi_value TestProgressStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_PROGRESS_TYPE_CAPSULE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(progress, NODE_PROGRESS_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_CAPSULE);
    NAPI_END;
}

static napi_value TestProgressStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(progress, ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_PROGRESS_TYPE_LINEAR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(progress, NODE_PROGRESS_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(progress, NODE_PROGRESS_TYPE)->value[PARAM_0].i32, ARKUI_PROGRESS_TYPE_LINEAR);
    NAPI_END;
}
} // namespace ArkUICapiTest

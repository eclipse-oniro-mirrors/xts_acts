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

static napi_value TestRefreshPullDownRatio001(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}

static napi_value TestRefreshPullDownRatio002(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_NEGATIVE_0_POINT_8}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32,
              PARAM_NEGATIVE_0_POINT_8);
    NAPI_END;
}

static napi_value TestRefreshPullDownRatio003(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    float ratio = 0.2;
    ArkUI_NumberValue value[] = {{.f32 = ratio}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, ratio);
    NAPI_END;
}

static napi_value TestRefreshPullDownRatio004(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static napi_value TestRefreshPullDownRatio005(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestRefreshPullDownRatio006(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1_POINT_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static napi_value TestRefreshPullDownRatio007(napi_env env, napi_callback_info info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1_POINT_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    auto ret1 = nodeAPI->resetAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_NE(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, PARAM_1_POINT_1);

    NAPI_END;
}
} // namespace ArkUICapiTest
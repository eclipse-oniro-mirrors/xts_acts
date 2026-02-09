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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestRefreshPullDownRatio001(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}

static ani_double TestRefreshPullDownRatio002(ani_env* env, ani_object info)
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

static ani_double TestRefreshPullDownRatio003(ani_env* env, ani_object info)
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

static ani_double TestRefreshPullDownRatio004(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestRefreshPullDownRatio005(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestRefreshPullDownRatio006(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1_POINT_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_PULL_DOWN_RATIO, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static ani_double TestRefreshPullDownRatio007(ani_env* env, ani_object info)
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
} // namespace ArkUIAniTest
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

static ani_double TestCommonAttrsAspectRatioTest001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float widthDivHeight = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = widthDivHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ASPECT_RATIO, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsAspectRatioTest002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float widthDivHeight = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = widthDivHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ASPECT_RATIO, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ASPECT_RATIO)->value[PARAM_0].f32, widthDivHeight);
    NAPI_END;
}

static ani_double TestCommonAttrsAspectRatioTest003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float widthDivHeight = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = widthDivHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ASPECT_RATIO, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ASPECT_RATIO)->value[PARAM_0].f32, widthDivHeight);
    NAPI_END;
}

static ani_double TestCommonAttrsAspectRatioTest004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float widthDivHeight = PARAM_NEGATIVE_5;
    ArkUI_NumberValue value[] = {{.f32 = widthDivHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ASPECT_RATIO, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUIAniTest

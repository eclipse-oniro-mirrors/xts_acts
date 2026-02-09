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

#define SUCCESS 0
#define NORMAL_VALUE 50
#define BIG_VALUE 200
#define DEFAULT_VALUE 0
#define PARAM_100 100

namespace ArkUIAniTest {

static ani_double TestScrollTranslate001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = NORMAL_VALUE}, {.f32 = NORMAL_VALUE}, {.f32 = NORMAL_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_0].f32, NORMAL_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_1].f32, NORMAL_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_2].f32, NORMAL_VALUE);
    NAPI_END;
}

static ani_double TestScrollTranslate002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = BIG_VALUE}, {.f32 = BIG_VALUE}, {.f32 = BIG_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_0].f32, BIG_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_1].f32, BIG_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_2].f32, BIG_VALUE);
    NAPI_END;
}

static ani_double TestScrollTranslate003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = BIG_VALUE}, {.f32 = NORMAL_VALUE}, {.f32 = BIG_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_0].f32, BIG_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_1].f32, NORMAL_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_2].f32, BIG_VALUE);
    NAPI_END;
}

static ani_double TestScrollTranslate004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float mode = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = mode}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_0].f32, PARAM_100);
    ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_1].f32, PARAM_100);
    ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_TRANSLATE)->value[PARAM_2].f32, PARAM_100);
    NAPI_END;
}
} // namespace ArkUIAniTest

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

static ani_double TestCommonAttrsSize001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_300;
    float width = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_300;
    float width = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_300;
    float width = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsSize004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_0;
    float width = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_0;
    float width = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize006(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_2000;
    float width = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsSize007(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_NEGATIVE_100;
    float width = PARAM_2000;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize008(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_NEGATIVE_100;
    float width = PARAM_NEGATIVE_2000;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsSize009(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_30;
    float width = PARAM_300;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize010(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_2000;
    float width = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize011(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_30;
    float width = PARAM_2000;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, height);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_1].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsSize012(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float height = PARAM_300;
    float width = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = height}, {.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_SIZE, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_SIZE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SIZE)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest

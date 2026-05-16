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

static ani_double TestCommonAttrsTranslate001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_30;
    float y = PARAM_0;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_30;
    float y = PARAM_NEGATIVE_30;
    float z = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_30;
    float y = PARAM_NEGATIVE_30;
    float z = PARAM_NEGATIVE_30;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_30;
    float y = PARAM_30;
    float z = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_30;
    float y = PARAM_30;
    float z = PARAM_NEGATIVE_30;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_30;
    float y = PARAM_NEGATIVE_30;
    float z = PARAM_30;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_300;
    float y = PARAM_NEGATIVE_300;
    float z = PARAM_NEGATIVE_300;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate008(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate009(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_30;
    float y = PARAM_0;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate010(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_30;
    float y = PARAM_0;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate011(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_30;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate012(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_NEGATIVE_30;
    float z = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate013(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate014(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = SIZE_60;
    float y = SIZE_60;
    float z = SIZE_60;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate015(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = SIZE_400;
    float y = SIZE_400;
    float z = SIZE_400;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static ani_double TestCommonAttrsTranslate016(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = SIZE_400;
    float y = SIZE_400;
    float z = SIZE_400;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_TRANSLATE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_TRANSLATE)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest

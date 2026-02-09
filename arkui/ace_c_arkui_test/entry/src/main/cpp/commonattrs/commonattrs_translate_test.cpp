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

static napi_value TestCommonAttrsTranslate001(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate002(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate003(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate004(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate005(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate006(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate007(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate008(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate009(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate010(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate011(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate012(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate013(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTranslate014(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate015(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsTranslate016(napi_env env, napi_callback_info info)
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
} // namespace ArkUICapiTest

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance translate the License.
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

static ani_double TestListItemTranslate001(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translateX = SIZE_100;
    float translateY = SIZE_100;
    float translateZ = SIZE_100;
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = translateX}, {.f32 = translateY}, {.f32 = translateZ}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_0].f32, translateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_1].f32, translateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_2].f32, translateZ);
    NAPI_END;
}

static ani_double TestListItemTranslate002(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translateX = SIZE_100;
    float translateY = PARAM_0;
    float translateZ = PARAM_0;
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = translateX}, {.f32 = translateY}, {.f32 = translateZ}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_0].f32, translateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_1].f32, translateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_2].f32, translateZ);
    NAPI_END;
}

static ani_double TestListItemTranslate003(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translateX = PARAM_0;
    float translateY = SIZE_100;
    float translateZ = PARAM_0;
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = translateX}, {.f32 = translateY}, {.f32 = translateZ}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_0].f32, translateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_1].f32, translateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_2].f32, translateZ);
    NAPI_END;
}

static ani_double TestListItemTranslate004(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translateX = PARAM_0;
    float translateY = PARAM_0;
    float translateZ = SIZE_100;
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = translateX}, {.f32 = translateY}, {.f32 = translateZ}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_0].f32, translateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_1].f32, translateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_2].f32, translateZ);
    NAPI_END;
}

static ani_double TestListItemTranslate005(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translate = SIZE_200;
    ArkUI_NumberValue value[] = {{.f32 = translate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_0].f32, translate);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_1].f32, translate);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_TRANSLATE)->value[PARAM_2].f32, translate);
    NAPI_END;
}

static ani_double TestListItemTranslate006(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float translateX = PARAM_0;
    float translateY = PARAM_0;
    float translateZ = PARAM_0;
    auto listItemDefault = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_TRANSLATE)->value[PARAM_0].f32, translateX);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_TRANSLATE)->value[PARAM_1].f32, translateY);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_TRANSLATE)->value[PARAM_2].f32, translateZ);
    NAPI_END;
}
} // namespace ArkUIAniTest

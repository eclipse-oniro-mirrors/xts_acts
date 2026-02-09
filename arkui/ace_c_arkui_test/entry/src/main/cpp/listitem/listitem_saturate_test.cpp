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
#include <cfloat>
namespace ArkUICapiTest {

/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0100
 * @tc.name       : TestListItemSaturate001
 * @tc.desc       : Testing saturate for listItem with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestListItemSaturate001(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0200
 * @tc.name       : TestListItemSaturate002
 * @tc.desc       : Testing saturate for listItem with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestListItemSaturate002(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}
/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0300
 * @tc.name       : TestListItemSaturate003
 * @tc.desc       : Testing saturate for listItem with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestListItemSaturate003(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = SIZE_50;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0400
 * @tc.name       : TestListItemSaturate004
 * @tc.desc       : Testing saturate for listItem with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestListItemSaturate004(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}
/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0500
 * @tc.name       : TestListItemSaturate005
 * @tc.desc       : Testing saturate for listItem with abnormal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 2
 */
static napi_value TestListItemSaturate005(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}
/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0600
 * @tc.name       : TestListItemSaturate006
 * @tc.desc       : Testing saturate for listItem with abnormal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 2
 */
static napi_value TestListItemSaturate006(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = SIZE_50 + PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

/*
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SATURATE_0700
 * @tc.name       : TestListItemSaturate007
 * @tc.desc       : Testing saturate for listItem with default value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestListItemSaturate007(napi_env env, napi_callback_info info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float saturate = 1.0;
    auto listItemDefault = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    ASSERT_EQ(nodeAPI->getAttribute(listItemDefault, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}
} // namespace ArkUICapiTest

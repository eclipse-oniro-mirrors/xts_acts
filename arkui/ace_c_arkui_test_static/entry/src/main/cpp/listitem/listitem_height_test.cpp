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

/**
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HEIGHT_0100
 * @tc.name       : TestListItemHeight001
 * @tc.desc       : Testing height for listItem with normal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static ani_double TestListItemHeight001(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float height = SIZE_200;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

/**
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HEIGHT_0200
 * @tc.name       : TestListItemHeight002
 * @tc.desc       : Testing height for listItem with large value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static ani_double TestListItemHeight002(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float height = SIZE_10000;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

/**
 * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_HEIGHT_0300
 * @tc.name       : TestListItemHeight003
 * @tc.desc       : Testing height for listItem with abnormal value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 2
 */
static ani_double TestListItemHeight003(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float height = PARAM_NEGATIVE_10;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(listItem, NODE_HEIGHT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_HEIGHT)->value[PARAM_0].f32, height);
    }
    NAPI_END;
}

} // namespace ArkUIAniTest

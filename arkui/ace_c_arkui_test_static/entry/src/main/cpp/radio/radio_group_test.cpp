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

static ani_double TestRadioGroup001(ani_env* env, ani_object info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "test";
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_GROUP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(radio, NODE_RADIO_GROUP)->string, "test");
    NAPI_END;
}
static ani_double TestRadioGroup002(ani_env* env, ani_object info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_AttributeItem value_item = {};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_GROUP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
static ani_double TestRadioGroup003(ani_env* env, ani_object info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.string = "test";
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_GROUP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(radio, NODE_RADIO_GROUP);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_STREQ(nodeAPI->getAttribute(radio, NODE_RADIO_GROUP)->string, "test");
    NAPI_END;
}
}
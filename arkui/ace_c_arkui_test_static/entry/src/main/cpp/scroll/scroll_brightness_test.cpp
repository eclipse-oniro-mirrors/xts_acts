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
#define ABNORMAL_PARAM 1000
#define DEFAULT_VALUE (1.0)
#define MAX_VALUE 2
#define MIN_VALUE 0
#define ABNORMAL_VALUE (-1)

namespace ArkUIAniTest {

static ani_double TestScrollBrightness001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BRIGHTNESS)->value[PARAM_0].f32, DEFAULT_VALUE);
    NAPI_END;
}

static ani_double TestScrollBrightness002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = MAX_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BRIGHTNESS)->value[PARAM_0].f32, MAX_VALUE);
    NAPI_END;
}

static ani_double TestScrollBrightness003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = MIN_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BRIGHTNESS)->value[PARAM_0].f32, MIN_VALUE);
    NAPI_END;
}
} // namespace ArkUIAniTest

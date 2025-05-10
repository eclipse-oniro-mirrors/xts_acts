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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000
#define DEFAULT_VALUE 0
#define NORMAL_VALUE 10
#define ABNORMAL_VALUE (-1)

namespace ArkUICapiTest {

static napi_value TestScrollRotate001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ROTATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_0].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_1].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_2].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_3].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_4].f32, DEFAULT_VALUE);
    NAPI_END;
}

static napi_value TestScrollRotate002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = DEFAULT_VALUE},
                                 {.f32 = NORMAL_VALUE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ROTATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_0].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_1].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_2].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_3].f32, DEFAULT_VALUE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ROTATE)->value[PARAM_4].f32, NORMAL_VALUE);
    NAPI_END;
}
} // namespace ArkUICapiTest

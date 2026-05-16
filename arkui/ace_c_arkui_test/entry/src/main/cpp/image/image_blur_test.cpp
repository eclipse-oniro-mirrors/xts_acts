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

#define DEFAULT_VALUE 0.0
#define FIRST_MIDDLE_VALUE 30.0
#define SECOND_MIDDLE_VALUE 100.0
#define ABNORMAL_VALUE (-10.0)

namespace ArkUICapiTest {

static napi_value TestImageBlur001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ASSERT_EQ(NULL_PARAM, NULL_PARAM);
    NAPI_END;
}

static napi_value TestImageBlur002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float blurValue = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = blurValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, blurValue);
    NAPI_END;
}

static napi_value TestImageBlur003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float blurValue = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = blurValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, blurValue);
    NAPI_END;
}

} // namespace ArkUICapiTest

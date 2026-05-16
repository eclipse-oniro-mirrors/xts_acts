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

#define COLOR_RESET 0xFF182431
namespace ArkUIAniTest {

static ani_double TestImageFillColor001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_FILL_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_FILL_COLOR)->value[PARAM_0].u32, COLOR_RED);
    NAPI_END;
}

static ani_double TestImageFillColor002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = {{.u32 = napi_null}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_FILL_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_FILL_COLOR)->value[PARAM_0].u32, napi_null);
    NAPI_END;
}

static ani_double TestImageFillColor003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_FILL_COLOR, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestImageFillColor004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_FILL_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_FILL_COLOR);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_FILL_COLOR)->value[PARAM_0].u32, COLOR_RESET);
    NAPI_END;
}
} // namespace ArkUIAniTest

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

static napi_value TestImageAnimatorFillMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_FILL_MODE_NONE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_FILL_MODE_NONE);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_FILL_MODE_FORWARDS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_FILL_MODE_FORWARDS);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_FILL_MODE_BACKWARDS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_FILL_MODE_BACKWARDS);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_FILL_MODE_BOTH}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_FILL_MODE_BOTH);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_4}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorFillMode008(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_FILL_MODE_BACKWARDS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_FILL_MODE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_FILL_MODE_FORWARDS);
    NAPI_END;
}
} // namespace ArkUICapiTest
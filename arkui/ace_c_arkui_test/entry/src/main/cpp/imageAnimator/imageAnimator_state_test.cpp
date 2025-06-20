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

static napi_value TestImageAnimatorState001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_STATUS_INITIAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_STATUS_INITIAL);
    NAPI_END;
}

static napi_value TestImageAnimatorState002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_STATUS_RUNNING}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_STATUS_RUNNING);
    NAPI_END;
}

static napi_value TestImageAnimatorState003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_STATUS_PAUSED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_STATUS_PAUSED);
    NAPI_END;
}

static napi_value TestImageAnimatorState004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ANIMATION_STATUS_STOPPED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_STATUS_STOPPED);
    NAPI_END;
}

static napi_value TestImageAnimatorState005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorState006(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorState007(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_4}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorState008(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_4}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    auto ret1 = nodeAPI->resetAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_STATE)->value[PARAM_0].i32,
        ARKUI_ANIMATION_STATUS_INITIAL);
    NAPI_END;
}
} // namespace ArkUICapiTest
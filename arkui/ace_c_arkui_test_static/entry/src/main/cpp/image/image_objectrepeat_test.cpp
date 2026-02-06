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

#define MIN_ABNORMAL_VALUE (-1)
#define MAX_ABNORMAL_VALUE 10

namespace ArkUIAniTest {

static ani_double TestImageObjectRepeat001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    NAPI_END;
}

static ani_double TestImageObjectRepeat002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_X;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    NAPI_END;
}

static ani_double TestImageObjectRepeat003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_Y;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    NAPI_END;
}

static ani_double TestImageObjectRepeat004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_XY;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    NAPI_END;
}

static ani_double TestImageObjectRepeat005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = MIN_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    }

    NAPI_END;
}

static ani_double TestImageObjectRepeat006(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectRepeatValue = MAX_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = objectRepeatValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_REPEAT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_REPEAT)->value[PARAM_0].i32, objectRepeatValue);
    }

    NAPI_END;
}

} // namespace ArkUIAniTest

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

#define MIN_ABNORMAL_VALUE (-1)
#define MAX_ABNORMAL_VALUE 16

namespace ArkUICapiTest {

static napi_value TestImageObjectFit001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_CONTAIN;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_COVER;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_FILL;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_SCALE_DOWN;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_NONE;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    NAPI_END;
}

static napi_value TestImageObjectFit007(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = MIN_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit008(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = MAX_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageObjectFit009(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit010(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_TOP;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit011(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit012(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_START;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit013(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit014(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_END;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit015(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit016(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit017(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFitValue);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit018(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t objectFitValue = ARKUI_OBJECT_FIT_NONE_AND_ALIGN_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_OBJECT_FIT);
    ASSERT_EQ(ret1, SUCCESS);
    if (nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_COVER);
    }
    NAPI_END;
}

static napi_value TestImageObjectFit019(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value17[] = {{.f32 = 1.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f} };
    ArkUI_AttributeItem value_item = {value17, sizeof(value17) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);

    int32_t objectFitValue = ArkUI_ObjectFit::ARKUI_OBJECT_FIT_NONE_MATRIX;
    ArkUI_NumberValue value[] = {{.i32 = objectFitValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(image, NODE_IMAGE_OBJECT_FIT, &valueItem);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest

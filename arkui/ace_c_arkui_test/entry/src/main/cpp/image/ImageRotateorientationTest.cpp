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

namespace ArkUICapiTest {
static napi_value TestImageRotateOrientation001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_AUTO}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_AUTO);
    NAPI_END;
}

static napi_value TestImageRotateOrientation002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageRotateOrientation003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_UP);
    NAPI_END;
}

static napi_value TestImageRotateOrientation004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_AUTO}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_ORIENTATION);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_UP);
    NAPI_END;
}

static napi_value TestImageRotateOrientation005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_UP}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_UP);
    NAPI_END;
}

static napi_value TestImageRotateOrientation006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_RIGHT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_RIGHT);
    NAPI_END;
}

static napi_value TestImageRotateOrientation007(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_DOWN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_DOWN);
    NAPI_END;
}

static napi_value TestImageRotateOrientation008(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_LEFT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_LEFT);
    NAPI_END;
}

static napi_value TestImageRotateOrientation009(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_UP_MIRRORED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_UP_MIRRORED);
    NAPI_END;
}

static napi_value TestImageRotateOrientation010(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_RIGHT_MIRRORED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_RIGHT_MIRRORED);
    NAPI_END;
}

static napi_value TestImageRotateOrientation011(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_DOWN_MIRRORED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_DOWN_MIRRORED);
    NAPI_END;
}

static napi_value TestImageRotateOrientation012(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ORIENTATION_LEFT_MIRRORED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_ORIENTATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_ORIENTATION)->value[PARAM_0].i32,
        ARKUI_ORIENTATION_LEFT_MIRRORED);
    NAPI_END;
}
} // namespace ArkUICapiTest

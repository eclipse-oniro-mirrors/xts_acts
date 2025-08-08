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

static napi_value TestCommonAttrsBlendMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_NONE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_NONE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_CLEAR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_CLEAR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode008(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode009(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_OVER;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode010(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_OVER;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode011(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_OVER;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode012(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_OVER;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode013(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_IN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode014(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_IN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode015(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_IN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode016(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_IN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode017(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_OUT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode018(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_OUT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode019(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_OUT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode020(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_OUT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode021(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_ATOP;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode022(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SRC_ATOP;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode023(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_ATOP;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode024(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DST_ATOP;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode025(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_XOR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode026(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_XOR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode027(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_PLUS;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode028(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_PLUS;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode029(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_MODULATE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode030(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_MODULATE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode031(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SCREEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode032(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SCREEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode033(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_OVERLAY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode034(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_OVERLAY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode035(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DARKEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode036(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DARKEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode037(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_LIGHTEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode038(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_LIGHTEN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode039(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR_DODGE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode040(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR_DODGE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode041(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_HARD_LIGHT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode042(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_HARD_LIGHT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode043(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SOFT_LIGHT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode044(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SOFT_LIGHT;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode045(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DIFFERENCE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode046(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_DIFFERENCE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode047(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_EXCLUSION;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode048(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_EXCLUSION;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode049(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_MULTIPLY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode050(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_MULTIPLY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode051(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_HUE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode052(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_HUE;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode053(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SATURATION;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode054(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_SATURATION;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode055(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode056(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode057(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_LUMINOSITY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode058(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_LUMINOSITY;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode059(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR_BURN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode060(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    int32_t blendModeType = ARKUI_BLEND_MODE_COLOR_BURN;
    int32_t blendModeApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = blendModeType}, {.i32 = blendModeApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(blendMode, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, blendModeType);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, blendModeApplyType);
    NAPI_END;
}

static napi_value TestCommonAttrsBlendMode061(napi_env env, napi_callback_info info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, ARKUI_BLEND_MODE_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, BLEND_APPLY_TYPE_FAST);
    NAPI_END;
}
} // namespace ArkUICapiTest

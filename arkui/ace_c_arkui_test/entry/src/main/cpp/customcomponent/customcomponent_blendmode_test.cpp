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

static napi_value TestCustomComponentBlendMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_NONE;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_NONE;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_CLEAR;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_CLEAR;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode008(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode009(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_OVER;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode010(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_OVER;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode011(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_OVER;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode012(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_OVER;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode013(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_IN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode014(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_IN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode015(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_IN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode016(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_IN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode017(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_OUT;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode018(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_OUT;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode019(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_OUT;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode020(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_OUT;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode021(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_ATOP;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode022(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SRC_ATOP;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode023(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_ATOP;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode024(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DST_ATOP;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode025(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_XOR;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode026(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_XOR;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode027(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_PLUS;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode028(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_PLUS;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode029(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_MODULATE;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode030(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_MODULATE;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode031(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SCREEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode032(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SCREEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode033(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_OVERLAY;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode034(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_OVERLAY;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode035(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DARKEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode036(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DARKEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode037(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_LIGHTEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode038(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_LIGHTEN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode039(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR_DODGE;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode040(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR_DODGE;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode041(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_HARD_LIGHT;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode042(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_HARD_LIGHT;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode043(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SOFT_LIGHT;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode044(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SOFT_LIGHT;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode045(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DIFFERENCE;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode046(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_DIFFERENCE;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode047(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_EXCLUSION;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode048(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_EXCLUSION;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode049(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_MULTIPLY;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode050(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_MULTIPLY;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode051(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_HUE;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode052(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_HUE;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode053(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SATURATION;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode054(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_SATURATION;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode055(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode056(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode057(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_LUMINOSITY;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode058(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_LUMINOSITY;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode059(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR_BURN;
    int32_t customApplyType = BLEND_APPLY_TYPE_FAST;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode060(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t customType = ARKUI_BLEND_MODE_COLOR_BURN;
    int32_t customApplyType = BLEND_APPLY_TYPE_OFFSCREEN;

    ArkUI_NumberValue value[] = {{.i32 = customType}, {.i32 = customApplyType}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BLEND_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, customType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, customApplyType);
    NAPI_END;
}

static napi_value TestCustomComponentBlendMode061(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, ARKUI_BLEND_MODE_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, BLEND_APPLY_TYPE_FAST);
    NAPI_END;
}
} // namespace ArkUICapiTest

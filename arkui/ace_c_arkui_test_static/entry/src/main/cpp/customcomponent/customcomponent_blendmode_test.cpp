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

namespace ArkUIAniTest {

static ani_double TestCustomComponentBlendMode001(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode002(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode003(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode004(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode005(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode006(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode007(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode008(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode009(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode010(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode011(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode012(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode013(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode014(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode015(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode016(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode017(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode018(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode019(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode020(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode021(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode022(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode023(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode024(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode025(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode026(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode027(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode028(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode029(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode030(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode031(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode032(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode033(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode034(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode035(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode036(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode037(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode038(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode039(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode040(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode041(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode042(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode043(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode044(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode045(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode046(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode047(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode048(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode049(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode050(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode051(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode052(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode053(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode054(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode055(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode056(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode057(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode058(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode059(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode060(ani_env* env, ani_object info)
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

static ani_double TestCustomComponentBlendMode061(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_0].i32, ARKUI_BLEND_MODE_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BLEND_MODE)->value[PARAM_1].i32, BLEND_APPLY_TYPE_FAST);
    NAPI_END;
}
} // namespace ArkUIAniTest

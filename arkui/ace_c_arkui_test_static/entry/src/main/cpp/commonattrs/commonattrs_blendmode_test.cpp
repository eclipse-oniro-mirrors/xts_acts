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

static ani_double TestCommonAttrsBlendMode001(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode002(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode003(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode004(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode005(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode006(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode007(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode008(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode009(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode010(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode011(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode012(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode013(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode014(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode015(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode016(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode017(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode018(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode019(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode020(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode021(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode022(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode023(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode024(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode025(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode026(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode027(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode028(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode029(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode030(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode031(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode032(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode033(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode034(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode035(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode036(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode037(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode038(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode039(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode040(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode041(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode042(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode043(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode044(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode045(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode046(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode047(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode048(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode049(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode050(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode051(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode052(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode053(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode054(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode055(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode056(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode057(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode058(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode059(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode060(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsBlendMode061(ani_env* env, ani_object info)
{
    NAPI_START(blendMode, ARKUI_NODE_COLUMN);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_0].i32, ARKUI_BLEND_MODE_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(blendMode, NODE_BLEND_MODE)->value[PARAM_1].i32, BLEND_APPLY_TYPE_FAST);
    NAPI_END;
}
} // namespace ArkUIAniTest

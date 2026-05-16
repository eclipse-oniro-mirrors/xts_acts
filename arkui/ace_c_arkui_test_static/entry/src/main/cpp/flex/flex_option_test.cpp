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
#define BAD_PARAM "BAD_PARAM_EXAMPLE"
#define PARAM_50_POINT_5 50.5

namespace ArkUIAniTest {

static ani_double TestFlexOption001(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW;
    int32_t wrap = ARKUI_FLEX_WRAP_NO_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_START;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_START;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestFlexOption002(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW;
    int32_t wrap = ARKUI_FLEX_WRAP_NO_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_START;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_START;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_START;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption003(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_NO_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_AUTO;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestFlexOption004(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_END;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_END;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption005(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_NO_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_AUTO;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestFlexOption006(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_CENTER;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, ARKUI_FLEX_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestFlexOption007(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_CENTER;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption008(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_NO_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_AUTO;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestFlexOption009(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_STRETCH;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, ARKUI_FLEX_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestFlexOption010(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW_REVERSE;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_BASELINE;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, ARKUI_FLEX_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestFlexOption011(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_BASELINE;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption012(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_START;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_END;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption013(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_STRETCH;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption014(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_CENTER;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption015(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_AUTO;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_START;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption016(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_AUTO;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_END;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
    ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    NAPI_END;
}

static ani_double TestFlexOption017(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_END;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_BETWEEN;

    ArkUI_NumberValue value[] = {
        {.f32 = PARAM_50_POINT_5},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, PARAM_50_POINT_5);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    }
    NAPI_END;
}

static ani_double TestFlexOption018(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_ROW_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_END;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_STRETCH;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_AROUND;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.f32 = PARAM_50_POINT_5},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, PARAM_50_POINT_5);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    }
    NAPI_END;
}

static ani_double TestFlexOption019(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_BASELINE;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_SPACE_EVENLY;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.f32 = PARAM_50_POINT_5},
        {.i32 = item_alignment},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, PARAM_50_POINT_5);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    }
    NAPI_END;
}

static ani_double TestFlexOption020(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;
    int32_t multi_flex_alignment = ARKUI_FLEX_ALIGNMENT_START;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.f32 = PARAM_50_POINT_5},
        {.i32 = multi_flex_alignment}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, PARAM_50_POINT_5);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, multi_flex_alignment);
    }
    NAPI_END;
}

static ani_double TestFlexOption021(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t direction = ARKUI_FLEX_DIRECTION_COLUMN;
    int32_t wrap = ARKUI_FLEX_WRAP_WRAP_REVERSE;
    int32_t flex_alignment = ARKUI_FLEX_ALIGNMENT_CENTER;
    int32_t item_alignment = ARKUI_ITEM_ALIGNMENT_CENTER;

    ArkUI_NumberValue value[] = {
        {.i32 = direction},
        {.i32 = wrap},
        {.i32 = flex_alignment},
        {.i32 = item_alignment},
        {.f32 = PARAM_50_POINT_5}
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, direction);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, wrap);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, flex_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, item_alignment);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_4].i32, PARAM_50_POINT_5);
    }
    NAPI_END;
}

static ani_double TestFlexOption022(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    const char *value = BAD_PARAM;
    ArkUI_AttributeItem value_item = {};
    value_item.string = value;
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}
static ani_double TestFlexOption023(ani_env* env, ani_object info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);

    ArkUI_NumberValue value[] = {
        {.i32 = PARAM_NEGATIVE_1},
        {.i32 = PARAM_NEGATIVE_1},
        {.i32 = PARAM_NEGATIVE_1},
        {.i32 = PARAM_NEGATIVE_1},
    };
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_FLEX_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    if (nodeAPI->getAttribute(flex, NODE_FLEX_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_0].i32, PARAM_NEGATIVE_1);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_1].i32, PARAM_NEGATIVE_1);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_2].i32, PARAM_NEGATIVE_1);
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_FLEX_OPTION)->value[PARAM_3].i32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

} // namespace ArkUIAniTest
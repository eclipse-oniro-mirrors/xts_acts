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

static napi_value TestTextAlignRules001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetStart(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_START);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_TOP);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_END);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetStart(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_START);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_END);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    OH_ArkUI_AlignmentRuleOption_SetStart(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_START);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    float offset = -50;
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal(alignRules, offset);
    OH_ArkUI_AlignmentRuleOption_SetBiasVertical(alignRules, offset);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAlignRules009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto alignRules = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignRules, "__container__", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignRules, "__container__", ARKUI_HORIZONTAL_ALIGNMENT_END);
    OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal(alignRules, SIZE_50);
    OH_ArkUI_AlignmentRuleOption_SetBiasVertical(alignRules, SIZE_50);
    ArkUI_AttributeItem alignRules_item = {.object = alignRules};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGN_RULES, &alignRules_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest

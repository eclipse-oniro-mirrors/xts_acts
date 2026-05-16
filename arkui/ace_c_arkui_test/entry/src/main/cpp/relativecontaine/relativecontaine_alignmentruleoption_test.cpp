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
#include <cmath>
#include <cstring>
#define NUM 0.3
#define NUM_0 0
#define EPSILON 1e-6

namespace ArkUICapiTest {

static napi_value TestRelativeContaineAlignmentRuleOption001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = {.string = "text"};
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    
    auto alignmentrule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetStart(alignmentrule, "text", ARKUI_HORIZONTAL_ALIGNMENT_END);
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignmentrule, "text", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignmentrule, "text", ARKUI_HORIZONTAL_ALIGNMENT_START);

    char text1[] = "text";
    auto ret = OH_ArkUI_AlignmentRuleOption_GetStartId(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ret = OH_ArkUI_AlignmentRuleOption_GetEndId(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetStartAlignment(alignmentrule), ARKUI_HORIZONTAL_ALIGNMENT_END);
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetEndAlignment(alignmentrule), ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal(alignmentrule),
        ARKUI_HORIZONTAL_ALIGNMENT_START);

    OH_ArkUI_AlignmentRuleOption_Dispose(alignmentrule);

    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOption002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = {.string = "text"};
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    
    auto alignmentrule = OH_ArkUI_AlignmentRuleOption_Create();

    char text1[] = "text";
    OH_ArkUI_AlignmentRuleOption_SetTop(alignmentrule, "text", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignmentrule, "text", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignmentrule, "text", ARKUI_VERTICAL_ALIGNMENT_TOP);
    
    auto ret = OH_ArkUI_AlignmentRuleOption_GetTopId(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ret = OH_ArkUI_AlignmentRuleOption_GetBottomId(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical(alignmentrule);
    if (::strcmp(ret, text1) != NUM_0) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetTopAlignment(alignmentrule), ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetBottomAlignment(alignmentrule), ARKUI_VERTICAL_ALIGNMENT_CENTER);
    ASSERT_EQ(OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical(alignmentrule),
        ARKUI_VERTICAL_ALIGNMENT_TOP);

    OH_ArkUI_AlignmentRuleOption_Dispose(alignmentrule);

    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOption003(napi_env env, napi_callback_info info)
{
    auto alignmentrule = OH_ArkUI_AlignmentRuleOption_Create();

    OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal(alignmentrule, NUM);
    OH_ArkUI_AlignmentRuleOption_SetBiasVertical(alignmentrule, NUM);

    if (fabs((OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal(alignmentrule) - NUM)) > EPSILON) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }
    if (fabs((OH_ArkUI_AlignmentRuleOption_GetBiasVertical(alignmentrule) - NUM)) > EPSILON) {
        napi_value errorResult = nullptr;                                                                          \
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);                                                    \
        return errorResult;
    }

    OH_ArkUI_AlignmentRuleOption_Dispose(alignmentrule);

    NAPI_END;
}

} // namespace ArkUICapiTest

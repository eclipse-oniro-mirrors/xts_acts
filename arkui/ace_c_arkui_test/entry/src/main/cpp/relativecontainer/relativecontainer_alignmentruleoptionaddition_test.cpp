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

#include <cmath>
#include <cstring>

#include "common/common.h"

#define RELATIVE_PARAM_0_POINT_3 0.3f
#define RELATIVE_PARAM_0_POINT_5 0.5f

namespace ArkUICapiTest {

static napi_value TestRelativeContaineAlignmentRuleOptionCreate001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBiasVertical(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal(alignmentRule);
    ASSERT_EQ((alignmentRule != nullptr), true);
    ASSERT_EQ(ret, RELATIVE_PARAM_0_POINT_5);
    ASSERT_EQ(ret1, RELATIVE_PARAM_0_POINT_5);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionDispose001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_Dispose(alignmentRule);
    alignmentRule = nullptr;
    ASSERT_OBJ(alignmentRule, nullptr);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetStart001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetStart(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_START);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetStartId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetStartAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetStart002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetStart(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetStartId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetStartAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetStart003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetStart(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_END);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetStartId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetStartAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetEnd001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_START);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetEndId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetEndAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetEnd002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetEndId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetEndAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetEnd003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetEnd(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_END);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetEndId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetEndAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_START);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterHorizontal003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterHorizontal(alignmentRule, "text", ARKUI_HORIZONTAL_ALIGNMENT_END);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdHorizontal(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentHorizontal(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_HORIZONTAL_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetTop001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_TOP);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetTopId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetTopAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetTop002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetTopId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetTopAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetTop003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetTop(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetTopId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetTopAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBottom001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_TOP);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBottomId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetBottomAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBottom002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBottomId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetBottomAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBottom003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBottom(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBottomId(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetBottomAlignment(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterVertical001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_TOP);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterVertical002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_CENTER);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetCenterVertical003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetCenterVertical(alignmentRule, "text", ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetCenterIdVertical(alignmentRule);
    auto ret1 = OH_ArkUI_AlignmentRuleOption_GetCenterAlignmentVertical(alignmentRule);
    ASSERT_EQ(strcmp(ret, "text"), SUCCESS);
    ASSERT_EQ(ret1, ARKUI_VERTICAL_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBiasHorizontal001(napi_env env, napi_callback_info info)
{
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal(alignmentRule, RELATIVE_PARAM_0_POINT_3);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal(alignmentRule);
    ASSERT_EQ(ret, RELATIVE_PARAM_0_POINT_3);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBiasHorizontal002(napi_env env, napi_callback_info info)
{
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBiasHorizontal(alignmentRule, PARAM_NEGATIVE_1);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBiasHorizontal(alignmentRule);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBiasVertical001(napi_env env, napi_callback_info info)
{
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBiasVertical(alignmentRule, RELATIVE_PARAM_0_POINT_3);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBiasVertical(alignmentRule);
    ASSERT_EQ(ret, RELATIVE_PARAM_0_POINT_3);
    NAPI_END;
}

static napi_value TestRelativeContaineAlignmentRuleOptionSetBiasVertical002(napi_env env, napi_callback_info info)
{
    auto alignmentRule = OH_ArkUI_AlignmentRuleOption_Create();
    OH_ArkUI_AlignmentRuleOption_SetBiasVertical(alignmentRule, PARAM_NEGATIVE_1);
    auto ret = OH_ArkUI_AlignmentRuleOption_GetBiasVertical(alignmentRule);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1);
    NAPI_END;
}
} // namespace ArkUICapiTest
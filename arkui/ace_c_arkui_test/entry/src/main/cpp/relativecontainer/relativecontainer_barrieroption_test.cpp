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

#include <arkui/native_type.h>
#include <cstring>

#include "common/common.h"

namespace ArkUICapiTest {
static napi_value TestRelativeContainerBarrierOptionCreate001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    if (barrier != nullptr) {
        OH_ArkUI_BarrierOption_Dispose(barrier);
        ASSERT_EQ(true, true);
    } else {
        ASSERT_EQ(true, false);
    }
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionDispose001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetId001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    const char* barrierId = "BarrierOption";
    OH_ArkUI_BarrierOption_SetId(barrier, barrierId, PARAM_0);
    auto ret = OH_ArkUI_BarrierOption_GetId(barrier, PARAM_0);
    if (::strcmp(ret, barrierId) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetId002(napi_env env, napi_callback_info info)
{
    const char* barrierId = "BarrierOption";
    OH_ArkUI_BarrierOption_SetId(nullptr, barrierId, PARAM_0);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetId003(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    const char* barrierId = "BarrierOption";
    OH_ArkUI_BarrierOption_SetId(barrier, barrierId, PARAM_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetId004(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    const char* barrierId = "BarrierOption";
    OH_ArkUI_BarrierOption_SetId(barrier, barrierId, PARAM_NEGATIVE_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetId001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    const char* barrierId = "BarrierOption";
    OH_ArkUI_BarrierOption_SetId(barrier, barrierId, PARAM_0);
    auto ret = OH_ArkUI_BarrierOption_GetId(barrier, PARAM_0);
    if (::strcmp(ret, barrierId) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetId002(napi_env env, napi_callback_info info)
{
    const char* barrierId = "BarrierOption";
    auto res1 = OH_ArkUI_BarrierOption_GetId(nullptr, PARAM_0);
    ASSERT_OBJ(res1, nullptr);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_START, PARAM_0);
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_0), ARKUI_BARRIER_DIRECTION_START);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection002(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_END, PARAM_0);
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_0), ARKUI_BARRIER_DIRECTION_END);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection003(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_TOP, PARAM_0);
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_0), ARKUI_BARRIER_DIRECTION_TOP);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection004(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_BOTTOM, PARAM_0);
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_0), ARKUI_BARRIER_DIRECTION_BOTTOM);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection005(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(nullptr, ARKUI_BARRIER_DIRECTION_START, PARAM_0);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetDirection006(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_START, PARAM_NEGATIVE_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetDirection001(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_START, PARAM_0);
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_0), ARKUI_BARRIER_DIRECTION_START);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetDirection002(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_START, PARAM_NEGATIVE_1);
    ASSERT_NE(OH_ArkUI_BarrierOption_GetDirection(barrier, PARAM_NEGATIVE_1), ARKUI_BARRIER_DIRECTION_START);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetReferencedId001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text1[] = "text";
    auto ret = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_0, PARAM_0);
    if (::strcmp(ret, text1) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetReferencedId002(napi_env env, napi_callback_info info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "", PARAM_0);
    auto ret = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_0, PARAM_0);
    if (::strlen(ret) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionSetReferencedId003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_NEGATIVE_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetReferencedId001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text2[] = "text";
    auto res1 = OH_ArkUI_BarrierOption_GetReferencedId(nullptr, PARAM_0, PARAM_0);
    ASSERT_OBJ(res1, nullptr);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetReferencedId002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text2[] = "text";
    auto res1 = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_NEGATIVE_1, PARAM_0);
    ASSERT_OBJ(res1, nullptr);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetReferencedId003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text2[] = "text";
    auto res1 = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_0, PARAM_NEGATIVE_1);
    ASSERT_OBJ(res1, nullptr);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetReferencedSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text1[] = "text";
    auto ret = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_0, PARAM_0);
    if (::strcmp(ret, text1) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    ASSERT_NE(OH_ArkUI_BarrierOption_GetReferencedIdSize(nullptr, PARAM_0), PARAM_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}

static napi_value TestRelativeContainerBarrierOptionGetReferencedSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = { .string = "text" };
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    auto barrier = OH_ArkUI_BarrierOption_Create(PARAM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", PARAM_0);
    char text1[] = "text";
    auto ret = OH_ArkUI_BarrierOption_GetReferencedId(barrier, PARAM_0, PARAM_0);
    if (::strcmp(ret, text1) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetReferencedIdSize(barrier, PARAM_0), PARAM_1);
    OH_ArkUI_BarrierOption_Dispose(barrier);
    NAPI_END;
}
} // namespace ArkUICapiTest
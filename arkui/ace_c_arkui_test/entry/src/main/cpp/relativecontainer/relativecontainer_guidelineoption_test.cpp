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
static napi_value TestRelativeContainerGuidelineOptionCreate001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    if (guideline != nullptr) {
        OH_ArkUI_GuidelineOption_Dispose(guideline);
        ASSERT_EQ(true, true);
    } else {
        ASSERT_EQ(true, false);
    }
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionDispose001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetId001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    const char* guidelineId = "line1";
    OH_ArkUI_GuidelineOption_SetId(guideline, guidelineId, PARAM_0);
    auto ret = OH_ArkUI_GuidelineOption_GetId(guideline, PARAM_0);
    if (::strcmp(ret, guidelineId) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetId002(napi_env env, napi_callback_info info)
{
    const char* guidelineId = "line1";
    OH_ArkUI_GuidelineOption_SetId(nullptr, guidelineId, PARAM_0);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetId003(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    const char* guidelineId = "line1";
    OH_ArkUI_GuidelineOption_SetId(guideline, guidelineId, PARAM_1);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetId004(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    const char* guidelineId = "line1";
    OH_ArkUI_GuidelineOption_SetId(guideline, guidelineId, PARAM_NEGATIVE_1);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetId001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    const char* guidelineId = "line1";
    OH_ArkUI_GuidelineOption_SetId(guideline, guidelineId, PARAM_0);
    auto ret = OH_ArkUI_GuidelineOption_GetId(guideline, PARAM_0);
    if (::strcmp(ret, guidelineId) != PARAM_0) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetId002(napi_env env, napi_callback_info info)
{
    const char* guidelineId = "line1";
    auto res1 = OH_ArkUI_GuidelineOption_GetId(nullptr, PARAM_0);
    ASSERT_OBJ(res1, nullptr);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetDirection001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    ArkUI_Axis value = ARKUI_AXIS_VERTICAL;
    OH_ArkUI_GuidelineOption_SetDirection(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetDirection(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetDirection002(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    ArkUI_Axis value = ARKUI_AXIS_HORIZONTAL;
    OH_ArkUI_GuidelineOption_SetDirection(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetDirection(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetDirection001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    OH_ArkUI_GuidelineOption_SetDirection(guideline, ARKUI_AXIS_VERTICAL, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetDirection(guideline, PARAM_0), ARKUI_AXIS_VERTICAL);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetDirection002(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    OH_ArkUI_GuidelineOption_SetDirection(guideline, ARKUI_AXIS_VERTICAL, PARAM_0);
    ASSERT_NE(OH_ArkUI_GuidelineOption_GetDirection(guideline, PARAM_NEGATIVE_1), ARKUI_AXIS_VERTICAL);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionStart001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionStart(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetPositionStart(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionStart002(napi_env env, napi_callback_info info)
{
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionStart(nullptr, value, PARAM_0);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionStart003(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_NEGATIVE_1;
    OH_ArkUI_GuidelineOption_SetPositionStart(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetPositionStart(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionStart004(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionStart(guideline, value, PARAM_NEGATIVE_1);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetPositionStart001(napi_env env, napi_callback_info info)
{
    ASSERT_NE(OH_ArkUI_GuidelineOption_GetPositionStart(nullptr, PARAM_0), PARAM_1);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetPositionStart002(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_1;
    OH_ArkUI_GuidelineOption_SetPositionStart(guideline, value, PARAM_0);
    ASSERT_NE(OH_ArkUI_GuidelineOption_GetPositionStart(guideline, PARAM_NEGATIVE_1), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionEnd001(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionEnd(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetPositionEnd(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionEnd002(napi_env env, napi_callback_info info)
{
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionEnd(nullptr, value, PARAM_0);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionEnd003(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_NEGATIVE_1;
    OH_ArkUI_GuidelineOption_SetPositionEnd(guideline, value, PARAM_0);
    ASSERT_EQ(OH_ArkUI_GuidelineOption_GetPositionEnd(guideline, PARAM_0), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionSetPositionEnd004(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_0;
    OH_ArkUI_GuidelineOption_SetPositionEnd(guideline, value, PARAM_NEGATIVE_1);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetPositionEnd001(napi_env env, napi_callback_info info)
{
    ASSERT_NE(OH_ArkUI_GuidelineOption_GetPositionEnd(nullptr, PARAM_0), PARAM_1);
    NAPI_END;
}

static napi_value TestRelativeContainerGuidelineOptionGetPositionEnd002(napi_env env, napi_callback_info info)
{
    auto guideline = OH_ArkUI_GuidelineOption_Create(PARAM_1);
    float value = PARAM_1;
    OH_ArkUI_GuidelineOption_SetPositionEnd(guideline, value, PARAM_0);
    ASSERT_NE(OH_ArkUI_GuidelineOption_GetPositionEnd(guideline, PARAM_NEGATIVE_1), value);
    OH_ArkUI_GuidelineOption_Dispose(guideline);
    NAPI_END;
}
} // namespace ArkUICapiTest
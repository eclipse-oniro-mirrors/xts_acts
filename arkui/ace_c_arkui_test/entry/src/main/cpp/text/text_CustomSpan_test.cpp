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
static ArkUI_NodeCustomEvent* g_customevent;

namespace ArkUICapiTest {

static napi_value textCustomSpanTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);  
    ArkUI_CustomSpanDrawInfo *customSpanDrawInfo = OH_ArkUI_CustomSpanDrawInfo_Create();    
    auto Baseline = OH_ArkUI_CustomSpanDrawInfo_GetBaseline(customSpanDrawInfo);
    ASSERT_EQ(Baseline, 0.0f);
    NAPI_END;
}

static napi_value textCustomSpanTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_CustomSpanMeasureInfo *measureInfo = OH_ArkUI_CustomSpanMeasureInfo_Create();
    OH_ArkUI_NodeCustomEvent_GetCustomSpanMeasureInfo(nullptr, measureInfo);
    float fontSize = OH_ArkUI_CustomSpanMeasureInfo_GetFontSize(measureInfo);
    ASSERT_EQ(fontSize, 0.0f);
    NAPI_END;
}

static napi_value textCustomSpanTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_CustomSpanMeasureInfo *measureInfo = OH_ArkUI_CustomSpanMeasureInfo_Create();
    ASSERT_OBJ_NE(measureInfo, nullptr);
    float fontSize = OH_ArkUI_CustomSpanMeasureInfo_GetFontSize(measureInfo);
    OH_ArkUI_CustomSpanMeasureInfo_Dispose(measureInfo);
    ASSERT_EQ(fontSize, 0.0f);
    NAPI_END;
}

static napi_value textCustomSpanTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_CustomSpanMetrics *customSpanMetrics = OH_ArkUI_CustomSpanMetrics_Create();
    ASSERT_OBJ_NE(customSpanMetrics, nullptr);
    auto ret = OH_ArkUI_CustomSpanMetrics_SetWidth(customSpanMetrics, 60.0f);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value textCustomSpanTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);  
    ArkUI_CustomSpanMetrics *customSpanMetrics = OH_ArkUI_CustomSpanMetrics_Create();
    auto ret = OH_ArkUI_CustomSpanMetrics_SetHeight(customSpanMetrics, 50.0f);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value textCustomSpanTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);  
    ArkUI_CustomSpanMetrics *customSpanMetrics = OH_ArkUI_CustomSpanMetrics_Create();
    OH_ArkUI_NodeCustomEvent_SetCustomSpanMetrics(nullptr, customSpanMetrics);
    auto ret = OH_ArkUI_CustomSpanMetrics_SetWidth(customSpanMetrics, 50.0f);
    OH_ArkUI_CustomSpanMetrics_Dispose(customSpanMetrics);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value textCustomSpanTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);  
    ArkUI_CustomSpanDrawInfo *customSpanDrawInfo = OH_ArkUI_CustomSpanDrawInfo_Create();
    ASSERT_OBJ_NE(customSpanDrawInfo, nullptr);

    auto LineTop = OH_ArkUI_CustomSpanDrawInfo_GetLineTop(customSpanDrawInfo);
    ASSERT_EQ(LineTop, 0.0f);
    NAPI_END;
}

static napi_value textCustomSpanTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_CustomSpanDrawInfo *customSpanDrawInfo = OH_ArkUI_CustomSpanDrawInfo_Create();
    OH_ArkUI_NodeCustomEvent_GetCustomSpanDrawInfo(nullptr, customSpanDrawInfo);
    auto LineBottom = OH_ArkUI_CustomSpanDrawInfo_GetLineBottom(customSpanDrawInfo);
    ASSERT_EQ(LineBottom, 0.0f);
    NAPI_END;
}

static napi_value textCustomSpanTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_CustomSpanDrawInfo *customSpanDrawInfo = OH_ArkUI_CustomSpanDrawInfo_Create();
    auto xOffset = OH_ArkUI_CustomSpanDrawInfo_GetXOffset(customSpanDrawInfo);
    OH_ArkUI_CustomSpanDrawInfo_Dispose(customSpanDrawInfo);
    ASSERT_EQ(xOffset, 0.0f);
    NAPI_END;
}
} // namespace ArkUICapiTest

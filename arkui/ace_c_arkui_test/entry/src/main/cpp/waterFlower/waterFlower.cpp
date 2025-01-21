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

static napi_value testWaterFlower_001(napi_env env, napi_callback_info info)
{
    auto option = OH_ArkUI_WaterFlowSectionOption_Create();
    OH_ArkUI_WaterFlowSectionOption_SetItemCount(option,0,5);
    auto result = OH_ArkUI_WaterFlowSectionOption_GetItemCount(option,0);
    ASSERT_EQ(result, 5);
    NAPI_END;
}
static napi_value testWaterFlower_002(napi_env env, napi_callback_info info)
{
    auto option = OH_ArkUI_WaterFlowSectionOption_Create();
    OH_ArkUI_WaterFlowSectionOption_SetCrossCount(option,0,1);
    auto result = OH_ArkUI_WaterFlowSectionOption_GetCrossCount(option,0);
    ASSERT_EQ(result, 1);
    NAPI_END;
}

static napi_value testWaterFlower_003(napi_env env, napi_callback_info info)
{
    auto option = OH_ArkUI_WaterFlowSectionOption_Create();
    OH_ArkUI_WaterFlowSectionOption_SetColumnGap(option,0,10);
    auto result = OH_ArkUI_WaterFlowSectionOption_GetColumnGap(option,0);
    ASSERT_EQ(result, 10);
    NAPI_END;
}
static napi_value testWaterFlower_004(napi_env env, napi_callback_info info)
{
    auto option = OH_ArkUI_WaterFlowSectionOption_Create();
    OH_ArkUI_WaterFlowSectionOption_SetMargin(option,0,0,0,0,0);
    auto result = OH_ArkUI_WaterFlowSectionOption_GetMargin(option,0);
    OH_ArkUI_WaterFlowSectionOption_SetRowGap(option,0,5);
    
    auto result1 = OH_ArkUI_WaterFlowSectionOption_GetRowGap(option,0);
    ASSERT_EQ(result1, 5);
    NAPI_END;
}

static napi_value testWaterFlower_005(napi_env env, napi_callback_info info)
{
        auto option = OH_ArkUI_WaterFlowSectionOption_Create();
        OH_ArkUI_WaterFlowSectionOption_RegisterGetItemMainSizeCallbackByIndex(option, 0, [](int index) -> float { return index * 0; });
    
        struct ArkUICustomData{
            float id;
            int index;
        };
        auto customData = new ArkUICustomData{12,1};
        OH_ArkUI_WaterFlowSectionOption_RegisterGetItemMainSizeCallbackByIndexWithUserData(option, 1, customData,
        [](int index,void *value) -> float{
            auto data = reinterpret_cast<ArkUICustomData *>(value);
            return index * 20;
        });
    
        OH_ArkUI_WaterFlowSectionOption_SetSize(option, 12);
        auto result = OH_ArkUI_WaterFlowSectionOption_GetSize(option);
        ASSERT_EQ(result, 12);
        OH_ArkUI_WaterFlowSectionOption_Dispose(option);
        NAPI_END;
}


} 

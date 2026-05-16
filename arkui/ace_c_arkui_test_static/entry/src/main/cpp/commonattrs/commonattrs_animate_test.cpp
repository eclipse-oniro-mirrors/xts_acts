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
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#define NUM_5 0.5
#define NUM_0 0
#define NUM_1 1
#define NUM_20 20
#define NUM_90 90
#define NUM_100 100
#define NUM_120 120

namespace ArkUIAniTest {

static ani_double TestCommonAttrsAnimate001(ani_env* env, ani_object info)
{
    auto animate = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDuration(animate, NUM_100);
    OH_ArkUI_AnimateOption_SetTempo(animate, NUM_5);
    
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetDuration(animate), NUM_100);
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetTempo(animate), NUM_5);

    OH_ArkUI_AnimateOption_Dispose(animate);
    NAPI_END;
}

static ani_double TestCommonAttrsAnimate002(ani_env* env, ani_object info)
{
    auto animate = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animate, ARKUI_CURVE_FAST_OUT_SLOW_IN);
    OH_ArkUI_AnimateOption_SetDelay(animate, NUM_1);
    
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetCurve(animate), ARKUI_CURVE_FAST_OUT_SLOW_IN);
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetDelay(animate), NUM_1);
    
    OH_ArkUI_AnimateOption_Dispose(animate);
    NAPI_END;
}

static ani_double TestCommonAttrsAnimate003(ani_env* env, ani_object info)
{
    auto animate = OH_ArkUI_AnimateOption_Create();
    
    OH_ArkUI_AnimateOption_SetIterations(animate, NUM_1);
    OH_ArkUI_AnimateOption_SetPlayMode(animate, ARKUI_ANIMATION_PLAY_MODE_NORMAL);
    
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetIterations(animate), NUM_1);
    ASSERT_EQ(OH_ArkUI_AnimateOption_GetPlayMode(animate), ARKUI_ANIMATION_PLAY_MODE_NORMAL);

    OH_ArkUI_AnimateOption_Dispose(animate);
    NAPI_END;
}

static ani_double TestCommonAttrsAnimate004(ani_env* env, ani_object info)
{
    ArkUI_ExpectedFrameRateRange expected = {NUM_20, NUM_120, NUM_90};
    
    auto animate = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animate, &expected);
    
    if (OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animate) == nullptr) {
        ASSERT_EQ(NUM_1, NUM_0);
    }

    OH_ArkUI_AnimateOption_Dispose(animate);
    NAPI_END;
}

} // namespace ArkUIAniTest

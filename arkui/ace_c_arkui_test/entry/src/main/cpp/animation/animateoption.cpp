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

#include <arkui/native_animate.h>

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestAnimateOption002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    auto ret = animateAPI->animateTo(nullptr, animateOption, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimateOption003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto context = OH_ArkUI_GetContextByNode(column);
    auto ret = animateAPI->animateTo(context, nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimateOption004(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_Dispose(animateOption);
    animateOption = nullptr;
    ASSERT_OBJ(animateOption, nullptr);
    NAPI_END;
}

static napi_value TestAnimateOption005(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDuration(animateOption, PARAM_2000);
    auto ret = OH_ArkUI_AnimateOption_GetDuration(animateOption);
    ASSERT_EQ(ret, PARAM_2000);
    NAPI_END;
}

static napi_value TestAnimateOption006(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDuration(animateOption, PARAM_NEGATIVE_1000);
    auto ret = OH_ArkUI_AnimateOption_GetDuration(animateOption);
    ASSERT_EQ(ret, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimateOption007(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetTempo(animateOption, PARAM_2);
    auto ret = OH_ArkUI_AnimateOption_GetTempo(animateOption);
    ASSERT_EQ(ret, PARAM_2);
    NAPI_END;
}

static napi_value TestAnimateOption008(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetTempo(animateOption, PARAM_NEGATIVE_1);
    auto ret = OH_ArkUI_AnimateOption_GetTempo(animateOption);
    ASSERT_EQ(ret, PARAM_1);
    NAPI_END;
}

static napi_value TestAnimateOption009(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_LINEAR);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_LINEAR);
    NAPI_END;
}

static napi_value TestAnimateOption010(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EASE);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_EASE);
    NAPI_END;
}

static napi_value TestAnimateOption011(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EASE_IN);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_EASE_IN);
    NAPI_END;
}

static napi_value TestAnimateOption012(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EASE_OUT);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_EASE_OUT);
    NAPI_END;
}

static napi_value TestAnimateOption013(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EASE_IN_OUT);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_EASE_IN_OUT);
    NAPI_END;
}

static napi_value TestAnimateOption014(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_FAST_OUT_SLOW_IN);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_FAST_OUT_SLOW_IN);
    NAPI_END;
}

static napi_value TestAnimateOption015(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_LINEAR_OUT_SLOW_IN);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_LINEAR_OUT_SLOW_IN);
    NAPI_END;
}

static napi_value TestAnimateOption016(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_FAST_OUT_LINEAR_IN);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_FAST_OUT_LINEAR_IN);
    NAPI_END;
}

static napi_value TestAnimateOption017(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EXTREME_DECELERATION);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_EXTREME_DECELERATION);
    NAPI_END;
}

static napi_value TestAnimateOption018(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_SHARP);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_SHARP);
    NAPI_END;
}

static napi_value TestAnimateOption019(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_RHYTHM);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_RHYTHM);
    NAPI_END;
}

static napi_value TestAnimateOption020(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_SMOOTH);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_SMOOTH);
    NAPI_END;
}

static napi_value TestAnimateOption021(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_FRICTION);
    auto ret = OH_ArkUI_AnimateOption_GetCurve(animateOption);
    ASSERT_EQ(ret, ARKUI_CURVE_FRICTION);
    NAPI_END;
}

static napi_value TestAnimateOption022(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDelay(animateOption, PARAM_NEGATIVE_1000);
    auto ret = OH_ArkUI_AnimateOption_GetDelay(animateOption);
    ASSERT_EQ(ret, PARAM_NEGATIVE_1000);
    NAPI_END;
}

static napi_value TestAnimateOption023(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDelay(animateOption, PARAM_2000);
    auto ret = OH_ArkUI_AnimateOption_GetDelay(animateOption);
    ASSERT_EQ(ret, PARAM_2000);
    NAPI_END;
}

static napi_value TestAnimateOption024(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetIterations(animateOption, PARAM_3);
    auto ret = OH_ArkUI_AnimateOption_GetIterations(animateOption);
    ASSERT_EQ(ret, PARAM_3);
    NAPI_END;
}

static napi_value TestAnimateOption025(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetIterations(animateOption, PARAM_NEGATIVE_2);
    auto ret = OH_ArkUI_AnimateOption_GetIterations(animateOption);
    ASSERT_EQ(ret, PARAM_1);
    NAPI_END;
}

static napi_value TestAnimateOption026(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetPlayMode(animateOption, ARKUI_ANIMATION_PLAY_MODE_NORMAL);
    auto ret = OH_ArkUI_AnimateOption_GetPlayMode(animateOption);
    ASSERT_EQ(ret, ARKUI_ANIMATION_PLAY_MODE_NORMAL);
    NAPI_END;
}

static napi_value TestAnimateOption027(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetPlayMode(animateOption, ARKUI_ANIMATION_PLAY_MODE_REVERSE);
    auto ret = OH_ArkUI_AnimateOption_GetPlayMode(animateOption);
    ASSERT_EQ(ret, ARKUI_ANIMATION_PLAY_MODE_REVERSE);
    NAPI_END;
}

static napi_value TestAnimateOption028(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetPlayMode(animateOption, ARKUI_ANIMATION_PLAY_MODE_ALTERNATE);
    auto ret = OH_ArkUI_AnimateOption_GetPlayMode(animateOption);
    ASSERT_EQ(ret, ARKUI_ANIMATION_PLAY_MODE_ALTERNATE);
    NAPI_END;
}

static napi_value TestAnimateOption029(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetPlayMode(animateOption, ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE);
    auto ret = OH_ArkUI_AnimateOption_GetPlayMode(animateOption);
    ASSERT_EQ(ret, ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE);
    NAPI_END;
}

static napi_value TestAnimateOption030(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_60 };
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animateOption, expectedFrameRateRange);
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animateOption);
    ASSERT_EQ(ret->min, expectedFrameRateRange->min);
    ASSERT_EQ(ret->max, expectedFrameRateRange->max);
    ASSERT_EQ(ret->expected, expectedFrameRateRange->expected);
    NAPI_END;
}

static napi_value TestAnimateOption031(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_100 };
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animateOption, expectedFrameRateRange);
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animateOption);
    ASSERT_EQ(ret->min, expectedFrameRateRange->min);
    ASSERT_EQ(ret->max, expectedFrameRateRange->max);
    ASSERT_EQ(ret->expected, expectedFrameRateRange->expected);
    NAPI_END;
}

static napi_value TestAnimateOption032(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_90, PARAM_30, PARAM_60 };
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animateOption, expectedFrameRateRange);
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animateOption);
    ASSERT_EQ(ret->min, expectedFrameRateRange->min);
    ASSERT_EQ(ret->max, expectedFrameRateRange->max);
    ASSERT_EQ(ret->expected, expectedFrameRateRange->expected);
    NAPI_END;
}

static napi_value TestAnimateOption033(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_0, PARAM_0, PARAM_0 };
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animateOption, expectedFrameRateRange);
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animateOption);
    ASSERT_EQ(ret->min, expectedFrameRateRange->min);
    ASSERT_EQ(ret->max, expectedFrameRateRange->max);
    ASSERT_EQ(ret->expected, expectedFrameRateRange->expected);
    NAPI_END;
}

static napi_value TestAnimateOption034(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetExpectedFrameRateRange(animateOption, nullptr);
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(animateOption);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

static napi_value TestAnimateOption035(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_ArkUI_AnimateOption_SetICurve(animateOption, animateCurve);
    auto ret = OH_ArkUI_AnimateOption_GetICurve(animateOption);
    ASSERT_OBJ(ret, animateCurve);
    NAPI_END;
}

static napi_value TestAnimateOption036(napi_env env, napi_callback_info info)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetICurve(animateOption, nullptr);
    auto ret = OH_ArkUI_AnimateOption_GetICurve(animateOption);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

static napi_value TestAnimateOption037(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetDuration(nullptr);
    ASSERT_EQ(ret, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimateOption038(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetTempo(nullptr);
    ASSERT_EQ(ret, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimateOption039(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetCurve(nullptr);
    ASSERT_EQ(ret, static_cast<ArkUI_AnimationCurve>(-1));
    NAPI_END;
}

static napi_value TestAnimateOption040(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetDelay(nullptr);
    ASSERT_EQ(ret, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimateOption041(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetIterations(nullptr);
    ASSERT_EQ(ret, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimateOption042(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetPlayMode(nullptr);
    ASSERT_EQ(ret, static_cast<ArkUI_AnimationPlayMode>(-1));
    NAPI_END;
}

static napi_value TestAnimateOption043(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimateOption_GetExpectedFrameRateRange(nullptr);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest
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

static napi_value TestAnimatorOption001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animator = animateAPI->createAnimator(context, animatorOption);
    ASSERT_EQ((animatorOption != nullptr), true);
    ASSERT_EQ((animator != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimatorOption002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_NEGATIVE_1);
    auto animator = animateAPI->createAnimator(context, animatorOption);
    ASSERT_OBJ(animatorOption, nullptr);
    ASSERT_OBJ(animator, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption003(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    OH_ArkUI_AnimatorOption_Dispose(animatorOption);
    animatorOption = nullptr;
    ASSERT_OBJ(animatorOption, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption004(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDuration(animatorOption, PARAM_2000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDuration(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_2000);
    NAPI_END;
}

static napi_value TestAnimatorOption005(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDuration(animatorOption, PARAM_NEGATIVE_1000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDuration(animatorOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimatorOption006(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetDuration(nullptr, PARAM_2000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDuration(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestAnimatorOption007(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDelay(animatorOption, PARAM_1000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDelay(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_1000);
    NAPI_END;
}

static napi_value TestAnimatorOption008(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDelay(animatorOption, PARAM_NEGATIVE_1000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDelay(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1000);
    NAPI_END;
}

static napi_value TestAnimatorOption009(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetDelay(nullptr, PARAM_1000);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDelay(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestAnimatorOption010(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetIterations(animatorOption, PARAM_3);
    auto ret2 = OH_ArkUI_AnimatorOption_GetIterations(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_3);
    NAPI_END;
}

static napi_value TestAnimatorOption011(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetIterations(animatorOption, PARAM_NEGATIVE_2);
    auto ret2 = OH_ArkUI_AnimatorOption_GetIterations(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

static napi_value TestAnimatorOption012(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetIterations(nullptr, PARAM_3);
    auto ret2 = OH_ArkUI_AnimatorOption_GetIterations(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestAnimatorOption013(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetFill(animatorOption, ARKUI_ANIMATION_FILL_MODE_NONE);
    auto ret2 = OH_ArkUI_AnimatorOption_GetFill(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_FILL_MODE_NONE);
    NAPI_END;
}

static napi_value TestAnimatorOption014(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetFill(animatorOption, ARKUI_ANIMATION_FILL_MODE_FORWARDS);
    auto ret2 = OH_ArkUI_AnimatorOption_GetFill(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_FILL_MODE_FORWARDS);
    NAPI_END;
}

static napi_value TestAnimatorOption015(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetFill(animatorOption, ARKUI_ANIMATION_FILL_MODE_BACKWARDS);
    auto ret2 = OH_ArkUI_AnimatorOption_GetFill(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_FILL_MODE_BACKWARDS);
    NAPI_END;
}

static napi_value TestAnimatorOption016(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetFill(animatorOption, ARKUI_ANIMATION_FILL_MODE_BOTH);
    auto ret2 = OH_ArkUI_AnimatorOption_GetFill(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_FILL_MODE_BOTH);
    NAPI_END;
}

static napi_value TestAnimatorOption017(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetFill(nullptr, ARKUI_ANIMATION_FILL_MODE_NONE);
    auto ret2 = OH_ArkUI_AnimatorOption_GetFill(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, static_cast<ArkUI_AnimationFillMode>(-1));
    NAPI_END;
}

static napi_value TestAnimatorOption018(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDirection(animatorOption, ARKUI_ANIMATION_DIRECTION_NORMAL);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDirection(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_DIRECTION_NORMAL);
    NAPI_END;
}

static napi_value TestAnimatorOption019(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDirection(animatorOption, ARKUI_ANIMATION_DIRECTION_REVERSE);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDirection(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_DIRECTION_REVERSE);
    NAPI_END;
}

static napi_value TestAnimatorOption020(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDirection(animatorOption, ARKUI_ANIMATION_DIRECTION_ALTERNATE);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDirection(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_DIRECTION_ALTERNATE);
    NAPI_END;
}

static napi_value TestAnimatorOption021(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetDirection(animatorOption, ARKUI_ANIMATION_DIRECTION_ALTERNATE_REVERSE);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDirection(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, ARKUI_ANIMATION_DIRECTION_ALTERNATE_REVERSE);
    NAPI_END;
}

static napi_value TestAnimatorOption022(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetDirection(nullptr, ARKUI_ANIMATION_DIRECTION_NORMAL);
    auto ret2 = OH_ArkUI_AnimatorOption_GetDirection(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, static_cast<ArkUI_AnimationDirection>(-1));
    NAPI_END;
}

static napi_value TestAnimatorOption023(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_AnimatorOption_SetCurve(animatorOption, animateCurve);
    auto ret2 = OH_ArkUI_AnimatorOption_GetCurve(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_OBJ(ret2, animateCurve);
    NAPI_END;
}

static napi_value TestAnimatorOption024(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animateCurve = OH_ArkUI_Curve_CreateSpringCurve(PARAM_2, PARAM_10, PARAM_1, PARAM_10);
    auto ret1 = OH_ArkUI_AnimatorOption_SetCurve(animatorOption, animateCurve);
    auto ret2 = OH_ArkUI_AnimatorOption_GetCurve(animatorOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption025(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetCurve(animatorOption, nullptr);
    auto ret2 = OH_ArkUI_AnimatorOption_GetCurve(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption026(napi_env env, napi_callback_info info)
{
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_AnimatorOption_SetCurve(nullptr, animateCurve);
    auto ret2 = OH_ArkUI_AnimatorOption_GetCurve(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption027(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    auto ret1 = OH_ArkUI_AnimatorOption_SetBegin(animatorOption, PARAM_100);
    auto ret2 = OH_ArkUI_AnimatorOption_GetBegin(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_100);
    NAPI_END;
}

static napi_value TestAnimatorOption028(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetBegin(animatorOption, PARAM_100);
    auto ret2 = OH_ArkUI_AnimatorOption_GetBegin(animatorOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimatorOption029(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    auto ret1 = OH_ArkUI_AnimatorOption_SetEnd(animatorOption, PARAM_200);
    auto ret2 = OH_ArkUI_AnimatorOption_GetEnd(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_200);
    NAPI_END;
}

static napi_value TestAnimatorOption030(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetEnd(animatorOption, PARAM_200);
    auto ret2 = OH_ArkUI_AnimatorOption_GetEnd(animatorOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

static napi_value TestAnimatorOption031(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    OH_ArkUI_AnimatorOption_SetBegin(animatorOption, PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_GetBegin(animatorOption);
    OH_ArkUI_AnimatorOption_SetEnd(animatorOption, PARAM_200);
    auto ret2 = OH_ArkUI_AnimatorOption_GetEnd(animatorOption);
    ASSERT_EQ(ret1, PARAM_100);
    ASSERT_EQ(ret2, PARAM_200);
    NAPI_END;
}

static napi_value TestAnimatorOption032(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    OH_ArkUI_AnimatorOption_SetBegin(animatorOption, PARAM_200);
    auto ret1 = OH_ArkUI_AnimatorOption_GetBegin(animatorOption);
    OH_ArkUI_AnimatorOption_SetEnd(animatorOption, PARAM_NEGATIVE_100);
    auto ret2 = OH_ArkUI_AnimatorOption_GetEnd(animatorOption);
    ASSERT_EQ(ret1, PARAM_200);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_100);
    NAPI_END;
}

static napi_value TestAnimatorOption033(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_60 };
    auto ret1 = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(animatorOption, expectedFrameRateRange);
    auto ret2 = OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange(animatorOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2->min, expectedFrameRateRange->min);
    ASSERT_EQ(ret2->max, expectedFrameRateRange->max);
    ASSERT_EQ(ret2->expected, expectedFrameRateRange->expected);
    NAPI_END;
}

static napi_value TestAnimatorOption034(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(animatorOption, nullptr);
    auto ret2 = OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange(animatorOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption035(napi_env env, napi_callback_info info)
{
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_60 };
    auto ret1 = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(nullptr, expectedFrameRateRange);
    auto ret2 = OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption036(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption, PARAM_1, PARAM_1, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeTime(animatorOption, PARAM_0);
    auto ret3 = OH_ArkUI_AnimatorOption_GetKeyframeValue(animatorOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_1);
    ASSERT_EQ(ret3, PARAM_1);
    NAPI_END;
}

static napi_value TestAnimatorOption037(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption, PARAM_2, PARAM_1, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeTime(animatorOption, PARAM_0);
    auto ret3 = OH_ArkUI_AnimatorOption_GetKeyframeValue(animatorOption, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    ASSERT_EQ(ret3, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimatorOption038(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption, PARAM_1, PARAM_1, PARAM_200);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeTime(animatorOption, PARAM_200);
    auto ret3 = OH_ArkUI_AnimatorOption_GetKeyframeValue(animatorOption, PARAM_200);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret3, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestAnimatorOption039(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframe(nullptr, PARAM_1, PARAM_1, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeTime(nullptr, PARAM_0);
    auto ret3 = OH_ArkUI_AnimatorOption_GetKeyframeValue(nullptr, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret3, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestAnimatorOption040(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(animatorOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_OBJ(ret2, animateCurve);
    NAPI_END;
}

static napi_value TestAnimatorOption041(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animateCurve = OH_ArkUI_Curve_CreateSpringCurve(PARAM_2, PARAM_10, PARAM_1, PARAM_10);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(animatorOption, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption042(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption, nullptr, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(animatorOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption043(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption, animateCurve, PARAM_200);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(animatorOption, PARAM_200);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption044(napi_env env, napi_callback_info info)
{
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(nullptr, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(nullptr, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption045(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimatorEvent_GetUserData(nullptr);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

static napi_value TestAnimatorOption046(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_AnimatorOnFrameEvent_GetUserData(nullptr);
    auto ret2 = OH_ArkUI_AnimatorOnFrameEvent_GetValue(nullptr);
    ASSERT_OBJ(ret1, nullptr);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static napi_value TestAnimatorOption048(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(animatorOption, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption049(napi_env env, napi_callback_info info)
{
    auto ret =
        OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(nullptr, nullptr, [](ArkUI_AnimatorOnFrameEvent* event) {});
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption051(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(animatorOption, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption052(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(nullptr, nullptr, [](ArkUI_AnimatorEvent* event) {});
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption054(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(animatorOption, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption055(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(nullptr, nullptr, [](ArkUI_AnimatorEvent* event) {});
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption057(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(animatorOption, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption058(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(nullptr, nullptr, [](ArkUI_AnimatorEvent* event) {});
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption059(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Animator_Play(nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption060(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Animator_Pause(nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption061(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Animator_Finish(nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption063(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Animator_Reverse(nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption064(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Animator_Cancel(nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption065(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    // create animatorOption1 with non default values
    auto animatorOption1 = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption1, PARAM_2000);
    OH_ArkUI_AnimatorOption_SetDelay(animatorOption1, PARAM_1000);
    OH_ArkUI_AnimatorOption_SetIterations(animatorOption1, PARAM_3);
    OH_ArkUI_AnimatorOption_SetFill(animatorOption1, ARKUI_ANIMATION_FILL_MODE_BACKWARDS);
    OH_ArkUI_AnimatorOption_SetDirection(animatorOption1, ARKUI_ANIMATION_DIRECTION_ALTERNATE);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_ArkUI_AnimatorOption_SetCurve(animatorOption1, animateCurve);
    OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption1, PARAM_1, PARAM_1, PARAM_0);
    OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption1, nullptr, PARAM_0);
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_60 };
    OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(animatorOption1, expectedFrameRateRange);
    // create animator with animatorOption1
    auto animator = animateAPI->createAnimator(context, animatorOption1);
    // create animatorOption2 with default values
    auto animatorOption2 = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    // reset animator with animatorOption2
    auto ret = OH_ArkUI_Animator_ResetAnimatorOption(animator, animatorOption2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestAnimatorOption066(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    // create animatorOption with non default values
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_100);
    OH_ArkUI_AnimatorOption_SetDuration(animatorOption, PARAM_2000);
    OH_ArkUI_AnimatorOption_SetDelay(animatorOption, PARAM_1000);
    OH_ArkUI_AnimatorOption_SetIterations(animatorOption, PARAM_3);
    OH_ArkUI_AnimatorOption_SetFill(animatorOption, ARKUI_ANIMATION_FILL_MODE_BACKWARDS);
    OH_ArkUI_AnimatorOption_SetDirection(animatorOption, ARKUI_ANIMATION_DIRECTION_ALTERNATE);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_ArkUI_AnimatorOption_SetCurve(animatorOption, animateCurve);
    OH_ArkUI_AnimatorOption_SetKeyframe(animatorOption, PARAM_1, PARAM_1, PARAM_0);
    OH_ArkUI_AnimatorOption_SetKeyframeCurve(animatorOption, nullptr, PARAM_0);
    ArkUI_ExpectedFrameRateRange* expectedFrameRateRange =
        new ArkUI_ExpectedFrameRateRange { PARAM_30, PARAM_90, PARAM_60 };
    OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(animatorOption, expectedFrameRateRange);
    auto animator = animateAPI->createAnimator(context, animatorOption);
    // reset animator with nullptr
    auto ret = OH_ArkUI_Animator_ResetAnimatorOption(animator, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestAnimatorOption067(napi_env env, napi_callback_info info)
{
    auto animatorOption = OH_ArkUI_AnimatorOption_Create(PARAM_0);
    auto ret = OH_ArkUI_Animator_ResetAnimatorOption(nullptr, animatorOption);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
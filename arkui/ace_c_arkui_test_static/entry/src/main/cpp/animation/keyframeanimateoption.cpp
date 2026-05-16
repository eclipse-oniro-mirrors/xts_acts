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

#include <arkui/native_animate.h>

#include "common/common.h"
#include "ani/ani.h"

#define PARAM_1000 1000
namespace ArkUIAniTest {

static ani_double TestKeyframeAnimateOption001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto context = OH_ArkUI_GetContextByNode(column);
    auto ret = animateAPI->keyframeAnimateTo(context, animateOption);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption002(ani_env* env, ani_object info)
{
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret = animateAPI->keyframeAnimateTo(nullptr, animateOption);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NativeAnimateAPI_1* animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    auto context = OH_ArkUI_GetContextByNode(column);
    auto ret = animateAPI->keyframeAnimateTo(context, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption004(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_NEGATIVE_1);
    ASSERT_OBJ(animateOption, nullptr);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption005(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    OH_ArkUI_KeyframeAnimateOption_Dispose(animateOption);
    animateOption = nullptr;
    ASSERT_OBJ(animateOption, nullptr);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption006(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDelay(animateOption, PARAM_2000);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDelay(animateOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_2000);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption007(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDelay(animateOption, PARAM_NEGATIVE_1000);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDelay(animateOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1000);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption008(ani_env* env, ani_object info)
{
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDelay(nullptr, PARAM_NEGATIVE_1000);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDelay(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption009(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetIterations(animateOption, PARAM_3);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetIterations(animateOption);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_3);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption010(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetIterations(animateOption, PARAM_NEGATIVE_2);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetIterations(animateOption);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption011(ani_env* env, ani_object info)
{
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetIterations(nullptr, PARAM_3);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetIterations(nullptr);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_1);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption013(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption014(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDuration(animateOption, PARAM_2000, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDuration(animateOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_2000);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption015(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDuration(animateOption, PARAM_2000, PARAM_2);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDuration(animateOption, PARAM_2);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption016(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDuration(animateOption, PARAM_NEGATIVE_1000, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDuration(animateOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption017(ani_env* env, ani_object info)
{
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetDuration(nullptr, PARAM_2000, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetDuration(nullptr, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption018(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret = OH_ArkUI_KeyframeAnimateOption_GetDuration(animateOption, PARAM_0);
    ASSERT_EQ(ret, PARAM_1000);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption019(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetCurve(animateOption, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetCurve(animateOption, PARAM_0);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_OBJ(ret2, animateCurve);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption020(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto animateCurve = OH_ArkUI_Curve_CreateSpringMotion(PARAM_0_POINT_5, PARAM_0_POINT_5, PARAM_0_POINT_5);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetCurve(animateOption, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetCurve(animateOption, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption021(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetCurve(animateOption, animateCurve, PARAM_2);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetCurve(animateOption, PARAM_2);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption022(ani_env* env, ani_object info)
{
    auto animateCurve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    auto ret1 = OH_ArkUI_KeyframeAnimateOption_SetCurve(nullptr, animateCurve, PARAM_0);
    auto ret2 = OH_ArkUI_KeyframeAnimateOption_GetCurve(nullptr, PARAM_0);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_OBJ(ret2, nullptr);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption024(ani_env* env, ani_object info)
{
    auto animateOption = OH_ArkUI_KeyframeAnimateOption_Create(PARAM_1);
    auto ret = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(animateOption, nullptr, nullptr, PARAM_2);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestKeyframeAnimateOption025(ani_env* env, ani_object info)
{
    auto ret = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(nullptr, nullptr, nullptr, PARAM_0);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUIAniTest
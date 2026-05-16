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

namespace ArkUIAniTest {

static ani_double TestAnimateCurve001(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve002(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_3, true);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve003(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_NEGATIVE_1, true);
    ASSERT_OBJ(curveHandle, nullptr);
    NAPI_END;
}

static ani_double TestAnimateCurve004(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_3, false);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve005(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCubicBezierCurve(PARAM_0, PARAM_0, PARAM_1, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve006(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateSpringCurve(PARAM_2, PARAM_10, PARAM_1, PARAM_10);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve007(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateSpringMotion(PARAM_0_POINT_5, PARAM_0_POINT_5, PARAM_0_POINT_5);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve008(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateResponsiveSpringMotion(PARAM_1, PARAM_1, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}
static ani_double TestAnimateCurve009(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateInterpolatingSpring(PARAM_50, PARAM_1, PARAM_10, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static ani_double TestAnimateCurve010(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_ArkUI_Curve_DisposeCurve(curveHandle);
    curveHandle = nullptr;
    ASSERT_OBJ(curveHandle, nullptr);
    NAPI_END;
}

static ani_double TestAnimateCurve011(ani_env* env, ani_object info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCustomCurve(nullptr, nullptr);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

} // namespace ArkUIAniTest
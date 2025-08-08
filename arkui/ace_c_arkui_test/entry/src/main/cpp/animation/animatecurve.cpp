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

static napi_value TestAnimateCurve001(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_3, true);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve003(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_NEGATIVE_1, true);
    ASSERT_OBJ(curveHandle, nullptr);
    NAPI_END;
}

static napi_value TestAnimateCurve004(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateStepsCurve(PARAM_3, false);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve005(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCubicBezierCurve(PARAM_0, PARAM_0, PARAM_1, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve006(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateSpringCurve(PARAM_2, PARAM_10, PARAM_1, PARAM_10);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve007(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateSpringMotion(PARAM_0_POINT_5, PARAM_0_POINT_5, PARAM_0_POINT_5);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve008(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateResponsiveSpringMotion(PARAM_1, PARAM_1, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}
static napi_value TestAnimateCurve009(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateInterpolatingSpring(PARAM_50, PARAM_1, PARAM_10, PARAM_1);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

static napi_value TestAnimateCurve010(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_ArkUI_Curve_DisposeCurve(curveHandle);
    curveHandle = nullptr;
    ASSERT_OBJ(curveHandle, nullptr);
    NAPI_END;
}

static napi_value TestAnimateCurve011(napi_env env, napi_callback_info info)
{
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_ANIMATE, "ArkUI_NativeAnimateAPI_1");
    auto curveHandle = OH_ArkUI_Curve_CreateCustomCurve(nullptr, nullptr);
    ASSERT_EQ((curveHandle != nullptr), true);
    NAPI_END;
}

} // namespace ArkUICapiTest
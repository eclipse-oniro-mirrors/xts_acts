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

#include "common/Common.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <animateoptiontest/AnimatorOptionTest.h>
#include <vector>

EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("KeyframeSetDelay0100", AnimatorOptionTest::KeyframeSetDelay0100));
    desc.push_back(XL("KeyframeSetDelay0200", AnimatorOptionTest::KeyframeSetDelay0200));
    desc.push_back(XL("KeyframeSetIterations0100", AnimatorOptionTest::KeyframeSetIterations0100));
    desc.push_back(XL("KeyframeSetIterations0200", AnimatorOptionTest::KeyframeSetIterations0200));
    desc.push_back(XL("KeyframeSetIterations0300", AnimatorOptionTest::KeyframeSetIterations0300));
    desc.push_back(XL("KeyframeRegisterOnFinishCallback0100",
                      AnimatorOptionTest::KeyframeRegisterOnFinishCallback0100));
    desc.push_back(XL("KeyframeRegisterOnFinishCallback0200",
                      AnimatorOptionTest::KeyframeRegisterOnFinishCallback0200));
    desc.push_back(XL("KeyframeSetExpectedFrameRate0100", AnimatorOptionTest::KeyframeSetExpectedFrameRate0100));
    desc.push_back(XL("KeyframeSetExpectedFrameRate0200", AnimatorOptionTest::KeyframeSetExpectedFrameRate0200));
    desc.push_back(XL("KeyframeSetExpectedFrameRate0300", AnimatorOptionTest::KeyframeSetExpectedFrameRate0300));
    desc.push_back(XL("KeyframeSetDuration0100", AnimatorOptionTest::KeyframeSetDuration0100));
    desc.push_back(XL("KeyframeSetDuration0200", AnimatorOptionTest::KeyframeSetDuration0200));
    desc.push_back(XL("KeyframeSetDuration0300", AnimatorOptionTest::KeyframeSetDuration0300));
    desc.push_back(XL("KeyframeSetDuration0400", AnimatorOptionTest::KeyframeSetDuration0400));
    desc.push_back(XL("KeyframeSetDuration0500", AnimatorOptionTest::KeyframeSetDuration0500));
    desc.push_back(XL("KeyframeSetCurve0100", AnimatorOptionTest::KeyframeSetCurve0100));
    desc.push_back(XL("KeyframeSetCurve0200", AnimatorOptionTest::KeyframeSetCurve0200));
    desc.push_back(XL("KeyframeSetCurve0300", AnimatorOptionTest::KeyframeSetCurve0300));
    desc.push_back(XL("KeyframeSetCurve0400", AnimatorOptionTest::KeyframeSetCurve0400));
    desc.push_back(XL("KeyframeRegisterOnEventCallback0100", AnimatorOptionTest::KeyframeRegisterOnEventCallback0100));
    desc.push_back(XL("KeyframeRegisterOnEventCallback0200", AnimatorOptionTest::KeyframeRegisterOnEventCallback0200));
    desc.push_back(XL("KeyframeRegisterOnEventCallback0300", AnimatorOptionTest::KeyframeRegisterOnEventCallback0300));
    desc.push_back(XL("KeyframeRegisterOnEventCallback0400", AnimatorOptionTest::KeyframeRegisterOnEventCallback0400));
    desc.push_back(XL("AnimatorOptionSetDuration0100", AnimatorOptionTest::AnimatorOptionSetDuration0100));
    desc.push_back(XL("AnimatorOptionSetDuration0200", AnimatorOptionTest::AnimatorOptionSetDuration0200));
    desc.push_back(XL("AnimatorOptionSetDuration0300", AnimatorOptionTest::AnimatorOptionSetDuration0300));
    desc.push_back(XL("AnimatorOptionSetDelay0100", AnimatorOptionTest::AnimatorOptionSetDelay0100));
    desc.push_back(XL("AnimatorOptionSetDelay0200", AnimatorOptionTest::AnimatorOptionSetDelay0200));
    desc.push_back(XL("AnimatorOptionSetIterations0100", AnimatorOptionTest::AnimatorOptionSetIterations0100));
    desc.push_back(XL("AnimatorOptionSetIterations0200", AnimatorOptionTest::AnimatorOptionSetIterations0200));
    desc.push_back(XL("AnimatorOptionSetIterations0300", AnimatorOptionTest::AnimatorOptionSetIterations0300));
    desc.push_back(XL("AnimatorOptionSetFill0100", AnimatorOptionTest::AnimatorOptionSetFill0100));
    desc.push_back(XL("AnimatorOptionSetFill0200", AnimatorOptionTest::AnimatorOptionSetFill0200));
    desc.push_back(XL("AnimatorOptionSetFill0300", AnimatorOptionTest::AnimatorOptionSetFill0300));
    desc.push_back(XL("AnimatorOptionSetFill0400", AnimatorOptionTest::AnimatorOptionSetFill0400));
    desc.push_back(XL("AnimatorOptionSetDirection0100", AnimatorOptionTest::AnimatorOptionSetDirection0100));
    desc.push_back(XL("AnimatorOptionSetDirection0200", AnimatorOptionTest::AnimatorOptionSetDirection0200));
    desc.push_back(XL("AnimatorOptionSetDirection0300", AnimatorOptionTest::AnimatorOptionSetDirection0300));
}

static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("AnimatorOptionSetCurve0100", AnimatorOptionTest::AnimatorOptionSetCurve0100));
    desc.push_back(XL("AnimatorOptionSetCurve0200", AnimatorOptionTest::AnimatorOptionSetCurve0200));
    desc.push_back(XL("AnimatorOptionSetBegin0100", AnimatorOptionTest::AnimatorOptionSetBegin0100));
    desc.push_back(XL("AnimatorOptionSetBegin0200", AnimatorOptionTest::AnimatorOptionSetBegin0200));
    desc.push_back(XL("AnimatorOptionSetEnd0100", AnimatorOptionTest::AnimatorOptionSetEnd0100));
    desc.push_back(XL("AnimatorOptionSetEnd0200", AnimatorOptionTest::AnimatorOptionSetEnd0200));
    desc.push_back(XL("AnimatorOptionSetExpectedFrameRateRange0100",
                      AnimatorOptionTest::AnimatorOptionSetExpectedFrameRateRange0100));
    desc.push_back(XL("AnimatorOptionSetExpectedFrameRateRange0200",
                      AnimatorOptionTest::AnimatorOptionSetExpectedFrameRateRange0200));
    desc.push_back(XL("AnimatorOptionSetExpectedFrameRateRange0300",
                      AnimatorOptionTest::AnimatorOptionSetExpectedFrameRateRange0300));
    desc.push_back(XL("AnimatorOptionSetKeyframe0100", AnimatorOptionTest::AnimatorOptionSetKeyframe0100));
    desc.push_back(XL("AnimatorOptionSetKeyframe0200", AnimatorOptionTest::AnimatorOptionSetKeyframe0200));
    desc.push_back(XL("AnimatorOptionSetKeyframe0300", AnimatorOptionTest::AnimatorOptionSetKeyframe0300));
    desc.push_back(XL("AnimatorOptionSetKeyframe0400", AnimatorOptionTest::AnimatorOptionSetKeyframe0400));
    desc.push_back(XL("AnimatorOptionSetKeyframe0500", AnimatorOptionTest::AnimatorOptionSetKeyframe0500));
    desc.push_back(XL("AnimatorOptionSetKeyframeCurve0100", AnimatorOptionTest::AnimatorOptionSetKeyframeCurve0100));
    desc.push_back(XL("AnimatorOptionSetKeyframeCurve0200", AnimatorOptionTest::AnimatorOptionSetKeyframeCurve0200));
    desc.push_back(XL("AnimatorOptionSetKeyframeCurve0300", AnimatorOptionTest::AnimatorOptionSetKeyframeCurve0300));
    desc.push_back(XL("AnimatorOptionSetKeyframeCurve0400", AnimatorOptionTest::AnimatorOptionSetKeyframeCurve0400));
    desc.push_back(XL("AnimatorOptionRegisterOnFrameCallback0100",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFrameCallback0100));
    desc.push_back(XL("AnimatorOptionRegisterOnFrameCallback0200",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFrameCallback0200));
    desc.push_back(XL("AnimatorOptionRegisterOnFrameCallback0300",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFrameCallback0300));
    desc.push_back(XL("AnimatorOptionRegisterOnFinishCallback0100",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFinishCallback0100));
    desc.push_back(XL("AnimatorOptionRegisterOnFinishCallback0200",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFinishCallback0200));
    desc.push_back(XL("AnimatorOptionRegisterOnFinishCallback0300",
                      AnimatorOptionTest::AnimatorOptionRegisterOnFinishCallback0300));
    desc.push_back(XL("AnimatorOptionRegisterOnCancelCallback0100",
                      AnimatorOptionTest::AnimatorOptionRegisterOnCancelCallback0100));
    desc.push_back(XL("AnimatorOptionRegisterOnCancelCallback0200",
                      AnimatorOptionTest::AnimatorOptionRegisterOnCancelCallback0200));
    desc.push_back(XL("AnimatorOptionRegisterOnCancelCallback0300",
                      AnimatorOptionTest::AnimatorOptionRegisterOnCancelCallback0300));
    desc.push_back(XL("AnimatorOptionRegisterOnRepeatCallback0100",
                      AnimatorOptionTest::AnimatorOptionRegisterOnRepeatCallback0100));
    desc.push_back(XL("AnimatorOptionRegisterOnRepeatCallback0200",
                      AnimatorOptionTest::AnimatorOptionRegisterOnRepeatCallback0200));
    desc.push_back(XL("AnimatorOptionRegisterOnRepeatCallback0300",
                      AnimatorOptionTest::AnimatorOptionRegisterOnRepeatCallback0300));
}

static void InitPush3(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("GetArkUIContext", AnimatorOptionTest::GetArkUIContext));
    desc.push_back(XL("AnimatorResetAnimatorOption0100", AnimatorOptionTest::AnimatorResetAnimatorOption0100));
    desc.push_back(XL("AnimatorResetAnimatorOption0200", AnimatorOptionTest::AnimatorResetAnimatorOption0200));
    desc.push_back(XL("AnimatorResetAnimatorOption0300", AnimatorOptionTest::AnimatorResetAnimatorOption0300));
    desc.push_back(XL("AnimatorPlay0100", AnimatorOptionTest::AnimatorPlay0100));
    desc.push_back(XL("AnimatorPlay0200", AnimatorOptionTest::AnimatorPlay0200));
    desc.push_back(XL("AnimatorFinish0100", AnimatorOptionTest::AnimatorFinish0100));
    desc.push_back(XL("AnimatorFinish0200", AnimatorOptionTest::AnimatorFinish0200));
    desc.push_back(XL("AnimatorPause0100", AnimatorOptionTest::AnimatorPause0100));
    desc.push_back(XL("AnimatorPause0200", AnimatorOptionTest::AnimatorPause0200));
    desc.push_back(XL("AnimatorCancel0100", AnimatorOptionTest::AnimatorCancel0100));
    desc.push_back(XL("AnimatorCancel0200", AnimatorOptionTest::AnimatorCancel0200));
    desc.push_back(XL("AnimatorReverse0100", AnimatorOptionTest::AnimatorReverse0100));
    desc.push_back(XL("AnimatorReverse0200", AnimatorOptionTest::AnimatorReverse0200));
    desc.push_back(XL("TransitionEffectCombine0100", AnimatorOptionTest::TransitionEffectCombine0100));
    desc.push_back(XL("TransitionEffectCombine0200", AnimatorOptionTest::TransitionEffectCombine0200));
    desc.push_back(XL("TransitionEffectSetAnimation0100", AnimatorOptionTest::TransitionEffectSetAnimation0100));
    desc.push_back(XL("TransitionEffectSetAnimation0200", AnimatorOptionTest::TransitionEffectSetAnimation0200));
    desc.push_back(XL("disposeAnimator0100", AnimatorOptionTest::disposeAnimator0100));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "animatendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }

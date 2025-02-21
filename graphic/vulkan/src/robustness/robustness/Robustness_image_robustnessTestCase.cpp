/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../RobustnessBaseFunc.h"
#include "../ActsRobustness0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32iDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32iUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32uiDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32uiUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32fDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR32fUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32iDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32iUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32uiDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32uiUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32fDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRg32fUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32iDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32iUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32uiDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32uiUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32fDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateRgba32fUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR64iDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR64iUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR64uiDontunroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRBindNotemplateR64uiUnroll, "dEQP-VK.robustness.image_robustness.bind.notemplate.r64ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32iDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32iUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32uiDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32uiUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32fDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR32fUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32iDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32iUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32uiDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32uiUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32fDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRg32fUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32iDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32iUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32uiDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32uiUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32fDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateRgba32fUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR64iDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR64iUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR64uiDontunroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCIRPushNotemplateR64uiUnroll, "dEQP-VK.robustness.image_robustness.push.notemplate.r64ui.unroll*");
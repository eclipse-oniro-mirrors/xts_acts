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

static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32iDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32iUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32uiUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32fDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR32fUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32iDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32iUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32uiUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32fDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRg32fUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32iDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32iUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32uiUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32fDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateRgba32fUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR64iDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR64iUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR64uiDontunroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindNotemplateR64uiUnroll, "dEQP-VK.robustness.robustness2.bind.notemplate.r64ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32iDontunroll, "dEQP-VK.robustness.robustness2.bind.template.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32iUnroll, "dEQP-VK.robustness.robustness2.bind.template.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.template.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32uiUnroll, "dEQP-VK.robustness.robustness2.bind.template.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32fDontunroll, "dEQP-VK.robustness.robustness2.bind.template.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR32fUnroll, "dEQP-VK.robustness.robustness2.bind.template.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32iDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32iUnroll, "dEQP-VK.robustness.robustness2.bind.template.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32uiUnroll, "dEQP-VK.robustness.robustness2.bind.template.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32fDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRg32fUnroll, "dEQP-VK.robustness.robustness2.bind.template.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32iDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32iUnroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32uiDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32uiUnroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32fDontunroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateRgba32fUnroll, "dEQP-VK.robustness.robustness2.bind.template.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR64iDontunroll, "dEQP-VK.robustness.robustness2.bind.template.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR64iUnroll, "dEQP-VK.robustness.robustness2.bind.template.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR64uiDontunroll, "dEQP-VK.robustness.robustness2.bind.template.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCBindTemplateR64uiUnroll, "dEQP-VK.robustness.robustness2.bind.template.r64ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32iDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32iUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32uiDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32uiUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32fDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR32fUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32iDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32iUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32uiDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32uiUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32fDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRg32fUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32iDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32iUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32uiDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32uiUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32fDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateRgba32fUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR64iDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR64iUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR64uiDontunroll, "dEQP-VK.robustness.robustness2.push.notemplate.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushNotemplateR64uiUnroll, "dEQP-VK.robustness.robustness2.push.notemplate.r64ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32iDontunroll, "dEQP-VK.robustness.robustness2.push.template.r32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32iUnroll, "dEQP-VK.robustness.robustness2.push.template.r32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32uiDontunroll, "dEQP-VK.robustness.robustness2.push.template.r32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32uiUnroll, "dEQP-VK.robustness.robustness2.push.template.r32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32fDontunroll, "dEQP-VK.robustness.robustness2.push.template.r32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR32fUnroll, "dEQP-VK.robustness.robustness2.push.template.r32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32iDontunroll, "dEQP-VK.robustness.robustness2.push.template.rg32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32iUnroll, "dEQP-VK.robustness.robustness2.push.template.rg32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32uiDontunroll, "dEQP-VK.robustness.robustness2.push.template.rg32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32uiUnroll, "dEQP-VK.robustness.robustness2.push.template.rg32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32fDontunroll, "dEQP-VK.robustness.robustness2.push.template.rg32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRg32fUnroll, "dEQP-VK.robustness.robustness2.push.template.rg32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32iDontunroll, "dEQP-VK.robustness.robustness2.push.template.rgba32i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32iUnroll, "dEQP-VK.robustness.robustness2.push.template.rgba32i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32uiDontunroll, "dEQP-VK.robustness.robustness2.push.template.rgba32ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32uiUnroll, "dEQP-VK.robustness.robustness2.push.template.rgba32ui.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32fDontunroll, "dEQP-VK.robustness.robustness2.push.template.rgba32f.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateRgba32fUnroll, "dEQP-VK.robustness.robustness2.push.template.rgba32f.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR64iDontunroll, "dEQP-VK.robustness.robustness2.push.template.r64i.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR64iUnroll, "dEQP-VK.robustness.robustness2.push.template.r64i.unroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR64uiDontunroll, "dEQP-VK.robustness.robustness2.push.template.r64ui.dontunroll*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCPushTemplateR64uiUnroll, "dEQP-VK.robustness.robustness2.push.template.r64ui.unroll*");
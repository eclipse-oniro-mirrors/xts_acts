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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017584,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.multiply");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017585,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.srgb.screen");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017586,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.srgb.overlay");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017587,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.srgb.darken");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017588,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.srgb.lighten");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017589,
        "dEQP-GLES31.functional.blend_eq",
        "uation_advanced.srgb.colordodge");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017590,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.colorburn");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017591,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.hardlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017592,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.softlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017593,
        "dEQP-GLES31.functional.blend_eq",
        "uation_advanced.srgb.difference");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017594,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.exclusion");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017595,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.srgb.hsl_hue");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017596,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.srgb.hsl_saturation");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017597,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.srgb.hsl_color");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017598,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.srgb.hsl_luminosity");

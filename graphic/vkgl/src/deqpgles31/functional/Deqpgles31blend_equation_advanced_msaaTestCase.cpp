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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017599,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.multiply");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017600,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.msaa.screen");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017601,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.msaa.overlay");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017602,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.msaa.darken");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017603,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.msaa.lighten");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017604,
        "dEQP-GLES31.functional.blend_eq",
        "uation_advanced.msaa.colordodge");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017605,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.colorburn");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017606,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.hardlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017607,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.softlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017608,
        "dEQP-GLES31.functional.blend_eq",
        "uation_advanced.msaa.difference");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017609,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.exclusion");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017610,
        "dEQP-GLES31.functional.blend_",
        "equation_advanced.msaa.hsl_hue");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017611,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.msaa.hsl_saturation");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017612,
        "dEQP-GLES31.functional.blend_e",
        "quation_advanced.msaa.hsl_color");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017613,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.msaa.hsl_luminosity");

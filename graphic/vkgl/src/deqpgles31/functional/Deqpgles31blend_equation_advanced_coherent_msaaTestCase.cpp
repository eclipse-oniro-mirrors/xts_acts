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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017644,
        "dEQP-GLES31.functional.blend_equat",
        "ion_advanced.coherent_msaa.multiply");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017645,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.coherent_msaa.screen");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017646,
        "dEQP-GLES31.functional.blend_equat",
        "ion_advanced.coherent_msaa.overlay");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017647,
        "dEQP-GLES31.functional.blend_equa",
        "tion_advanced.coherent_msaa.darken");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017648,
        "dEQP-GLES31.functional.blend_equat",
        "ion_advanced.coherent_msaa.lighten");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017649,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.colordodge");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017650,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.colorburn");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017651,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.hardlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017652,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.softlight");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017653,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.difference");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017654,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.exclusion");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017655,
        "dEQP-GLES31.functional.blend_equat",
        "ion_advanced.coherent_msaa.hsl_hue");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017656,
        "dEQP-GLES31.functional.blend_equation",
        "_advanced.coherent_msaa.hsl_saturation");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017657,
        "dEQP-GLES31.functional.blend_equati",
        "on_advanced.coherent_msaa.hsl_color");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017658,
        "dEQP-GLES31.functional.blend_equation",
        "_advanced.coherent_msaa.hsl_luminosity");

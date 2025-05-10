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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023527,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023528,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023529,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023530,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023531,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023532,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023533,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023534,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023535,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x6_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023536,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023537,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x6_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023538,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023539,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023540,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023541,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x6_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023542,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023543,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x6_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023544,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023545,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023546,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "6x6_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023547,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023548,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023549,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023550,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023551,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023552,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023553,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "6_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023554,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023555,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "6_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023556,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023557,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023558,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023559,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "6_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023560,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023561,
        "dEQP-GLES3.functional.texture.wrap.astc_6x",
        "6_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023562,
        "dEQP-GLES3.functional.texture.wrap.astc_6",
        "x6_srgb.mirror_mirror_linear_not_divisible");

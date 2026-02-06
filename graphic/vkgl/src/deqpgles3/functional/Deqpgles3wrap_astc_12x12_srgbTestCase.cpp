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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023851,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023852,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x12_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023853,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023854,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023855,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023856,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023857,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023858,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023859,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x12_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023860,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023861,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x12_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023862,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023863,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023864,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023865,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x12_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023866,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023867,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x12_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023868,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x12_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023869,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023870,
        "dEQP-GLES3.functional.texture.wrap.astc_1",
        "2x12_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023871,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023872,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023873,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023874,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023875,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023876,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023877,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "12_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023878,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023879,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "12_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023880,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023881,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023882,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023883,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "12_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023884,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023885,
        "dEQP-GLES3.functional.texture.wrap.astc_12x",
        "12_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023886,
        "dEQP-GLES3.functional.texture.wrap.astc_12",
        "x12_srgb.mirror_mirror_linear_not_divisible");

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
#include "../ActsDeqpgles30031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030593,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.add_add");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030594,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.add_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030595,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.add_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030596,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.add_min");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030597,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.add_max");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030598,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030599,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.rgb_equation_alpha_equation.subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030600,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_equation_alpha_equation.subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030601,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030602,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030603,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.reverse_subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030604,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_equation_alpha_equation.reverse_subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030605,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_e",
        "quation_alpha_equation.reverse_subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030606,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.reverse_subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030607,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.reverse_subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030608,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.min_add");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030609,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.min_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030610,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.min_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030611,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.min_min");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030612,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.min_max");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030613,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.max_add");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030614,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.rgb_equation_alpha_equation.max_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030615,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_equation_alpha_equation.max_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030616,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.max_min");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030617,
        "dEQP-GLES3.functional.fragment_ops.blend.f",
        "bo_srgb.rgb_equation_alpha_equation.max_max");

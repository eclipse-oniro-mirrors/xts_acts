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
#include "../ActsDeqpgles30030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029441,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029442,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.add_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029443,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.add_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029444,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029445,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029446,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029447,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_equation_alpha_equation.subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029448,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_equation_alpha_equation.subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029449,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029450,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029451,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029452,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_equation_alpha_equation.reverse_subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029453,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_equation_alpha_equation.reverse_subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029454,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029455,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029456,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029457,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.min_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029458,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.min_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029459,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029460,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029461,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029462,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.max_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029463,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.max_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029464,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029465,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_max");

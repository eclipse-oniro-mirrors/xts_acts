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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031429,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.tex2d_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031430,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031431,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.tex2d_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031432,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031433,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.tex2d_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031434,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031435,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031436,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031437,
        "dEQP-GLES3.functional.fbo.render.share",
        "d_colorbuffer_clear.tex2d_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031438,
        "dEQP-GLES3.functional.fbo.render.shar",
        "ed_colorbuffer_clear.rbo_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031439,
        "dEQP-GLES3.functional.fbo.render.sha",
        "red_colorbuffer_clear.tex2d_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031440,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.rbo_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031441,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031442,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031443,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.tex2d_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031444,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031445,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031446,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031447,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer_clear.tex2d_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031448,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031449,
        "dEQP-GLES3.functional.fbo.render.shared",
        "_colorbuffer_clear.tex2d_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031450,
        "dEQP-GLES3.functional.fbo.render.share",
        "d_colorbuffer_clear.rbo_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031451,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031452,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031453,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031454,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031455,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.tex2d_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031456,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer_clear.rbo_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031457,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031458,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031459,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031460,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031461,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer_clear.tex2d_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031462,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer_clear.rbo_r8");

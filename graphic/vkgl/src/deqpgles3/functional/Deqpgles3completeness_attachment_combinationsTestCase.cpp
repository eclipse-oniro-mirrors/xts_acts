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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031322,
        "dEQP-GLES3.functional.fbo.completeness.at",
        "tachment_combinations.none_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031323,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031324,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031325,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031326,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031327,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031328,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031329,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031330,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031331,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031332,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031333,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031334,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031335,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031336,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031337,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031338,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031339,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031340,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031341,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031342,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031343,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031344,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031345,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031346,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031347,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031348,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.none_tex_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031349,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031350,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031351,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031352,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031353,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031354,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031355,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031356,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031357,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031358,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031359,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031360,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031361,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031362,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031363,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031364,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031365,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031366,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031367,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031368,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031369,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031370,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031371,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031372,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031373,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031374,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031375,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031376,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031377,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031378,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031379,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031380,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031381,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031382,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031383,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031384,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031385,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031386,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031387,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031388,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031389,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031390,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031391,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031392,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031393,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031394,
        "dEQP-GLES3.functional.fbo.completeness.a",
        "ttachment_combinations.tex_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031395,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031396,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031397,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031398,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031399,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031400,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031401,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031402,
        "dEQP-GLES3.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_tex");

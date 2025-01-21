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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012935,
        "dEQP-GLES2.functional.fbo.completeness.at",
        "tachment_combinations.none_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012936,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012937,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012938,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012939,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012940,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012941,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012942,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012943,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012944,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012945,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012946,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012947,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012948,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012949,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012950,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012951,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012952,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012953,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012954,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012955,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012956,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012957,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012958,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012959,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.none_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012960,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012961,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.none_tex_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012962,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012963,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012964,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012965,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012966,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012967,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012968,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012969,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012970,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012971,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012972,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012973,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012974,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012975,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012976,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012977,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012978,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012979,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012980,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.rbo_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012981,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012982,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012983,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012984,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012985,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012986,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012987,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012988,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.rbo_tex_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012989,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012990,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012991,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012992,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012993,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_none_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012994,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_none_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012995,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_none_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012996,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_none_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012997,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_none_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012998,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_rbo_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012999,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013000,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013001,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013002,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013003,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013004,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013005,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013006,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_rbo_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013007,
        "dEQP-GLES2.functional.fbo.completeness.a",
        "ttachment_combinations.tex_tex_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013008,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_none_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013009,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_none_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013010,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013011,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013012,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_rbo_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013013,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013014,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013015,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.tex_tex_tex_tex");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_013016,
        "dEQP-GLES2.functional.fbo.completeness.",
        "attachment_combinations.exists_supported");

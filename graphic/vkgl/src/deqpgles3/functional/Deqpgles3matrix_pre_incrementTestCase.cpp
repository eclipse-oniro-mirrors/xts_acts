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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016014,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_increment.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016015,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016016,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016017,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016018,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016019,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016020,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016021,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016022,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016023,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016024,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016025,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016026,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016027,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016028,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016029,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016030,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016031,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016032,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016033,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016034,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016035,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016036,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016037,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016038,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_increment.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016039,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016040,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016041,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016042,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016043,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016044,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016045,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016046,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016047,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016048,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016049,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016050,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016051,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016052,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016053,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016054,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016055,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016056,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016057,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016058,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016059,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_increment.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016060,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016061,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016062,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_increment.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016063,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016064,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016065,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_increment.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016066,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_increment.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016067,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_increment.highp_mat4_float_fragment");

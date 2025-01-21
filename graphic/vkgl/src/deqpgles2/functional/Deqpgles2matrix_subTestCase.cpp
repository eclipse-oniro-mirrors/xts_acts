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
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006989,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006990,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006991,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006992,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006993,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006994,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.const_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006995,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006996,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006997,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006998,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006999,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007000,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007001,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007002,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007003,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007004,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007005,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007006,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.const_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007007,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007008,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007009,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007010,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007011,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007012,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007013,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007014,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007015,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007016,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007017,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007018,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.const_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007019,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007020,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007021,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007022,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.const_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007023,
        "dEQP-GLES2.functional.shaders.matr",
        "ix.sub.const_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007024,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.const_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007025,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007026,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007027,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007028,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007029,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007030,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.uniform_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007031,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007032,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007033,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007034,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007035,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007036,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007037,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007038,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007039,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007040,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007041,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007042,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.uniform_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007043,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007044,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007045,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007046,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007047,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007048,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007049,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007050,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007051,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007052,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007053,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007054,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.uniform_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007055,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007056,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007057,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007058,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.uniform_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007059,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.uniform_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007060,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.uniform_highp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007061,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007062,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007063,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007064,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007065,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007066,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.dynamic_mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007067,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007068,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007069,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007070,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007071,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007072,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007073,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007074,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007075,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007076,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007077,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007078,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.dynamic_mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007079,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007080,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007081,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007082,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007083,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007084,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007085,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007086,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007087,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007088,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007089,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007090,
        "dEQP-GLES2.functional.shaders.matrix.s",
        "ub.dynamic_mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007091,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007092,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007093,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007094,
        "dEQP-GLES2.functional.shaders.matrix.",
        "sub.dynamic_highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007095,
        "dEQP-GLES2.functional.shaders.matri",
        "x.sub.dynamic_highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_007096,
        "dEQP-GLES2.functional.shaders.matrix",
        ".sub.dynamic_highp_mat4_mat4_fragment");

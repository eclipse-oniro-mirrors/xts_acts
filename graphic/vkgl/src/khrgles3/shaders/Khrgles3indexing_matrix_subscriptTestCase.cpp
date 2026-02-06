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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000218,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000219,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000220,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000221,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000222,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000223,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000224,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000225,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000226,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000227,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000228,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000229,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000230,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000231,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000232,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000233,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000234,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000235,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at2x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000236,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000237,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000238,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000239,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000240,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000241,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at2x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000242,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000243,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000244,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000245,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000246,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000247,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at2x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000248,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat2x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000249,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat2x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000250,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat2x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000251,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000252,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat2x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000253,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at2x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000254,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000255,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000256,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000257,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000258,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000259,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at3x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000260,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000261,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000262,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000263,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000264,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000265,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at3x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000266,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000267,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000268,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000269,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000270,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000271,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000272,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000273,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000274,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000275,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000276,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000277,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000278,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000279,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000280,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000281,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000282,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000283,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at3x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000284,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat3x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000285,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat3x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000286,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat3x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000287,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000288,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat3x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000289,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at3x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000290,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000291,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000292,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000293,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000294,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000295,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at4x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000296,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000297,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000298,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000299,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000300,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000301,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at4x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000302,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000303,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000304,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000305,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000306,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000307,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at4x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000308,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000309,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000310,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000311,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000312,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000313,
        "KHR-GLES3.shaders.indexing.matrix_subscript.m",
        "at4x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000314,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000315,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000316,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000317,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000318,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000319,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000320,
        "KHR-GLES3.shaders.indexing.matrix_subscr",
        "ipt.mat4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000321,
        "KHR-GLES3.shaders.indexing.matrix_subscri",
        "pt.mat4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000322,
        "KHR-GLES3.shaders.indexing.matrix_subscrip",
        "t.mat4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000323,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000324,
        "KHR-GLES3.shaders.indexing.matrix_subscript",
        ".mat4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000325,
        "KHR-GLES3.shaders.indexing.matrix_subscript.",
        "mat4_dynamic_loop_write_static_read_fragment");

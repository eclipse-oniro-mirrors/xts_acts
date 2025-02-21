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
#include "../ActsDeqpgles20004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003211,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003212,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003213,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003214,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003215,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003216,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003217,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003218,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003219,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003220,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003221,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003222,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003223,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003224,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003225,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003226,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003227,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003228,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003229,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003230,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003231,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003232,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003233,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003234,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003235,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003236,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003237,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003238,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003239,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003240,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003241,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003242,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri",
        "pt.mat2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003243,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003244,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003245,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003246,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003247,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003248,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003249,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003250,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003251,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003252,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003253,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003254,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003255,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003256,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003257,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003258,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003259,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003260,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003261,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003262,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003263,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003264,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003265,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003266,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003267,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003268,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003269,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003270,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003271,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003272,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003273,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003274,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri",
        "pt.mat3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003275,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003276,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003277,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003278,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003279,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003280,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003281,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003282,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003283,
        "dEQP-GLES2.functional.shaders.indexing.matrix_",
        "subscript.mat4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003284,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003285,
        "dEQP-GLES2.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003286,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003287,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003288,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003289,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003290,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003291,
        "dEQP-GLES2.functional.shaders.indexing.matrix_su",
        "bscript.mat4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003292,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003293,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003294,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003295,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003296,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003297,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003298,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003299,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003300,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003301,
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003302,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003303,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003304,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003305,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003306,
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri",
        "pt.mat4_dynamic_loop_write_dynamic_loop_read_fragment");

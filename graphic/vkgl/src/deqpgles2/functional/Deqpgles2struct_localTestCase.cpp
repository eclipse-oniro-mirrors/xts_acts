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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007682,
        "dEQP-GLES2.functional.shade",
        "rs.struct.local.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007683,
        "dEQP-GLES2.functional.shader",
        "s.struct.local.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007684,
        "dEQP-GLES2.functional.shader",
        "s.struct.local.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007685,
        "dEQP-GLES2.functional.shaders",
        ".struct.local.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007686,
        "dEQP-GLES2.functional.shaders.s",
        "truct.local.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007687,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007688,
        "dEQP-GLES2.functional.shaders.struct.l",
        "ocal.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007689,
        "dEQP-GLES2.functional.shaders.struct.lo",
        "cal.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007690,
        "dEQP-GLES2.functional.shaders.s",
        "truct.local.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007691,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007692,
        "dEQP-GLES2.functional.shaders.struct.l",
        "ocal.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007693,
        "dEQP-GLES2.functional.shaders.struct.lo",
        "cal.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007694,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007695,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007696,
        "dEQP-GLES2.functional.shaders.struct.loca",
        "l.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007697,
        "dEQP-GLES2.functional.shaders.struct.local",
        ".nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007698,
        "dEQP-GLES2.functional.shaders",
        ".struct.local.parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007699,
        "dEQP-GLES2.functional.shaders.",
        "struct.local.parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007700,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.parameter_inout_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007701,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.parameter_inout_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007702,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.parameter_inout_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007703,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.parameter_inout_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007704,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.parameter_inout_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007705,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.parameter_inout_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007706,
        "dEQP-GLES2.functional.shaders.str",
        "uct.local.parameter_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007707,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.parameter_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007708,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.parameter_out_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007709,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.parameter_out_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007710,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.parameter_out_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007711,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.parameter_out_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007712,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.parameter_out_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007713,
        "dEQP-GLES2.functional.shaders.struc",
        "t.local.parameter_out_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007714,
        "dEQP-GLES2.functional.shader",
        "s.struct.local.return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007715,
        "dEQP-GLES2.functional.shaders",
        ".struct.local.return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007716,
        "dEQP-GLES2.functional.shaders.s",
        "truct.local.return_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007717,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.return_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007718,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007719,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007720,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007721,
        "dEQP-GLES2.functional.shaders.str",
        "uct.local.loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007722,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007723,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007724,
        "dEQP-GLES2.functional.shaders.struct.lo",
        "cal.nested_conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007725,
        "dEQP-GLES2.functional.shaders.struct.loc",
        "al.nested_conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007726,
        "dEQP-GLES2.functional.shaders.struct",
        ".local.nested_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007727,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.nested_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007728,
        "dEQP-GLES2.functional.shaders.struct.loc",
        "al.nested_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007729,
        "dEQP-GLES2.functional.shaders.struct.loca",
        "l.nested_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007730,
        "dEQP-GLES2.functional.shaders.str",
        "uct.local.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007731,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007732,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007733,
        "dEQP-GLES2.functional.shaders.struct.l",
        "ocal.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007734,
        "dEQP-GLES2.functional.shaders.struct.",
        "local.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007735,
        "dEQP-GLES2.functional.shaders.struct.l",
        "ocal.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007736,
        "dEQP-GLES2.functional.shaders.struct.loca",
        "l.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007737,
        "dEQP-GLES2.functional.shaders.struct.local",
        ".dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007738,
        "dEQP-GLES2.functional.shaders.",
        "struct.local.basic_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007739,
        "dEQP-GLES2.functional.shaders.s",
        "truct.local.basic_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007740,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.basic_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007741,
        "dEQP-GLES2.functional.shaders.str",
        "uct.local.basic_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007742,
        "dEQP-GLES2.functional.shaders.s",
        "truct.local.nested_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007743,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.local.nested_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007744,
        "dEQP-GLES2.functional.shaders.str",
        "uct.local.nested_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007745,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.local.nested_not_equal_fragment");

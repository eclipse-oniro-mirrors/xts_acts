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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016448,
        "dEQP-GLES3.functional.shade",
        "rs.struct.local.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016449,
        "dEQP-GLES3.functional.shader",
        "s.struct.local.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016450,
        "dEQP-GLES3.functional.shader",
        "s.struct.local.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016451,
        "dEQP-GLES3.functional.shaders",
        ".struct.local.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016452,
        "dEQP-GLES3.functional.shaders.s",
        "truct.local.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016453,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016454,
        "dEQP-GLES3.functional.shaders.struct.l",
        "ocal.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016455,
        "dEQP-GLES3.functional.shaders.struct.lo",
        "cal.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016456,
        "dEQP-GLES3.functional.shaders.s",
        "truct.local.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016457,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016458,
        "dEQP-GLES3.functional.shaders.struct.l",
        "ocal.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016459,
        "dEQP-GLES3.functional.shaders.struct.lo",
        "cal.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016460,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016461,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016462,
        "dEQP-GLES3.functional.shaders.struct.loca",
        "l.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016463,
        "dEQP-GLES3.functional.shaders.struct.local",
        ".nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016464,
        "dEQP-GLES3.functional.shaders",
        ".struct.local.parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016465,
        "dEQP-GLES3.functional.shaders.",
        "struct.local.parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016466,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.parameter_inout_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016467,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.parameter_inout_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016468,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.parameter_inout_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016469,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.parameter_inout_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016470,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.parameter_inout_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016471,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.parameter_inout_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016472,
        "dEQP-GLES3.functional.shaders.str",
        "uct.local.parameter_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016473,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.parameter_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016474,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.parameter_out_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016475,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.parameter_out_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016476,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.parameter_out_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016477,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.parameter_out_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016478,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.parameter_out_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016479,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.parameter_out_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016480,
        "dEQP-GLES3.functional.shader",
        "s.struct.local.return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016481,
        "dEQP-GLES3.functional.shaders",
        ".struct.local.return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016482,
        "dEQP-GLES3.functional.shaders.s",
        "truct.local.return_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016483,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.return_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016484,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016485,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016486,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016487,
        "dEQP-GLES3.functional.shaders.str",
        "uct.local.loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016488,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016489,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016490,
        "dEQP-GLES3.functional.shaders.struct.lo",
        "cal.nested_conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016491,
        "dEQP-GLES3.functional.shaders.struct.loc",
        "al.nested_conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016492,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.nested_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016493,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.nested_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016494,
        "dEQP-GLES3.functional.shaders.struct.loc",
        "al.nested_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016495,
        "dEQP-GLES3.functional.shaders.struct.loca",
        "l.nested_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016496,
        "dEQP-GLES3.functional.shaders.str",
        "uct.local.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016497,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016498,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016499,
        "dEQP-GLES3.functional.shaders.struct.l",
        "ocal.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016500,
        "dEQP-GLES3.functional.shaders.struct.",
        "local.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016501,
        "dEQP-GLES3.functional.shaders.struct.l",
        "ocal.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016502,
        "dEQP-GLES3.functional.shaders.struct.loca",
        "l.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016503,
        "dEQP-GLES3.functional.shaders.struct.local",
        ".dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016504,
        "dEQP-GLES3.functional.shaders.",
        "struct.local.basic_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016505,
        "dEQP-GLES3.functional.shaders.s",
        "truct.local.basic_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016506,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.basic_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016507,
        "dEQP-GLES3.functional.shaders.str",
        "uct.local.basic_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016508,
        "dEQP-GLES3.functional.shaders.s",
        "truct.local.nested_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016509,
        "dEQP-GLES3.functional.shaders.st",
        "ruct.local.nested_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016510,
        "dEQP-GLES3.functional.shaders.str",
        "uct.local.nested_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016511,
        "dEQP-GLES3.functional.shaders.stru",
        "ct.local.nested_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016512,
        "dEQP-GLES3.functional.shaders.struc",
        "t.local.array_member_equality_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016513,
        "dEQP-GLES3.functional.shaders.struct",
        ".local.array_member_equality_fragment");

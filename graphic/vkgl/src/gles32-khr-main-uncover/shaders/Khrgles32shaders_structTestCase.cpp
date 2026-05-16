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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000006,
        "KHR-GLES32.shaders.str",
        "uct.local.basic_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000007,
        "KHR-GLES32.shaders.stru",
        "ct.local.basic_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000008,
        "KHR-GLES32.shaders.str",
        "uct.local.nested_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000009,
        "KHR-GLES32.shaders.stru",
        "ct.local.nested_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000010,
        "KHR-GLES32.shaders.struct",
        ".local.array_member_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000011,
        "KHR-GLES32.shaders.struct.",
        "local.array_member_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000012,
        "KHR-GLES32.shaders.struct.local.",
        "array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000013,
        "KHR-GLES32.shaders.struct.local.a",
        "rray_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000014,
        "KHR-GLES32.shaders.struct",
        ".local.struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000015,
        "KHR-GLES32.shaders.struct.",
        "local.struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000016,
        "KHR-GLES32.shaders.struct.local.",
        "struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000017,
        "KHR-GLES32.shaders.struct.local.s",
        "truct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000018,
        "KHR-GLES32.shaders.struct.loc",
        "al.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000019,
        "KHR-GLES32.shaders.struct.loca",
        "l.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000020,
        "KHR-GLES32.shaders.struct.local.nest",
        "ed_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000021,
        "KHR-GLES32.shaders.struct.local.neste",
        "d_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000022,
        "KHR-GLES32.shaders.struc",
        "t.local.parameter_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000023,
        "KHR-GLES32.shaders.struct",
        ".local.parameter_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000024,
        "KHR-GLES32.shaders.struct.l",
        "ocal.parameter_nested_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000025,
        "KHR-GLES32.shaders.struct.lo",
        "cal.parameter_nested_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000026,
        "KHR-GLES32.shaders.str",
        "uct.local.return_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000027,
        "KHR-GLES32.shaders.stru",
        "ct.local.return_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000028,
        "KHR-GLES32.shaders.struct.",
        "local.return_nested_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000029,
        "KHR-GLES32.shaders.struct.l",
        "ocal.return_nested_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000030,
        "KHR-GLES32.shaders.struct.loca",
        "l.conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000031,
        "KHR-GLES32.shaders.struct.local",
        ".conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000032,
        "KHR-GLES32.shaders.struct.l",
        "ocal.loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000033,
        "KHR-GLES32.shaders.struct.lo",
        "cal.loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000034,
        "KHR-GLES32.shaders.struct.local",
        ".dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000035,
        "KHR-GLES32.shaders.struct.local.",
        "dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000036,
        "KHR-GLES32.shaders.struct.local.ne",
        "sted_conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000037,
        "KHR-GLES32.shaders.struct.local.nes",
        "ted_conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000038,
        "KHR-GLES32.shaders.struct.loca",
        "l.nested_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000039,
        "KHR-GLES32.shaders.struct.local",
        ".nested_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000040,
        "KHR-GLES32.shaders.struct.local.ne",
        "sted_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000041,
        "KHR-GLES32.shaders.struct.local.nes",
        "ted_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000042,
        "KHR-GLES32.shaders.struct.lo",
        "cal.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000043,
        "KHR-GLES32.shaders.struct.loc",
        "al.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000044,
        "KHR-GLES32.shaders.struct.local",
        ".loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000045,
        "KHR-GLES32.shaders.struct.local.",
        "loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000046,
        "KHR-GLES32.shaders.struct.local.",
        "dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000047,
        "KHR-GLES32.shaders.struct.local.d",
        "ynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000048,
        "KHR-GLES32.shaders.struct.local.dyn",
        "amic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000049,
        "KHR-GLES32.shaders.struct.local.dyna",
        "mic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000050,
        "KHR-GLES32.shaders.struct",
        ".local.basic_equal_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000051,
        "KHR-GLES32.shaders.struct.",
        "local.basic_equal_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000052,
        "KHR-GLES32.shaders.struct.l",
        "ocal.basic_not_equal_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000053,
        "KHR-GLES32.shaders.struct.lo",
        "cal.basic_not_equal_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000054,
        "KHR-GLES32.shaders.struct",
        ".local.nested_equal_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000055,
        "KHR-GLES32.shaders.struct.",
        "local.nested_equal_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000056,
        "KHR-GLES32.shaders.struct.l",
        "ocal.nested_not_equal_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000057,
        "KHR-GLES32.shaders.struct.lo",
        "cal.nested_not_equal_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000058,
        "KHR-GLES32.shaders.struct.loca",
        "l.array_member_equality_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000059,
        "KHR-GLES32.shaders.struct.local",
        ".array_member_equality_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000060,
        "KHR-GLES32.shaders.stru",
        "ct.uniform.basic_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000061,
        "KHR-GLES32.shaders.struc",
        "t.uniform.basic_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000062,
        "KHR-GLES32.shaders.stru",
        "ct.uniform.nested_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000063,
        "KHR-GLES32.shaders.struc",
        "t.uniform.nested_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000064,
        "KHR-GLES32.shaders.struct.",
        "uniform.array_member_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000065,
        "KHR-GLES32.shaders.struct.u",
        "niform.array_member_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000066,
        "KHR-GLES32.shaders.struct.uniform",
        ".array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000067,
        "KHR-GLES32.shaders.struct.uniform.",
        "array_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000068,
        "KHR-GLES32.shaders.struct.",
        "uniform.struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000069,
        "KHR-GLES32.shaders.struct.u",
        "niform.struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000070,
        "KHR-GLES32.shaders.struct.uniform",
        ".struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000071,
        "KHR-GLES32.shaders.struct.uniform.",
        "struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000072,
        "KHR-GLES32.shaders.struct.unif",
        "orm.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000073,
        "KHR-GLES32.shaders.struct.unifo",
        "rm.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000074,
        "KHR-GLES32.shaders.struct.uniform.nes",
        "ted_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000075,
        "KHR-GLES32.shaders.struct.uniform.nest",
        "ed_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000076,
        "KHR-GLES32.shaders.struct.uni",
        "form.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000077,
        "KHR-GLES32.shaders.struct.unif",
        "orm.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000078,
        "KHR-GLES32.shaders.struct.unifor",
        "m.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000079,
        "KHR-GLES32.shaders.struct.uniform",
        ".loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000080,
        "KHR-GLES32.shaders.struct.uniform",
        ".dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000081,
        "KHR-GLES32.shaders.struct.uniform.",
        "dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000082,
        "KHR-GLES32.shaders.struct.uniform.dy",
        "namic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000083,
        "KHR-GLES32.shaders.struct.uniform.dyn",
        "amic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000084,
        "KHR-GLES32.shaders.struc",
        "t.uniform.sampler_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000085,
        "KHR-GLES32.shaders.struct",
        ".uniform.sampler_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000086,
        "KHR-GLES32.shaders.struct.u",
        "niform.sampler_nested_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000087,
        "KHR-GLES32.shaders.struct.un",
        "iform.sampler_nested_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000088,
        "KHR-GLES32.shaders.struct.u",
        "niform.sampler_array_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000089,
        "KHR-GLES32.shaders.struct.un",
        "iform.sampler_array_fragment");

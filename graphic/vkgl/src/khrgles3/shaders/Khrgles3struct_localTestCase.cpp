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
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001402,
        "KHR-GLES3.shaders.str",
        "uct.local.basic_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001403,
        "KHR-GLES3.shaders.stru",
        "ct.local.basic_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001404,
        "KHR-GLES3.shaders.stru",
        "ct.local.nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001405,
        "KHR-GLES3.shaders.struc",
        "t.local.nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001406,
        "KHR-GLES3.shaders.struct.",
        "local.array_member_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001407,
        "KHR-GLES3.shaders.struct.l",
        "ocal.array_member_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001408,
        "KHR-GLES3.shaders.struct.local.a",
        "rray_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001409,
        "KHR-GLES3.shaders.struct.local.ar",
        "ray_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001410,
        "KHR-GLES3.shaders.struct.",
        "local.struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001411,
        "KHR-GLES3.shaders.struct.l",
        "ocal.struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001412,
        "KHR-GLES3.shaders.struct.local.s",
        "truct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001413,
        "KHR-GLES3.shaders.struct.local.st",
        "ruct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001414,
        "KHR-GLES3.shaders.struct.loc",
        "al.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001415,
        "KHR-GLES3.shaders.struct.loca",
        "l.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001416,
        "KHR-GLES3.shaders.struct.local.nest",
        "ed_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001417,
        "KHR-GLES3.shaders.struct.local.neste",
        "d_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001418,
        "KHR-GLES3.shaders.struc",
        "t.local.parameter_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001419,
        "KHR-GLES3.shaders.struct",
        ".local.parameter_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001420,
        "KHR-GLES3.shaders.struct.lo",
        "cal.parameter_nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001421,
        "KHR-GLES3.shaders.struct.loc",
        "al.parameter_nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001422,
        "KHR-GLES3.shaders.stru",
        "ct.local.return_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001423,
        "KHR-GLES3.shaders.struc",
        "t.local.return_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001424,
        "KHR-GLES3.shaders.struct.",
        "local.return_nested_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001425,
        "KHR-GLES3.shaders.struct.l",
        "ocal.return_nested_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001426,
        "KHR-GLES3.shaders.struct.local",
        ".conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001427,
        "KHR-GLES3.shaders.struct.local.",
        "conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001428,
        "KHR-GLES3.shaders.struct.l",
        "ocal.loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001429,
        "KHR-GLES3.shaders.struct.lo",
        "cal.loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001430,
        "KHR-GLES3.shaders.struct.local",
        ".dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001431,
        "KHR-GLES3.shaders.struct.local.",
        "dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001432,
        "KHR-GLES3.shaders.struct.local.ne",
        "sted_conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001433,
        "KHR-GLES3.shaders.struct.local.nes",
        "ted_conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001434,
        "KHR-GLES3.shaders.struct.local",
        ".nested_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001435,
        "KHR-GLES3.shaders.struct.local.",
        "nested_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001436,
        "KHR-GLES3.shaders.struct.local.nes",
        "ted_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001437,
        "KHR-GLES3.shaders.struct.local.nest",
        "ed_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001438,
        "KHR-GLES3.shaders.struct.lo",
        "cal.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001439,
        "KHR-GLES3.shaders.struct.loc",
        "al.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001440,
        "KHR-GLES3.shaders.struct.local.",
        "loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001441,
        "KHR-GLES3.shaders.struct.local.l",
        "oop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001442,
        "KHR-GLES3.shaders.struct.local.",
        "dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001443,
        "KHR-GLES3.shaders.struct.local.d",
        "ynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001444,
        "KHR-GLES3.shaders.struct.local.dyna",
        "mic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001445,
        "KHR-GLES3.shaders.struct.local.dynam",
        "ic_loop_nested_struct_array_fragment");

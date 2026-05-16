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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002995,
        "dEQP-GLES2.functional.shaders.indexing.vector_",
        "subscript.vec2_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002996,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec2_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002997,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec2_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002998,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec2_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002999,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec2_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003000,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003001,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec2_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003002,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003003,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003004,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003005,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003006,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003007,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec2_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003008,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec2_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003009,
        "dEQP-GLES2.functional.shaders.indexing.vector_sub",
        "script.vec2_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003010,
        "dEQP-GLES2.functional.shaders.indexing.vector_subs",
        "cript.vec2_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003011,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003012,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003013,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003014,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003015,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003016,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003017,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003018,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003019,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec2_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003020,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003021,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003022,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003023,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003024,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003025,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003026,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003027,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c2_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003028,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003029,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003030,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003031,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec2_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003032,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003033,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003034,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003035,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003036,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec2_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003037,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec2_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003038,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c2_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003039,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003040,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003041,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003042,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003043,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec2_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003044,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003045,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003046,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003047,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c2_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003048,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003049,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003050,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003051,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003052,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003053,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003054,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003055,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec2_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003056,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003057,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec2_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003058,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec2_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003059,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003060,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003061,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003062,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003063,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003064,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003065,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003066,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec2_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003067,
        "dEQP-GLES2.functional.shaders.indexing.vector_",
        "subscript.vec3_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003068,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec3_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003069,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec3_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003070,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec3_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003071,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec3_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003072,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003073,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec3_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003074,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003075,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003076,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003077,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003078,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003079,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec3_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003080,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec3_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003081,
        "dEQP-GLES2.functional.shaders.indexing.vector_sub",
        "script.vec3_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003082,
        "dEQP-GLES2.functional.shaders.indexing.vector_subs",
        "cript.vec3_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003083,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003084,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003085,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003086,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003087,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003088,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003089,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003090,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003091,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec3_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003092,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003093,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003094,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003095,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003096,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003097,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003098,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003099,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c3_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003100,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003101,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003102,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003103,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec3_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003104,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003105,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003106,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003107,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003108,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec3_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003109,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec3_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003110,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c3_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003111,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003112,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003113,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003114,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003115,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec3_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003116,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003117,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003118,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003119,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c3_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003120,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003121,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003122,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003123,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003124,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003125,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003126,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003127,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec3_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003128,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003129,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec3_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003130,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec3_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003131,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003132,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003133,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003134,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003135,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003136,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003137,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003138,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec3_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003139,
        "dEQP-GLES2.functional.shaders.indexing.vector_",
        "subscript.vec4_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003140,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec4_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003141,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec4_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003142,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec4_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003143,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec4_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003144,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003145,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec4_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003146,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003147,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003148,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003149,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003150,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003151,
        "dEQP-GLES2.functional.shaders.indexing.vector_s",
        "ubscript.vec4_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003152,
        "dEQP-GLES2.functional.shaders.indexing.vector_su",
        "bscript.vec4_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003153,
        "dEQP-GLES2.functional.shaders.indexing.vector_sub",
        "script.vec4_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003154,
        "dEQP-GLES2.functional.shaders.indexing.vector_subs",
        "cript.vec4_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003155,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003156,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003157,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003158,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003159,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003160,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003161,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003162,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003163,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec4_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003164,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003165,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003166,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003167,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003168,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003169,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003170,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003171,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c4_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003172,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003173,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003174,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003175,
        "dEQP-GLES2.functional.shaders.indexing.vector_subsc",
        "ript.vec4_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003176,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003177,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003178,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003179,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003180,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec4_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003181,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.v",
        "ec4_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003182,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c4_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003183,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003184,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003185,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003186,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003187,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscri",
        "pt.vec4_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003188,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003189,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003190,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003191,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.ve",
        "c4_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003192,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003193,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003194,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003195,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003196,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003197,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003198,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003199,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscrip",
        "t.vec4_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003200,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003201,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript",
        ".vec4_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003202,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.",
        "vec4_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003203,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003204,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003205,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003206,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003207,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003208,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003209,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_003210,
        "dEQP-GLES2.functional.shaders.indexing.vector_subscript.vec4_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

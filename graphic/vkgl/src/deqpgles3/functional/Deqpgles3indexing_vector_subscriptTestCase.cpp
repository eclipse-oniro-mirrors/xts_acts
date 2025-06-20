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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006175,
        "dEQP-GLES3.functional.shaders.indexing.vector_",
        "subscript.vec2_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006176,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec2_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006177,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec2_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006178,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec2_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006179,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec2_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006180,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006181,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec2_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006182,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006183,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006184,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006185,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006186,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006187,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec2_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006188,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec2_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006189,
        "dEQP-GLES3.functional.shaders.indexing.vector_sub",
        "script.vec2_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006190,
        "dEQP-GLES3.functional.shaders.indexing.vector_subs",
        "cript.vec2_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006191,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006192,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006193,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006194,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006195,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006196,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006197,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006198,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006199,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec2_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006200,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006201,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006202,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006203,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006204,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006205,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006206,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006207,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c2_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006208,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006209,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006210,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006211,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec2_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006212,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec2_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006213,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006214,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006215,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006216,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec2_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006217,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec2_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006218,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c2_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006219,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006220,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006221,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006222,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006223,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec2_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006224,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006225,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006226,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006227,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c2_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006228,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006229,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006230,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006231,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006232,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006233,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006234,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006235,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec2_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006236,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006237,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec2_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006238,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec2_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006239,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006240,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006241,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "2_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006242,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006243,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006244,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006245,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006246,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec2_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006247,
        "dEQP-GLES3.functional.shaders.indexing.vector_",
        "subscript.vec3_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006248,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec3_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006249,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec3_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006250,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec3_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006251,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec3_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006252,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006253,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec3_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006254,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006255,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006256,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006257,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006258,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006259,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec3_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006260,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec3_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006261,
        "dEQP-GLES3.functional.shaders.indexing.vector_sub",
        "script.vec3_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006262,
        "dEQP-GLES3.functional.shaders.indexing.vector_subs",
        "cript.vec3_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006263,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006264,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006265,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006266,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006267,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006268,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006269,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006270,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006271,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec3_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006272,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006273,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006274,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006275,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006276,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006277,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006278,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006279,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c3_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006280,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006281,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006282,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006283,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec3_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006284,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec3_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006285,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006286,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006287,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006288,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec3_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006289,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec3_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006290,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c3_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006291,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006292,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006293,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006294,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006295,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec3_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006296,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006297,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006298,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006299,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c3_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006300,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006301,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006302,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006303,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006304,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006305,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006306,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006307,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec3_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006308,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006309,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec3_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006310,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec3_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006311,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006312,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006313,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "3_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006314,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006315,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006316,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006317,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006318,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec3_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006319,
        "dEQP-GLES3.functional.shaders.indexing.vector_",
        "subscript.vec4_direct_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006320,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec4_direct_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006321,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec4_direct_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006322,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec4_direct_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006323,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec4_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006324,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006325,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec4_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006326,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006327,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006328,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006329,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006330,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006331,
        "dEQP-GLES3.functional.shaders.indexing.vector_s",
        "ubscript.vec4_component_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006332,
        "dEQP-GLES3.functional.shaders.indexing.vector_su",
        "bscript.vec4_component_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006333,
        "dEQP-GLES3.functional.shaders.indexing.vector_sub",
        "script.vec4_component_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006334,
        "dEQP-GLES3.functional.shaders.indexing.vector_subs",
        "cript.vec4_component_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006335,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_component_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006336,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_component_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006337,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_component_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006338,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_component_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006339,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_component_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006340,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_component_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006341,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_component_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006342,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_component_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006343,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec4_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006344,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006345,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_static_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006346,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_static_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006347,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_static_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006348,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006349,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_static_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006350,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006351,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c4_static_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006352,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_static_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006353,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_static_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006354,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_static_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006355,
        "dEQP-GLES3.functional.shaders.indexing.vector_subsc",
        "ript.vec4_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006356,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscr",
        "ipt.vec4_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006357,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_dynamic_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006358,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_dynamic_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006359,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_dynamic_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006360,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec4_dynamic_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006361,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.v",
        "ec4_dynamic_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006362,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c4_dynamic_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006363,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006364,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006365,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006366,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006367,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscri",
        "pt.vec4_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006368,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006369,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_static_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006370,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_static_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006371,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.ve",
        "c4_static_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006372,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_static_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006373,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_static_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006374,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_static_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006375,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_",
        "static_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006376,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_s",
        "tatic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006377,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_",
        "static_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006378,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_s",
        "tatic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006379,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscrip",
        "t.vec4_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006380,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006381,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript",
        ".vec4_dynamic_loop_subscript_write_component_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006382,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.",
        "vec4_dynamic_loop_subscript_write_component_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006383,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_loop_subscript_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006384,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006385,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec",
        "4_dynamic_loop_subscript_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006386,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006387,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_",
        "dynamic_loop_subscript_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006388,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_d",
        "ynamic_loop_subscript_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006389,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_d",
        "ynamic_loop_subscript_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006390,
        "dEQP-GLES3.functional.shaders.indexing.vector_subscript.vec4_dy",
        "namic_loop_subscript_write_dynamic_loop_subscript_read_fragment");

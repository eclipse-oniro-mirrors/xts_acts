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
#include "../ActsDeqpgles30031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030816,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.scissor.contained_quads");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030817,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.partial_quads");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030818,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.contained_tri");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030819,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.enclosing_tri");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030820,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.scissor.partial_tri");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030821,
        "dEQP-GLES3.functional.fragment",
        "_ops.scissor.outside_render_tri");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030822,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.partial_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030823,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.contained_line");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030824,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.scissor.partial_line");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030825,
        "dEQP-GLES3.functional.fragment_",
        "ops.scissor.outside_render_line");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030826,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.scissor.contained_point");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030827,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.partial_points");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030828,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.outside_point");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030829,
        "dEQP-GLES3.functional.fragment_",
        "ops.scissor.outside_render_point");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030830,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.scissor.clear_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030831,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.scissor.clear_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030832,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.scissor.clear_color");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030833,
        "dEQP-GLES3.functional.fragment",
        "_ops.scissor.clear_fixed_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030834,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.scissor.clear_int_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030835,
        "dEQP-GLES3.functional.fragment",
        "_ops.scissor.clear_uint_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030836,
        "dEQP-GLES3.functional.fragment",
        "_ops.scissor.clear_depth_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030837,
        "dEQP-GLES3.functional.fragment_",
        "ops.scissor.clear_stencil_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030838,
        "dEQP-GLES3.functional.fragment_ops",
        ".scissor.clear_depth_stencil_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030839,
        "dEQP-GLES3.functional.fragment_op",
        "s.scissor.framebuffer_blit_center");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030840,
        "dEQP-GLES3.functional.fragment_op",
        "s.scissor.framebuffer_blit_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030841,
        "dEQP-GLES3.functional.fragment_o",
        "ps.scissor.framebuffer_blit_none");

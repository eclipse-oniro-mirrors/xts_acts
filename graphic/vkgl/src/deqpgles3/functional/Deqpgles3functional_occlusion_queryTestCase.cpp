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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039864,
        "dEQP-GLES3.functional.",
        "occlusion_query.scissor");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039865,
        "dEQP-GLES3.functional.oc",
        "clusion_query.depth_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039866,
        "dEQP-GLES3.functional.oc",
        "clusion_query.depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039867,
        "dEQP-GLES3.functional.occ",
        "lusion_query.stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039868,
        "dEQP-GLES3.functional.occ",
        "lusion_query.stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039869,
        "dEQP-GLES3.functional.occlus",
        "ion_query.scissor_depth_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039870,
        "dEQP-GLES3.functional.occlus",
        "ion_query.scissor_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039871,
        "dEQP-GLES3.functional.occlusi",
        "on_query.scissor_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039872,
        "dEQP-GLES3.functional.occlusi",
        "on_query.scissor_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039873,
        "dEQP-GLES3.functional.occlusio",
        "n_query.depth_write_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039874,
        "dEQP-GLES3.functional.occlusion",
        "_query.depth_write_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039875,
        "dEQP-GLES3.functional.occlusion",
        "_query.depth_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039876,
        "dEQP-GLES3.functional.occlusion",
        "_query.depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039877,
        "dEQP-GLES3.functional.occlusion",
        "_query.depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039878,
        "dEQP-GLES3.functional.occlusion_",
        "query.stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039879,
        "dEQP-GLES3.functional.occlusion_qu",
        "ery.scissor_depth_write_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039880,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.scissor_depth_write_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039881,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.scissor_depth_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039882,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.scissor_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039883,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.scissor_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039884,
        "dEQP-GLES3.functional.occlusion_quer",
        "y.scissor_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039885,
        "dEQP-GLES3.functional.occlusion_query",
        ".depth_write_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039886,
        "dEQP-GLES3.functional.occlusion_query",
        ".depth_write_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039887,
        "dEQP-GLES3.functional.occlusion_query.",
        "depth_write_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039888,
        "dEQP-GLES3.functional.occlusion_query.",
        "depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039889,
        "dEQP-GLES3.functional.occlusion_query.sci",
        "ssor_depth_write_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039890,
        "dEQP-GLES3.functional.occlusion_query.sci",
        "ssor_depth_write_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039891,
        "dEQP-GLES3.functional.occlusion_query.scis",
        "sor_depth_write_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039892,
        "dEQP-GLES3.functional.occlusion_query.scis",
        "sor_depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039893,
        "dEQP-GLES3.functional.occlusion_query.depth_",
        "write_depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039894,
        "dEQP-GLES3.functional.occ",
        "lusion_query.all_occluders");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039895,
        "dEQP-GLES3.functional.occlusi",
        "on_query.conservative_scissor");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039896,
        "dEQP-GLES3.functional.occlusion",
        "_query.conservative_depth_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039897,
        "dEQP-GLES3.functional.occlusion",
        "_query.conservative_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039898,
        "dEQP-GLES3.functional.occlusion_",
        "query.conservative_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039899,
        "dEQP-GLES3.functional.occlusion_",
        "query.conservative_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039900,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.conservative_scissor_depth_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039901,
        "dEQP-GLES3.functional.occlusion_que",
        "ry.conservative_scissor_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039902,
        "dEQP-GLES3.functional.occlusion_quer",
        "y.conservative_scissor_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039903,
        "dEQP-GLES3.functional.occlusion_quer",
        "y.conservative_scissor_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039904,
        "dEQP-GLES3.functional.occlusion_query",
        ".conservative_depth_write_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039905,
        "dEQP-GLES3.functional.occlusion_query.",
        "conservative_depth_write_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039906,
        "dEQP-GLES3.functional.occlusion_query.",
        "conservative_depth_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039907,
        "dEQP-GLES3.functional.occlusion_query.",
        "conservative_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039908,
        "dEQP-GLES3.functional.occlusion_query.",
        "conservative_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039909,
        "dEQP-GLES3.functional.occlusion_query.c",
        "onservative_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039910,
        "dEQP-GLES3.functional.occlusion_query.con",
        "servative_scissor_depth_write_depth_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039911,
        "dEQP-GLES3.functional.occlusion_query.cons",
        "ervative_scissor_depth_write_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039912,
        "dEQP-GLES3.functional.occlusion_query.cons",
        "ervative_scissor_depth_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039913,
        "dEQP-GLES3.functional.occlusion_query.cons",
        "ervative_scissor_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039914,
        "dEQP-GLES3.functional.occlusion_query.cons",
        "ervative_scissor_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039915,
        "dEQP-GLES3.functional.occlusion_query.conse",
        "rvative_scissor_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039916,
        "dEQP-GLES3.functional.occlusion_query.conser",
        "vative_depth_write_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039917,
        "dEQP-GLES3.functional.occlusion_query.conser",
        "vative_depth_write_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039918,
        "dEQP-GLES3.functional.occlusion_query.conserv",
        "ative_depth_write_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039919,
        "dEQP-GLES3.functional.occlusion_query.conserv",
        "ative_depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039920,
        "dEQP-GLES3.functional.occlusion_query.conservati",
        "ve_scissor_depth_write_depth_clear_stencil_write");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039921,
        "dEQP-GLES3.functional.occlusion_query.conservati",
        "ve_scissor_depth_write_depth_clear_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039922,
        "dEQP-GLES3.functional.occlusion_query.conservativ",
        "e_scissor_depth_write_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039923,
        "dEQP-GLES3.functional.occlusion_query.conservativ",
        "e_scissor_depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039924,
        "dEQP-GLES3.functional.occlusion_query.conservative_",
        "depth_write_depth_clear_stencil_write_stencil_clear");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039925,
        "dEQP-GLES3.functional.occlusion_",
        "query.conservative_all_occluders");

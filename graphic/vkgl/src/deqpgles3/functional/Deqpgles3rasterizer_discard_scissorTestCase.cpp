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
#include "../ActsDeqpgles30041TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040502,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.scissor.write_depth_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040503,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.scissor.write_depth_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040504,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.scissor.write_depth_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040505,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.scissor.write_depth_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040506,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.scissor.write_depth_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040507,
        "dEQP-GLES3.functional.rasterizer_disc",
        "ard.scissor.write_depth_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040508,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.scissor.write_depth_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040509,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.scissor.write_stencil_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040510,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.scissor.write_stencil_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040511,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.scissor.write_stencil_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040512,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.scissor.write_stencil_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040513,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.scissor.write_stencil_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040514,
        "dEQP-GLES3.functional.rasterizer_disca",
        "rd.scissor.write_stencil_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040515,
        "dEQP-GLES3.functional.rasterizer_disc",
        "ard.scissor.write_stencil_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040516,
        "dEQP-GLES3.functional.rasteriz",
        "er_discard.scissor.clear_color");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040517,
        "dEQP-GLES3.functional.rasteriz",
        "er_discard.scissor.clear_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040518,
        "dEQP-GLES3.functional.rasterize",
        "r_discard.scissor.clear_stencil");

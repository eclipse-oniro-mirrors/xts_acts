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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040519,
        "dEQP-GLES3.functional.rasterize",
        "r_discard.fbo.write_depth_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040520,
        "dEQP-GLES3.functional.rasterize",
        "r_discard.fbo.write_depth_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040521,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.fbo.write_depth_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040522,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.fbo.write_depth_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040523,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.fbo.write_depth_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040524,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.fbo.write_depth_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040525,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.fbo.write_depth_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040526,
        "dEQP-GLES3.functional.rasterizer",
        "_discard.fbo.write_stencil_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040527,
        "dEQP-GLES3.functional.rasterizer",
        "_discard.fbo.write_stencil_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040528,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.fbo.write_stencil_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040529,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.fbo.write_stencil_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040530,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.fbo.write_stencil_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040531,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.fbo.write_stencil_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040532,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.fbo.write_stencil_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040533,
        "dEQP-GLES3.functional.raster",
        "izer_discard.fbo.clear_color");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040534,
        "dEQP-GLES3.functional.raster",
        "izer_discard.fbo.clear_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040535,
        "dEQP-GLES3.functional.rasteri",
        "zer_discard.fbo.clear_stencil");

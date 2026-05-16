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

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040485,
        "dEQP-GLES3.functional.rasterizer",
        "_discard.basic.write_depth_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040486,
        "dEQP-GLES3.functional.rasterizer",
        "_discard.basic.write_depth_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040487,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.basic.write_depth_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040488,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.basic.write_depth_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040489,
        "dEQP-GLES3.functional.rasterizer_d",
        "iscard.basic.write_depth_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040490,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.basic.write_depth_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040491,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.basic.write_depth_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040492,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.basic.write_stencil_points");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040493,
        "dEQP-GLES3.functional.rasterizer_",
        "discard.basic.write_stencil_lines");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040494,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.basic.write_stencil_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040495,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.basic.write_stencil_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040496,
        "dEQP-GLES3.functional.rasterizer_di",
        "scard.basic.write_stencil_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040497,
        "dEQP-GLES3.functional.rasterizer_disc",
        "ard.basic.write_stencil_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040498,
        "dEQP-GLES3.functional.rasterizer_dis",
        "card.basic.write_stencil_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040499,
        "dEQP-GLES3.functional.rasteri",
        "zer_discard.basic.clear_color");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040500,
        "dEQP-GLES3.functional.rasteri",
        "zer_discard.basic.clear_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040501,
        "dEQP-GLES3.functional.rasteriz",
        "er_discard.basic.clear_stencil");

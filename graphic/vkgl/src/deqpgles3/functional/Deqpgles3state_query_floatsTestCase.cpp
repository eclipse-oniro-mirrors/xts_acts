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
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042981,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.depth_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042982,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.depth_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042983,
        "dEQP-GLES3.functional.state_quer",
        "y.floats.depth_range_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042984,
        "dEQP-GLES3.functional.state_qu",
        "ery.floats.depth_range_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042985,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.line_width_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042986,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.line_width_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042987,
        "dEQP-GLES3.functional.state_quer",
        "y.floats.line_width_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042988,
        "dEQP-GLES3.functional.state_qu",
        "ery.floats.line_width_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042989,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.polygon_offset_factor_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042990,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.polygon_offset_factor_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042991,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.polygon_offset_factor_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042992,
        "dEQP-GLES3.functional.state_query.f",
        "loats.polygon_offset_factor_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042993,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.polygon_offset_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042994,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.polygon_offset_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042995,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.polygon_offset_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042996,
        "dEQP-GLES3.functional.state_query.f",
        "loats.polygon_offset_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042997,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.sample_coverage_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042998,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.sample_coverage_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042999,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.sample_coverage_value_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043000,
        "dEQP-GLES3.functional.state_query.f",
        "loats.sample_coverage_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043001,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.blend_color_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043002,
        "dEQP-GLES3.functional.state_que",
        "ry.floats.blend_color_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043003,
        "dEQP-GLES3.functional.state_quer",
        "y.floats.blend_color_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043004,
        "dEQP-GLES3.functional.state_qu",
        "ery.floats.blend_color_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043005,
        "dEQP-GLES3.functional.state_query.",
        "floats.color_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043006,
        "dEQP-GLES3.functional.state_query.",
        "floats.color_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043007,
        "dEQP-GLES3.functional.state_query.f",
        "loats.color_clear_value_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043008,
        "dEQP-GLES3.functional.state_query",
        ".floats.color_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043009,
        "dEQP-GLES3.functional.state_query.",
        "floats.depth_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043010,
        "dEQP-GLES3.functional.state_query.",
        "floats.depth_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043011,
        "dEQP-GLES3.functional.state_query.f",
        "loats.depth_clear_value_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043012,
        "dEQP-GLES3.functional.state_query",
        ".floats.depth_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043013,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.max_texture_lod_bias_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043014,
        "dEQP-GLES3.functional.state_query.fl",
        "oats.max_texture_lod_bias_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043015,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.max_texture_lod_bias_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043016,
        "dEQP-GLES3.functional.state_query.f",
        "loats.max_texture_lod_bias_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043017,
        "dEQP-GLES3.functional.state_query.floa",
        "ts.aliased_point_size_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043018,
        "dEQP-GLES3.functional.state_query.floa",
        "ts.aliased_point_size_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043019,
        "dEQP-GLES3.functional.state_query.float",
        "s.aliased_point_size_range_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043020,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.aliased_point_size_range_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043021,
        "dEQP-GLES3.functional.state_query.floa",
        "ts.aliased_line_width_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043022,
        "dEQP-GLES3.functional.state_query.floa",
        "ts.aliased_line_width_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043023,
        "dEQP-GLES3.functional.state_query.float",
        "s.aliased_line_width_range_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_043024,
        "dEQP-GLES3.functional.state_query.flo",
        "ats.aliased_line_width_range_getfloat");

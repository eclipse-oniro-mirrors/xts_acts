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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015605,
        "dEQP-GLES2.functional.state_que",
        "ry.floats.depth_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015606,
        "dEQP-GLES2.functional.state_que",
        "ry.floats.depth_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015607,
        "dEQP-GLES2.functional.state_qu",
        "ery.floats.depth_range_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015608,
        "dEQP-GLES2.functional.state_que",
        "ry.floats.line_width_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015609,
        "dEQP-GLES2.functional.state_que",
        "ry.floats.line_width_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015610,
        "dEQP-GLES2.functional.state_qu",
        "ery.floats.line_width_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015611,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.polygon_offset_factor_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015612,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.polygon_offset_factor_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015613,
        "dEQP-GLES2.functional.state_query.f",
        "loats.polygon_offset_factor_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015614,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.polygon_offset_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015615,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.polygon_offset_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015616,
        "dEQP-GLES2.functional.state_query.f",
        "loats.polygon_offset_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015617,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.sample_coverage_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015618,
        "dEQP-GLES2.functional.state_query.fl",
        "oats.sample_coverage_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015619,
        "dEQP-GLES2.functional.state_query.f",
        "loats.sample_coverage_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015620,
        "dEQP-GLES2.functional.state_query.",
        "floats.color_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015621,
        "dEQP-GLES2.functional.state_query.",
        "floats.color_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015622,
        "dEQP-GLES2.functional.state_query",
        ".floats.color_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015623,
        "dEQP-GLES2.functional.state_query.",
        "floats.depth_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015624,
        "dEQP-GLES2.functional.state_query.",
        "floats.depth_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015625,
        "dEQP-GLES2.functional.state_query",
        ".floats.depth_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015626,
        "dEQP-GLES2.functional.state_query.floa",
        "ts.aliased_point_size_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015627,
        "dEQP-GLES2.functional.state_query.floa",
        "ts.aliased_point_size_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015628,
        "dEQP-GLES2.functional.state_query.flo",
        "ats.aliased_point_size_range_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015629,
        "dEQP-GLES2.functional.state_query.floa",
        "ts.aliased_line_width_range_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015630,
        "dEQP-GLES2.functional.state_query.floa",
        "ts.aliased_line_width_range_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015631,
        "dEQP-GLES2.functional.state_query.flo",
        "ats.aliased_line_width_range_getfloat");

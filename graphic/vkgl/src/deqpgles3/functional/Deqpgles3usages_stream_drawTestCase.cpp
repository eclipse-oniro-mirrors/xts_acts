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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033381,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033382,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033383,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033384,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033385,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033386,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033387,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033388,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033389,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033390,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033391,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033392,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033393,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033394,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033395,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033396,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033397,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033398,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033399,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_draw.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033400,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_draw.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033401,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033402,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033403,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033404,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_draw.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033405,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033406,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_draw.stride32_byte_quads256");

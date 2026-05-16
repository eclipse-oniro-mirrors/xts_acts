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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033407,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033408,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033409,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033410,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033411,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033412,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_draw.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033413,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033414,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033415,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033416,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033417,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033418,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_draw.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033419,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033420,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033421,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033422,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033423,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033424,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_draw.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033425,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033426,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033427,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033428,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_draw.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033429,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033430,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033431,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033432,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_draw.stride32_byte_quads256");

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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033355,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033356,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033357,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033358,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033359,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033360,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033361,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033362,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033363,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033364,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033365,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033366,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033367,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033368,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033369,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033370,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033371,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033372,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033373,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_draw.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033374,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_draw.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033375,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033376,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033377,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033378,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_draw.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033379,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033380,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_draw.stride32_byte_quads256");

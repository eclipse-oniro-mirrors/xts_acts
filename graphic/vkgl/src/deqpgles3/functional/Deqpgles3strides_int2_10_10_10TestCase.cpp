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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033005,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.st",
        "rides.int2_10_10_10.user_ptr_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033006,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.st",
        "rides.int2_10_10_10.user_ptr_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033007,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.st",
        "rides.int2_10_10_10.user_ptr_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033008,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.str",
        "ides.int2_10_10_10.user_ptr_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033009,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.str",
        "ides.int2_10_10_10.user_ptr_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033010,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.str",
        "ides.int2_10_10_10.user_ptr_stride32_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033011,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.s",
        "trides.int2_10_10_10.buffer_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033012,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.s",
        "trides.int2_10_10_10.buffer_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033013,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.st",
        "rides.int2_10_10_10.buffer_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033014,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute.st",
        "rides.int2_10_10_10.buffer_stride32_components4_quads256");

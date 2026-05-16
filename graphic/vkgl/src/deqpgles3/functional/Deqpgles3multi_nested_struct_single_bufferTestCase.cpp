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
#include "../ActsDeqpgles30036TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035894,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035895,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.single_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035896,
        "dEQP-GLES3.functional.ubo.multi_nes",
        "ted_struct.single_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035897,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035898,
        "dEQP-GLES3.functional.ubo.multi_nested_struc",
        "t.single_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035899,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".single_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035900,
        "dEQP-GLES3.functional.ubo.multi_nested_stru",
        "ct.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035901,
        "dEQP-GLES3.functional.ubo.multi_nested_stru",
        "ct.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035902,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035903,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.single_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035904,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035905,
        "dEQP-GLES3.functional.ubo.multi_nested_struc",
        "t.single_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035906,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".single_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035907,
        "dEQP-GLES3.functional.ubo.multi_nested_stru",
        "ct.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035908,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035909,
        "dEQP-GLES3.functional.ubo.multi_neste",
        "d_struct.single_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035910,
        "dEQP-GLES3.functional.ubo.multi_nes",
        "ted_struct.single_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035911,
        "dEQP-GLES3.functional.ubo.multi_nest",
        "ed_struct.single_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035912,
        "dEQP-GLES3.functional.ubo.multi_nested_struc",
        "t.single_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035913,
        "dEQP-GLES3.functional.ubo.multi_nested_struct",
        ".single_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035914,
        "dEQP-GLES3.functional.ubo.multi_nested_stru",
        "ct.single_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035915,
        "dEQP-GLES3.functional.ubo.multi_nested_stru",
        "ct.single_buffer.std140_instance_array_mixed");

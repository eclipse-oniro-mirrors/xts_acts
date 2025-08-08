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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035850,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035851,
        "dEQP-GLES3.functional.ubo.multi_basi",
        "c_types.single_buffer.shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035852,
        "dEQP-GLES3.functional.ubo.multi_ba",
        "sic_types.single_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035853,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035854,
        "dEQP-GLES3.functional.ubo.multi_basic_types",
        ".single_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035855,
        "dEQP-GLES3.functional.ubo.multi_basic_types.",
        "single_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035856,
        "dEQP-GLES3.functional.ubo.multi_basic_type",
        "s.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035857,
        "dEQP-GLES3.functional.ubo.multi_basic_type",
        "s.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035858,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035859,
        "dEQP-GLES3.functional.ubo.multi_basi",
        "c_types.single_buffer.packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035860,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035861,
        "dEQP-GLES3.functional.ubo.multi_basic_types",
        ".single_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035862,
        "dEQP-GLES3.functional.ubo.multi_basic_types.",
        "single_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035863,
        "dEQP-GLES3.functional.ubo.multi_basic_type",
        "s.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035864,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035865,
        "dEQP-GLES3.functional.ubo.multi_basi",
        "c_types.single_buffer.std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035866,
        "dEQP-GLES3.functional.ubo.multi_ba",
        "sic_types.single_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035867,
        "dEQP-GLES3.functional.ubo.multi_bas",
        "ic_types.single_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035868,
        "dEQP-GLES3.functional.ubo.multi_basic_types",
        ".single_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035869,
        "dEQP-GLES3.functional.ubo.multi_basic_types.",
        "single_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035870,
        "dEQP-GLES3.functional.ubo.multi_basic_type",
        "s.single_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035871,
        "dEQP-GLES3.functional.ubo.multi_basic_type",
        "s.single_buffer.std140_instance_array_mixed");

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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019825,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.compute.program_not_active");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019826,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.compute.invalid_program_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019827,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.compute.invalid_dispatch_compute_indirect");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019828,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.compute.invalid_maximum_work_group_counts");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019829,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.compute.invalid_maximum_work_group_sizes");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019830,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.compute.invalid_layout_qualifiers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019831,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.compute.invalid_write_built_in_constants");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019832,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.compute.exceed_uniform_block_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019833,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.compute.exceed_shader_storage_block_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019834,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.compute.exceed_texture_image_units_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019835,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.compute.exceed_image_uniforms_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019836,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.compute.exceed_shared_memory_size_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019837,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.compute.exceed_uniform_components_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019838,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.compute.exceed_atomic_counter_buffer_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019839,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.compute.exceed_atomic_counters_limit");

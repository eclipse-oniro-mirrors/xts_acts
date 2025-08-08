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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018831,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.compute.program_not_active");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018832,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.compute.invalid_program_query");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018833,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.compute.invalid_dispatch_compute_indirect");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018834,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.compute.invalid_maximum_work_group_counts");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018835,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.compute.invalid_maximum_work_group_sizes");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018836,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.compute.invalid_layout_qualifiers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018837,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.compute.invalid_write_built_in_constants");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018838,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.compute.exceed_uniform_block_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018839,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.compute.exceed_shader_storage_block_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018840,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.compute.exceed_texture_image_units_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018841,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.compute.exceed_image_uniforms_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018842,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.compute.exceed_shared_memory_size_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018843,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.compute.exceed_uniform_components_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018844,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.compute.exceed_atomic_counter_buffer_limit");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018845,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.compute.exceed_atomic_counters_limit");

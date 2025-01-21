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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019813,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.tessellation.single_tessellation_stage");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019814,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.tessellation.invalid_primitive_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019815,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.tessellation.tessellation_not_active");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019816,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.tessellation.invalid_program_state");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019817,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.tessellation.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019818,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.tessellation.invalid_program_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019819,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.tessellation.tessellation_control_invalid_vertex_count");

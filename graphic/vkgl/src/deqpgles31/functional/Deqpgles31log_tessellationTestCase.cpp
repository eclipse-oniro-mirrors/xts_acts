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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019317,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.tessellation.single_tessellation_stage");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019318,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.tessellation.invalid_primitive_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019319,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.tessellation.tessellation_not_active");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019320,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.tessellation.invalid_program_state");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019321,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.tessellation.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019322,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.tessellation.invalid_program_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019323,
        "dEQP-GLES31.functional.debug.negative_coverage.log.t",
        "essellation.tessellation_control_invalid_vertex_count");

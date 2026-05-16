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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016159,
        "dEQP-GLES31.functional.state_query.program_p",
        "ipeline.active_program_get_program_pipelineiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016160,
        "dEQP-GLES31.functional.state_query.program_p",
        "ipeline.vertex_shader_get_program_pipelineiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016161,
        "dEQP-GLES31.functional.state_query.program_pi",
        "peline.fragment_shader_get_program_pipelineiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016162,
        "dEQP-GLES31.functional.state_query.program_p",
        "ipeline.compute_shader_get_program_pipelineiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016163,
        "dEQP-GLES31.functional.state_query.program_pi",
        "peline.validate_status_get_program_pipelineiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016164,
        "dEQP-GLES31.functional.state_q",
        "uery.program_pipeline.info_log");

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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016150,
        "dEQP-GLES31.functional.state_query.pr",
        "ogram.program_separable_get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016151,
        "dEQP-GLES31.functional.state_query.progr",
        "am.compute_work_group_size_get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016152,
        "dEQP-GLES31.functional.state_query.program.",
        "active_atomic_counter_buffers_get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016153,
        "dEQP-GLES31.functional.state_query.prog",
        "ram.geometry_shader_state_get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016154,
        "dEQP-GLES31.functional.state_query.progr",
        "am.tesselation_shader_state_get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016155,
        "dEQP-GLES31.functional.state_query.pro",
        "gram.info_log_vertex_fragment_link_fail");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016156,
        "dEQP-GLES31.functional.state_query",
        ".program.info_log_compute_link_fail");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016157,
        "dEQP-GLES31.functional.state_query.",
        "program.info_log_geometry_link_fail");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016158,
        "dEQP-GLES31.functional.state_query.pr",
        "ogram.info_log_tessellation_link_fail");

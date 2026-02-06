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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017659,
        "dEQP-GLES31.functional.separate_shader.pip",
        "eline.different_constant_separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017660,
        "dEQP-GLES31.functional.separate_shader.pipeline.",
        "different_constant_separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017661,
        "dEQP-GLES31.functional.separate_shader.pipeline",
        ".different_constant_separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017662,
        "dEQP-GLES31.functional.separate_shader.pipelin",
        "e.different_constant_separate_programs_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017663,
        "dEQP-GLES31.functional.separate_shader.p",
        "ipeline.different_constant_single_program");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017664,
        "dEQP-GLES31.functional.separate_shader.pipeli",
        "ne.different_constant_single_program_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017665,
        "dEQP-GLES31.functional.separate_shader.pi",
        "peline.different_uniform_separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017666,
        "dEQP-GLES31.functional.separate_shader.pipeline.",
        "different_uniform_separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017667,
        "dEQP-GLES31.functional.separate_shader.pipeline",
        ".different_uniform_separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017668,
        "dEQP-GLES31.functional.separate_shader.pipelin",
        "e.different_uniform_separate_programs_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017669,
        "dEQP-GLES31.functional.separate_shader.p",
        "ipeline.different_uniform_single_program");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017670,
        "dEQP-GLES31.functional.separate_shader.pipel",
        "ine.different_uniform_single_program_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017671,
        "dEQP-GLES31.functional.separate_shader.",
        "pipeline.same_constant_separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017672,
        "dEQP-GLES31.functional.separate_shader.pipelin",
        "e.same_constant_separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017673,
        "dEQP-GLES31.functional.separate_shader.pipeli",
        "ne.same_constant_separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017674,
        "dEQP-GLES31.functional.separate_shader.pipel",
        "ine.same_constant_separate_programs_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017675,
        "dEQP-GLES31.functional.separate_shader.",
        "pipeline.same_uniform_separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017676,
        "dEQP-GLES31.functional.separate_shader.pipeli",
        "ne.same_uniform_separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017677,
        "dEQP-GLES31.functional.separate_shader.pipel",
        "ine.same_uniform_separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017678,
        "dEQP-GLES31.functional.separate_shader.pipe",
        "line.same_uniform_separate_programs_add_both");

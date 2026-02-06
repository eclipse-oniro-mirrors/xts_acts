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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017679,
        "dEQP-GLES31.functional.separate_shad",
        "er.program_uniform.separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017680,
        "dEQP-GLES31.functional.separate_shader.pro",
        "gram_uniform.separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017681,
        "dEQP-GLES31.functional.separate_shader.pr",
        "ogram_uniform.separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017682,
        "dEQP-GLES31.functional.separate_shader.p",
        "rogram_uniform.separate_programs_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017683,
        "dEQP-GLES31.functional.separate_sh",
        "ader.program_uniform.single_program");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017684,
        "dEQP-GLES31.functional.separate_shader.",
        "program_uniform.single_program_add_both");

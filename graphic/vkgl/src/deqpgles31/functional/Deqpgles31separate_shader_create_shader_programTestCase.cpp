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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017685,
        "dEQP-GLES31.functional.separate_shader.",
        "create_shader_program.separate_programs");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017686,
        "dEQP-GLES31.functional.separate_shader.create",
        "_shader_program.separate_programs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017687,
        "dEQP-GLES31.functional.separate_shader.creat",
        "e_shader_program.separate_programs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017688,
        "dEQP-GLES31.functional.separate_shader.crea",
        "te_shader_program.separate_programs_add_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017689,
        "dEQP-GLES31.functional.separate_shader.cre",
        "ate_shader_program.single_program_add_both");

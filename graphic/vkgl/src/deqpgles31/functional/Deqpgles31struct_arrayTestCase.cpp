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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020588,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020589,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020590,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020591,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020592,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020593,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020594,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.array.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020595,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.struct.array.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020596,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.array.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020597,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.array.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024593,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.array.struct.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024623,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.struct.struct.array.float");

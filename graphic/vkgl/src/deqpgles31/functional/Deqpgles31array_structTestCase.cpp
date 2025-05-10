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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020555,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020556,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020557,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020558,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020559,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020560,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020561,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.struct.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020562,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.array.struct.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020563,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.struct.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020564,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.array.struct.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024586,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.array.array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024616,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.struct.array.struct.float");

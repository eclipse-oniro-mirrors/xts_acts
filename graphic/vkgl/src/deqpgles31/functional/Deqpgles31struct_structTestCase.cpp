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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020598,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020599,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.struct.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020600,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020601,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020602,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020603,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.location.default_block.struct.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020604,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.struct.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020605,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".location.default_block.struct.struct.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020606,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.struct.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020607,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.struct.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024594,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.array.struct.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024624,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.struct.struct.struct.float");

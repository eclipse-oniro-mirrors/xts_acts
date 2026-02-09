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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020542,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020543,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020544,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020545,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020546,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020547,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.array.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020548,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.array.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020549,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.array.array.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020550,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.array.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020551,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.array.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020552,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.array.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020553,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.array.array.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020554,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.array.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024585,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024615,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.struct.array.array.float");

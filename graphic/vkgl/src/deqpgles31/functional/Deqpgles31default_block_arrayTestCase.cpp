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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020447,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020448,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.array.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021474,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021475,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.default_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021476,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021477,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021478,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021479,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021480,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.array.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021481,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.type.default_block.array.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021482,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.array.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021483,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.array.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021484,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.array.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021485,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.array.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021486,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.array.atomic_uint");

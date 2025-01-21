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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020565,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020566,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.struct.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020567,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020568,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020569,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020570,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020571,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020572,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020573,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020574,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020575,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020576,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020577,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.struct.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020578,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.struct.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024587,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.struct.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024588,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.struct.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024589,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.struct.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024590,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.struct.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024591,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.struct.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024592,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.struct.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024595,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024596,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.struct.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024597,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024598,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024599,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024600,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024601,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024602,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024603,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024604,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024605,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.struct.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024606,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024607,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.type.struct.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024608,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.struct.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024617,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.type.struct.struct.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024618,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.struct.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024619,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.struct.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024620,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.struct.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024621,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.struct.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024622,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.struct.basic_type.vec4");

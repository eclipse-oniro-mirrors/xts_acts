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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020515,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020516,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020517,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020518,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020519,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020520,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020521,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020522,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020523,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020524,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020525,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020526,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020527,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.array.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020528,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.array.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024565,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024566,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024567,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024568,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024569,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024570,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024571,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024572,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024573,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024574,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024575,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024576,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024577,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.type.array.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024578,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.buffer_variable.type.array.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024579,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.array.array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024580,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024581,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024582,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024583,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024584,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.array.array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024609,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024610,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.type.struct.array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024611,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024612,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024613,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024614,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.type.struct.array.basic_type.vec4");

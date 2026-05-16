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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024540,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024541,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024542,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024543,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024544,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024545,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024546,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024547,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024548,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024549,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024550,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024551,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024552,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024553,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024554,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024555,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024556,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024557,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024558,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024559,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024560,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024561,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024562,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024563,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.buffer_variable.type.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024564,
        "dEQP-GLES31.functional.program_interface_",
        "query.buffer_variable.type.basic_type.mat4");

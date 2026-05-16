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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022166,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.in.named_block_explicit_location.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022167,
        "dEQP-GLES31.functional.program_interface_query.program_input.type",
        ".interface_blocks.in.named_block_explicit_location.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022168,
        "dEQP-GLES31.functional.program_interface_query.program_input.type",
        ".interface_blocks.in.named_block_explicit_location.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022169,
        "dEQP-GLES31.functional.program_interface_query.program_input.type",
        ".interface_blocks.in.named_block_explicit_location.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022170,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.in.named_block_explicit_location.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022171,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.in.named_block_explicit_location.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022172,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.in.named_block_explicit_location.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022250,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.int",
        "erface_blocks.patch_in.named_block_explicit_location.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022251,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.in",
        "terface_blocks.patch_in.named_block_explicit_location.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022252,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.in",
        "terface_blocks.patch_in.named_block_explicit_location.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022253,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.in",
        "terface_blocks.patch_in.named_block_explicit_location.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022254,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.int",
        "erface_blocks.patch_in.named_block_explicit_location.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022255,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.int",
        "erface_blocks.patch_in.named_block_explicit_location.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022256,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.int",
        "erface_blocks.patch_in.named_block_explicit_location.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022808,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.out.named_block_explicit_location.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022809,
        "dEQP-GLES31.functional.program_interface_query.program_output.type",
        ".interface_blocks.out.named_block_explicit_location.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022810,
        "dEQP-GLES31.functional.program_interface_query.program_output.type",
        ".interface_blocks.out.named_block_explicit_location.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022811,
        "dEQP-GLES31.functional.program_interface_query.program_output.type",
        ".interface_blocks.out.named_block_explicit_location.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022812,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.out.named_block_explicit_location.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022813,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.out.named_block_explicit_location.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022814,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.out.named_block_explicit_location.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022886,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.int",
        "erface_blocks.patch_out.named_block_explicit_location.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022887,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.in",
        "terface_blocks.patch_out.named_block_explicit_location.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022888,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.in",
        "terface_blocks.patch_out.named_block_explicit_location.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022889,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.in",
        "terface_blocks.patch_out.named_block_explicit_location.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022890,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.int",
        "erface_blocks.patch_out.named_block_explicit_location.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022891,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.int",
        "erface_blocks.patch_out.named_block_explicit_location.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022892,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.int",
        "erface_blocks.patch_out.named_block_explicit_location.basic_type.mat3x2");

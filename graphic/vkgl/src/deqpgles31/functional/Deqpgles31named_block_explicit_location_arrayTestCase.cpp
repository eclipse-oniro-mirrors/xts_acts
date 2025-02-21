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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022173,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022174,
        "dEQP-GLES31.functional.program_interface_query.program_input.t",
        "ype.interface_blocks.in.named_block_explicit_location.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022175,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022176,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022177,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022178,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022179,
        "dEQP-GLES31.functional.program_interface_query.program_input.typ",
        "e.interface_blocks.in.named_block_explicit_location.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022257,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022258,
        "dEQP-GLES31.functional.program_interface_query.program_input.type",
        ".interface_blocks.patch_in.named_block_explicit_location.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022259,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022260,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022261,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022262,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022263,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.i",
        "nterface_blocks.patch_in.named_block_explicit_location.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022815,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022816,
        "dEQP-GLES31.functional.program_interface_query.program_output.t",
        "ype.interface_blocks.out.named_block_explicit_location.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022817,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022818,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022819,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022820,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022821,
        "dEQP-GLES31.functional.program_interface_query.program_output.typ",
        "e.interface_blocks.out.named_block_explicit_location.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022893,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.patch_out.named_block_explicit_location.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022894,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.patch_out.named_block_explicit_location.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022895,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.",
        "interface_blocks.patch_out.named_block_explicit_location.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022896,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.i",
        "nterface_blocks.patch_out.named_block_explicit_location.array.mat3x2");

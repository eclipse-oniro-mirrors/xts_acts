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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022180,
        "dEQP-GLES31.functional.program_interface_query.program_input.typ",
        "e.interface_blocks.in.named_block_explicit_location.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022181,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022182,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022183,
        "dEQP-GLES31.functional.program_interface_query.program_input.ty",
        "pe.interface_blocks.in.named_block_explicit_location.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022184,
        "dEQP-GLES31.functional.program_interface_query.program_input.typ",
        "e.interface_blocks.in.named_block_explicit_location.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022185,
        "dEQP-GLES31.functional.program_interface_query.program_input.typ",
        "e.interface_blocks.in.named_block_explicit_location.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022186,
        "dEQP-GLES31.functional.program_interface_query.program_input.typ",
        "e.interface_blocks.in.named_block_explicit_location.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022264,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.i",
        "nterface_blocks.patch_in.named_block_explicit_location.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022265,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022266,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022267,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.",
        "interface_blocks.patch_in.named_block_explicit_location.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022268,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.i",
        "nterface_blocks.patch_in.named_block_explicit_location.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022269,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.i",
        "nterface_blocks.patch_in.named_block_explicit_location.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022270,
        "dEQP-GLES31.functional.program_interface_query.program_input.type.i",
        "nterface_blocks.patch_in.named_block_explicit_location.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022822,
        "dEQP-GLES31.functional.program_interface_query.program_output.typ",
        "e.interface_blocks.out.named_block_explicit_location.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022823,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022824,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022825,
        "dEQP-GLES31.functional.program_interface_query.program_output.ty",
        "pe.interface_blocks.out.named_block_explicit_location.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022826,
        "dEQP-GLES31.functional.program_interface_query.program_output.typ",
        "e.interface_blocks.out.named_block_explicit_location.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022827,
        "dEQP-GLES31.functional.program_interface_query.program_output.typ",
        "e.interface_blocks.out.named_block_explicit_location.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022828,
        "dEQP-GLES31.functional.program_interface_query.program_output.typ",
        "e.interface_blocks.out.named_block_explicit_location.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022897,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.i",
        "nterface_blocks.patch_out.named_block_explicit_location.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022898,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.i",
        "nterface_blocks.patch_out.named_block_explicit_location.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022899,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.i",
        "nterface_blocks.patch_out.named_block_explicit_location.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022900,
        "dEQP-GLES31.functional.program_interface_query.program_output.type.i",
        "nterface_blocks.patch_out.named_block_explicit_location.struct.mat3x2");

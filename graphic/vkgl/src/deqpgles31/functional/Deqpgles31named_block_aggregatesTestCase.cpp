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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020230,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_size.named_block.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020231,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_size.named_block.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020232,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.array_size.named_block.aggregates.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020233,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.named_block.aggregates.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020234,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.named_block.aggregates.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020235,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_size.named_block.aggregates.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020236,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.named_block.aggregates.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020237,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_size.named_block.aggregates.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020238,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_size.named_block.aggregates.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020239,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_size.named_block.aggregates.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020240,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.named_block.aggregates.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020241,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_size.named_block.aggregates.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020242,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_size.named_block.aggregates.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020243,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_size.named_block.aggregates.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020244,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_size.named_block.aggregates.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020329,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020330,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.named_block.aggregates.float_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020331,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.float_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020332,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020333,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.float_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020334,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.float_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020335,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.bool_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020336,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_stride.named_block.aggregates.bool_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020337,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020338,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.named_block.aggregates.bvec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020339,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.bvec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020340,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020341,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.bvec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020342,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.bvec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020343,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020344,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.vec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020345,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.vec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020346,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_stride.named_block.aggregates.vec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020347,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.vec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020348,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.array_stride.named_block.aggregates.vec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020349,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.ivec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020350,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.named_block.aggregates.ivec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020351,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.ivec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020352,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.named_block.aggregates.ivec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020353,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.ivec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020354,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.named_block.aggregates.ivec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020924,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.named_block.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020925,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.named_block.aggregates.float_array");

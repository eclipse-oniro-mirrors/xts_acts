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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020201,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_size.default_block.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020202,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_size.default_block.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020203,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_size.default_block.aggregates.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020204,
        "dEQP-GLES31.functional.program_interface_query.uniform.ar",
        "ray_size.default_block.aggregates.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020205,
        "dEQP-GLES31.functional.program_interface_query.uniform.ar",
        "ray_size.default_block.aggregates.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020206,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.array_size.default_block.aggregates.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020207,
        "dEQP-GLES31.functional.program_interface_query.uniform.ar",
        "ray_size.default_block.aggregates.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020208,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.default_block.aggregates.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020209,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_size.default_block.aggregates.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020210,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.array_size.default_block.aggregates.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020211,
        "dEQP-GLES31.functional.program_interface_query.uniform.ar",
        "ray_size.default_block.aggregates.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020212,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.default_block.aggregates.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020213,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.array_size.default_block.aggregates.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020214,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.default_block.aggregates.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020215,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_size.default_block.aggregates.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020286,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.default_block.aggregates.sampler2D_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020287,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.default_block.aggregates.sampler2D_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020288,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.atomic_uint_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020289,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020290,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_stride.default_block.aggregates.float_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020291,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.float_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020292,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020293,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.float_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020294,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.float_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020295,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.bool_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020296,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.default_block.aggregates.bool_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020297,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020298,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_stride.default_block.aggregates.bvec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020299,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.bvec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020300,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020301,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.bvec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020302,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.bvec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020303,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.vec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020304,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.vec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020305,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.vec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020306,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.default_block.aggregates.vec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020307,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.vec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020308,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".array_stride.default_block.aggregates.vec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020309,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.ivec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020310,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "rray_stride.default_block.aggregates.ivec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020311,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.ivec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020312,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.aggregates.ivec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020313,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.ivec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020314,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "array_stride.default_block.aggregates.ivec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020896,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.offset.default_block.aggregates.atomic_uint_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020897,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020898,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.aggregates.float_array");

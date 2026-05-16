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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019226,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "shader_function.bitfield_extract_invalid_value_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019227,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "shader_function.bitfield_extract_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019228,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".shader_function.bitfield_extract_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019229,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".shader_function.bitfield_insert_invalid_base_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019230,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "shader_function.bitfield_insert_invalid_insert_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019231,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "shader_function.bitfield_insert_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019232,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".shader_function.bitfield_insert_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019233,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.bitfield_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019234,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.bit_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019235,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.shader_function.find_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019236,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.shader_function.find_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019237,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.shader_function.uadd_carry_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019238,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.shader_function.uadd_carry_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019239,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.uadd_carry_invalid_carry");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019240,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.usub_borrow_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019241,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.usub_borrow_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019242,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.usub_borrow_invalid_borrow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019243,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.umul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019244,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.umul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019245,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.umul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019246,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.umul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019247,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.imul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019248,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.imul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019249,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.imul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019250,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.imul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019251,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.frexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019252,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader_function.frexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019253,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.ldexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019254,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader_function.ldexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019255,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader_function.pack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019256,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader_function.pack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019257,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.unpack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019258,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.unpack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019259,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.shader_function.texture_size_invalid_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019260,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.texture_size_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019261,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader_function.texture_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019262,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.shader_function.texture_invalid_bias_or_compare");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019263,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.texture_lod_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019264,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.texture_lod_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019265,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.texel_fetch_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019266,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.texel_fetch_invalid_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019267,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader_function.emit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019268,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader_function.end_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019269,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader_function.texture_grad");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019270,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader_function.texture_gather_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019271,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.shader_function.texture_gather_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019272,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.shader_function.texture_gather_sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019273,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.shader_function.texture_gather_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019274,
        "dEQP-GLES31.functional.debug.negative_coverage.log.s",
        "hader_function.texture_gather_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019275,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".shader_function.texture_gather_sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019276,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".shader_function.texture_gather_sampler_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019277,
        "dEQP-GLES31.functional.debug.negative_coverage.log.sh",
        "ader_function.texture_gather_sampler_cube_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019278,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.shader_function.texture_gather_offset_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019279,
        "dEQP-GLES31.functional.debug.negative_coverage.log.s",
        "hader_function.texture_gather_offset_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019280,
        "dEQP-GLES31.functional.debug.negative_coverage.log.sh",
        "ader_function.texture_gather_offset_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019281,
        "dEQP-GLES31.functional.debug.negative_coverage.log.shade",
        "r_function.texture_gather_offset_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019282,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.texture_gather_offsets");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019283,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_add");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019284,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_min");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019285,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_max");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019286,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_and");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019287,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_or");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019288,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_function.atomic_xor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019289,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.atomic_exchange");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019290,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_function.atomic_comp_swap");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019291,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader_function.interpolate_at_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019292,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.interpolate_at_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019293,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader_function.interpolate_at_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019294,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader_function.fma");

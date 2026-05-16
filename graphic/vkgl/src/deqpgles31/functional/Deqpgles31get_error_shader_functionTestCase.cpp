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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019722,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.shader_function.bitfield_extract_invalid_value_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019723,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.shader_function.bitfield_extract_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019724,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.shader_function.bitfield_extract_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019725,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.shader_function.bitfield_insert_invalid_base_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019726,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.shader_function.bitfield_insert_invalid_insert_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019727,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.shader_function.bitfield_insert_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019728,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.shader_function.bitfield_insert_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019729,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.bitfield_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019730,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.bit_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019731,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.shader_function.find_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019732,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.shader_function.find_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019733,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.shader_function.uadd_carry_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019734,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.shader_function.uadd_carry_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019735,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.uadd_carry_invalid_carry");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019736,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.usub_borrow_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019737,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.usub_borrow_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019738,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.usub_borrow_invalid_borrow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019739,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.umul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019740,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.umul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019741,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.umul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019742,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.umul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019743,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.imul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019744,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.imul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019745,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.imul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019746,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.imul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019747,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.frexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019748,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader_function.frexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019749,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.ldexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019750,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader_function.ldexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019751,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_function.pack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019752,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_function.pack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019753,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.unpack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019754,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.unpack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019755,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.shader_function.texture_size_invalid_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019756,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.texture_size_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019757,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader_function.texture_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019758,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.shader_function.texture_invalid_bias_or_compare");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019759,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.texture_lod_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019760,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.texture_lod_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019761,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.texel_fetch_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019762,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.texel_fetch_invalid_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019763,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_function.emit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019764,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_function.end_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019765,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_function.texture_grad");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019766,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader_function.texture_gather_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019767,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.shader_function.texture_gather_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019768,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.shader_function.texture_gather_sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019769,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.shader_function.texture_gather_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019770,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.shader_function.texture_gather_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019771,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.shader_function.texture_gather_sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019772,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.shader_function.texture_gather_sampler_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019773,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error",
        ".shader_function.texture_gather_sampler_cube_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019774,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.shader_function.texture_gather_offset_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019775,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.shader_function.texture_gather_offset_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019776,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error",
        ".shader_function.texture_gather_offset_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019777,
        "dEQP-GLES31.functional.debug.negative_coverage.get_error.sh",
        "ader_function.texture_gather_offset_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019778,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.texture_gather_offsets");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019779,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_add");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019780,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_min");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019781,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_max");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019782,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_and");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019783,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_or");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019784,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_function.atomic_xor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019785,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.atomic_exchange");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019786,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader_function.atomic_comp_swap");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019787,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader_function.interpolate_at_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019788,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.interpolate_at_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019789,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader_function.interpolate_at_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019790,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader_function.fma");

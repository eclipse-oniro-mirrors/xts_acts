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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018728,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.shader_function.bitfield_extract_invalid_value_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018729,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.shader_function.bitfield_extract_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018730,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.shader_function.bitfield_extract_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018731,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.shader_function.bitfield_insert_invalid_base_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018732,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.shader_function.bitfield_insert_invalid_insert_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018733,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.shader_function.bitfield_insert_invalid_offset_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018734,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.shader_function.bitfield_insert_invalid_bits_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018735,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.bitfield_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018736,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.bit_count");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018737,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.shader_function.find_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018738,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.shader_function.find_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018739,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.shader_function.uadd_carry_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018740,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.shader_function.uadd_carry_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018741,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.uadd_carry_invalid_carry");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018742,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.usub_borrow_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018743,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.usub_borrow_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018744,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.usub_borrow_invalid_borrow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018745,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.umul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018746,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.umul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018747,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.umul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018748,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.umul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018749,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.imul_extended_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018750,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.imul_extended_invalid_y");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018751,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.imul_extended_invalid_msb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018752,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.imul_extended_invalid_lsb");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018753,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.frexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018754,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader_function.frexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018755,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.ldexp_invalid_x");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018756,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader_function.ldexp_invalid_exp");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018757,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader_function.pack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018758,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader_function.pack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018759,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.unpack_snorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018760,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.unpack_unorm_4x8");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018761,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.shader_function.texture_size_invalid_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018762,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.texture_size_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018763,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader_function.texture_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018764,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.shader_function.texture_invalid_bias_or_compare");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018765,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.texture_lod_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018766,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.texture_lod_invalid_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018767,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.texel_fetch_invalid_p");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018768,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.texel_fetch_invalid_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018769,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_function.emit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018770,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader_function.end_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018771,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_function.texture_grad");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018772,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader_function.texture_gather_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018773,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.shader_function.texture_gather_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018774,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.shader_function.texture_gather_sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018775,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.shader_function.texture_gather_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018776,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.shader_function.texture_gather_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018777,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.shader_function.texture_gather_sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018778,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.shader_function.texture_gather_sampler_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018779,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks",
        ".shader_function.texture_gather_sampler_cube_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018780,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.shader_function.texture_gather_offset_sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018781,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.shader_function.texture_gather_offset_sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018782,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks",
        ".shader_function.texture_gather_offset_sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018783,
        "dEQP-GLES31.functional.debug.negative_coverage.callbacks.sh",
        "ader_function.texture_gather_offset_sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018784,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.texture_gather_offsets");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018785,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_add");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018786,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018787,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018788,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_and");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018789,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_or");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018790,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_function.atomic_xor");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018791,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.atomic_exchange");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018792,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_function.atomic_comp_swap");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018793,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader_function.interpolate_at_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018794,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.interpolate_at_sample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018795,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader_function.interpolate_at_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018796,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader_function.fma");

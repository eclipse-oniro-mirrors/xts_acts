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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004645,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.attribute_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004646,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.attribute_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004647,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.varying_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004648,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.varying_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004649,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.coherent_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004650,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.coherent_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004651,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.restrict_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004652,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.restrict_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004653,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.readonly_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004654,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.readonly_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004655,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.writeonly_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004656,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.writeonly_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004657,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.resource_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004658,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.resource_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004659,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.atomic_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004660,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.atomic_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004661,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.noperspective_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004662,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.noperspective_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004663,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.patch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004664,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.patch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004665,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.sample_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004666,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.sample_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004667,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.subroutine_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004668,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.subroutine_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004669,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.common_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004670,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.common_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004671,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.partition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004672,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.partition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004673,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.active_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004674,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.active_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004675,
        "dEQP-GLES3.functional.shaders.key",
        "words.reserved_keywords.asm_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004676,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.asm_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004677,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.class_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004678,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.class_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004679,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.union_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004680,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.union_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004681,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.enum_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004682,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.enum_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004683,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.typedef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004684,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.typedef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004685,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.template_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004686,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.template_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004687,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.this_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004688,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.this_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004689,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.goto_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004690,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.goto_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004691,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.inline_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004692,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.inline_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004693,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.noinline_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004694,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.noinline_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004695,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.volatile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004696,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.volatile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004697,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.public_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004698,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.public_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004699,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004700,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004701,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.extern_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004702,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.extern_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004703,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.external_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004704,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.external_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004705,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.interface_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004706,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.interface_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004707,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.long_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004708,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.long_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004709,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.short_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004710,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.short_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004711,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.double_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004712,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.double_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004713,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.half_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004714,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.half_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004715,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004716,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004717,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.unsigned_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004718,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.unsigned_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004719,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.superp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004720,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.superp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004721,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.input_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004722,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.input_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004723,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.output_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004724,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.output_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004725,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.hvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004726,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.hvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004727,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.hvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004728,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.hvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004729,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.hvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004730,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.hvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004731,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.dvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004732,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.dvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004733,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.dvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004734,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.dvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004735,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.dvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004736,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.dvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004737,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.fvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004738,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.fvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004739,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.fvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004740,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.fvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004741,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.fvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004742,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.fvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004743,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.sampler3DRect_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004744,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.sampler3DRect_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004745,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.filter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004746,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.filter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004747,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.image1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004748,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.image1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004749,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.image2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004750,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.image2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004751,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.image3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004752,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.image3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004753,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.imageCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004754,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.imageCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004755,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.iimage1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004756,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.iimage1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004757,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.iimage2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004758,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.iimage2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004759,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.iimage3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004760,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.iimage3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004761,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.iimageCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004762,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.iimageCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004763,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.uimage1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004764,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.uimage1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004765,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.uimage2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004766,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.uimage2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004767,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.uimage3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004768,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.uimage3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004769,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.uimageCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004770,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.uimageCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004771,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.image1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004772,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.image1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004773,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.image2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004774,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.image2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004775,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.iimage1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004776,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.iimage1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004777,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.iimage2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004778,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.iimage2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004779,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.uimage1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004780,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.uimage1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004781,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.uimage2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004782,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.uimage2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004783,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.imageBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004784,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.imageBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004785,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.iimageBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004786,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.iimageBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004787,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.uimageBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004788,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.uimageBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004789,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.sampler1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004790,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.sampler1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004791,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.sampler1DShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004792,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.sampler1DShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004793,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.sampler1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004794,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.sampler1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004795,
        "dEQP-GLES3.functional.shaders.keywords.res",
        "erved_keywords.sampler1DArrayShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004796,
        "dEQP-GLES3.functional.shaders.keywords.rese",
        "rved_keywords.sampler1DArrayShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004797,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.isampler1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004798,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.isampler1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004799,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.isampler1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004800,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.isampler1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004801,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.usampler1D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004802,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.usampler1D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004803,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.usampler1DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004804,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.usampler1DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004805,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.sampler2DRect_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004806,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.sampler2DRect_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004807,
        "dEQP-GLES3.functional.shaders.keywords.re",
        "served_keywords.sampler2DRectShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004808,
        "dEQP-GLES3.functional.shaders.keywords.res",
        "erved_keywords.sampler2DRectShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004809,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.isampler2DRect_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004810,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.isampler2DRect_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004811,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.usampler2DRect_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004812,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.usampler2DRect_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004813,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.samplerBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004814,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.samplerBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004815,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.isamplerBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004816,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.isamplerBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004817,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.usamplerBuffer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004818,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.usamplerBuffer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004819,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.sampler2DMS_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004820,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.sampler2DMS_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004821,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.isampler2DMS_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004822,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.isampler2DMS_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004823,
        "dEQP-GLES3.functional.shaders.keywords",
        ".reserved_keywords.usampler2DMS_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004824,
        "dEQP-GLES3.functional.shaders.keywords.",
        "reserved_keywords.usampler2DMS_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004825,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.sampler2DMSArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004826,
        "dEQP-GLES3.functional.shaders.keywords.re",
        "served_keywords.sampler2DMSArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004827,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.isampler2DMSArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004828,
        "dEQP-GLES3.functional.shaders.keywords.re",
        "served_keywords.isampler2DMSArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004829,
        "dEQP-GLES3.functional.shaders.keywords.r",
        "eserved_keywords.usampler2DMSArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004830,
        "dEQP-GLES3.functional.shaders.keywords.re",
        "served_keywords.usampler2DMSArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004831,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.sizeof_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004832,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.sizeof_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004833,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.cast_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004834,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.cast_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004835,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.reserved_keywords.namespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004836,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.reserved_keywords.namespace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004837,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.reserved_keywords.using_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004838,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.reserved_keywords.using_fragment");

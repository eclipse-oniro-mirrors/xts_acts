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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004445,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".geometry.varying.rules.input_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004446,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".geometry.varying.rules.output_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004447,
        "dEQP-GLES31.functional.shaders.linkage.es31.ge",
        "ometry.varying.rules.input_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004448,
        "dEQP-GLES31.functional.shaders.linkage.es31.ge",
        "ometry.varying.rules.output_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004449,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".geometry.varying.rules.input_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004450,
        "dEQP-GLES31.functional.shaders.linkage.es31.",
        "geometry.varying.rules.output_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004451,
        "dEQP-GLES31.functional.shaders.linkage.es31.geom",
        "etry.varying.rules.input_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004452,
        "dEQP-GLES31.functional.shaders.linkage.es31.geom",
        "etry.varying.rules.output_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004453,
        "dEQP-GLES31.functional.shaders.linkage.es31.ge",
        "ometry.varying.rules.input_array_explicit_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004454,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.geometry.varying.rules.input_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004455,
        "dEQP-GLES31.functional.shaders.linkage.es31.ge",
        "ometry.varying.rules.input_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004456,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.rules.input_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004457,
        "dEQP-GLES31.functional.shaders.linkage.es31.ge",
        "ometry.varying.rules.input_block_explicit_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004458,
        "dEQP-GLES31.functional.shaders.linkage.es31.",
        "geometry.varying.rules.input_block_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004459,
        "dEQP-GLES31.functional.shaders.linkage.es31.geome",
        "try.varying.rules.input_block_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004460,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.rules.output_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004461,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.geometry.varying.rules.output_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004462,
        "dEQP-GLES31.functional.shaders.linkage.es31.geome",
        "try.varying.rules.unspecified_input_primitive_type");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004463,
        "dEQP-GLES31.functional.shaders.linkage.es31.geomet",
        "ry.varying.rules.unspecified_output_primitive_type");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004464,
        "dEQP-GLES31.functional.shaders.linkage.es31.geometry.v",
        "arying.rules.unspecified_output_primitive_num_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004465,
        "dEQP-GLES31.functional.shaders.linkage.es31.geometry.v",
        "arying.rules.access_more_than_available_input_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004520,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.varying.rules.input_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004521,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.varying.rules.output_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004522,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation.varying.rules.internal_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004523,
        "dEQP-GLES31.functional.shaders.linkage.es31.tess",
        "ellation.varying.rules.input_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004524,
        "dEQP-GLES31.functional.shaders.linkage.es31.tess",
        "ellation.varying.rules.output_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004525,
        "dEQP-GLES31.functional.shaders.linkage.es31.tesse",
        "llation.varying.rules.internal_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004526,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.varying.rules.input_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004527,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation.varying.rules.output_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004528,
        "dEQP-GLES31.functional.shaders.linkage.es31.tes",
        "sellation.varying.rules.internal_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004529,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation.varying.rules.input_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004530,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation.varying.rules.output_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004531,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessell",
        "ation.varying.rules.internal_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004532,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessellat",
        "ion.varying.rules.vertex_fragment_same_varying_name_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004533,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessellat",
        "ion.varying.rules.vertex_fragment_same_varying_name_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004534,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.varying.rules.invalid_vertex_index");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004535,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.varying.rules.input_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004536,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.varying.rules.output_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004537,
        "dEQP-GLES31.functional.shaders.linkage.es31.tess",
        "ellation.varying.rules.input_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004538,
        "dEQP-GLES31.functional.shaders.linkage.es31.tesse",
        "llation.varying.rules.internal_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004539,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation.varying.rules.invalid_patch_in_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004540,
        "dEQP-GLES31.functional.shaders.linkage.es31.tes",
        "sellation.varying.rules.invalid_patch_out_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004541,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessella",
        "tion.varying.rules.invalid_per_patch_qualifier_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004542,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation.varying.rules.per_patch_qualifier_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004543,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation.varying.rules.per_patch_qualifier_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004544,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.rules.input_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004545,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation.varying.rules.input_block_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004546,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation.varying.rules.output_block_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004547,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessell",
        "ation.varying.rules.input_block_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004548,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.rules.output_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004549,
        "dEQP-GLES31.functional.shaders.linkage.es31.",
        "tessellation.varying.rules.output_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004550,
        "dEQP-GLES31.functional.shaders.linkage.es31.tes",
        "sellation.varying.rules.unspecified_vertex_count");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004551,
        "dEQP-GLES31.functional.shaders.linkage.es31.tess",
        "ellation.varying.rules.unspecified_primitive_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004616,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation_geometry.varying.rules.type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004617,
        "dEQP-GLES31.functional.shaders.linkage.es31.tesse",
        "llation_geometry.varying.rules.different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004618,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation_geometry.varying.rules.no_output_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004619,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessellatio",
        "n_geometry.varying.rules.superfluous_output_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004620,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessellation_",
        "geometry.varying.rules.vertex_geometry_same_varying_name_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004621,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessellation_",
        "geometry.varying.rules.vertex_geometry_same_varying_name_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004622,
        "dEQP-GLES31.functional.shaders.linkage.es31.",
        "tessellation_geometry.varying.rules.io_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004623,
        "dEQP-GLES31.functional.shaders.linkage.es31.tess",
        "ellation_geometry.varying.rules.array_in_io_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004716,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".geometry.varying.rules.input_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004717,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".geometry.varying.rules.output_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004718,
        "dEQP-GLES31.functional.shaders.linkage.es32.ge",
        "ometry.varying.rules.input_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004719,
        "dEQP-GLES31.functional.shaders.linkage.es32.ge",
        "ometry.varying.rules.output_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004720,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".geometry.varying.rules.input_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004721,
        "dEQP-GLES31.functional.shaders.linkage.es32.",
        "geometry.varying.rules.output_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004722,
        "dEQP-GLES31.functional.shaders.linkage.es32.geom",
        "etry.varying.rules.input_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004723,
        "dEQP-GLES31.functional.shaders.linkage.es32.geom",
        "etry.varying.rules.output_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004724,
        "dEQP-GLES31.functional.shaders.linkage.es32.ge",
        "ometry.varying.rules.input_array_explicit_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004725,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.geometry.varying.rules.input_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004726,
        "dEQP-GLES31.functional.shaders.linkage.es32.ge",
        "ometry.varying.rules.input_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004727,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.rules.input_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004728,
        "dEQP-GLES31.functional.shaders.linkage.es32.ge",
        "ometry.varying.rules.input_block_explicit_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004729,
        "dEQP-GLES31.functional.shaders.linkage.es32.",
        "geometry.varying.rules.input_block_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004730,
        "dEQP-GLES31.functional.shaders.linkage.es32.geome",
        "try.varying.rules.input_block_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004731,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.rules.output_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004732,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.geometry.varying.rules.output_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004733,
        "dEQP-GLES31.functional.shaders.linkage.es32.geome",
        "try.varying.rules.unspecified_input_primitive_type");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004734,
        "dEQP-GLES31.functional.shaders.linkage.es32.geomet",
        "ry.varying.rules.unspecified_output_primitive_type");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004735,
        "dEQP-GLES31.functional.shaders.linkage.es32.geometry.v",
        "arying.rules.unspecified_output_primitive_num_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004736,
        "dEQP-GLES31.functional.shaders.linkage.es32.geometry.v",
        "arying.rules.access_more_than_available_input_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004791,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.varying.rules.input_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004792,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.varying.rules.output_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004793,
        "dEQP-GLES31.functional.shaders.linkage.es32.te",
        "ssellation.varying.rules.internal_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004794,
        "dEQP-GLES31.functional.shaders.linkage.es32.tess",
        "ellation.varying.rules.input_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004795,
        "dEQP-GLES31.functional.shaders.linkage.es32.tess",
        "ellation.varying.rules.output_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004796,
        "dEQP-GLES31.functional.shaders.linkage.es32.tesse",
        "llation.varying.rules.internal_different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004797,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.varying.rules.input_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004798,
        "dEQP-GLES31.functional.shaders.linkage.es32.te",
        "ssellation.varying.rules.output_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004799,
        "dEQP-GLES31.functional.shaders.linkage.es32.tes",
        "sellation.varying.rules.internal_no_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004800,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation.varying.rules.input_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004801,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation.varying.rules.output_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004802,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessell",
        "ation.varying.rules.internal_superfluous_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004803,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessellat",
        "ion.varying.rules.vertex_fragment_same_varying_name_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004804,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessellat",
        "ion.varying.rules.vertex_fragment_same_varying_name_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004805,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.varying.rules.invalid_vertex_index");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004806,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.varying.rules.input_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004807,
        "dEQP-GLES31.functional.shaders.linkage.es32.tess",
        "ellation.varying.rules.input_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004808,
        "dEQP-GLES31.functional.shaders.linkage.es32.tesse",
        "llation.varying.rules.internal_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004809,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation.varying.rules.per_patch_qualifier_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004810,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation.varying.rules.per_patch_qualifier_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004811,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.rules.input_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004812,
        "dEQP-GLES31.functional.shaders.linkage.es32.te",
        "ssellation.varying.rules.input_block_non_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004813,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessell",
        "ation.varying.rules.input_block_array_size_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004814,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.rules.output_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004815,
        "dEQP-GLES31.functional.shaders.linkage.es32.",
        "tessellation.varying.rules.output_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004816,
        "dEQP-GLES31.functional.shaders.linkage.es32.tes",
        "sellation.varying.rules.unspecified_vertex_count");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004817,
        "dEQP-GLES31.functional.shaders.linkage.es32.tess",
        "ellation.varying.rules.unspecified_primitive_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004876,
        "dEQP-GLES31.functional.shaders.linkage.es32.te",
        "ssellation_geometry.varying.rules.type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004877,
        "dEQP-GLES31.functional.shaders.linkage.es32.tesse",
        "llation_geometry.varying.rules.different_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004878,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation_geometry.varying.rules.no_output_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004879,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessellatio",
        "n_geometry.varying.rules.superfluous_output_declaration");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004880,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessellation_",
        "geometry.varying.rules.vertex_geometry_same_varying_name_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004881,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessellation_",
        "geometry.varying.rules.vertex_geometry_same_varying_name_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004882,
        "dEQP-GLES31.functional.shaders.linkage.es32.",
        "tessellation_geometry.varying.rules.io_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004883,
        "dEQP-GLES31.functional.shaders.linkage.es32.tess",
        "ellation_geometry.varying.rules.array_in_io_block");

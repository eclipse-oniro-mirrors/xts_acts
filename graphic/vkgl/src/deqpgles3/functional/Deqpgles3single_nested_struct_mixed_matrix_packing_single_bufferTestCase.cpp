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
#include "../ActsDeqpgles30036TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035396,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.",
        "shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035397,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "hared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035398,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer",
        ".shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035399,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035400,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035401,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "hared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035402,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035403,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035404,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "hared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035405,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035406,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar",
        "ed_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035407,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035408,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035409,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035410,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "hared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035411,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035412,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar",
        "ed_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035413,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035414,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha",
        "red_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035415,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar",
        "ed_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035416,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh",
        "ared_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035417,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.share",
        "d_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035418,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shared",
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035419,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar",
        "ed_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035420,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.",
        "packed_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035421,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.p",
        "acked_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035422,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa",
        "cked_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035423,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035424,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa",
        "cked_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035425,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035426,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035427,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack",
        "ed_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035428,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa",
        "cked_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035429,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035430,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035431,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack",
        "ed_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035432,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac",
        "ked_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035433,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack",
        "ed_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035434,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.packe",
        "d_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035435,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.packed",
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035436,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.",
        "std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035437,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "td140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035438,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer",
        ".std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035439,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035440,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035441,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "td140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035442,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035443,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035444,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "td140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035445,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035446,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1",
        "40_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035447,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035448,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035449,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035450,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s",
        "td140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035451,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035452,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1",
        "40_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035453,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035454,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std",
        "140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035455,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1",
        "40_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035456,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st",
        "d140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035457,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std14",
        "0_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035458,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std140",
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035459,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1",
        "40_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both");

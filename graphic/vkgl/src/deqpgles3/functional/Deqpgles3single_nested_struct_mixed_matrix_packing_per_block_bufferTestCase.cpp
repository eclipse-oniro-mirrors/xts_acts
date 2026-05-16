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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035268,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_bloc",
        "k_buffer.shared_block_row_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035269,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.shared_block_row_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035270,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_blo",
        "ck_buffer.shared_block_row_major_matrix_row_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035271,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035272,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035273,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffe",
        "r.shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035274,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_row_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035275,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_row_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035276,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.shared_block_row_major_matrix_row_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035277,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "shared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035278,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035279,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".shared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035280,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_row_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035281,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_row_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035282,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.shared_block_row_major_matrix_column_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035283,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "shared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035284,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035285,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".shared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035286,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_row_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035287,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.shared_block_row_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035288,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_row_major_matrix_column_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035289,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sh",
        "ared_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035290,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sha",
        "red_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035291,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035292,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_column_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035293,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_column_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035294,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.shared_block_column_major_matrix_row_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035295,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "shared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035296,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035297,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".shared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035298,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_column_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035299,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.shared_block_column_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035300,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_column_major_matrix_row_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035301,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sh",
        "ared_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035302,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sha",
        "red_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035303,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035304,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.shared_block_column_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035305,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.shared_block_column_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035306,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.shared_block_column_major_matrix_column_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035307,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sh",
        "ared_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035308,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sha",
        "red_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035309,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "hared_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035310,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buf",
        "fer.shared_block_column_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035311,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buff",
        "er.shared_block_column_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035312,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.shared_block_column_major_matrix_column_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035313,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sha",
        "red_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035314,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.shar",
        "ed_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035315,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.sh",
        "ared_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035316,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_bloc",
        "k_buffer.packed_block_row_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035317,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.packed_block_row_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035318,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".packed_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035319,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "packed_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035320,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.packed_block_row_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035321,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_row_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035322,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "packed_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035323,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.p",
        "acked_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035324,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.packed_block_row_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035325,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_row_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035326,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "packed_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035327,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.p",
        "acked_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035328,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_row_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035329,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.packed_block_row_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035330,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pa",
        "cked_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035331,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pac",
        "ked_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035332,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.packed_block_column_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035333,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_column_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035334,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "packed_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035335,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.p",
        "acked_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035336,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_column_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035337,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.packed_block_column_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035338,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pa",
        "cked_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035339,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pac",
        "ked_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035340,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.packed_block_column_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035341,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.packed_block_column_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035342,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pa",
        "cked_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035343,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pac",
        "ked_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035344,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buf",
        "fer.packed_block_column_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035345,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buff",
        "er.packed_block_column_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035346,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pac",
        "ked_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035347,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.pack",
        "ed_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035348,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_bloc",
        "k_buffer.std140_block_row_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035349,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.std140_block_row_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035350,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_blo",
        "ck_buffer.std140_block_row_major_matrix_row_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035351,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035352,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035353,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffe",
        "r.std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035354,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_row_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035355,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_row_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035356,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.std140_block_row_major_matrix_row_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035357,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "std140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035358,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035359,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".std140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035360,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_row_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035361,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_row_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035362,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.std140_block_row_major_matrix_column_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035363,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "std140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035364,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035365,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".std140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035366,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_row_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035367,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.std140_block_row_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035368,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_row_major_matrix_column_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035369,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.st",
        "d140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035370,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.std",
        "140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035371,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035372,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_column_major_matrix_row_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035373,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_column_major_matrix_row_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035374,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block",
        "_buffer.std140_block_column_major_matrix_row_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035375,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.",
        "std140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035376,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035377,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer",
        ".std140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035378,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_column_major_matrix_row_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035379,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.std140_block_column_major_matrix_row_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035380,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_column_major_matrix_row_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035381,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.st",
        "d140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035382,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.std",
        "140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035383,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035384,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_b",
        "uffer.std140_block_column_major_matrix_column_major_matrixarray_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035385,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.std140_block_column_major_matrix_column_major_matrixarray_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035386,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_",
        "buffer.std140_block_column_major_matrix_column_major_matrixarray_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035387,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.st",
        "d140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035388,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.std",
        "140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035389,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.s",
        "td140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035390,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buf",
        "fer.std140_block_column_major_matrix_column_major_matrixarray_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035391,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buff",
        "er.std140_block_column_major_matrix_column_major_matrixarray_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035392,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_bu",
        "ffer.std140_block_column_major_matrix_column_major_matrixarray_column_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035393,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.std",
        "140_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035394,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.std1",
        "40_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035395,
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.per_block_buffer.st",
        "d140_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both");

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
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008326,
        "dEQP-GLES31.functional.tessellation.user_defin",
        "ed_io.negative.es32.per_patch_array_of_structs");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008327,
        "dEQP-GLES31.functional.tessellation.user_defined_i",
        "o.negative.es32.per_patch_structs_containing_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008328,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negative.",
        "es32.per_vertex_incorrect_control_explicit_output_array_size_1");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008329,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negative.",
        "es32.per_vertex_incorrect_control_explicit_output_array_size_2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008330,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negative.",
        "es32.per_vertex_incorrect_control_explicit_output_array_size_3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008331,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negati",
        "ve.es32.per_vertex_incorrect_eval_explicit_input_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018263,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es32.duplicate_location_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018264,
        "dEQP-GLES31.functional.uniform_location.",
        "negative.es32.duplicate_location_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018265,
        "dEQP-GLES31.functional.uniform_location.neg",
        "ative.es32.duplicate_location_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018266,
        "dEQP-GLES31.functional.uniform_location.nega",
        "tive.es32.duplicate_location_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018267,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es32.duplicate_location_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018268,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es32.array_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018269,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es32.array_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018270,
        "dEQP-GLES31.functional.uniform_location.",
        "negative.es32.array_overlap_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018271,
        "dEQP-GLES31.functional.uniform_location.n",
        "egative.es32.array_overlap_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018272,
        "dEQP-GLES31.functional.uniform_locat",
        "ion.negative.es32.array_overlap_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018273,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es32.struct_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018274,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es32.struct_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018275,
        "dEQP-GLES31.functional.uniform_location.n",
        "egative.es32.struct_overlap_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018276,
        "dEQP-GLES31.functional.uniform_location.ne",
        "gative.es32.struct_overlap_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018277,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es32.struct_overlap_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018278,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es32.complex_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018279,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es32.complex_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018280,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.negative.es32.atomic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018281,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.negative.es32.atomic_fragment");

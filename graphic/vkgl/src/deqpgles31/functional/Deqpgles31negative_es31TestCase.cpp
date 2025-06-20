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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008321,
        "dEQP-GLES31.functional.tessellation.user_defin",
        "ed_io.negative.es31.per_patch_array_of_structs");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008322,
        "dEQP-GLES31.functional.tessellation.user_defined_i",
        "o.negative.es31.per_patch_structs_containing_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008323,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negative.",
        "es31.per_vertex_incorrect_control_explicit_output_array_size_2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008324,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negative.",
        "es31.per_vertex_incorrect_control_explicit_output_array_size_3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008325,
        "dEQP-GLES31.functional.tessellation.user_defined_io.negati",
        "ve.es31.per_vertex_incorrect_eval_explicit_input_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018244,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es31.duplicate_location_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018245,
        "dEQP-GLES31.functional.uniform_location.",
        "negative.es31.duplicate_location_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018246,
        "dEQP-GLES31.functional.uniform_location.neg",
        "ative.es31.duplicate_location_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018247,
        "dEQP-GLES31.functional.uniform_location.nega",
        "tive.es31.duplicate_location_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018248,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es31.duplicate_location_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018249,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es31.array_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018250,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es31.array_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018251,
        "dEQP-GLES31.functional.uniform_location.",
        "negative.es31.array_overlap_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018252,
        "dEQP-GLES31.functional.uniform_location.n",
        "egative.es31.array_overlap_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018253,
        "dEQP-GLES31.functional.uniform_locat",
        "ion.negative.es31.array_overlap_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018254,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es31.struct_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018255,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es31.struct_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018256,
        "dEQP-GLES31.functional.uniform_location.n",
        "egative.es31.struct_overlap_unused_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018257,
        "dEQP-GLES31.functional.uniform_location.ne",
        "gative.es31.struct_overlap_unused_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018258,
        "dEQP-GLES31.functional.uniform_locati",
        "on.negative.es31.struct_overlap_split");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018259,
        "dEQP-GLES31.functional.uniform_locatio",
        "n.negative.es31.complex_overlap_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018260,
        "dEQP-GLES31.functional.uniform_location",
        ".negative.es31.complex_overlap_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018261,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.negative.es31.atomic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_018262,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.negative.es31.atomic_fragment");

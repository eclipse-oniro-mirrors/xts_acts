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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007976,
        "dEQP-GLES31.functional.tessellation.shade",
        "r_input_output.patch_vertices_5_in_10_out");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007977,
        "dEQP-GLES31.functional.tessellation.shade",
        "r_input_output.patch_vertices_10_in_5_out");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007978,
        "dEQP-GLES31.functional.tessellation.",
        "shader_input_output.primitive_id_tcs");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007979,
        "dEQP-GLES31.functional.tessellation.",
        "shader_input_output.primitive_id_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007980,
        "dEQP-GLES31.functional.tessellation.sh",
        "ader_input_output.patch_vertices_in_tcs");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007981,
        "dEQP-GLES31.functional.tessellation.sh",
        "ader_input_output.patch_vertices_in_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007982,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_inner_0_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007983,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_inner_1_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007984,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_outer_0_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007985,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_outer_1_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007986,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_outer_2_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007987,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.tess_level_outer_3_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007988,
        "dEQP-GLES31.functional.tessellation.sh",
        "ader_input_output.gl_position_vs_to_tcs");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007989,
        "dEQP-GLES31.functional.tessellation.sha",
        "der_input_output.gl_position_tcs_to_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007990,
        "dEQP-GLES31.functional.tessellation.shader",
        "_input_output.gl_position_vs_to_tcs_to_tes");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007991,
        "dEQP-GLES31.functional.tessella",
        "tion.shader_input_output.barrier");

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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017882,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es32.varying.missing_input");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017883,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es32.varying.missing_output");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017884,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es32.varying.mismatch_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017885,
        "dEQP-GLES31.functional.separate_shader.v",
        "alidation.es32.varying.mismatch_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017886,
        "dEQP-GLES31.functional.separate_shader.validati",
        "on.es32.varying.mismatch_explicit_location_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017887,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es32.varying.mismatch_explicit_location_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017888,
        "dEQP-GLES31.functional.separate_shader.valid",
        "ation.es32.varying.mismatch_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017889,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.varying.mismatch_implicit_explicit_location_1");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017890,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.varying.mismatch_implicit_explicit_location_2");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017891,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.varying.mismatch_implicit_explicit_location_3");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017892,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.varying.match_different_struct_names");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017893,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.varying.mismatch_struct_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017894,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.varying.mismatch_struct_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017895,
        "dEQP-GLES31.functional.separate_shader.validati",
        "on.es32.varying.mismatch_struct_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017896,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.varying.mismatch_struct_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017897,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.varying.mismatch_array_element_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017898,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es32.varying.mismatch_array_length");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017899,
        "dEQP-GLES31.functional.separate_shader.vali",
        "dation.es32.varying.mismatch_array_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017900,
        "dEQP-GLES31.functional.separate_shader.validation.es3",
        "2.varying.mismatch_qualifier_vertex_flat_fragment_none");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017901,
        "dEQP-GLES31.functional.separate_shader.validation.es32",
        ".varying.mismatch_qualifier_vertex_flat_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017902,
        "dEQP-GLES31.functional.separate_shader.validation.es32.",
        "varying.mismatch_qualifier_vertex_flat_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017903,
        "dEQP-GLES31.functional.separate_shader.validation.es32",
        ".varying.mismatch_qualifier_vertex_smooth_fragment_flat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017904,
        "dEQP-GLES31.functional.separate_shader.validation.es32.",
        "varying.mismatch_qualifier_vertex_centroid_fragment_flat");

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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017842,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es31.varying.missing_input");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017843,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es31.varying.missing_output");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017844,
        "dEQP-GLES31.functional.separate_shader",
        ".validation.es31.varying.mismatch_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017845,
        "dEQP-GLES31.functional.separate_shader.v",
        "alidation.es31.varying.mismatch_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017846,
        "dEQP-GLES31.functional.separate_shader.validati",
        "on.es31.varying.mismatch_explicit_location_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017847,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es31.varying.mismatch_explicit_location_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017848,
        "dEQP-GLES31.functional.separate_shader.valid",
        "ation.es31.varying.mismatch_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017849,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.varying.mismatch_implicit_explicit_location_1");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017850,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.varying.mismatch_implicit_explicit_location_2");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017851,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.varying.mismatch_implicit_explicit_location_3");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017852,
        "dEQP-GLES31.functional.separate_shader.validati",
        "on.es31.varying.mismatch_different_struct_names");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017853,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.varying.mismatch_struct_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017854,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.varying.mismatch_struct_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017855,
        "dEQP-GLES31.functional.separate_shader.validati",
        "on.es31.varying.mismatch_struct_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017856,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.varying.mismatch_struct_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017857,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.varying.mismatch_array_element_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017858,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es31.varying.mismatch_array_length");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017859,
        "dEQP-GLES31.functional.separate_shader.vali",
        "dation.es31.varying.mismatch_array_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017860,
        "dEQP-GLES31.functional.separate_shader.validation.es3",
        "1.varying.mismatch_qualifier_vertex_flat_fragment_none");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017861,
        "dEQP-GLES31.functional.separate_shader.validation.es31",
        ".varying.mismatch_qualifier_vertex_flat_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017862,
        "dEQP-GLES31.functional.separate_shader.validation.es31.",
        "varying.mismatch_qualifier_vertex_flat_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017863,
        "dEQP-GLES31.functional.separate_shader.validation.es31",
        ".varying.mismatch_qualifier_vertex_smooth_fragment_flat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017864,
        "dEQP-GLES31.functional.separate_shader.validation.es31.",
        "varying.mismatch_qualifier_vertex_centroid_fragment_flat");

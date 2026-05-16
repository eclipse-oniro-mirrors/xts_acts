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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001477,
        "dEQP-GLES3.functional.shaders.link",
        "age.varying.rules.fragment_declare");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001478,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.varying.rules.vertex_declare");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001479,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.rules.both_declare");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001480,
        "dEQP-GLES3.functional.shaders.linkage.v",
        "arying.rules.vertex_declare_fragment_use");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001481,
        "dEQP-GLES3.functional.shaders.linkage.v",
        "arying.rules.vertex_use_fragment_declare");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001482,
        "dEQP-GLES3.functional.shaders.linkage.v",
        "arying.rules.vertex_use_declare_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001483,
        "dEQP-GLES3.functional.shaders.linkage",
        ".varying.rules.vertex_use_fragment_use");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001484,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.varying.rules.differing_precision_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001485,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.varying.rules.differing_precision_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001486,
        "dEQP-GLES3.functional.shaders.linkag",
        "e.varying.rules.differing_precision_3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001487,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.varying.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001488,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.varying.rules.type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001489,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.varying.rules.type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001490,
        "dEQP-GLES3.functional.shaders.linkage",
        ".varying.rules.struct_type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001491,
        "dEQP-GLES3.functional.shaders.linkage",
        ".varying.rules.struct_type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001492,
        "dEQP-GLES3.functional.shaders.linkage",
        ".varying.rules.struct_type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001493,
        "dEQP-GLES3.functional.shaders.linkage.",
        "varying.rules.interpolation_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001494,
        "dEQP-GLES3.functional.shaders.linkage.",
        "varying.rules.differing_interpolation_2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001495,
        "dEQP-GLES3.functional.shaders.lin",
        "kage.varying.rules.illegal_usage_1");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001496,
        "dEQP-GLES3.functional.shaders.link",
        "age.varying.rules.invalid_type_int");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001497,
        "dEQP-GLES3.functional.shaders.link",
        "age.varying.rules.invalid_type_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001498,
        "dEQP-GLES3.functional.shaders.link",
        "age.varying.rules.invalid_type_bool");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001499,
        "dEQP-GLES3.functional.shaders.linkage.",
        "varying.rules.invalid_type_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001500,
        "dEQP-GLES3.functional.shaders.linkage.v",
        "arying.rules.invalid_type_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001501,
        "dEQP-GLES3.functional.shaders.linkage.",
        "varying.rules.invalid_type_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001502,
        "dEQP-GLES3.functional.shaders.linkage.",
        "varying.rules.invalid_type_array_array");

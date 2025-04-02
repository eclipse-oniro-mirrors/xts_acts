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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004493,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.geometry.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004494,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.geometry.uniform.rules.type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004495,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.geometry.uniform.rules.type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004496,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.geometry.uniform.rules.precision_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004497,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".geometry.uniform.rules.struct_partial_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004580,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004581,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.uniform.rules.type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004582,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.uniform.rules.type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004583,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.uniform.rules.type_mismatch_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004584,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation.uniform.rules.type_mismatch_5");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004585,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.uniform.rules.precision_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004586,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.uniform.rules.precision_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004587,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation.uniform.rules.struct_partial_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004647,
        "dEQP-GLES31.functional.shaders.linkage.es31.tes",
        "sellation_geometry.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004648,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation_geometry.uniform.rules.precision_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004649,
        "dEQP-GLES31.functional.shaders.linkage.es31.tessel",
        "lation_geometry.uniform.rules.struct_partial_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004764,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.geometry.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004765,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.geometry.uniform.rules.type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004766,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.geometry.uniform.rules.type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004767,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.geometry.uniform.rules.precision_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004768,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".geometry.uniform.rules.struct_partial_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004846,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004847,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.uniform.rules.type_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004848,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.uniform.rules.type_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004849,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.uniform.rules.type_mismatch_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004850,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation.uniform.rules.type_mismatch_5");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004851,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.uniform.rules.precision_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004852,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.uniform.rules.precision_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004853,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation.uniform.rules.struct_partial_usage");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004907,
        "dEQP-GLES31.functional.shaders.linkage.es32.tes",
        "sellation_geometry.uniform.rules.type_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004908,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation_geometry.uniform.rules.precision_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004909,
        "dEQP-GLES31.functional.shaders.linkage.es32.tessel",
        "lation_geometry.uniform.rules.struct_partial_usage");

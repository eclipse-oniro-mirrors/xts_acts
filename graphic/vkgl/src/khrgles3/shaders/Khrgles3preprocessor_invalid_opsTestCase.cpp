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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001060,
        "KHR-GLES3.shaders.preprocessor.",
        "invalid_ops.invalid_op_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001061,
        "KHR-GLES3.shaders.preprocessor.i",
        "nvalid_ops.invalid_op_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001062,
        "KHR-GLES3.shaders.preprocessor.",
        "invalid_ops.invalid_op_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001063,
        "KHR-GLES3.shaders.preprocessor.i",
        "nvalid_ops.invalid_op_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001064,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.",
        "invalid_defined_expected_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001065,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001066,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.",
        "invalid_defined_expected_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001067,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001068,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.",
        "invalid_defined_expected_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001069,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001070,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.",
        "invalid_defined_expected_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001071,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001072,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.",
        "invalid_defined_expected_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001073,
        "KHR-GLES3.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001074,
        "KHR-GLES3.shaders.preprocessor.invalid_o",
        "ps.invalid_defined_expected_rparen_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001075,
        "KHR-GLES3.shaders.preprocessor.invalid_op",
        "s.invalid_defined_expected_rparen_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001076,
        "KHR-GLES3.shaders.preprocessor.i",
        "nvalid_ops.defined_define_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001077,
        "KHR-GLES3.shaders.preprocessor.in",
        "valid_ops.defined_define_fragment");

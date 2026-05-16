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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005477,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.greater.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005478,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.greater.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005479,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.greater.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005480,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.greater.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005481,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.greater.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005482,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.greater.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006511,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.greater.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006512,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.greater.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006513,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.greater.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006514,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.greater.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006515,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.greater.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006516,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.greater.uint_to_float_fragment");

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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005549,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.greater.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005550,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.greater.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005551,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.greater.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005552,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.greater.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005553,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.greater.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005554,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.literal_before_input.greater.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006583,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.greater.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006584,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.greater.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006585,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.greater.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006586,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.greater.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006587,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.greater.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006588,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.literal_before_input.greater.uint_to_float_fragment");

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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004910,
        "dEQP-GLES3.functional.shaders.qualification_order.p",
        "arameters.invalid.storage_precision_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004911,
        "dEQP-GLES3.functional.shaders.qualification_order.pa",
        "rameters.invalid.storage_precision_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004912,
        "dEQP-GLES3.functional.shaders.qualification_order.p",
        "arameters.invalid.parameter_storage_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004913,
        "dEQP-GLES3.functional.shaders.qualification_order.pa",
        "rameters.invalid.parameter_storage_precision_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004914,
        "dEQP-GLES3.functional.shaders.qualification_order.p",
        "arameters.invalid.parameter_precision_storage_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004915,
        "dEQP-GLES3.functional.shaders.qualification_order.pa",
        "rameters.invalid.parameter_precision_storage_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004916,
        "dEQP-GLES3.functional.shaders.qualification_order.p",
        "arameters.invalid.precision_storage_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004917,
        "dEQP-GLES3.functional.shaders.qualification_order.pa",
        "rameters.invalid.precision_storage_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004918,
        "dEQP-GLES3.functional.shaders.qualification_order.p",
        "arameters.invalid.precision_parameter_storage_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004919,
        "dEQP-GLES3.functional.shaders.qualification_order.pa",
        "rameters.invalid.precision_parameter_storage_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004920,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.parameters.invalid.parameter_storage_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004921,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.parameters.invalid.parameter_storage_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004922,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.parameters.invalid.precision_storage_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004923,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.parameters.invalid.precision_storage_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004924,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.parameters.invalid.precision_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004925,
        "dEQP-GLES3.functional.shaders.qualification_orde",
        "r.parameters.invalid.precision_parameter_fragment");

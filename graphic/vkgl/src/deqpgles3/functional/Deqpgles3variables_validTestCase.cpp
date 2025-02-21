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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004847,
        "dEQP-GLES3.functional.shaders.qualification_order.",
        "variables.valid.invariant_interp_storage_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004848,
        "dEQP-GLES3.functional.shaders.qualification_o",
        "rder.variables.valid.interp_storage_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004849,
        "dEQP-GLES3.functional.shaders.qualification_o",
        "rder.variables.valid.invariant_interp_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004850,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.valid.invariant_storage_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004851,
        "dEQP-GLES3.functional.shaders.qualificati",
        "on_order.variables.valid.storage_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004852,
        "dEQP-GLES3.functional.shaders.qualificat",
        "ion_order.variables.valid.interp_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004853,
        "dEQP-GLES3.functional.shaders.qualificati",
        "on_order.variables.valid.invariant_storage");

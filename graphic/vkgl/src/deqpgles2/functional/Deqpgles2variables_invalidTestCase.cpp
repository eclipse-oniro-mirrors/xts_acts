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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002374,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.variables.invalid.invariant_precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002375,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.variables.invalid.storage_invariant_precision");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002376,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.variables.invalid.storage_precision_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002377,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.variables.invalid.precision_invariant_storage");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002378,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.variables.invalid.precision_storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002379,
        "dEQP-GLES2.functional.shaders.qualificatio",
        "n_order.variables.invalid.precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002380,
        "dEQP-GLES2.functional.shaders.qualificatio",
        "n_order.variables.invalid.storage_invariant");

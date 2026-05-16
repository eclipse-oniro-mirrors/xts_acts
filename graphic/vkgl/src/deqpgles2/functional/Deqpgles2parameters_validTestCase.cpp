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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002381,
        "dEQP-GLES2.functional.shaders.qualification_order.",
        "parameters.valid.storage_parameter_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002382,
        "dEQP-GLES2.functional.shaders.qualification_order.p",
        "arameters.valid.storage_parameter_precision_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002383,
        "dEQP-GLES2.functional.shaders.qualification_o",
        "rder.parameters.valid.storage_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002384,
        "dEQP-GLES2.functional.shaders.qualification_or",
        "der.parameters.valid.storage_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002385,
        "dEQP-GLES2.functional.shaders.qualification_o",
        "rder.parameters.valid.storage_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002386,
        "dEQP-GLES2.functional.shaders.qualification_or",
        "der.parameters.valid.storage_precision_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002387,
        "dEQP-GLES2.functional.shaders.qualification_or",
        "der.parameters.valid.parameter_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002388,
        "dEQP-GLES2.functional.shaders.qualification_ord",
        "er.parameters.valid.parameter_precision_fragment");

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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043213,
        "dEQP-GLES3.functional.state",
        "_query.rbo.renderbuffer_size");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043214,
        "dEQP-GLES3.functional.state_query",
        ".rbo.renderbuffer_internal_format");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043215,
        "dEQP-GLES3.functional.state_query.r",
        "bo.renderbuffer_component_size_color");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043216,
        "dEQP-GLES3.functional.state_query.r",
        "bo.renderbuffer_component_size_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043217,
        "dEQP-GLES3.functional.state_q",
        "uery.rbo.renderbuffer_samples");

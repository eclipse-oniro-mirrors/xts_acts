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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004839,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.invalid_identifiers.gl_begin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004840,
        "dEQP-GLES3.functional.shaders.keywords",
        ".invalid_identifiers.gl_begin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004841,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.invalid_identifiers.digit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004842,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.invalid_identifiers.digit_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004843,
        "dEQP-GLES3.functional.shaders.keywords",
        ".invalid_identifiers.digit_begin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004844,
        "dEQP-GLES3.functional.shaders.keywords.",
        "invalid_identifiers.digit_begin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004845,
        "dEQP-GLES3.functional.shaders.keywords",
        ".invalid_identifiers.max_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004846,
        "dEQP-GLES3.functional.shaders.keywords.",
        "invalid_identifiers.max_length_fragment");

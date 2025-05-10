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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005035,
        "dEQP-GLES31.functional.shaders.h",
        "elper_invocation.value.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005036,
        "dEQP-GLES31.functional.shaders",
        ".helper_invocation.value.lines");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005037,
        "dEQP-GLES31.functional.shaders.h",
        "elper_invocation.value.wide_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005038,
        "dEQP-GLES31.functional.shaders",
        ".helper_invocation.value.points");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005039,
        "dEQP-GLES31.functional.shaders.he",
        "lper_invocation.value.wide_points");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005040,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.value.triangles_4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005041,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.value.lines_4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005042,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.value.wide_lines_4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005043,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.value.points_4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005044,
        "dEQP-GLES31.functional.shaders.helper_",
        "invocation.value.wide_points_4_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005045,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.value.triangles_8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005046,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.value.lines_8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005047,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.value.wide_lines_8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005048,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.value.points_8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005049,
        "dEQP-GLES31.functional.shaders.helper_",
        "invocation.value.wide_points_8_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005050,
        "dEQP-GLES31.functional.shaders.helper_",
        "invocation.value.triangles_max_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005051,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.value.lines_max_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005052,
        "dEQP-GLES31.functional.shaders.helper_",
        "invocation.value.wide_lines_max_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005053,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.value.points_max_samples");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005054,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.value.wide_points_max_samples");

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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007618,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.float_1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007619,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_64_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007620,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_1_64_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007621,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_1_1_64");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007622,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_128_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007623,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_1_128_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007624,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.float_13_2_4");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007625,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.vec4_1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007626,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.vec4_64_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007627,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.vec4_1_64_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007628,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.vec4_1_1_64");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007629,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.vec4_128_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007630,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.vec4_1_128_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007631,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.vec4_13_2_4");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007632,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.mat4_1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007633,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.mat4_64_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007634,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.mat4_1_64_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007635,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.mat4_1_1_64");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007636,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.mat4_128_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007637,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.work_group_size.mat4_1_128_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007638,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.work_group_size.mat4_13_2_4");

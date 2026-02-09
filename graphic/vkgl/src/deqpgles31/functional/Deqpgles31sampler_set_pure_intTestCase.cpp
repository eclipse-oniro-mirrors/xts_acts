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
#include "../ActsDeqpgles310016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015953,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_int.texture_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015954,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_int.texture_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015955,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_int.texture_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015956,
        "dEQP-GLES31.functional.state_query.sa",
        "mpler.set_pure_int.texture_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015957,
        "dEQP-GLES31.functional.state_query.sa",
        "mpler.set_pure_int.texture_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015958,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_int.texture_min_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015959,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_int.texture_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015960,
        "dEQP-GLES31.functional.state_query.sam",
        "pler.set_pure_int.texture_compare_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015961,
        "dEQP-GLES31.functional.state_query.sam",
        "pler.set_pure_int.texture_compare_func");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015962,
        "dEQP-GLES31.functional.state_query.sa",
        "mpler.set_pure_int.texture_srgb_decode");

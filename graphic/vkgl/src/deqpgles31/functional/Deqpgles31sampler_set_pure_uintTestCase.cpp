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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015963,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_uint.texture_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015964,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_uint.texture_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015965,
        "dEQP-GLES31.functional.state_query.",
        "sampler.set_pure_uint.texture_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015966,
        "dEQP-GLES31.functional.state_query.sa",
        "mpler.set_pure_uint.texture_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015967,
        "dEQP-GLES31.functional.state_query.sa",
        "mpler.set_pure_uint.texture_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015968,
        "dEQP-GLES31.functional.state_query.s",
        "ampler.set_pure_uint.texture_min_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015969,
        "dEQP-GLES31.functional.state_query.s",
        "ampler.set_pure_uint.texture_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015970,
        "dEQP-GLES31.functional.state_query.sam",
        "pler.set_pure_uint.texture_compare_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015971,
        "dEQP-GLES31.functional.state_query.sam",
        "pler.set_pure_uint.texture_compare_func");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015972,
        "dEQP-GLES31.functional.state_query.sam",
        "pler.set_pure_uint.texture_srgb_decode");

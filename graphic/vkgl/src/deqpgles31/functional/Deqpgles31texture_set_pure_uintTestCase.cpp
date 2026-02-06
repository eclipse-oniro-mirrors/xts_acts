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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015570,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_swizzle_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015571,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_swizzle_g");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015572,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_swizzle_b");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015573,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_swizzle_a");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015574,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_uint.texture_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015575,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_uint.texture_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015576,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_uint.texture_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015577,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015578,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015579,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_uint.texture_min_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015580,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_uint.texture_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015581,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_base_level");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015582,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.texture_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015583,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.set_pure_uint.texture_compare_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015584,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.set_pure_uint.texture_compare_func");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015585,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_uint.depth_stencil_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015586,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.set_pure_uint.texture_srgb_decode");

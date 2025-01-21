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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015553,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_int.texture_swizzle_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015554,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_int.texture_swizzle_g");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015555,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_int.texture_swizzle_b");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015556,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_int.texture_swizzle_a");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015557,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_int.texture_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015558,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_int.texture_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015559,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_int.texture_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015560,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_int.texture_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015561,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_int.texture_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015562,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_int.texture_min_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015563,
        "dEQP-GLES31.functional.state_query.",
        "texture.set_pure_int.texture_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015564,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_int.texture_base_level");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015565,
        "dEQP-GLES31.functional.state_query.t",
        "exture.set_pure_int.texture_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015566,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.set_pure_int.texture_compare_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015567,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.set_pure_int.texture_compare_func");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015568,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_int.depth_stencil_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015569,
        "dEQP-GLES31.functional.state_query.te",
        "xture.set_pure_int.texture_srgb_decode");

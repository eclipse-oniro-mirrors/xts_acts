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
#include "../ActsDeqpgles30024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023383,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023384,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_4x4_srgb.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023385,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023386,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023387,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023388,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023389,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023390,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023391,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "4x4_srgb.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023392,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023393,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "4x4_srgb.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023394,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023395,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023396,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023397,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "4x4_srgb.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023398,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023399,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "4x4_srgb.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023400,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_4x4_srgb.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023401,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023402,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "4x4_srgb.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023403,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023404,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023405,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023406,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023407,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023408,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023409,
        "dEQP-GLES3.functional.texture.wrap.astc_4x",
        "4_srgb.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023410,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023411,
        "dEQP-GLES3.functional.texture.wrap.astc_4x",
        "4_srgb.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023412,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023413,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023414,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023415,
        "dEQP-GLES3.functional.texture.wrap.astc_4x",
        "4_srgb.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023416,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023417,
        "dEQP-GLES3.functional.texture.wrap.astc_4x",
        "4_srgb.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023418,
        "dEQP-GLES3.functional.texture.wrap.astc_4",
        "x4_srgb.mirror_mirror_linear_not_divisible");

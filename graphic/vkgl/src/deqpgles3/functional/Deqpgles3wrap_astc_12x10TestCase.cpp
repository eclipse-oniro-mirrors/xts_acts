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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023311,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023312,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023313,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023314,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023315,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023316,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023317,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023318,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023319,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023320,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023321,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023322,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023323,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023324,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_12x10.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023325,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023326,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023327,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023328,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_12x10.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023329,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023330,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023331,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023332,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023333,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023334,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023335,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023336,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023337,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023338,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023339,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023340,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023341,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023342,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_12x10.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023343,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023344,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023345,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023346,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "12x10.mirror_mirror_linear_not_divisible");

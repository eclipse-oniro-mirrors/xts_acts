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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023275,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023276,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023277,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023278,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023279,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023280,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023281,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023282,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023283,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023284,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023285,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023286,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023287,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023288,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_10x10.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023289,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023290,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023291,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023292,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_10x10.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023293,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023294,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023295,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023296,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023297,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023298,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023299,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023300,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023301,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023302,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023303,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023304,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023305,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023306,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_10x10.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023307,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023308,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023309,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023310,
        "dEQP-GLES3.functional.texture.wrap.astc_",
        "10x10.mirror_mirror_linear_not_divisible");

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

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023023,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.clamp_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023024,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.clamp_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023025,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.clamp_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023026,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.clamp_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023027,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.clamp_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023028,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.clamp_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023029,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.repeat_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023030,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.repeat_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023031,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.repeat_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023032,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.repeat_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023033,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.repeat_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023034,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.repeat_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023035,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.mirror_clamp_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023036,
        "dEQP-GLES3.functional.texture.wrap.a",
        "stc_6x6.mirror_clamp_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023037,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.mirror_repeat_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023038,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.mirror_repeat_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023039,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.mirror_mirror_nearest_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023040,
        "dEQP-GLES3.functional.texture.wrap.as",
        "tc_6x6.mirror_mirror_linear_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023041,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.clamp_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023042,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.clamp_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023043,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.clamp_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023044,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.clamp_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023045,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.clamp_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023046,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.clamp_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023047,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.repeat_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023048,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.repeat_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023049,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.repeat_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023050,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.repeat_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023051,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.repeat_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023052,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.repeat_mirror_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023053,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.mirror_clamp_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023054,
        "dEQP-GLES3.functional.texture.wrap.ast",
        "c_6x6.mirror_clamp_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023055,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.mirror_repeat_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023056,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.mirror_repeat_linear_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023057,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.mirror_mirror_nearest_not_divisible");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023058,
        "dEQP-GLES3.functional.texture.wrap.astc",
        "_6x6.mirror_mirror_linear_not_divisible");

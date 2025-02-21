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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025592,
        "dEQP-GLES3.functional.texture.shadow.2d_ar",
        "ray.linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025593,
        "dEQP-GLES3.functional.texture.shadow.2d_ar",
        "ray.linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025594,
        "dEQP-GLES3.functional.texture.shadow.2d_a",
        "rray.linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025595,
        "dEQP-GLES3.functional.texture.shadow.2d_arr",
        "ay.linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025596,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025597,
        "dEQP-GLES3.functional.texture.shadow.2d_arr",
        "ay.linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025598,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d_array.linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025599,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025600,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d_array.linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025601,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025602,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025603,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025604,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025605,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025606,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d_array.linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025607,
        "dEQP-GLES3.functional.texture.shadow.2d_",
        "array.linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025608,
        "dEQP-GLES3.functional.texture.shadow.2d_",
        "array.linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025609,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025610,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025611,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025612,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025613,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025614,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025615,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d_array.linear.never_depth24_stencil8");

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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025568,
        "dEQP-GLES3.functional.texture.shadow.2d_ar",
        "ray.nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025569,
        "dEQP-GLES3.functional.texture.shadow.2d_arr",
        "ay.nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025570,
        "dEQP-GLES3.functional.texture.shadow.2d_ar",
        "ray.nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025571,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025572,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025573,
        "dEQP-GLES3.functional.texture.shadow.2d_arr",
        "ay.nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025574,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025575,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025576,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d_array.nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025577,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025578,
        "dEQP-GLES3.functional.texture.shadow.2d_",
        "array.nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025579,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025580,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025581,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025582,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025583,
        "dEQP-GLES3.functional.texture.shadow.2d_",
        "array.nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025584,
        "dEQP-GLES3.functional.texture.shadow.2d_a",
        "rray.nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025585,
        "dEQP-GLES3.functional.texture.shadow.2d_",
        "array.nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025586,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025587,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025588,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025589,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025590,
        "dEQP-GLES3.functional.texture.shadow.2d",
        "_array.nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025591,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d_array.nearest.never_depth24_stencil8");

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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025640,
        "dEQP-GLES3.functional.texture.shadow.2d_array.lin",
        "ear_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025641,
        "dEQP-GLES3.functional.texture.shadow.2d_array.line",
        "ar_mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025642,
        "dEQP-GLES3.functional.texture.shadow.2d_array.lin",
        "ear_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025643,
        "dEQP-GLES3.functional.texture.shadow.2d_array.linea",
        "r_mipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025644,
        "dEQP-GLES3.functional.texture.shadow.2d_array.linea",
        "r_mipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025645,
        "dEQP-GLES3.functional.texture.shadow.2d_array.line",
        "ar_mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025646,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025647,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025648,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025649,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025650,
        "dEQP-GLES3.functional.texture.shadow.2d_array.l",
        "inear_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025651,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025652,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025653,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025654,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025655,
        "dEQP-GLES3.functional.texture.shadow.2d_array.l",
        "inear_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025656,
        "dEQP-GLES3.functional.texture.shadow.2d_array.li",
        "near_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025657,
        "dEQP-GLES3.functional.texture.shadow.2d_array.l",
        "inear_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025658,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025659,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025660,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025661,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025662,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025663,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_nearest.never_depth24_stencil8");

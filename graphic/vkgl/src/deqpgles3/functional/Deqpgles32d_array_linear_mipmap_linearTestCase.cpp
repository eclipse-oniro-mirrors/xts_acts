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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025688,
        "dEQP-GLES3.functional.texture.shadow.2d_array.lin",
        "ear_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025689,
        "dEQP-GLES3.functional.texture.shadow.2d_array.lin",
        "ear_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025690,
        "dEQP-GLES3.functional.texture.shadow.2d_array.li",
        "near_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025691,
        "dEQP-GLES3.functional.texture.shadow.2d_array.line",
        "ar_mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025692,
        "dEQP-GLES3.functional.texture.shadow.2d_array.linea",
        "r_mipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025693,
        "dEQP-GLES3.functional.texture.shadow.2d_array.line",
        "ar_mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025694,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025695,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025696,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025697,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025698,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025699,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025700,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025701,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025702,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025703,
        "dEQP-GLES3.functional.texture.shadow.2d_array.l",
        "inear_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025704,
        "dEQP-GLES3.functional.texture.shadow.2d_array.l",
        "inear_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025705,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025706,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025707,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "linear_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025708,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025709,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025710,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".linear_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025711,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.linear_mipmap_linear.never_depth24_stencil8");

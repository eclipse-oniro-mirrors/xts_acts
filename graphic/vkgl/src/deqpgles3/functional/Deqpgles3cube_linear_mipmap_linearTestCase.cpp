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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025544,
        "dEQP-GLES3.functional.texture.shadow.cube.linea",
        "r_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025545,
        "dEQP-GLES3.functional.texture.shadow.cube.linea",
        "r_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025546,
        "dEQP-GLES3.functional.texture.shadow.cube.line",
        "ar_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025547,
        "dEQP-GLES3.functional.texture.shadow.cube.linear",
        "_mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025548,
        "dEQP-GLES3.functional.texture.shadow.cube.linear_",
        "mipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025549,
        "dEQP-GLES3.functional.texture.shadow.cube.linear",
        "_mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025550,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025551,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025552,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025553,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025554,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025555,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025556,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025557,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025558,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025559,
        "dEQP-GLES3.functional.texture.shadow.cube.lin",
        "ear_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025560,
        "dEQP-GLES3.functional.texture.shadow.cube.lin",
        "ear_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025561,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025562,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025563,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025564,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025565,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025566,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025567,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear_mipmap_linear.never_depth24_stencil8");

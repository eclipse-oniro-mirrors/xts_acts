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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025496,
        "dEQP-GLES3.functional.texture.shadow.cube.linea",
        "r_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025497,
        "dEQP-GLES3.functional.texture.shadow.cube.linear",
        "_mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025498,
        "dEQP-GLES3.functional.texture.shadow.cube.linea",
        "r_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025499,
        "dEQP-GLES3.functional.texture.shadow.cube.linear_",
        "mipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025500,
        "dEQP-GLES3.functional.texture.shadow.cube.linear_",
        "mipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025501,
        "dEQP-GLES3.functional.texture.shadow.cube.linear",
        "_mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025502,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025503,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025504,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025505,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025506,
        "dEQP-GLES3.functional.texture.shadow.cube.lin",
        "ear_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025507,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025508,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025509,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025510,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025511,
        "dEQP-GLES3.functional.texture.shadow.cube.lin",
        "ear_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025512,
        "dEQP-GLES3.functional.texture.shadow.cube.line",
        "ar_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025513,
        "dEQP-GLES3.functional.texture.shadow.cube.lin",
        "ear_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025514,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025515,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025516,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025517,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025518,
        "dEQP-GLES3.functional.texture.shadow.cube.li",
        "near_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025519,
        "dEQP-GLES3.functional.texture.shadow.cube.l",
        "inear_mipmap_nearest.never_depth24_stencil8");

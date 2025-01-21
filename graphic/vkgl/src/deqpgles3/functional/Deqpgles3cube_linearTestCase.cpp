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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025448,
        "dEQP-GLES3.functional.texture.shadow.cub",
        "e.linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025449,
        "dEQP-GLES3.functional.texture.shadow.cub",
        "e.linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025450,
        "dEQP-GLES3.functional.texture.shadow.cu",
        "be.linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025451,
        "dEQP-GLES3.functional.texture.shadow.cube",
        ".linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025452,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025453,
        "dEQP-GLES3.functional.texture.shadow.cube",
        ".linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025454,
        "dEQP-GLES3.functional.texture.shado",
        "w.cube.linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025455,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025456,
        "dEQP-GLES3.functional.texture.shado",
        "w.cube.linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025457,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025458,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025459,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025460,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025461,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025462,
        "dEQP-GLES3.functional.texture.shado",
        "w.cube.linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025463,
        "dEQP-GLES3.functional.texture.shadow.c",
        "ube.linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025464,
        "dEQP-GLES3.functional.texture.shadow.c",
        "ube.linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025465,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025466,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025467,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025468,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025469,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025470,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025471,
        "dEQP-GLES3.functional.texture.shado",
        "w.cube.linear.never_depth24_stencil8");

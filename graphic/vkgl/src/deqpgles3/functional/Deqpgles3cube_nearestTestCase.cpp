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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025424,
        "dEQP-GLES3.functional.texture.shadow.cub",
        "e.nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025425,
        "dEQP-GLES3.functional.texture.shadow.cube",
        ".nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025426,
        "dEQP-GLES3.functional.texture.shadow.cub",
        "e.nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025427,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025428,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025429,
        "dEQP-GLES3.functional.texture.shadow.cube",
        ".nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025430,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025431,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025432,
        "dEQP-GLES3.functional.texture.shado",
        "w.cube.nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025433,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025434,
        "dEQP-GLES3.functional.texture.shadow.c",
        "ube.nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025435,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025436,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025437,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025438,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025439,
        "dEQP-GLES3.functional.texture.shadow.c",
        "ube.nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025440,
        "dEQP-GLES3.functional.texture.shadow.cu",
        "be.nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025441,
        "dEQP-GLES3.functional.texture.shadow.c",
        "ube.nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025442,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025443,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025444,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025445,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025446,
        "dEQP-GLES3.functional.texture.shadow.",
        "cube.nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025447,
        "dEQP-GLES3.functional.texture.shadow",
        ".cube.nearest.never_depth24_stencil8");

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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025472,
        "dEQP-GLES3.functional.texture.shadow.cube.neares",
        "t_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025473,
        "dEQP-GLES3.functional.texture.shadow.cube.neares",
        "t_mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025474,
        "dEQP-GLES3.functional.texture.shadow.cube.neare",
        "st_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025475,
        "dEQP-GLES3.functional.texture.shadow.cube.nearest",
        "_mipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025476,
        "dEQP-GLES3.functional.texture.shadow.cube.nearest_",
        "mipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025477,
        "dEQP-GLES3.functional.texture.shadow.cube.nearest",
        "_mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025478,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025479,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025480,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025481,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025482,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025483,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025484,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025485,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025486,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025487,
        "dEQP-GLES3.functional.texture.shadow.cube.near",
        "est_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025488,
        "dEQP-GLES3.functional.texture.shadow.cube.near",
        "est_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025489,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025490,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025491,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025492,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025493,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025494,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025495,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_nearest.never_depth24_stencil8");

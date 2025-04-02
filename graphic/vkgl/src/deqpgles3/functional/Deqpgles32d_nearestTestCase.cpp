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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025280,
        "dEQP-GLES3.functional.texture.shadow.2d",
        ".nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025281,
        "dEQP-GLES3.functional.texture.shadow.2d.",
        "nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025282,
        "dEQP-GLES3.functional.texture.shadow.2d",
        ".nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025283,
        "dEQP-GLES3.functional.texture.shadow.2d.n",
        "earest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025284,
        "dEQP-GLES3.functional.texture.shadow.2d.n",
        "earest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025285,
        "dEQP-GLES3.functional.texture.shadow.2d.",
        "nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025286,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025287,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025288,
        "dEQP-GLES3.functional.texture.shad",
        "ow.2d.nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025289,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025290,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d.nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025291,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025292,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025293,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025294,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025295,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d.nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025296,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d.nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025297,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d.nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025298,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025299,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025300,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025301,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025302,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025303,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.nearest.never_depth24_stencil8");

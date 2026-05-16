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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025304,
        "dEQP-GLES3.functional.texture.shadow.2d",
        ".linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025305,
        "dEQP-GLES3.functional.texture.shadow.2d",
        ".linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025306,
        "dEQP-GLES3.functional.texture.shadow.2",
        "d.linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025307,
        "dEQP-GLES3.functional.texture.shadow.2d.",
        "linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025308,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025309,
        "dEQP-GLES3.functional.texture.shadow.2d.",
        "linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025310,
        "dEQP-GLES3.functional.texture.shad",
        "ow.2d.linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025311,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025312,
        "dEQP-GLES3.functional.texture.shad",
        "ow.2d.linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025313,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025314,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025315,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025316,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025317,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025318,
        "dEQP-GLES3.functional.texture.shad",
        "ow.2d.linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025319,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d.linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025320,
        "dEQP-GLES3.functional.texture.shadow.",
        "2d.linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025321,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025322,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025323,
        "dEQP-GLES3.functional.texture.shadow",
        ".2d.linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025324,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025325,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025326,
        "dEQP-GLES3.functional.texture.shado",
        "w.2d.linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025327,
        "dEQP-GLES3.functional.texture.shad",
        "ow.2d.linear.never_depth24_stencil8");

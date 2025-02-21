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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025328,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest",
        "_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025329,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest",
        "_mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025330,
        "dEQP-GLES3.functional.texture.shadow.2d.neares",
        "t_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025331,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest_",
        "mipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025332,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest_m",
        "ipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025333,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest_",
        "mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025334,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025335,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025336,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025337,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025338,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025339,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025340,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025341,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025342,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025343,
        "dEQP-GLES3.functional.texture.shadow.2d.neare",
        "st_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025344,
        "dEQP-GLES3.functional.texture.shadow.2d.neare",
        "st_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025345,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025346,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025347,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025348,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025349,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025350,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025351,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_nearest.never_depth24_stencil8");

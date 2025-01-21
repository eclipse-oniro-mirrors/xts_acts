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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025129,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025130,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.nearest_nearest_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025131,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.3d.basic.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025132,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.nearest_nearest_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025133,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.3d.basic.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025134,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.nearest_nearest_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025135,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025136,
        "dEQP-GLES3.functional.texture.mipma",
        "p.3d.basic.linear_nearest_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025137,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025138,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.linear_nearest_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025139,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025140,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.linear_nearest_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025141,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025142,
        "dEQP-GLES3.functional.texture.mipma",
        "p.3d.basic.nearest_linear_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025143,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025144,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.nearest_linear_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025145,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025146,
        "dEQP-GLES3.functional.texture.mipmap",
        ".3d.basic.nearest_linear_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025147,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.3d.basic.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025148,
        "dEQP-GLES3.functional.texture.mipma",
        "p.3d.basic.linear_linear_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025149,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025150,
        "dEQP-GLES3.functional.texture.mipma",
        "p.3d.basic.linear_linear_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025151,
        "dEQP-GLES3.functional.texture.mip",
        "map.3d.basic.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025152,
        "dEQP-GLES3.functional.texture.mipma",
        "p.3d.basic.linear_linear_mirror_npot");

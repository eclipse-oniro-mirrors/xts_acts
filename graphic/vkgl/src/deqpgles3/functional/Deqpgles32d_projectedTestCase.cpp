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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025011,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025012,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.projected.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025013,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.projected.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025014,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025015,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025016,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025017,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025018,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025019,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025020,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.projected.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025021,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025022,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.projected.linear_linear_mirror");

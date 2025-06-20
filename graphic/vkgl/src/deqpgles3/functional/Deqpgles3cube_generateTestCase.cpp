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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025099,
        "dEQP-GLES3.functional.texture.",
        "mipmap.cube.generate.a8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025100,
        "dEQP-GLES3.functional.texture.",
        "mipmap.cube.generate.a8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025101,
        "dEQP-GLES3.functional.texture.",
        "mipmap.cube.generate.l8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025102,
        "dEQP-GLES3.functional.texture.",
        "mipmap.cube.generate.l8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025103,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.cube.generate.la88_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025104,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.cube.generate.la88_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025105,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.cube.generate.rgb565_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025106,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.cube.generate.rgb565_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025107,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.cube.generate.rgb888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025108,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.cube.generate.rgb888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025109,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba4444_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025110,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba4444_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025111,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba5551_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025112,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba5551_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025113,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba8888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025114,
        "dEQP-GLES3.functional.texture.mip",
        "map.cube.generate.rgba8888_nicest");

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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010663,
        "dEQP-GLES2.functional.texture.",
        "mipmap.cube.generate.a8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010664,
        "dEQP-GLES2.functional.texture.",
        "mipmap.cube.generate.a8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010665,
        "dEQP-GLES2.functional.texture.",
        "mipmap.cube.generate.l8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010666,
        "dEQP-GLES2.functional.texture.",
        "mipmap.cube.generate.l8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010667,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.cube.generate.la88_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010668,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.cube.generate.la88_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010669,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.cube.generate.rgb565_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010670,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.cube.generate.rgb565_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010671,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.cube.generate.rgb888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010672,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.cube.generate.rgb888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010673,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba4444_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010674,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba4444_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010675,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba5551_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010676,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba5551_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010677,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba8888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010678,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.generate.rgba8888_nicest");

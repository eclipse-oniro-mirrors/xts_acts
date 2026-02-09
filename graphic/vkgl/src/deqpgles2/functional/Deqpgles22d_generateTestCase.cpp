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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010625,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.generate.a8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010626,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.generate.a8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010627,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.generate.a8_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010628,
        "dEQP-GLES2.functional.texture.mipm",
        "ap.2d.generate.a8_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010629,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.generate.l8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010630,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.generate.l8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010631,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.generate.l8_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010632,
        "dEQP-GLES2.functional.texture.mipm",
        "ap.2d.generate.l8_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010633,
        "dEQP-GLES2.functional.texture.",
        "mipmap.2d.generate.la88_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010634,
        "dEQP-GLES2.functional.texture.",
        "mipmap.2d.generate.la88_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010635,
        "dEQP-GLES2.functional.texture.mipmap",
        ".2d.generate.la88_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010636,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.generate.la88_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010637,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.2d.generate.rgb565_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010638,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.2d.generate.rgb565_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010639,
        "dEQP-GLES2.functional.texture.mipmap.",
        "2d.generate.rgb565_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010640,
        "dEQP-GLES2.functional.texture.mipmap",
        ".2d.generate.rgb565_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010641,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.2d.generate.rgb888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010642,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.2d.generate.rgb888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010643,
        "dEQP-GLES2.functional.texture.mipmap.",
        "2d.generate.rgb888_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010644,
        "dEQP-GLES2.functional.texture.mipmap",
        ".2d.generate.rgb888_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010645,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba4444_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010646,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba4444_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010647,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.generate.rgba4444_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010648,
        "dEQP-GLES2.functional.texture.mipmap.",
        "2d.generate.rgba4444_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010649,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba5551_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010650,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba5551_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010651,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.generate.rgba5551_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010652,
        "dEQP-GLES2.functional.texture.mipmap.",
        "2d.generate.rgba5551_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010653,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba8888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010654,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.generate.rgba8888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010655,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.generate.rgba8888_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010656,
        "dEQP-GLES2.functional.texture.mipmap.",
        "2d.generate.rgba8888_non_square_nicest");

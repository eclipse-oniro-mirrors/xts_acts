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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010298,
        "dEQP-GLES2.functional.te",
        "xture.size.cube.15x15_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010299,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.15x15_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010300,
        "dEQP-GLES2.functional.text",
        "ure.size.cube.15x15_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010301,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.15x15_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010302,
        "dEQP-GLES2.functional.te",
        "xture.size.cube.16x16_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010303,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.16x16_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010304,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.16x16_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010305,
        "dEQP-GLES2.functional.texture.",
        "size.cube.16x16_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010306,
        "dEQP-GLES2.functional.text",
        "ure.size.cube.16x16_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010307,
        "dEQP-GLES2.functional.texture",
        ".size.cube.16x16_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010308,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.16x16_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010309,
        "dEQP-GLES2.functional.texture.",
        "size.cube.16x16_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010310,
        "dEQP-GLES2.functional.te",
        "xture.size.cube.64x64_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010311,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.64x64_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010312,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.64x64_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010313,
        "dEQP-GLES2.functional.texture.",
        "size.cube.64x64_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010314,
        "dEQP-GLES2.functional.text",
        "ure.size.cube.64x64_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010315,
        "dEQP-GLES2.functional.texture",
        ".size.cube.64x64_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010316,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.64x64_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010317,
        "dEQP-GLES2.functional.texture.",
        "size.cube.64x64_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010318,
        "dEQP-GLES2.functional.tex",
        "ture.size.cube.128x128_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010319,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.128x128_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010320,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.128x128_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010321,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.128x128_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010322,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.128x128_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010323,
        "dEQP-GLES2.functional.texture.",
        "size.cube.128x128_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010324,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.128x128_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010325,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.128x128_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010326,
        "dEQP-GLES2.functional.tex",
        "ture.size.cube.256x256_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010327,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.256x256_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010328,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.256x256_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010329,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.256x256_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010330,
        "dEQP-GLES2.functional.texture.",
        "size.cube.256x256_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010331,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.256x256_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010332,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.256x256_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010333,
        "dEQP-GLES2.functional.tex",
        "ture.size.cube.512x512_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010334,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.512x512_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010335,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.512x512_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010336,
        "dEQP-GLES2.functional.textu",
        "re.size.cube.512x512_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010337,
        "dEQP-GLES2.functional.texture.",
        "size.cube.512x512_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010338,
        "dEQP-GLES2.functional.textur",
        "e.size.cube.512x512_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010339,
        "dEQP-GLES2.functional.texture.s",
        "ize.cube.512x512_rgba8888_mipmap");

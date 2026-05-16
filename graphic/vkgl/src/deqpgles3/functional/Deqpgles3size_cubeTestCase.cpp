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
#include "../ActsDeqpgles30023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022405,
        "dEQP-GLES3.functional.te",
        "xture.size.cube.15x15_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022406,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.15x15_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022407,
        "dEQP-GLES3.functional.text",
        "ure.size.cube.15x15_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022408,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.15x15_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022409,
        "dEQP-GLES3.functional.te",
        "xture.size.cube.16x16_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022410,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.16x16_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022411,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.16x16_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022412,
        "dEQP-GLES3.functional.texture.",
        "size.cube.16x16_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022413,
        "dEQP-GLES3.functional.text",
        "ure.size.cube.16x16_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022414,
        "dEQP-GLES3.functional.texture",
        ".size.cube.16x16_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022415,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.16x16_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022416,
        "dEQP-GLES3.functional.texture.",
        "size.cube.16x16_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022417,
        "dEQP-GLES3.functional.te",
        "xture.size.cube.64x64_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022418,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.64x64_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022419,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.64x64_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022420,
        "dEQP-GLES3.functional.texture.",
        "size.cube.64x64_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022421,
        "dEQP-GLES3.functional.text",
        "ure.size.cube.64x64_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022422,
        "dEQP-GLES3.functional.texture",
        ".size.cube.64x64_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022423,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.64x64_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022424,
        "dEQP-GLES3.functional.texture.",
        "size.cube.64x64_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022425,
        "dEQP-GLES3.functional.tex",
        "ture.size.cube.128x128_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022426,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.128x128_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022427,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.128x128_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022428,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.128x128_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022429,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.128x128_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022430,
        "dEQP-GLES3.functional.texture.",
        "size.cube.128x128_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022431,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.128x128_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022432,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.128x128_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022433,
        "dEQP-GLES3.functional.tex",
        "ture.size.cube.256x256_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022434,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.256x256_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022435,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.256x256_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022436,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.256x256_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022437,
        "dEQP-GLES3.functional.texture.",
        "size.cube.256x256_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022438,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.256x256_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022439,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.256x256_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022440,
        "dEQP-GLES3.functional.tex",
        "ture.size.cube.512x512_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022441,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.512x512_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022442,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.512x512_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022443,
        "dEQP-GLES3.functional.textu",
        "re.size.cube.512x512_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022444,
        "dEQP-GLES3.functional.texture.",
        "size.cube.512x512_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022445,
        "dEQP-GLES3.functional.textur",
        "e.size.cube.512x512_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022446,
        "dEQP-GLES3.functional.texture.s",
        "ize.cube.512x512_rgba8888_mipmap");

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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022369,
        "dEQP-GLES3.functional.t",
        "exture.size.2d.64x64_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022370,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.64x64_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022371,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.64x64_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022372,
        "dEQP-GLES3.functional.texture",
        ".size.2d.64x64_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022373,
        "dEQP-GLES3.functional.tex",
        "ture.size.2d.64x64_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022374,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.64x64_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022375,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.64x64_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022376,
        "dEQP-GLES3.functional.texture",
        ".size.2d.64x64_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022377,
        "dEQP-GLES3.functional.t",
        "exture.size.2d.65x63_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022378,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.65x63_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022379,
        "dEQP-GLES3.functional.tex",
        "ture.size.2d.65x63_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022380,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.65x63_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022381,
        "dEQP-GLES3.functional.te",
        "xture.size.2d.512x512_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022382,
        "dEQP-GLES3.functional.textu",
        "re.size.2d.512x512_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022383,
        "dEQP-GLES3.functional.textu",
        "re.size.2d.512x512_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022384,
        "dEQP-GLES3.functional.texture.",
        "size.2d.512x512_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022385,
        "dEQP-GLES3.functional.text",
        "ure.size.2d.512x512_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022386,
        "dEQP-GLES3.functional.texture",
        ".size.2d.512x512_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022387,
        "dEQP-GLES3.functional.textu",
        "re.size.2d.512x512_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022388,
        "dEQP-GLES3.functional.texture.",
        "size.2d.512x512_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022389,
        "dEQP-GLES3.functional.tex",
        "ture.size.2d.1024x1024_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022390,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.1024x1024_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022391,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.1024x1024_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022392,
        "dEQP-GLES3.functional.texture.s",
        "ize.2d.1024x1024_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022393,
        "dEQP-GLES3.functional.textu",
        "re.size.2d.1024x1024_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022394,
        "dEQP-GLES3.functional.texture.",
        "size.2d.1024x1024_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022395,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.1024x1024_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022396,
        "dEQP-GLES3.functional.texture.s",
        "ize.2d.1024x1024_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022397,
        "dEQP-GLES3.functional.tex",
        "ture.size.2d.2048x2048_l8");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022398,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.2048x2048_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022399,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.2048x2048_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022400,
        "dEQP-GLES3.functional.texture.s",
        "ize.2d.2048x2048_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022401,
        "dEQP-GLES3.functional.textu",
        "re.size.2d.2048x2048_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022402,
        "dEQP-GLES3.functional.texture.",
        "size.2d.2048x2048_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022403,
        "dEQP-GLES3.functional.textur",
        "e.size.2d.2048x2048_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022404,
        "dEQP-GLES3.functional.texture.s",
        "ize.2d.2048x2048_rgba8888_mipmap");

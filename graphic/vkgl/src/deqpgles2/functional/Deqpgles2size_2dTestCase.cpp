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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010266,
        "dEQP-GLES2.functional.t",
        "exture.size.2d.64x64_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010267,
        "dEQP-GLES2.functional.text",
        "ure.size.2d.64x64_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010268,
        "dEQP-GLES2.functional.text",
        "ure.size.2d.64x64_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010269,
        "dEQP-GLES2.functional.texture",
        ".size.2d.64x64_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010270,
        "dEQP-GLES2.functional.tex",
        "ture.size.2d.64x64_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010271,
        "dEQP-GLES2.functional.textur",
        "e.size.2d.64x64_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010272,
        "dEQP-GLES2.functional.text",
        "ure.size.2d.64x64_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010273,
        "dEQP-GLES2.functional.texture",
        ".size.2d.64x64_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010274,
        "dEQP-GLES2.functional.t",
        "exture.size.2d.65x63_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010275,
        "dEQP-GLES2.functional.tex",
        "ture.size.2d.65x63_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010276,
        "dEQP-GLES2.functional.text",
        "ure.size.2d.65x63_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010277,
        "dEQP-GLES2.functional.te",
        "xture.size.2d.512x512_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010278,
        "dEQP-GLES2.functional.textu",
        "re.size.2d.512x512_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010279,
        "dEQP-GLES2.functional.texture.",
        "size.2d.512x512_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010280,
        "dEQP-GLES2.functional.text",
        "ure.size.2d.512x512_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010281,
        "dEQP-GLES2.functional.texture",
        ".size.2d.512x512_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010282,
        "dEQP-GLES2.functional.textu",
        "re.size.2d.512x512_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010283,
        "dEQP-GLES2.functional.texture.",
        "size.2d.512x512_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010284,
        "dEQP-GLES2.functional.tex",
        "ture.size.2d.1024x1024_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010285,
        "dEQP-GLES2.functional.textur",
        "e.size.2d.1024x1024_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010286,
        "dEQP-GLES2.functional.texture.s",
        "ize.2d.1024x1024_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010287,
        "dEQP-GLES2.functional.textu",
        "re.size.2d.1024x1024_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010288,
        "dEQP-GLES2.functional.texture.",
        "size.2d.1024x1024_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010289,
        "dEQP-GLES2.functional.textur",
        "e.size.2d.1024x1024_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010290,
        "dEQP-GLES2.functional.texture.s",
        "ize.2d.1024x1024_rgba8888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010291,
        "dEQP-GLES2.functional.tex",
        "ture.size.2d.2048x2048_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010292,
        "dEQP-GLES2.functional.textur",
        "e.size.2d.2048x2048_l8_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010293,
        "dEQP-GLES2.functional.texture.s",
        "ize.2d.2048x2048_rgba4444_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010294,
        "dEQP-GLES2.functional.textu",
        "re.size.2d.2048x2048_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010295,
        "dEQP-GLES2.functional.texture.",
        "size.2d.2048x2048_rgb888_mipmap");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010296,
        "dEQP-GLES2.functional.textur",
        "e.size.2d.2048x2048_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010297,
        "dEQP-GLES2.functional.texture.s",
        "ize.2d.2048x2048_rgba8888_mipmap");

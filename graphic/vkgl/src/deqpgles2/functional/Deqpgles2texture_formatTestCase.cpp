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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010230,
        "dEQP-GLES2.functional.t",
        "exture.format.a8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010231,
        "dEQP-GLES2.functional.t",
        "exture.format.a8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010232,
        "dEQP-GLES2.functional.te",
        "xture.format.a8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010233,
        "dEQP-GLES2.functional.te",
        "xture.format.a8_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010234,
        "dEQP-GLES2.functional.t",
        "exture.format.l8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010235,
        "dEQP-GLES2.functional.t",
        "exture.format.l8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010236,
        "dEQP-GLES2.functional.te",
        "xture.format.l8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010237,
        "dEQP-GLES2.functional.te",
        "xture.format.l8_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010238,
        "dEQP-GLES2.functional.te",
        "xture.format.la88_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010239,
        "dEQP-GLES2.functional.te",
        "xture.format.la88_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010240,
        "dEQP-GLES2.functional.tex",
        "ture.format.la88_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010241,
        "dEQP-GLES2.functional.tex",
        "ture.format.la88_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010242,
        "dEQP-GLES2.functional.tex",
        "ture.format.rgb565_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010243,
        "dEQP-GLES2.functional.tex",
        "ture.format.rgb565_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010244,
        "dEQP-GLES2.functional.text",
        "ure.format.rgb565_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010245,
        "dEQP-GLES2.functional.text",
        "ure.format.rgb565_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010246,
        "dEQP-GLES2.functional.tex",
        "ture.format.rgb888_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010247,
        "dEQP-GLES2.functional.tex",
        "ture.format.rgb888_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010248,
        "dEQP-GLES2.functional.text",
        "ure.format.rgb888_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010249,
        "dEQP-GLES2.functional.text",
        "ure.format.rgb888_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010250,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba4444_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010251,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba4444_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010252,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba4444_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010253,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba4444_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010254,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba5551_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010255,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba5551_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010256,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba5551_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010257,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba5551_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010258,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba8888_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010259,
        "dEQP-GLES2.functional.text",
        "ure.format.rgba8888_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010260,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba8888_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010261,
        "dEQP-GLES2.functional.textu",
        "re.format.rgba8888_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010262,
        "dEQP-GLES2.functional.te",
        "xture.format.etc1_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010263,
        "dEQP-GLES2.functional.te",
        "xture.format.etc1_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010264,
        "dEQP-GLES2.functional.tex",
        "ture.format.etc1_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010265,
        "dEQP-GLES2.functional.tex",
        "ture.format.etc1_cube_npot");

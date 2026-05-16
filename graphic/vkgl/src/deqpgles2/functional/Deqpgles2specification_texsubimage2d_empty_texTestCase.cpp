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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010785,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_empty_tex.a8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010786,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_empty_tex.a8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010787,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_empty_tex.l8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010788,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_empty_tex.l8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010789,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_empty_tex.la88_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010790,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.la88_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010791,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010792,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010793,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.rgb888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010794,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgb888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010795,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgba4444_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010796,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_empty_tex.rgba4444_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010797,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgba5551_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010798,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_empty_tex.rgba5551_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010799,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgba8888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010800,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_empty_tex.rgba8888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010801,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010802,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_empty_tex.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010803,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010804,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010805,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.la16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010806,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_empty_tex.la16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010807,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_empty_tex.l16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010808,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.l16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010809,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_empty_tex.a16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010810,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_empty_tex.a16f_cube");

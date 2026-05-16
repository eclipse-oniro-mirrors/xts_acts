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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010759,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_texsubimage2d.a8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010760,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_texsubimage2d.a8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010761,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_texsubimage2d.l8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010762,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_texsubimage2d.l8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010763,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_texsubimage2d.la88_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010764,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.la88_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010765,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010766,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010767,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010768,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010769,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba4444_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010770,
        "dEQP-GLES2.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba4444_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010771,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba5551_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010772,
        "dEQP-GLES2.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba5551_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010773,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba8888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010774,
        "dEQP-GLES2.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba8888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010775,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010776,
        "dEQP-GLES2.functional.texture.specific",
        "ation.basic_texsubimage2d.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010777,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010778,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010779,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.la16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010780,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_texsubimage2d.la16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010781,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_texsubimage2d.l16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010782,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.l16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010783,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_texsubimage2d.a16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010784,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_texsubimage2d.a16f_cube");

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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010679,
        "dEQP-GLES2.functional.texture.spe",
        "cification.basic_teximage2d.a8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010680,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.a8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010681,
        "dEQP-GLES2.functional.texture.spe",
        "cification.basic_teximage2d.l8_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010682,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.l8_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010683,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.la88_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010684,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.la88_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010685,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.rgb565_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010686,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgb565_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010687,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.rgb888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010688,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgb888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010689,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgba4444_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010690,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_teximage2d.rgba4444_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010691,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgba5551_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010692,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_teximage2d.rgba5551_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010693,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgba8888_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010694,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_teximage2d.rgba8888_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010695,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.rgba16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010696,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgba16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010697,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.rgb16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010698,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_teximage2d.rgb16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010699,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.la16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010700,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.la16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010701,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.l16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010702,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.l16f_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010703,
        "dEQP-GLES2.functional.texture.spec",
        "ification.basic_teximage2d.a16f_2d");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010704,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_teximage2d.a16f_cube");

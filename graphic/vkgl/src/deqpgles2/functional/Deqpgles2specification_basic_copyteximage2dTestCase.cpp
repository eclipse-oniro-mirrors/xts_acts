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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010851,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_copyteximage2d.2d_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010852,
        "dEQP-GLES2.functional.texture.specific",
        "ation.basic_copyteximage2d.2d_luminance");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010853,
        "dEQP-GLES2.functional.texture.specificati",
        "on.basic_copyteximage2d.2d_luminance_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010854,
        "dEQP-GLES2.functional.texture.speci",
        "fication.basic_copyteximage2d.2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010855,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_copyteximage2d.2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010856,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_copyteximage2d.cube_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010857,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.basic_copyteximage2d.cube_luminance");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010858,
        "dEQP-GLES2.functional.texture.specificatio",
        "n.basic_copyteximage2d.cube_luminance_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010859,
        "dEQP-GLES2.functional.texture.specif",
        "ication.basic_copyteximage2d.cube_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010860,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.basic_copyteximage2d.cube_rgba");

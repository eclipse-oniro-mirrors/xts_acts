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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012491,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.unsized.alpha_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012492,
        "dEQP-GLES31.functional.texture.fo",
        "rmat.unsized.alpha_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012493,
        "dEQP-GLES31.functional.texture.form",
        "at.unsized.luminance_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012494,
        "dEQP-GLES31.functional.texture.form",
        "at.unsized.luminance_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012495,
        "dEQP-GLES31.functional.texture.format.",
        "unsized.luminance_alpha_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012496,
        "dEQP-GLES31.functional.texture.format.",
        "unsized.luminance_alpha_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012497,
        "dEQP-GLES31.functional.texture.format.unsi",
        "zed.rgb_unsigned_short_5_6_5_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012498,
        "dEQP-GLES31.functional.texture.format.unsiz",
        "ed.rgb_unsigned_short_5_6_5_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012499,
        "dEQP-GLES31.functional.texture.format.u",
        "nsized.rgb_unsigned_byte_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012500,
        "dEQP-GLES31.functional.texture.format.u",
        "nsized.rgb_unsigned_byte_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012501,
        "dEQP-GLES31.functional.texture.format.unsize",
        "d.rgba_unsigned_short_4_4_4_4_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012502,
        "dEQP-GLES31.functional.texture.format.unsize",
        "d.rgba_unsigned_short_4_4_4_4_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012503,
        "dEQP-GLES31.functional.texture.format.unsize",
        "d.rgba_unsigned_short_5_5_5_1_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012504,
        "dEQP-GLES31.functional.texture.format.unsize",
        "d.rgba_unsigned_short_5_5_5_1_cube_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012505,
        "dEQP-GLES31.functional.texture.format.u",
        "nsized.rgba_unsigned_byte_cube_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012506,
        "dEQP-GLES31.functional.texture.format.un",
        "sized.rgba_unsigned_byte_cube_array_npot");

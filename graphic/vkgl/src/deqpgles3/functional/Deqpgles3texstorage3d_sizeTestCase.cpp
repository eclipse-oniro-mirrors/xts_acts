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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026933,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage3d.size.2d_array_1x1x1_1_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026934,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.texstorage3d.size.2d_array_2x2x2_2_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026935,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.size.2d_array_64x32x3_7_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026936,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.size.2d_array_32x64x3_4_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026937,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.size.2d_array_57x63x5_1_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026938,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.size.2d_array_57x63x5_2_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026939,
        "dEQP-GLES3.functional.texture.specification",
        ".texstorage3d.size.2d_array_57x63x5_6_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026940,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.size.3d_1x1x1_1_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026941,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texstorage3d.size.3d_2x2x2_2_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026942,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_64x32x16_7_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026943,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_32x64x16_4_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026944,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_32x16x64_4_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026945,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_57x63x11_1_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026946,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_57x63x11_2_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026947,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texstorage3d.size.3d_57x63x11_6_levels");

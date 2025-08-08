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
#include "../ActsDeqpgles310027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026020,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026021,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026022,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16f_rgba16i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026023,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026024,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026025,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16i.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026026,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_64_bits.rgba16f_rgba16i.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026027,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16f_rgba16i.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026028,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16i.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026029,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16i.texture3d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026030,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16f_rgba16i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026031,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_64_bits.rgba16f_rgba16i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026032,
        "dEQP-GLES31.functional.copy_image.non_compressed.v",
        "iewclass_64_bits.rgba16f_rgba16i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026033,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026034,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_64_bits.rgba16f_rgba16i.cubemap_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026035,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16i.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026036,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_64_bits.rgba16f_rgba16i.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026037,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_64_bits.rgba16f_rgba16i.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026038,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass",
        "_64_bits.rgba16f_rgba16i.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310027TestSuite, TestCase_026039,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_64_bits.rgba16f_rgba16i.texture2d_array_to_renderbuffer");

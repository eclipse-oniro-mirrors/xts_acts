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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025217,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es31.extension_directive.oes_sample_variables");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025218,
        "dEQP-GLES31.functional.android_extension_pack.shade",
        "rs.es31.extension_directive.oes_shader_image_atomic");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025219,
        "dEQP-GLES31.functional.android_extension_pack.shaders.es3",
        "1.extension_directive.oes_shader_multisample_interpolation");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025220,
        "dEQP-GLES31.functional.android_extension_pack.shaders.es31.",
        "extension_directive.oes_texture_storage_multisample_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025221,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es31.extension_directive.ext_geometry_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025222,
        "dEQP-GLES31.functional.android_extension_pack.s",
        "haders.es31.extension_directive.ext_gpu_shader5");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025223,
        "dEQP-GLES31.functional.android_extension_pack.shader",
        "s.es31.extension_directive.ext_primitive_bounding_box");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025224,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es31.extension_directive.ext_shader_io_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025225,
        "dEQP-GLES31.functional.android_extension_pack.shade",
        "rs.es31.extension_directive.ext_tessellation_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025226,
        "dEQP-GLES31.functional.android_extension_pack.sh",
        "aders.es31.extension_directive.ext_texture_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025227,
        "dEQP-GLES31.functional.android_extension_pack.shader",
        "s.es31.extension_directive.ext_texture_cube_map_array");

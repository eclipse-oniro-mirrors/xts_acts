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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025233,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es32.extension_directive.oes_sample_variables");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025234,
        "dEQP-GLES31.functional.android_extension_pack.shade",
        "rs.es32.extension_directive.oes_shader_image_atomic");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025235,
        "dEQP-GLES31.functional.android_extension_pack.shaders.es3",
        "2.extension_directive.oes_shader_multisample_interpolation");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025236,
        "dEQP-GLES31.functional.android_extension_pack.shaders.es32.",
        "extension_directive.oes_texture_storage_multisample_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025237,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es32.extension_directive.ext_geometry_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025238,
        "dEQP-GLES31.functional.android_extension_pack.s",
        "haders.es32.extension_directive.ext_gpu_shader5");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025239,
        "dEQP-GLES31.functional.android_extension_pack.shader",
        "s.es32.extension_directive.ext_primitive_bounding_box");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025240,
        "dEQP-GLES31.functional.android_extension_pack.sha",
        "ders.es32.extension_directive.ext_shader_io_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025241,
        "dEQP-GLES31.functional.android_extension_pack.shade",
        "rs.es32.extension_directive.ext_tessellation_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025242,
        "dEQP-GLES31.functional.android_extension_pack.sh",
        "aders.es32.extension_directive.ext_texture_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025243,
        "dEQP-GLES31.functional.android_extension_pack.shader",
        "s.es32.extension_directive.ext_texture_cube_map_array");

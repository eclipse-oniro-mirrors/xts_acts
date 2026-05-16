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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000010,
        "dEQP-GLES2.functional.implem",
        "entation_limits.subpixel_bits");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000011,
        "dEQP-GLES2.functional.implemen",
        "tation_limits.max_texture_size");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000012,
        "dEQP-GLES2.functional.implementati",
        "on_limits.max_cube_map_texture_size");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000013,
        "dEQP-GLES2.functional.implementati",
        "on_limits.aliased_point_size_range");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000014,
        "dEQP-GLES2.functional.implementati",
        "on_limits.aliased_line_width_range");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000015,
        "dEQP-GLES2.functional.implementation_",
        "limits.num_compressed_texture_formats");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000016,
        "dEQP-GLES2.functional.implementati",
        "on_limits.num_shader_binary_formats");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000017,
        "dEQP-GLES2.functional.impleme",
        "ntation_limits.shader_compiler");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000018,
        "dEQP-GLES2.functional.implement",
        "ation_limits.max_vertex_attribs");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000019,
        "dEQP-GLES2.functional.implementatio",
        "n_limits.max_vertex_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000020,
        "dEQP-GLES2.functional.implement",
        "ation_limits.max_varying_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000021,
        "dEQP-GLES2.functional.implementation_l",
        "imits.max_combined_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000022,
        "dEQP-GLES2.functional.implementation_",
        "limits.max_vertex_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000023,
        "dEQP-GLES2.functional.implementat",
        "ion_limits.max_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000024,
        "dEQP-GLES2.functional.implementation",
        "_limits.max_fragment_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000025,
        "dEQP-GLES2.functional.implementa",
        "tion_limits.max_renderbuffer_size");

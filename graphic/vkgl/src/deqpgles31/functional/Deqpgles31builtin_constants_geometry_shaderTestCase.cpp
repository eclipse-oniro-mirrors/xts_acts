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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005008,
        "dEQP-GLES31.functional.shaders.builtin_constant",
        "s.geometry_shader.max_geometry_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005009,
        "dEQP-GLES31.functional.shaders.builtin_constant",
        "s.geometry_shader.max_geometry_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005010,
        "dEQP-GLES31.functional.shaders.builtin_constan",
        "ts.geometry_shader.max_geometry_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005011,
        "dEQP-GLES31.functional.shaders.builtin_constants",
        ".geometry_shader.max_geometry_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005012,
        "dEQP-GLES31.functional.shaders.builtin_constan",
        "ts.geometry_shader.max_geometry_output_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005013,
        "dEQP-GLES31.functional.shaders.builtin_constants.g",
        "eometry_shader.max_geometry_total_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005014,
        "dEQP-GLES31.functional.shaders.builtin_constants",
        ".geometry_shader.max_geometry_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005015,
        "dEQP-GLES31.functional.shaders.builtin_constan",
        "ts.geometry_shader.max_geometry_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005016,
        "dEQP-GLES31.functional.shaders.builtin_constants.g",
        "eometry_shader.max_geometry_atomic_counter_buffers");

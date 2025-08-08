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
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008309,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_v",
        "ertex_block.vertex_io_array_size_shader_builtin.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008310,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per",
        "_vertex_block.vertex_io_array_size_shader_builtin.quads");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008311,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_",
        "vertex_block.vertex_io_array_size_shader_builtin.isolines");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008312,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_vertex_block",
        ".vertex_io_array_size_shader_builtin.triangles_explicit_tcs_out_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008313,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_vertex_blo",
        "ck.vertex_io_array_size_shader_builtin.quads_explicit_tcs_out_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008314,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_vertex_bloc",
        "k.vertex_io_array_size_shader_builtin.isolines_explicit_tcs_out_size");

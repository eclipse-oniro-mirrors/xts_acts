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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000121,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "float_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000122,
        "KHR-GLES3.shaders.indexing.tmp_array.f",
        "loat_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000123,
        "KHR-GLES3.shaders.indexing.tmp_array.fl",
        "oat_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000124,
        "KHR-GLES3.shaders.indexing.tmp_array.flo",
        "at_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000125,
        "KHR-GLES3.shaders.indexing.tmp_array.flo",
        "at_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000126,
        "KHR-GLES3.shaders.indexing.tmp_array.floa",
        "t_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000127,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "float_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000128,
        "KHR-GLES3.shaders.indexing.tmp_array.f",
        "loat_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000129,
        "KHR-GLES3.shaders.indexing.tmp_array.fl",
        "oat_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000130,
        "KHR-GLES3.shaders.indexing.tmp_array.flo",
        "at_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000131,
        "KHR-GLES3.shaders.indexing.tmp_array.flo",
        "at_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000132,
        "KHR-GLES3.shaders.indexing.tmp_array.floa",
        "t_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000133,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000134,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000135,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000136,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000137,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000138,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000139,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000140,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000141,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000142,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000143,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000144,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000145,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000146,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000147,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000148,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000149,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000150,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000151,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000152,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000153,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000154,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000155,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000156,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000157,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000158,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000159,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000160,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000161,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000162,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000163,
        "KHR-GLES3.shaders.indexing.tmp_array.",
        "vec4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000164,
        "KHR-GLES3.shaders.indexing.tmp_array.v",
        "ec4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000165,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000166,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000167,
        "KHR-GLES3.shaders.indexing.tmp_array.ve",
        "c4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000168,
        "KHR-GLES3.shaders.indexing.tmp_array.vec",
        "4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000169,
        "KHR-GLES3.shaders.inde",
        "xing.tmp_array.vertexid");

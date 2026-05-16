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
#include "../Khrgles2BaseFunc.h"
#include "../ActsGles2MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000665,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000666,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000667,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000668,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000669,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000670,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000671,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000672,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.nested_structs_arrays.mat4_mat2_both");

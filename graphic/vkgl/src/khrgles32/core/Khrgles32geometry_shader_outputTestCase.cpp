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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000108,
        "KHR-GLES32.core.geometry_shader.o",
        "utput.conflicted_output_primitive");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000109,
        "KHR-GLES32.core.geometry_shader.ou",
        "tput.conflicted_output_vertices_max");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000110,
        "KHR-GLES32.core.geometry_sha",
        "der.output.vertex_emit_at_end");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000111,
        "KHR-GLES32.core.geometry_shader.",
        "output.primitive_end_done_at_end");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000112,
        "KHR-GLES32.core.geometry_shader.output",
        ".primite_end_done_for_single_primitive");

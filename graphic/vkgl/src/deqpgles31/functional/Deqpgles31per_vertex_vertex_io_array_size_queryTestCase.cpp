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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008297,
        "dEQP-GLES31.functional.tessellation.user_defined_",
        "io.per_vertex.vertex_io_array_size_query.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008298,
        "dEQP-GLES31.functional.tessellation.user_define",
        "d_io.per_vertex.vertex_io_array_size_query.quads");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008299,
        "dEQP-GLES31.functional.tessellation.user_defined_",
        "io.per_vertex.vertex_io_array_size_query.isolines");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008300,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_vert",
        "ex.vertex_io_array_size_query.triangles_explicit_tcs_out_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008301,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_ve",
        "rtex.vertex_io_array_size_query.quads_explicit_tcs_out_size");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008302,
        "dEQP-GLES31.functional.tessellation.user_defined_io.per_vert",
        "ex.vertex_io_array_size_query.isolines_explicit_tcs_out_size");

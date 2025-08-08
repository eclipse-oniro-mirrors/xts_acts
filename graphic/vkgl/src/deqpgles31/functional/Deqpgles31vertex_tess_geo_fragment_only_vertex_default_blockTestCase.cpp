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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021333,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_",
        "by_shader.vertex_tess_geo_fragment_only_vertex.default_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021334,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_",
        "shader.vertex_tess_geo_fragment_only_vertex.default_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021335,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_",
        "shader.vertex_tess_geo_fragment_only_vertex.default_block.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021336,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_b",
        "y_shader.vertex_tess_geo_fragment_only_vertex.default_block.sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021337,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_s",
        "hader.vertex_tess_geo_fragment_only_vertex.default_block.sampler_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021338,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_s",
        "hader.vertex_tess_geo_fragment_only_vertex.default_block.sampler_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021339,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_",
        "shader.vertex_tess_geo_fragment_only_vertex.default_block.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021340,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_sha",
        "der.vertex_tess_geo_fragment_only_vertex.default_block.atomic_uint_array");

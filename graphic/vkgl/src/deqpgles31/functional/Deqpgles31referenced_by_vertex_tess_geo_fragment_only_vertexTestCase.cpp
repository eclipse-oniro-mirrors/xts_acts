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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021727,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.",
        "referenced_by.vertex_tess_geo_fragment_only_vertex.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021728,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.r",
        "eferenced_by.vertex_tess_geo_fragment_only_vertex.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021729,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.",
        "referenced_by.vertex_tess_geo_fragment_only_vertex.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024782,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_blo",
        "ck.referenced_by.vertex_tess_geo_fragment_only_vertex.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024783,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_bloc",
        "k.referenced_by.vertex_tess_geo_fragment_only_vertex.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024784,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_blo",
        "ck.referenced_by.vertex_tess_geo_fragment_only_vertex.block_array");

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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021721,
        "dEQP-GLES31.functional.program_interface_query.uniform_bl",
        "ock.referenced_by.vertex_geo_fragment_only_geo.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021722,
        "dEQP-GLES31.functional.program_interface_query.uniform_blo",
        "ck.referenced_by.vertex_geo_fragment_only_geo.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021723,
        "dEQP-GLES31.functional.program_interface_query.uniform_bl",
        "ock.referenced_by.vertex_geo_fragment_only_geo.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024776,
        "dEQP-GLES31.functional.program_interface_query.shader_storage",
        "_block.referenced_by.vertex_geo_fragment_only_geo.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024777,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_",
        "block.referenced_by.vertex_geo_fragment_only_geo.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024778,
        "dEQP-GLES31.functional.program_interface_query.shader_storage",
        "_block.referenced_by.vertex_geo_fragment_only_geo.block_array");

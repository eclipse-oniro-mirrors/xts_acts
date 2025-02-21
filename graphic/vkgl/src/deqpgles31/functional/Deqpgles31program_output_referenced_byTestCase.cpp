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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022554,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.referenced_by.referenced_by_vertex_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022555,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.referenced_by.referenced_by_vertex_tess_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022556,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.referenced_by.referenced_by_vertex_geo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022557,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.referenced_by.referenced_by_vertex_tess_geo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022558,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.referenced_by.referenced_by_separable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022559,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.referenced_by.referenced_by_separable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022560,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.referenced_by.referenced_by_separable_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022561,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.referenced_by.referenced_by_separable_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022562,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.referenced_by.referenced_by_separable_tess_ctrl");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022563,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.referenced_by.referenced_by_separable_tess_ctrl_patch_out");

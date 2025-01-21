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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020579,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.struct.opaque_type.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020580,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".location.default_block.struct.opaque_type.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020581,
        "dEQP-GLES31.functional.program_interface_query.uniform.l",
        "ocation.default_block.struct.opaque_type.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020582,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.struct.opaque_type.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020583,
        "dEQP-GLES31.functional.program_interface_query.uniform.lo",
        "cation.default_block.struct.opaque_type.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020584,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".location.default_block.struct.opaque_type.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020585,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".location.default_block.struct.opaque_type.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020586,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "location.default_block.struct.opaque_type.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020587,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "location.default_block.struct.opaque_type.isampler_2d_ms");

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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021109,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "eferenced_by_shader.separable_geometry.block_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021110,
        "dEQP-GLES31.functional.program_interface_query.uniform.refe",
        "renced_by_shader.separable_geometry.block_array.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021111,
        "dEQP-GLES31.functional.program_interface_query.uniform.refe",
        "renced_by_shader.separable_geometry.block_array.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024243,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.referenced_by.separable_geometry.block_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024244,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.referenced_by.separable_geometry.block_array.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024245,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.referenced_by.separable_geometry.block_array.float_struct");

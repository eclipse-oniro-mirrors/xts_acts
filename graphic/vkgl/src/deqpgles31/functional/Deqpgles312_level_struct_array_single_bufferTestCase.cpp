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
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011097,
        "dEQP-GLES31.functional.ubo.2_level_struct_arr",
        "ay.single_buffer.shared_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011098,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.single_buffer.shared_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011099,
        "dEQP-GLES31.functional.ubo.2_level_struct_ar",
        "ray.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011100,
        "dEQP-GLES31.functional.ubo.2_level_struct_arr",
        "ay.single_buffer.packed_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011101,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.single_buffer.packed_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011102,
        "dEQP-GLES31.functional.ubo.2_level_struct_arr",
        "ay.single_buffer.std140_instance_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011103,
        "dEQP-GLES31.functional.ubo.2_level_struct_arra",
        "y.single_buffer.std140_instance_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011104,
        "dEQP-GLES31.functional.ubo.2_level_struct_ar",
        "ray.single_buffer.std140_instance_array_both");

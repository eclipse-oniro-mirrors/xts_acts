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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020449,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.atomic_counter_buffer_index.named_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020450,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.atomic_counter_buffer_index.named_block.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020451,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.atomic_counter_buffer_index.named_block.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020452,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.atomic_counter_buffer_index.named_block.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020453,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.atomic_counter_buffer_index.named_block.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020454,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.atomic_counter_buffer_index.named_block.vec4");

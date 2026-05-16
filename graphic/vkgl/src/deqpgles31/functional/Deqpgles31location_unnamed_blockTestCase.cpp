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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020614,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.location.unnamed_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020615,
        "dEQP-GLES31.functional.program_interface",
        "_query.uniform.location.unnamed_block.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020616,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.location.unnamed_block.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020617,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.location.unnamed_block.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020618,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.location.unnamed_block.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020619,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.location.unnamed_block.vec4");

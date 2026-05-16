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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004671,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.basic.precision_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004672,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.basic.precision_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004673,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.basic.precision_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004674,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.uniform.basic.precision_conflict_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004931,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.basic.precision_conflict_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004932,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.basic.precision_conflict_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004933,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.basic.precision_conflict_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004934,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.uniform.basic.precision_conflict_4");

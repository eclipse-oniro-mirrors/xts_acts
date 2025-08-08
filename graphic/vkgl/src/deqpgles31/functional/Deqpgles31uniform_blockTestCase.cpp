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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004708,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.uniform.block.differing_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004709,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.uniform.block.type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004710,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.uniform.block.members_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004711,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.uniform.block.layout_qualifier_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004712,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.uniform.block.layout_qualifier_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004713,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.uniform.block.layout_qualifier_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004714,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.uniform.block.layout_qualifier_mismatch_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004715,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.uniform.block.layout_qualifier_mismatch_5");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004968,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.uniform.block.differing_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004969,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.uniform.block.type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004970,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.uniform.block.members_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004971,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.uniform.block.layout_qualifier_mismatch_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004972,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.uniform.block.layout_qualifier_mismatch_2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004973,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.uniform.block.layout_qualifier_mismatch_3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004974,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.uniform.block.layout_qualifier_mismatch_4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004975,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.uniform.block.layout_qualifier_mismatch_5");

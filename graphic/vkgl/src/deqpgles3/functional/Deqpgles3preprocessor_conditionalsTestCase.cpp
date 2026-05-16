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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001082,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001083,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.conditionals.ifdef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001084,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001085,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.conditionals.ifdef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001086,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001087,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.conditionals.ifdef_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001088,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.conditionals.ifndef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001089,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.conditionals.ifndef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001090,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.conditionals.ifndef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001091,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.conditionals.ifndef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001092,
        "dEQP-GLES3.functional.shaders.preprocessor.co",
        "nditionals.mixed_conditional_inclusion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001093,
        "dEQP-GLES3.functional.shaders.preprocessor.con",
        "ditionals.mixed_conditional_inclusion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001094,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.conditionals.nested_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001095,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.conditionals.nested_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001096,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.conditionals.nested_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001097,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.conditionals.nested_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001098,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.conditionals.nested_if_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001099,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.conditionals.nested_if_3_fragment");

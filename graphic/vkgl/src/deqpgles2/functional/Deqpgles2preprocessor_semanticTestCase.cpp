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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000269,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.semantic.ops_as_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000270,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.semantic.ops_as_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000271,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.semantic.correct_order_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000272,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.semantic.correct_order_fragment");

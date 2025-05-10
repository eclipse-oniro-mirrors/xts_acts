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
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012203,
        "dEQP-GLES2.functional.fragment_ops.ble",
        "nd.rgb_equation_alpha_equation.add_add");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012204,
        "dEQP-GLES2.functional.fragment_ops.blend",
        ".rgb_equation_alpha_equation.add_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012205,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_equation_alpha_equation.add_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012206,
        "dEQP-GLES2.functional.fragment_ops.blend",
        ".rgb_equation_alpha_equation.subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012207,
        "dEQP-GLES2.functional.fragment_ops.blend.rg",
        "b_equation_alpha_equation.subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012208,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_eq",
        "uation_alpha_equation.subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012209,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb",
        "_equation_alpha_equation.reverse_subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012210,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_eq",
        "uation_alpha_equation.reverse_subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012211,
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_equati",
        "on_alpha_equation.reverse_subtract_reverse_subtract");

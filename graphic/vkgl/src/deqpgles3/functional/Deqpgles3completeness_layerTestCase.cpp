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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031405,
        "dEQP-GLES3.functional.fbo.c",
        "ompleteness.layer.2darr_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031406,
        "dEQP-GLES3.functional.fbo.c",
        "ompleteness.layer.2darr_1_3");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031407,
        "dEQP-GLES3.functional.fbo.c",
        "ompleteness.layer.2darr_4_3");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031408,
        "dEQP-GLES3.functional.fbo.c",
        "ompleteness.layer.2darr_4_15");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031409,
        "dEQP-GLES3.functional.fbo",
        ".completeness.layer.3d_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031410,
        "dEQP-GLES3.functional.fbo.",
        "completeness.layer.3d_1_15");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031411,
        "dEQP-GLES3.functional.fbo.",
        "completeness.layer.3d_4_15");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031412,
        "dEQP-GLES3.functional.fbo.",
        "completeness.layer.3d_64_15");

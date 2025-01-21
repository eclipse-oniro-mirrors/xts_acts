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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039926,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039927,
        "dEQP-GLES3.functional.vert",
        "ex_array_objects.diff_size");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039928,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_stride");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039929,
        "dEQP-GLES3.functional.vert",
        "ex_array_objects.diff_type");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039930,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039931,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039932,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039933,
        "dEQP-GLES3.functional.vertex",
        "_array_objects.diff_normalize");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039934,
        "dEQP-GLES3.functional.verte",
        "x_array_objects.diff_indices");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039935,
        "dEQP-GLES3.functional.vertex",
        "_array_objects.all_attributes");

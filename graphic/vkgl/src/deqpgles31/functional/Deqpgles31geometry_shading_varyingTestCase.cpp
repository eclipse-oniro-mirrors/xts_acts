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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016373,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.varying.vertex_no_op_geometry_out_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016374,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.varying.vertex_out_0_geometry_out_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016375,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.varying.vertex_out_0_geometry_out_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016376,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.varying.vertex_out_1_geometry_out_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016377,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.varying.vertex_out_1_geometry_out_2");

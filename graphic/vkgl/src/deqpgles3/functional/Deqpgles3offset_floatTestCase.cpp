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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033589,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.float.offset4_stride8_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033590,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.float.offset4_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033591,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.float.offset4_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033592,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.float.offset4_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033593,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.float.offset32_stride8_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033594,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.float.offset32_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033595,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.float.offset32_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033596,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.offset.float.offset32_stride32_quads256");

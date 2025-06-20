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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033597,
        "dEQP-GLES3.functional.vertex_arrays.single_",
        "attribute.offset.byte.offset1_stride2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033598,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset1_stride17_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033599,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset1_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033600,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset1_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033601,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset1_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033602,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset1_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033603,
        "dEQP-GLES3.functional.vertex_arrays.single_",
        "attribute.offset.byte.offset4_stride2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033604,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset4_stride17_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033605,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset4_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033606,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset4_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033607,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset4_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033608,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset4_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033609,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset17_stride2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033610,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset17_stride17_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033611,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset17_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033612,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset17_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033613,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset17_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033614,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset17_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033615,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset32_stride2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033616,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset32_stride17_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033617,
        "dEQP-GLES3.functional.vertex_arrays.single_a",
        "ttribute.offset.byte.offset32_stride32_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033618,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset32_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033619,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset32_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033620,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.offset.byte.offset32_stride32_quads256");

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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032975,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride8_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032976,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride17_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032977,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032978,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride8_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032979,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride17_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032980,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032981,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride12_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032982,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride17_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032983,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032984,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride12_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032985,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride17_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032986,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032987,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032988,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032989,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.user_ptr_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032990,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032991,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032992,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.fixed.user_ptr_stride32_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032993,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride8_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032994,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032995,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride8_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032996,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032997,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride12_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032998,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032999,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride12_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_033000,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_033001,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_033002,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.fixed.buffer_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_033003,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_033004,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.fixed.buffer_stride32_components4_quads256");

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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032939,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.user_ptr_stride2_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032940,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride17_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032941,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032942,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride2_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032943,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride17_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032944,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032945,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.user_ptr_stride3_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032946,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride17_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032947,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032948,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride3_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032949,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride17_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032950,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032951,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.user_ptr_stride4_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032952,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032953,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032954,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.user_ptr_stride4_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032955,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032956,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.byte.user_ptr_stride32_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032957,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.strides.byte.buffer_stride2_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032958,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride17_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032959,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032960,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride2_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032961,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride17_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032962,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032963,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.strides.byte.buffer_stride3_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032964,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride17_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032965,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032966,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride3_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032967,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride17_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032968,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032969,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.strides.byte.buffer_stride4_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032970,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032971,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032972,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.byte.buffer_stride4_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032973,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032974,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.byte.buffer_stride32_components4_quads256");

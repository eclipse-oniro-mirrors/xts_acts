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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032879,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride8_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032880,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride17_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032881,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032882,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride8_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032883,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride17_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032884,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032885,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride12_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032886,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride17_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032887,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032888,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride12_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032889,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride17_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032890,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032891,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032892,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032893,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.user_ptr_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032894,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032895,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032896,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.float.user_ptr_stride32_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032897,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride8_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032898,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032899,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride8_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032900,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032901,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride12_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032902,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032903,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride12_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032904,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032905,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride16_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032906,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.float.buffer_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032907,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride16_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032908,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.float.buffer_stride32_components4_quads256");

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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032909,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride4_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032910,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride17_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032911,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032912,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride4_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032913,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride17_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032914,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032915,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride6_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032916,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride17_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032917,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032918,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride6_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032919,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride17_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032920,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032921,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride8_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032922,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride17_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032923,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.user_ptr_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032924,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride8_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032925,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride17_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032926,
        "dEQP-GLES3.functional.vertex_arrays.single_attribute",
        ".strides.short.user_ptr_stride32_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032927,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride4_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032928,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride32_components2_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032929,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride4_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032930,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride32_components2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032931,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride6_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032932,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride32_components3_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032933,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride6_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032934,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride32_components3_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032935,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride8_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032936,
        "dEQP-GLES3.functional.vertex_arrays.single_attribu",
        "te.strides.short.buffer_stride32_components4_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032937,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride8_components4_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032938,
        "dEQP-GLES3.functional.vertex_arrays.single_attribut",
        "e.strides.short.buffer_stride32_components4_quads256");

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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001841,
        "KHR-GLES31.core.shader_storag",
        "e_buffer_object.basic-basic-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001842,
        "KHR-GLES31.core.shader_storag",
        "e_buffer_object.basic-basic-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001843,
        "KHR-GLES31.core.shader_stor",
        "age_buffer_object.basic-max");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001844,
        "KHR-GLES31.core.shader_storag",
        "e_buffer_object.basic-binding");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001845,
        "KHR-GLES31.core.shader_storage",
        "_buffer_object.basic-syntax-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001846,
        "KHR-GLES31.core.shader_storage",
        "_buffer_object.basic-syntax-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001847,
        "KHR-GLES31.core.shader_storage",
        "_buffer_object.basic-syntaxSSO");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001848,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001849,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001850,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001851,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001852,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case3-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001853,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case3-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001854,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case4-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001855,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case4-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001856,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case5-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001857,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case5-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001858,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case6-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001859,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case6-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001860,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case7-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001861,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std430Layout-case7-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001862,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001863,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001864,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001865,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001866,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case3-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001867,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case3-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001868,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case4-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001869,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case4-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001870,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case5-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001871,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case5-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001872,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case6-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001873,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.basic-std140Layout-case6-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001874,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-atomic-case1-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001875,
        "KHR-GLES31.core.shader_storage_bu",
        "ffer_object.basic-atomic-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001876,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-atomic-case3-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001877,
        "KHR-GLES31.core.shader_storage_bu",
        "ffer_object.basic-atomic-case3-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001878,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-atomic-case4-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001879,
        "KHR-GLES31.core.shader_storage_bu",
        "ffer_object.basic-atomic-case4-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001880,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001881,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001882,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001883,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001884,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case3-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001885,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case3-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001886,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case4-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001887,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-stdLayout-case4-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001888,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.basic-operations-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001889,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.basic-operations-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001890,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.basic-operations-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001891,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.basic-operations-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001892,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.basic-stdLayout_UBO_SSBO-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001893,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.basic-stdLayout_UBO_SSBO-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001894,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.basic-stdLayout_UBO_SSBO-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001895,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.basic-stdLayout_UBO_SSBO-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001896,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001897,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001898,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case2-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001899,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001900,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case3-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001901,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case3-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001902,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case4-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001903,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case4-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001904,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case5-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001905,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case5-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001906,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case6-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001907,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case6-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001908,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case7-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001909,
        "KHR-GLES31.core.shader_storage_buffer_",
        "object.basic-matrixOperations-case7-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001910,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.basic-readonly-writeonly");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001911,
        "KHR-GLES31.core.shader_storage",
        "_buffer_object.basic-name-match");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001912,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-switchBuffers-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001913,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-switchBuffers-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001914,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-switchPrograms-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001915,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-switchPrograms-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001916,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-write-fragment-fs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001917,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.advanced-write-fragment-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001918,
        "KHR-GLES31.core.shader_storage_buffer_ob",
        "ject.advanced-indirectAddressing-case1-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001919,
        "KHR-GLES31.core.shader_storage_buffer_ob",
        "ject.advanced-indirectAddressing-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001920,
        "KHR-GLES31.core.shader_storage_buffer_obj",
        "ect.advanced-indirectAddressing-case2-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001921,
        "KHR-GLES31.core.shader_storage_buffer_ob",
        "ject.advanced-indirectAddressing-case2-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001922,
        "KHR-GLES31.core.shader_storage_buffer",
        "_object.advanced-readWrite-case1-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001923,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.advanced-readWrite-case1-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001924,
        "KHR-GLES31.core.shader_storage_b",
        "uffer_object.advanced-usage-case1");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001925,
        "KHR-GLES31.core.shader_storage_buf",
        "fer_object.advanced-usage-sync-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001926,
        "KHR-GLES31.core.shader_storage_bu",
        "ffer_object.advanced-usage-sync-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001927,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.advanced-usage-operators-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001928,
        "KHR-GLES31.core.shader_storage_buffe",
        "r_object.advanced-usage-operators-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001929,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.advanced-unsizedArrayLength-cs-int");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001930,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.advanced-unsizedArrayLength-fs-int");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001931,
        "KHR-GLES31.core.shader_storage_buffer_o",
        "bject.advanced-unsizedArrayLength-vs-int");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001932,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std430-vec");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001933,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std430-matC");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001934,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std430-matR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001935,
        "KHR-GLES31.core.shader_storage_buffer_object",
        ".advanced-unsizedArrayLength-cs-std430-struct");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001936,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std140-vec");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001937,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std140-matC");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001938,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-std140-matR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001939,
        "KHR-GLES31.core.shader_storage_buffer_object",
        ".advanced-unsizedArrayLength-cs-std140-struct");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001940,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-packed-vec");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001941,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-packed-matC");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001942,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-cs-shared-matR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001943,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-fs-std430-vec");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001944,
        "KHR-GLES31.core.shader_storage_buffer_object.",
        "advanced-unsizedArrayLength-fs-std430-matC-pad");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001945,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-fs-std140-matR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001946,
        "KHR-GLES31.core.shader_storage_buffer_object",
        ".advanced-unsizedArrayLength-fs-std140-struct");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001947,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-vs-std430-vec");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001948,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-vs-std140-matC");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001949,
        "KHR-GLES31.core.shader_storage_buffer_objec",
        "t.advanced-unsizedArrayLength-vs-packed-matR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001950,
        "KHR-GLES31.core.shader_storage_buffer_object",
        ".advanced-unsizedArrayLength-vs-std140-struct");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001951,
        "KHR-GLES31.core.shader_storage_buffer_object.",
        "advanced-unsizedArrayLength-cs-std430-vec-pad");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001952,
        "KHR-GLES31.core.shader_storage_buffer_object.",
        "advanced-unsizedArrayLength-cs-std430-matC-pad");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001953,
        "KHR-GLES31.core.shader_storage_buffer_object.",
        "advanced-unsizedArrayLength-cs-std140-matR-pad");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001954,
        "KHR-GLES31.core.shader_storage_buffer_object.a",
        "dvanced-unsizedArrayLength-cs-std430-struct-pad");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001955,
        "KHR-GLES31.core.shader_storage_buffer_object.advanc",
        "ed-unsizedArrayLength-cs-std430-vec-bindrangeOffset");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001956,
        "KHR-GLES31.core.shader_storage_buffer_object.advan",
        "ced-unsizedArrayLength-cs-std430-vec-bindrangeSize");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001957,
        "KHR-GLES31.core.shader_storage_buffer_object.advan",
        "ced-unsizedArrayLength-cs-std430-vec-bindbaseAfter");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001958,
        "KHR-GLES31.core.shader_storage_buffer_object.ad",
        "vanced-unsizedArrayLength-cs-std430-vec-indexing");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001959,
        "KHR-GLES31.core.shader_storage_b",
        "uffer_object.advanced-matrix-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001960,
        "KHR-GLES31.core.shader_storage_",
        "buffer_object.advanced-matrix-cs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001961,
        "KHR-GLES31.core.shader_storage_",
        "buffer_object.negative-api-bind");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001962,
        "KHR-GLES31.core.shader_storage_buff",
        "er_object.negative-glsl-compileTime");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001963,
        "KHR-GLES31.core.shader_storage_bu",
        "ffer_object.negative-glsl-linkTime");

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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005635,
    "KHR-GL43.shader_storage_buffer_object.basic-basic");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005636,
    "KHR-GL43.shader_storage_buffer_object.basic-basic-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005637,
    "KHR-GL43.shader_storage_buffer_object.basic-max");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005638,
    "KHR-GL43.shader_storage_buffer_object.basic-binding");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005639,
    "KHR-GL43.shader_storage_buffer_object.basic-syntax");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005640,
    "KHR-GL43.shader_storage_buffer_object.basic-syntaxSSO");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005641,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005642,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005643,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005644,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005645,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case3-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005646,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case3-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005647,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case4-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005648,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case4-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005649,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case5-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005650,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case5-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005651,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case6-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005652,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case6-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005653,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case7-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005654,
    "KHR-GL43.shader_storage_buffer_object.basic-std430Layout-case7-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005655,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005656,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005657,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005658,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005659,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case3-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005660,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case3-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005661,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case4-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005662,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case4-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005663,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case5-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005664,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case5-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005665,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case6-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005666,
    "KHR-GL43.shader_storage_buffer_object.basic-std140Layout-case6-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005667,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005668,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005669,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005670,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005671,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case3-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005672,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005673,
    "KHR-GL43.shader_storage_buffer_object.basic-atomic-case4-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005674,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005675,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005676,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005677,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005678,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case3-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005679,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case3-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005680,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case4-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005681,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout-case4-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005682,
    "KHR-GL43.shader_storage_buffer_object.basic-operations-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005683,
    "KHR-GL43.shader_storage_buffer_object.basic-operations-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005684,
    "KHR-GL43.shader_storage_buffer_object.basic-operations-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005685,
    "KHR-GL43.shader_storage_buffer_object.basic-operations-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005686,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout_UBO_SSBO-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005687,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout_UBO_SSBO-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005688,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout_UBO_SSBO-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005689,
    "KHR-GL43.shader_storage_buffer_object.basic-stdLayout_UBO_SSBO-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005690,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case1-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005691,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005692,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case2-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005693,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005694,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case3-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005695,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case3-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005696,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case4-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005697,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case4-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005698,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case5-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005699,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case5-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005700,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case6-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005701,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case6-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005702,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case7-vs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005703,
    "KHR-GL43.shader_storage_buffer_object.basic-matrixOperations-case7-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005704,
    "KHR-GL43.shader_storage_buffer_object.basic-noBindingLayout");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005705,
    "KHR-GL43.shader_storage_buffer_object.basic-readonly-writeonly");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005706,
    "KHR-GL43.shader_storage_buffer_object.basic-name-match");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005707,
    "KHR-GL43.shader_storage_buffer_object.advanced-switchBuffers");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005708,
    "KHR-GL43.shader_storage_buffer_object.advanced-switchBuffers-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005709,
    "KHR-GL43.shader_storage_buffer_object.advanced-switchPrograms");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005710,
    "KHR-GL43.shader_storage_buffer_object.advanced-switchPrograms-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005711,
    "KHR-GL43.shader_storage_buffer_object.advanced-write-fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005712,
    "KHR-GL43.shader_storage_buffer_object.advanced-write-geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005713,
    "KHR-GL43.shader_storage_buffer_object.advanced-write-tessellation");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005714,
    "KHR-GL43.shader_storage_buffer_object.advanced-indirectAddressing-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005715,
    "KHR-GL43.shader_storage_buffer_object.advanced-indirectAddressing-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005716,
    "KHR-GL43.shader_storage_buffer_object.advanced-indirectAddressing-case2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005717,
    "KHR-GL43.shader_storage_buffer_object.advanced-indirectAddressing-case2-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005718,
    "KHR-GL43.shader_storage_buffer_object.advanced-readWrite-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005719,
    "KHR-GL43.shader_storage_buffer_object.advanced-readWrite-case1-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005720,
    "KHR-GL43.shader_storage_buffer_object.advanced-usage-case1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005721,
    "KHR-GL43.shader_storage_buffer_object.advanced-usage-sync");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005722,
    "KHR-GL43.shader_storage_buffer_object.advanced-usage-sync-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005723,
    "KHR-GL43.shader_storage_buffer_object.advanced-usage-operators");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005724,
    "KHR-GL43.shader_storage_buffer_object.advanced-usage-operators-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005725,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005726,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005727,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-matC");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005728,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-matR");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005729,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-struct");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005730,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std140-vec");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005731,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std140-matC");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005732,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std140-matR");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005733,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std140-struct");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005734,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-packed-vec");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005735,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-packed-matC");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005736,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-shared-matR");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005737,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-fs-std430-vec");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005738,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-fs-std430-matC-pad");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005739,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-fs-std140-matR");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005740,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-fs-std140-struct");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005741,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-vs-std430-vec");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005742,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-vs-std140-matC");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005743,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-vs-packed-matR");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005744,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-vs-std140-struct");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005745,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec-pad");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005746,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-matC-pad");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005747,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std140-matR-pad");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005748,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-struct-pad");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005749,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec-bindrangeOffset");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005750,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec-bindrangeSize");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005751,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec-bindbaseAfter");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005752,
    "KHR-GL43.shader_storage_buffer_object.advanced-unsizedArrayLength-cs-std430-vec-indexing");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005753,
    "KHR-GL43.shader_storage_buffer_object.advanced-matrix");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005754,
    "KHR-GL43.shader_storage_buffer_object.advanced-matrix-cs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005755,
    "KHR-GL43.shader_storage_buffer_object.negative-api-bind");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005756,
    "KHR-GL43.shader_storage_buffer_object.negative-api-blockBinding");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005757,
    "KHR-GL43.shader_storage_buffer_object.negative-glsl-compileTime");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005758,
    "KHR-GL43.shader_storage_buffer_object.negative-glsl-linkTime");

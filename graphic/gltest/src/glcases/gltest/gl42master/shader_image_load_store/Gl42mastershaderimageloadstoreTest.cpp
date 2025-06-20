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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005432,
    "KHR-GL42.shader_image_load_store.basic-api-get");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005433,
    "KHR-GL42.shader_image_load_store.basic-api-bind");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005434,
    "KHR-GL42.shader_image_load_store.basic-api-barrier");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005435,
    "KHR-GL42.shader_image_load_store.basic-api-texParam");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005436,
    "KHR-GL42.shader_image_load_store.basic-allFormats-store");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005437,
    "KHR-GL42.shader_image_load_store.basic-allFormats-load");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005438,
    "KHR-GL42.shader_image_load_store.basic-allFormats-storeGeometryStages");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005439,
    "KHR-GL42.shader_image_load_store.basic-allFormats-loadGeometryStages");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005440,
    "KHR-GL42.shader_image_load_store.basic-allFormats-loadStoreComputeStage");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005441,
    "KHR-GL42.shader_image_load_store.basic-allTargets-store");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005442,
    "KHR-GL42.shader_image_load_store.basic-allTargets-load-nonMS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005443,
    "KHR-GL42.shader_image_load_store.basic-allTargets-load-ms");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005444,
    "KHR-GL42.shader_image_load_store.basic-allTargets-atomic");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005445,
    "KHR-GL42.shader_image_load_store.basic-allTargets-loadStoreVS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005446,
    "KHR-GL42.shader_image_load_store.basic-allTargets-loadStoreTCS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005447,
    "KHR-GL42.shader_image_load_store.basic-allTargets-loadStoreTES");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005448,
    "KHR-GL42.shader_image_load_store.basic-allTargets-loadStoreGS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005449,
    "KHR-GL42.shader_image_load_store.basic-allTargets-loadStoreCS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005450,
    "KHR-GL42.shader_image_load_store.basic-allTargets-atomicVS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005451,
    "KHR-GL42.shader_image_load_store.basic-allTargets-atomicTCS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005452,
    "KHR-GL42.shader_image_load_store.basic-allTargets-atomicGS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005453,
    "KHR-GL42.shader_image_load_store.basic-allTargets-atomicCS");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005454,
    "KHR-GL42.shader_image_load_store.basic-glsl-misc");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005455,
    "KHR-GL42.shader_image_load_store.basic-glsl-earlyFragTests");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005456,
    "KHR-GL42.shader_image_load_store.basic-glsl-const");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005457,
    "KHR-GL42.shader_image_load_store.advanced-sync-imageAccess");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005458,
    "KHR-GL42.shader_image_load_store.advanced-sync-vertexArray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005459,
    "KHR-GL42.shader_image_load_store.advanced-sync-drawIndirect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005460,
    "KHR-GL42.shader_image_load_store.advanced-sync-textureUpdate");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005461,
    "KHR-GL42.shader_image_load_store.advanced-sync-imageAccess2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005462,
    "KHR-GL42.shader_image_load_store.advanced-sync-bufferUpdate");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005463,
    "KHR-GL42.shader_image_load_store.advanced-allStages-oneImage");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005464,
    "KHR-GL42.shader_image_load_store.advanced-memory-dependentInvocation");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005465,
    "KHR-GL42.shader_image_load_store.advanced-memory-order");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005466,
    "KHR-GL42.shader_image_load_store.advanced-sso-simple");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005467,
    "KHR-GL42.shader_image_load_store.advanced-sso-atomicCounters");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005468,
    "KHR-GL42.shader_image_load_store.advanced-sso-subroutine");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005469,
    "KHR-GL42.shader_image_load_store.advanced-sso-perSample");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005470,
    "KHR-GL42.shader_image_load_store.advanced-copyImage");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005471,
    "KHR-GL42.shader_image_load_store.advanced-allMips");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005472,
    "KHR-GL42.shader_image_load_store.advanced-cast");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005473,
    "KHR-GL42.shader_image_load_store.single-byte_data_alignment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005474,
    "KHR-GL42.shader_image_load_store.non-layered_binding");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005475,
    "KHR-GL42.shader_image_load_store.incomplete_textures");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005476,
    "KHR-GL42.shader_image_load_store.multiple-uniforms");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005477,
    "KHR-GL42.shader_image_load_store.early-fragment-tests");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005478,
    "KHR-GL42.shader_image_load_store.negative-uniform");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005479,
    "KHR-GL42.shader_image_load_store.negative-bind");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005480,
    "KHR-GL42.shader_image_load_store.negative-compileErrors");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005481,
    "KHR-GL42.shader_image_load_store.negative-linkErrors");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005482,
    "KHR-GL42.shader_image_load_store.uniform-limits");

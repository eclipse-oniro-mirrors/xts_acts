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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002001,
        "KHR-GLES31.core.shader_ima",
        "ge_load_store.basic-api-get");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002002,
        "KHR-GLES31.core.shader_imag",
        "e_load_store.basic-api-bind");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002003,
        "KHR-GLES31.core.shader_image",
        "_load_store.basic-api-barrier");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002004,
        "KHR-GLES31.core.shader_image_load",
        "_store.basic-api-barrier-byRegion");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002005,
        "KHR-GLES31.core.shader_image_",
        "load_store.basic-api-texParam");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002006,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allFormats-store-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002007,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allFormats-store-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002008,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allFormats-load-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002009,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allFormats-load-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002010,
        "KHR-GLES31.core.shader_image_load_store",
        ".basic-allFormats-loadStoreComputeStage");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002011,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-store-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002012,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-store-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002013,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-load-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002014,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-load-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002015,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-atomicFS");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002016,
        "KHR-GLES31.core.shader_image_load_",
        "store.basic-allTargets-loadStoreVS");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002017,
        "KHR-GLES31.core.shader_image_load_",
        "store.basic-allTargets-loadStoreCS");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002018,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-atomicVS");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002019,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-allTargets-atomicCS");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002020,
        "KHR-GLES31.core.shader_image_",
        "load_store.basic-glsl-misc-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002021,
        "KHR-GLES31.core.shader_image_",
        "load_store.basic-glsl-misc-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002022,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.basic-glsl-earlyFragTests");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002023,
        "KHR-GLES31.core.shader_image",
        "_load_store.basic-glsl-const");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002024,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.advanced-sync-imageAccess");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002025,
        "KHR-GLES31.core.shader_image_loa",
        "d_store.advanced-sync-vertexArray");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002026,
        "KHR-GLES31.core.shader_image_load",
        "_store.advanced-sync-imageAccess2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002027,
        "KHR-GLES31.core.shader_image_load",
        "_store.advanced-allStages-oneImage");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002028,
        "KHR-GLES31.core.shader_image_load",
        "_store.advanced-memory-order-vsfs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002029,
        "KHR-GLES31.core.shader_image_",
        "load_store.advanced-sso-simple");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002030,
        "KHR-GLES31.core.shader_image_l",
        "oad_store.advanced-copyImage-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002031,
        "KHR-GLES31.core.shader_image_l",
        "oad_store.advanced-copyImage-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002032,
        "KHR-GLES31.core.shader_image_",
        "load_store.advanced-allMips-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002033,
        "KHR-GLES31.core.shader_image_",
        "load_store.advanced-allMips-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002034,
        "KHR-GLES31.core.shader_image",
        "_load_store.advanced-cast-fs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002035,
        "KHR-GLES31.core.shader_image",
        "_load_store.advanced-cast-cs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002036,
        "KHR-GLES31.core.shader_image",
        "_load_store.negative-uniform");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002037,
        "KHR-GLES31.core.shader_ima",
        "ge_load_store.negative-bind");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002038,
        "KHR-GLES31.core.shader_image_lo",
        "ad_store.negative-compileErrors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002039,
        "KHR-GLES31.core.shader_image_",
        "load_store.negative-linkErrors");

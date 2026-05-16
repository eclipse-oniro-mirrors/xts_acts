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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011517,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011518,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011519,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011520,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011521,
        "dEQP-GLES31.functional.ima",
        "ge_load_store.3d.store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011522,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011523,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011524,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011525,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011526,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011527,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011528,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011529,
        "dEQP-GLES31.functional.imag",
        "e_load_store.3d.store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011530,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011531,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011532,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011533,
        "dEQP-GLES31.functional.image",
        "_load_store.3d.store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011534,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011535,
        "dEQP-GLES31.functional.imag",
        "e_load_store.3d.store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011536,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011537,
        "dEQP-GLES31.functional.ima",
        "ge_load_store.3d.store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011538,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011539,
        "dEQP-GLES31.functional.imag",
        "e_load_store.3d.store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011540,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011541,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011542,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.store.rgba8_snorm_single_layer");

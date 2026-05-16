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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011360,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011361,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011362,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011363,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011364,
        "dEQP-GLES31.functional.imag",
        "e_load_store.cube.store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011365,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011366,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011367,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011368,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011369,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011370,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011371,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011372,
        "dEQP-GLES31.functional.image",
        "_load_store.cube.store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011373,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011374,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011375,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011376,
        "dEQP-GLES31.functional.image_",
        "load_store.cube.store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011377,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011378,
        "dEQP-GLES31.functional.image",
        "_load_store.cube.store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011379,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011380,
        "dEQP-GLES31.functional.imag",
        "e_load_store.cube.store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011381,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011382,
        "dEQP-GLES31.functional.image",
        "_load_store.cube.store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011383,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011384,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011385,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.store.rgba8_snorm_single_layer");

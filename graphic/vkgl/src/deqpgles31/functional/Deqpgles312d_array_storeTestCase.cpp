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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011674,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011675,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011676,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011677,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011678,
        "dEQP-GLES31.functional.image_",
        "load_store.2d_array.store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011679,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011680,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011681,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011682,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011683,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011684,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011685,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011686,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d_array.store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011687,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011688,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011689,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011690,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d_array.store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011691,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011692,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d_array.store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011693,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011694,
        "dEQP-GLES31.functional.image_",
        "load_store.2d_array.store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011695,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011696,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d_array.store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011697,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011698,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011699,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.store.rgba8_snorm_single_layer");

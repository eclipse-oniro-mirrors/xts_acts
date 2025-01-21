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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011543,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011544,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011545,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011546,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011547,
        "dEQP-GLES31.functional.image_",
        "load_store.3d.load_store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011548,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.load_store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011549,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.3d.load_store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011550,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011551,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.3d.load_store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011552,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011553,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011554,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011555,
        "dEQP-GLES31.functional.image_",
        "load_store.3d.load_store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011556,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.load_store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011557,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011558,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011559,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011560,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.load_store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011561,
        "dEQP-GLES31.functional.image_l",
        "oad_store.3d.load_store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011562,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.load_store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011563,
        "dEQP-GLES31.functional.image_",
        "load_store.3d.load_store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011564,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.load_store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011565,
        "dEQP-GLES31.functional.image_",
        "load_store.3d.load_store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011566,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.load_store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011567,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.load_store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011568,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.load_store.rgba8_snorm_single_layer");

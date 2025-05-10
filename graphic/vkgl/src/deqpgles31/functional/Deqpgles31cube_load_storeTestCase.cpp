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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011386,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011387,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011388,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011389,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011390,
        "dEQP-GLES31.functional.image_l",
        "oad_store.cube.load_store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011391,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.load_store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011392,
        "dEQP-GLES31.functional.image_loa",
        "d_store.cube.load_store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011393,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011394,
        "dEQP-GLES31.functional.image_loa",
        "d_store.cube.load_store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011395,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011396,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011397,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011398,
        "dEQP-GLES31.functional.image_l",
        "oad_store.cube.load_store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011399,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.load_store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011400,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011401,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011402,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011403,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.load_store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011404,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.cube.load_store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011405,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.load_store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011406,
        "dEQP-GLES31.functional.image_l",
        "oad_store.cube.load_store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011407,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.load_store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011408,
        "dEQP-GLES31.functional.image_l",
        "oad_store.cube.load_store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011409,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.load_store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011410,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.load_store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011411,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.load_store.rgba8_snorm_single_layer");

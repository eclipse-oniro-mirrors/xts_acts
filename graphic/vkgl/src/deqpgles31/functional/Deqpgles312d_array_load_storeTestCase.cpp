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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011700,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011701,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011702,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011703,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba16f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011704,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d_array.load_store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011705,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.load_store.r32f_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011706,
        "dEQP-GLES31.functional.image_load_",
        "store.2d_array.load_store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011707,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011708,
        "dEQP-GLES31.functional.image_load_",
        "store.2d_array.load_store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011709,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba16ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011710,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011711,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba8ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011712,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d_array.load_store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011713,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.load_store.r32ui_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011714,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011715,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011716,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011717,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.load_store.rgba16i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011718,
        "dEQP-GLES31.functional.image_load",
        "_store.2d_array.load_store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011719,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.load_store.rgba8i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011720,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d_array.load_store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011721,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.load_store.r32i_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011722,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d_array.load_store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011723,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.load_store.rgba8_single_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011724,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.load_store.rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011725,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.load_store.rgba8_snorm_single_layer");

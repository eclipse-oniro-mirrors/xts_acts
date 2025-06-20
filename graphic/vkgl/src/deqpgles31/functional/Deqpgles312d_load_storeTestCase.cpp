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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011242,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011243,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011244,
        "dEQP-GLES31.functional.image_",
        "load_store.2d.load_store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011245,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d.load_store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011246,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.2d.load_store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011247,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011248,
        "dEQP-GLES31.functional.image_",
        "load_store.2d.load_store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011249,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011250,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011251,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.load_store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011252,
        "dEQP-GLES31.functional.image_",
        "load_store.2d.load_store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011253,
        "dEQP-GLES31.functional.image_",
        "load_store.2d.load_store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011254,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.load_store.rgba8_snorm");

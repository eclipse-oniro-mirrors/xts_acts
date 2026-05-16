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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011843,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011844,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011845,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.buffer.load_store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011846,
        "dEQP-GLES31.functional.image_load",
        "_store.buffer.load_store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011847,
        "dEQP-GLES31.functional.image_load",
        "_store.buffer.load_store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011848,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011849,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.buffer.load_store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011850,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011851,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011852,
        "dEQP-GLES31.functional.image_loa",
        "d_store.buffer.load_store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011853,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.buffer.load_store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011854,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.buffer.load_store.rgba8");

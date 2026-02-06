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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011229,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011230,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011231,
        "dEQP-GLES31.functional.ima",
        "ge_load_store.2d.store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011232,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011233,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011234,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011235,
        "dEQP-GLES31.functional.imag",
        "e_load_store.2d.store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011236,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011237,
        "dEQP-GLES31.functional.image",
        "_load_store.2d.store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011238,
        "dEQP-GLES31.functional.imag",
        "e_load_store.2d.store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011239,
        "dEQP-GLES31.functional.ima",
        "ge_load_store.2d.store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011240,
        "dEQP-GLES31.functional.imag",
        "e_load_store.2d.store.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011241,
        "dEQP-GLES31.functional.image_l",
        "oad_store.2d.store.rgba8_snorm");

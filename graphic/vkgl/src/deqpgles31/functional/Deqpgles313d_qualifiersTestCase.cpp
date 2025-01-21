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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011601,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.qualifiers.coherent_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011602,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.qualifiers.volatile_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011603,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.qualifiers.coherent_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011604,
        "dEQP-GLES31.functional.image_load_",
        "store.3d.qualifiers.volatile_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011605,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.qualifiers.coherent_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011606,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.qualifiers.volatile_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011607,
        "dEQP-GLES31.functional.image_lo",
        "ad_store.3d.qualifiers.restrict");

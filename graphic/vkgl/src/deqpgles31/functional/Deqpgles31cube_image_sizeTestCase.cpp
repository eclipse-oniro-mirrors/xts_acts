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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011505,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.image_size.readonly_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011506,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.image_size.readonly_12x12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011507,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.image_size.readonly_1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011508,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.image_size.readonly_7x7");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011509,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.image_size.writeonly_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011510,
        "dEQP-GLES31.functional.image_load_s",
        "tore.cube.image_size.writeonly_12x12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011511,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.image_size.writeonly_1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011512,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.image_size.writeonly_7x7");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011513,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.image_size.readonly_writeonly_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011514,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.image_size.readonly_writeonly_12x12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011515,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.image_size.readonly_writeonly_1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011516,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.image_size.readonly_writeonly_7x7");

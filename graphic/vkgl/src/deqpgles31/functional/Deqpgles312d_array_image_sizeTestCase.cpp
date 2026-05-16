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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011819,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.image_size.readonly_32x32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011820,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.image_size.readonly_12x34x56");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011821,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.image_size.readonly_1x1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011822,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.image_size.readonly_7x1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011823,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.image_size.writeonly_32x32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011824,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.image_size.writeonly_12x34x56");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011825,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.image_size.writeonly_1x1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011826,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d_array.image_size.writeonly_7x1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011827,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.image_size.readonly_writeonly_32x32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011828,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.image_size.readonly_writeonly_12x34x56");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011829,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.image_size.readonly_writeonly_1x1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011830,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.image_size.readonly_writeonly_7x1x1");

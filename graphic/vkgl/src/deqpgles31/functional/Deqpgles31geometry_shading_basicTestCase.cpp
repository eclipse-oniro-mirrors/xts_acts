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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016306,
        "dEQP-GLES31.functional.geom",
        "etry_shading.basic.output_10");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016307,
        "dEQP-GLES31.functional.geome",
        "try_shading.basic.output_128");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016308,
        "dEQP-GLES31.functional.geome",
        "try_shading.basic.output_256");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016309,
        "dEQP-GLES31.functional.geome",
        "try_shading.basic.output_max");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016310,
        "dEQP-GLES31.functional.geometry",
        "_shading.basic.output_10_and_100");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016311,
        "dEQP-GLES31.functional.geometry",
        "_shading.basic.output_100_and_10");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016312,
        "dEQP-GLES31.functional.geometry",
        "_shading.basic.output_0_and_128");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016313,
        "dEQP-GLES31.functional.geometry",
        "_shading.basic.output_128_and_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016314,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.basic.output_vary_by_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016315,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.basic.output_vary_by_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016316,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.basic.output_vary_by_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016317,
        "dEQP-GLES31.functional.geome",
        "try_shading.basic.point_size");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016318,
        "dEQP-GLES31.functional.geometr",
        "y_shading.basic.primitive_id_in");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016319,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.basic.primitive_id_in_restarted");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016320,
        "dEQP-GLES31.functional.geomet",
        "ry_shading.basic.primitive_id");

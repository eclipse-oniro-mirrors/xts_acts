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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039695,
        "dEQP-GLES3.functional.sample",
        "rs.multi_cubemap.diff_wrap_t");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039696,
        "dEQP-GLES3.functional.sample",
        "rs.multi_cubemap.diff_wrap_s");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039697,
        "dEQP-GLES3.functional.sample",
        "rs.multi_cubemap.diff_wrap_r");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039698,
        "dEQP-GLES3.functional.samplers",
        ".multi_cubemap.diff_min_filter");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039699,
        "dEQP-GLES3.functional.samplers",
        ".multi_cubemap.diff_mag_filter");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039700,
        "dEQP-GLES3.functional.sample",
        "rs.multi_cubemap.diff_max_lod");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039701,
        "dEQP-GLES3.functional.sample",
        "rs.multi_cubemap.diff_min_lod");

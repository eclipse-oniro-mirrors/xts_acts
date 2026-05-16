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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005055,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.derivate.triangles_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005056,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.derivate.triangles_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005057,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.derivate.triangles_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005058,
        "dEQP-GLES31.functional.shaders.hel",
        "per_invocation.derivate.lines_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005059,
        "dEQP-GLES31.functional.shaders.hel",
        "per_invocation.derivate.lines_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005060,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.derivate.lines_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005061,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.derivate.wide_lines_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005062,
        "dEQP-GLES31.functional.shaders.helpe",
        "r_invocation.derivate.wide_lines_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005063,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.derivate.wide_lines_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005064,
        "dEQP-GLES31.functional.shaders.hel",
        "per_invocation.derivate.points_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005065,
        "dEQP-GLES31.functional.shaders.hel",
        "per_invocation.derivate.points_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005066,
        "dEQP-GLES31.functional.shaders.help",
        "er_invocation.derivate.points_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005067,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.derivate.wide_points_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005068,
        "dEQP-GLES31.functional.shaders.helper",
        "_invocation.derivate.wide_points_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005069,
        "dEQP-GLES31.functional.shaders.helper_",
        "invocation.derivate.wide_points_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005070,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.triangles_4_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005071,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.triangles_4_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005072,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.triangles_4_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005073,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.lines_4_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005074,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.lines_4_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005075,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.lines_4_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005076,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.wide_lines_4_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005077,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.wide_lines_4_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005078,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_lines_4_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005079,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.points_4_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005080,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.points_4_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005081,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.points_4_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005082,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_points_4_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005083,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_points_4_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005084,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.wide_points_4_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005085,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.triangles_8_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005086,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.triangles_8_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005087,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.triangles_8_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005088,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.lines_8_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005089,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.lines_8_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005090,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.lines_8_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005091,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.wide_lines_8_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005092,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.wide_lines_8_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005093,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_lines_8_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005094,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.points_8_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005095,
        "dEQP-GLES31.functional.shaders.helper_i",
        "nvocation.derivate.points_8_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005096,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.points_8_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005097,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_points_8_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005098,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_points_8_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005099,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.wide_points_8_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005100,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.triangles_max_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005101,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.triangles_max_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005102,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.triangles_max_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005103,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.lines_max_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005104,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.lines_max_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005105,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.lines_max_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005106,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_lines_max_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005107,
        "dEQP-GLES31.functional.shaders.helper_invo",
        "cation.derivate.wide_lines_max_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005108,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.wide_lines_max_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005109,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.points_max_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005110,
        "dEQP-GLES31.functional.shaders.helper_in",
        "vocation.derivate.points_max_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005111,
        "dEQP-GLES31.functional.shaders.helper_inv",
        "ocation.derivate.points_max_samples_fwidth");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005112,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.wide_points_max_samples_dfdx");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005113,
        "dEQP-GLES31.functional.shaders.helper_invoc",
        "ation.derivate.wide_points_max_samples_dfdy");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005114,
        "dEQP-GLES31.functional.shaders.helper_invoca",
        "tion.derivate.wide_points_max_samples_fwidth");

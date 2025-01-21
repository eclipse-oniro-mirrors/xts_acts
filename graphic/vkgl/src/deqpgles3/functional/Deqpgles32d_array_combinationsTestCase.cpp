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
#include "../ActsDeqpgles30025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024429,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024430,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024431,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024432,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024433,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024434,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024435,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024436,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024437,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024438,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024439,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024440,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024441,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024442,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024443,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024444,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024445,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024446,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024447,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024448,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024449,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024450,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024451,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024452,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024453,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024454,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024455,
        "dEQP-GLES3.functional.texture.filtering.2d_ar",
        "ray.combinations.linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024456,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.combinations.linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024457,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024458,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024459,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024460,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024461,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024462,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024463,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024464,
        "dEQP-GLES3.functional.texture.filtering.2d_a",
        "rray.combinations.linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024465,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024466,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024467,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024468,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024469,
        "dEQP-GLES3.functional.texture.filtering.2d_array.comb",
        "inations.nearest_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024470,
        "dEQP-GLES3.functional.texture.filtering.2d_array.comb",
        "inations.nearest_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024471,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024472,
        "dEQP-GLES3.functional.texture.filtering.2d_array.comb",
        "inations.nearest_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024473,
        "dEQP-GLES3.functional.texture.filtering.2d_array.comb",
        "inations.nearest_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024474,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024475,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024476,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024477,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024478,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024479,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024480,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024481,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024482,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024483,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024484,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024485,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024486,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024487,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024488,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024489,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024490,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024491,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024492,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024493,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024494,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024495,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024496,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024497,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024498,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024499,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024500,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024501,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024502,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024503,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024504,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024505,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024506,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024507,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024508,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024509,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024510,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024511,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024512,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024513,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024514,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024515,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024516,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.nearest_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024517,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024518,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.nearest_mipmap_linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024519,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024520,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024521,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024522,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024523,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024524,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024525,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024526,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024527,
        "dEQP-GLES3.functional.texture.filtering.2d_array.com",
        "binations.linear_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024528,
        "dEQP-GLES3.functional.texture.filtering.2d_array.c",
        "ombinations.linear_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024529,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024530,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024531,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024532,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024533,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024534,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024535,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024536,
        "dEQP-GLES3.functional.texture.filtering.2d_array.co",
        "mbinations.linear_mipmap_linear_linear_mirror_mirror");

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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004062,
        "KHR-GLES3.number_parsing.unsigned_",
        "integer_above_signed_range_decimal");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004063,
        "KHR-GLES3.number_parsing.unsigned",
        "_integer_above_signed_range_base8");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004064,
        "KHR-GLES3.number_parsing.unsigned",
        "_integer_above_signed_range_base16");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004065,
        "KHR-GLES3.number_parsing.unsigned_integer",
        "_smallest_value_above_signed_range_decimal");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004066,
        "KHR-GLES3.number_parsing.unsigned_intege",
        "r_smallest_value_above_signed_range_base8");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004067,
        "KHR-GLES3.number_parsing.unsigned_integer",
        "_smallest_value_above_signed_range_base16");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004068,
        "KHR-GLES3.number_parsing.unsi",
        "gned_integer_max_value_decimal");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004069,
        "KHR-GLES3.number_parsing.uns",
        "igned_integer_max_value_base8");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004070,
        "KHR-GLES3.number_parsing.unsi",
        "gned_integer_max_value_base16");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004071,
        "KHR-GLES3.number_parsing.unsigne",
        "d_integer_too_large_value_invalid");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004072,
        "KHR-GLES3.number_parsing.unsigne",
        "d_integer_negative_value_as_uint");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004073,
        "KHR-GLES3.number_parsing.fl",
        "oat_out_of_range_as_infinity");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004074,
        "KHR-GLES3.number_parsing.",
        "float_out_of_range_as_zero");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004075,
        "KHR-GLES3.number_parsing.float_no_limi",
        "t_on_number_of_digits_positive_exponent");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004076,
        "KHR-GLES3.number_parsing.float_no_limi",
        "t_on_number_of_digits_negative_exponent");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004077,
        "KHR-GLES3.number_parsing.float_slightly_o",
        "ut_of_range_exponent_as_positive_infinity");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004078,
        "KHR-GLES3.number_parsing.float",
        "_overflow_to_positive_infinity");

static SHRINK_HWTEST_F(ActsKhrgles30005TestSuite, TestCase_004079,
        "KHR-GLES3.number_parsing.float",
        "_overflow_to_negative_infinity");

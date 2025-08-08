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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033759,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033760,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033761,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033762,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033763,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033764,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033765,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_fixed2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033766,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033767,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033768,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033769,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033770,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033771,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033772,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033773,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033774,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033775,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033776,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033777,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_fixed2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033778,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033779,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033780,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033781,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033782,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033783,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033784,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033785,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033786,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033787,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033788,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033789,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033790,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033791,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033792,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_byte2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033793,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033794,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033795,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033796,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033797,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033798,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033799,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033800,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_byte2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033801,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033802,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033803,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033804,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033805,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033806,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033807,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033808,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_byte2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033809,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033810,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033811,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033812,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033813,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033814,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033815,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_short2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033816,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033817,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033818,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033819,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033820,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033821,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033822,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033823,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033824,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033825,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033826,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033827,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_short2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033828,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033829,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033830,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033831,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033832,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033833,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033834,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033835,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033836,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033837,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033838,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033839,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033840,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_unsigned_byte2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033841,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033842,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033843,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033844,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033845,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033846,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033847,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033848,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033849,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033850,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033851,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033852,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_ty",
        "pes.3_unsigned_byte2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033853,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033854,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033855,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033856,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033857,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033858,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033859,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033860,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033861,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033862,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033863,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033864,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033865,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033866,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033867,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_short2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033868,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033869,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033870,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033871,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033872,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033873,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033874,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033875,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033876,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033877,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033878,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033879,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033880,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033881,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033882,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033883,
        "dEQP-GLES3.functional.vertex_arrays.multiple_attributes.input_type",
        "s.3_unsigned_short2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

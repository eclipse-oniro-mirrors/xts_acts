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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016548,
        "dEQP-GLES3.functional.shader",
        "s.switch.basic_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016549,
        "dEQP-GLES3.functional.shaders",
        ".switch.basic_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016550,
        "dEQP-GLES3.functional.shader",
        "s.switch.basic_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016551,
        "dEQP-GLES3.functional.shaders",
        ".switch.basic_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016552,
        "dEQP-GLES3.functional.shader",
        "s.switch.basic_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016553,
        "dEQP-GLES3.functional.shaders",
        ".switch.basic_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016554,
        "dEQP-GLES3.functional.shaders.switc",
        "h.const_expr_in_label_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016555,
        "dEQP-GLES3.functional.shaders.switch",
        ".const_expr_in_label_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016556,
        "dEQP-GLES3.functional.shaders.switc",
        "h.const_expr_in_label_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016557,
        "dEQP-GLES3.functional.shaders.switch",
        ".const_expr_in_label_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016558,
        "dEQP-GLES3.functional.shaders.switc",
        "h.const_expr_in_label_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016559,
        "dEQP-GLES3.functional.shaders.switch",
        ".const_expr_in_label_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016560,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_label_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016561,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_label_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016562,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_label_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016563,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_label_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016564,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_label_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016565,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_label_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016566,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_not_last_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016567,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.default_not_last_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016568,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.default_not_last_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016569,
        "dEQP-GLES3.functional.shaders.switc",
        "h.default_not_last_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016570,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.default_not_last_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016571,
        "dEQP-GLES3.functional.shaders.switc",
        "h.default_not_last_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016572,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.no_default_label_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016573,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.no_default_label_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016574,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.no_default_label_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016575,
        "dEQP-GLES3.functional.shaders.switc",
        "h.no_default_label_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016576,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.no_default_label_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016577,
        "dEQP-GLES3.functional.shaders.switc",
        "h.no_default_label_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016578,
        "dEQP-GLES3.functional.shaders.s",
        "witch.fall_through_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016579,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.fall_through_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016580,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.fall_through_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016581,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.fall_through_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016582,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.fall_through_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016583,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.fall_through_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016584,
        "dEQP-GLES3.functional.shaders.switc",
        "h.fall_through_default_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016585,
        "dEQP-GLES3.functional.shaders.switch",
        ".fall_through_default_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016586,
        "dEQP-GLES3.functional.shaders.switch",
        ".fall_through_default_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016587,
        "dEQP-GLES3.functional.shaders.switch.",
        "fall_through_default_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016588,
        "dEQP-GLES3.functional.shaders.switch",
        ".fall_through_default_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016589,
        "dEQP-GLES3.functional.shaders.switch.",
        "fall_through_default_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016590,
        "dEQP-GLES3.functional.shaders.switch.",
        "conditional_fall_through_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016591,
        "dEQP-GLES3.functional.shaders.switch.c",
        "onditional_fall_through_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016592,
        "dEQP-GLES3.functional.shaders.switch.c",
        "onditional_fall_through_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016593,
        "dEQP-GLES3.functional.shaders.switch.co",
        "nditional_fall_through_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016594,
        "dEQP-GLES3.functional.shaders.switch.c",
        "onditional_fall_through_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016595,
        "dEQP-GLES3.functional.shaders.switch.co",
        "nditional_fall_through_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016596,
        "dEQP-GLES3.functional.shaders.switch.c",
        "onditional_fall_through_2_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016597,
        "dEQP-GLES3.functional.shaders.switch.co",
        "nditional_fall_through_2_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016598,
        "dEQP-GLES3.functional.shaders.switch.co",
        "nditional_fall_through_2_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016599,
        "dEQP-GLES3.functional.shaders.switch.con",
        "ditional_fall_through_2_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016600,
        "dEQP-GLES3.functional.shaders.switch.co",
        "nditional_fall_through_2_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016601,
        "dEQP-GLES3.functional.shaders.switch.con",
        "ditional_fall_through_2_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016602,
        "dEQP-GLES3.functional.shader",
        "s.switch.scope_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016603,
        "dEQP-GLES3.functional.shaders",
        ".switch.scope_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016604,
        "dEQP-GLES3.functional.shader",
        "s.switch.scope_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016605,
        "dEQP-GLES3.functional.shaders",
        ".switch.scope_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016606,
        "dEQP-GLES3.functional.shader",
        "s.switch.scope_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016607,
        "dEQP-GLES3.functional.shaders",
        ".switch.scope_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016608,
        "dEQP-GLES3.functional.shaders.s",
        "witch.switch_in_if_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016609,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.switch_in_if_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016610,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.switch_in_if_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016611,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.switch_in_if_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016612,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.switch_in_if_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016613,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.switch_in_if_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016614,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.switch_in_for_loop_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016615,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_for_loop_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016616,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_for_loop_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016617,
        "dEQP-GLES3.functional.shaders.switch",
        ".switch_in_for_loop_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016618,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_for_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016619,
        "dEQP-GLES3.functional.shaders.switch",
        ".switch_in_for_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016620,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_while_loop_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016621,
        "dEQP-GLES3.functional.shaders.switch",
        ".switch_in_while_loop_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016622,
        "dEQP-GLES3.functional.shaders.switch",
        ".switch_in_while_loop_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016623,
        "dEQP-GLES3.functional.shaders.switch.",
        "switch_in_while_loop_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016624,
        "dEQP-GLES3.functional.shaders.switch",
        ".switch_in_while_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016625,
        "dEQP-GLES3.functional.shaders.switch.",
        "switch_in_while_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016626,
        "dEQP-GLES3.functional.shaders.switch.",
        "switch_in_do_while_loop_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016627,
        "dEQP-GLES3.functional.shaders.switch.s",
        "witch_in_do_while_loop_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016628,
        "dEQP-GLES3.functional.shaders.switch.",
        "switch_in_do_while_loop_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016629,
        "dEQP-GLES3.functional.shaders.switch.s",
        "witch_in_do_while_loop_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016630,
        "dEQP-GLES3.functional.shaders.switch.",
        "switch_in_do_while_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016631,
        "dEQP-GLES3.functional.shaders.switch.s",
        "witch_in_do_while_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016632,
        "dEQP-GLES3.functional.shaders.s",
        "witch.if_in_switch_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016633,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.if_in_switch_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016634,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.if_in_switch_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016635,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.if_in_switch_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016636,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.if_in_switch_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016637,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.if_in_switch_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016638,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.for_loop_in_switch_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016639,
        "dEQP-GLES3.functional.shaders.switc",
        "h.for_loop_in_switch_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016640,
        "dEQP-GLES3.functional.shaders.switc",
        "h.for_loop_in_switch_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016641,
        "dEQP-GLES3.functional.shaders.switch",
        ".for_loop_in_switch_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016642,
        "dEQP-GLES3.functional.shaders.switc",
        "h.for_loop_in_switch_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016643,
        "dEQP-GLES3.functional.shaders.switch",
        ".for_loop_in_switch_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016644,
        "dEQP-GLES3.functional.shaders.switc",
        "h.while_loop_in_switch_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016645,
        "dEQP-GLES3.functional.shaders.switch",
        ".while_loop_in_switch_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016646,
        "dEQP-GLES3.functional.shaders.switch",
        ".while_loop_in_switch_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016647,
        "dEQP-GLES3.functional.shaders.switch.",
        "while_loop_in_switch_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016648,
        "dEQP-GLES3.functional.shaders.switch",
        ".while_loop_in_switch_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016649,
        "dEQP-GLES3.functional.shaders.switch.",
        "while_loop_in_switch_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016650,
        "dEQP-GLES3.functional.shaders.switch.",
        "do_while_loop_in_switch_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016651,
        "dEQP-GLES3.functional.shaders.switch.d",
        "o_while_loop_in_switch_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016652,
        "dEQP-GLES3.functional.shaders.switch.",
        "do_while_loop_in_switch_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016653,
        "dEQP-GLES3.functional.shaders.switch.d",
        "o_while_loop_in_switch_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016654,
        "dEQP-GLES3.functional.shaders.switch.",
        "do_while_loop_in_switch_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016655,
        "dEQP-GLES3.functional.shaders.switch.d",
        "o_while_loop_in_switch_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016656,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.switch_in_switch_static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016657,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.switch_in_switch_static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016658,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.switch_in_switch_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016659,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_switch_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016660,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.switch_in_switch_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016661,
        "dEQP-GLES3.functional.shaders.switc",
        "h.switch_in_switch_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016662,
        "dEQP-GLES3.functional.shaders",
        ".switch.empty_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016663,
        "dEQP-GLES3.functional.shaders.",
        "switch.empty_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016664,
        "dEQP-GLES3.functional.shaders",
        ".switch.condition_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016665,
        "dEQP-GLES3.functional.shaders.",
        "switch.condition_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016666,
        "dEQP-GLES3.functional.shaders",
        ".switch.condition_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016667,
        "dEQP-GLES3.functional.shaders.",
        "switch.condition_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016668,
        "dEQP-GLES3.functional.shaders",
        ".switch.condition_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016669,
        "dEQP-GLES3.functional.shaders.",
        "switch.condition_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016670,
        "dEQP-GLES3.functional.shaders.",
        "switch.condition_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016671,
        "dEQP-GLES3.functional.shaders.s",
        "witch.condition_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016672,
        "dEQP-GLES3.functional.shaders",
        ".switch.duplicate_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016673,
        "dEQP-GLES3.functional.shaders.",
        "switch.duplicate_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016674,
        "dEQP-GLES3.functional.shade",
        "rs.switch.float_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016675,
        "dEQP-GLES3.functional.shader",
        "s.switch.float_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016676,
        "dEQP-GLES3.functional.shaders.s",
        "witch.non_const_int_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016677,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.non_const_int_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016678,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.statement_before_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016679,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.statement_before_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016680,
        "dEQP-GLES3.functional.shaders.switch.",
        "statement_before_default_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016681,
        "dEQP-GLES3.functional.shaders.switch.s",
        "tatement_before_default_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016682,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.no_statement_after_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016683,
        "dEQP-GLES3.functional.shaders.switc",
        "h.no_statement_after_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016684,
        "dEQP-GLES3.functional.shaders.switch.n",
        "o_statement_after_default_label_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016685,
        "dEQP-GLES3.functional.shaders.switch.no",
        "_statement_after_default_label_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016686,
        "dEQP-GLES3.functional.shade",
        "rs.switch.case_in_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016687,
        "dEQP-GLES3.functional.shader",
        "s.switch.case_in_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016688,
        "dEQP-GLES3.functional.shader",
        "s.switch.default_in_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016689,
        "dEQP-GLES3.functional.shaders",
        ".switch.default_in_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016690,
        "dEQP-GLES3.functional.shaders.",
        "switch.case_in_for_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016691,
        "dEQP-GLES3.functional.shaders.s",
        "witch.case_in_for_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016692,
        "dEQP-GLES3.functional.shaders.s",
        "witch.default_in_for_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016693,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_in_for_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016694,
        "dEQP-GLES3.functional.shaders.s",
        "witch.case_in_while_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016695,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.case_in_while_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016696,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_in_while_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016697,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_in_while_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016698,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.case_in_do_while_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016699,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.case_in_do_while_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016700,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.default_in_do_while_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016701,
        "dEQP-GLES3.functional.shaders.switc",
        "h.default_in_do_while_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016702,
        "dEQP-GLES3.functional.shader",
        "s.switch.missing_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016703,
        "dEQP-GLES3.functional.shaders",
        ".switch.missing_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016704,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.missing_opening_brace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016705,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.missing_opening_brace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016706,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.missing_closing_brace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016707,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.missing_closing_brace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016708,
        "dEQP-GLES3.functional.shade",
        "rs.switch.double_case_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016709,
        "dEQP-GLES3.functional.shader",
        "s.switch.double_case_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016710,
        "dEQP-GLES3.functional.shaders.",
        "switch.double_default_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016711,
        "dEQP-GLES3.functional.shaders.s",
        "witch.double_default_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016712,
        "dEQP-GLES3.functional.shaders.",
        "switch.double_default_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016713,
        "dEQP-GLES3.functional.shaders.s",
        "witch.double_default_2_fragment");

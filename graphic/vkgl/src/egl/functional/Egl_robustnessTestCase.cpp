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
#include "../EglBaseFunc.h"
#include "../ActsEgl0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003655, "dEQP-EGL.functional.robustness.c",
    "reate_context.query_robust_access");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003656, "dEQP-EGL.functional.robustness.cr",
    "eate_context.no_reset_notification");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003657, "dEQP-EGL.functional.robustness.cr",
    "eate_context.lose_context_on_reset");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003658, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.reads.uniform_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003659, "dEQP-EGL.functional.robustness.reset_context.shaders.o",
    "ut_of_bounds.reset_status.reads.uniform_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003660, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds.reset_status.reads.uniform_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003661, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.reads.uniform_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003662, "dEQP-EGL.functional.robustness.reset_context.shaders.out",
    "_of_bounds.reset_status.reads.shader_storage_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003663, "dEQP-EGL.functional.robustness.reset_context.shaders.out_",
    "of_bounds.reset_status.reads.shader_storage_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003664, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bou",
    "nds.reset_status.reads.shader_storage_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003665, "dEQP-EGL.functional.robustness.reset_context.shaders.out_",
    "of_bounds.reset_status.reads.shader_storage_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003666, "dEQP-EGL.functional.robustness.reset_context.shaders",
    ".out_of_bounds.reset_status.reads.local_array.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003667, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.reads.local_array.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003668, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds.reset_status.reads.local_array.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003669, "dEQP-EGL.functional.robustness.reset_context.shaders",
    ".out_of_bounds.reset_status.reads.local_array.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003670, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.writes.uniform_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003671, "dEQP-EGL.functional.robustness.reset_context.shaders.o",
    "ut_of_bounds.reset_status.writes.uniform_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003672, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_",
    "bounds.reset_status.writes.uniform_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003673, "dEQP-EGL.functional.robustness.reset_context.shaders.o",
    "ut_of_bounds.reset_status.writes.uniform_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003674, "dEQP-EGL.functional.robustness.reset_context.shaders.out_",
    "of_bounds.reset_status.writes.shader_storage_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003675, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds.reset_status.writes.shader_storage_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003676, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bou",
    "nds.reset_status.writes.shader_storage_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003677, "dEQP-EGL.functional.robustness.reset_context.shaders.out_",
    "of_bounds.reset_status.writes.shader_storage_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003678, "dEQP-EGL.functional.robustness.reset_context.shaders",
    ".out_of_bounds.reset_status.writes.local_array.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003679, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.writes.local_array.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003680, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds.reset_status.writes.local_array.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003681, "dEQP-EGL.functional.robustness.reset_context.shaders.",
    "out_of_bounds.reset_status.writes.local_array.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003682, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds_non_robust.reset_status.reads.uniform_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003683, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds_non_robust.reset_status.reads.uniform_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003684, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bound",
    "s_non_robust.reset_status.reads.uniform_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003685, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds_non_robust.reset_status.reads.uniform_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003686, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bo",
    "unds_non_robust.reset_status.reads.shader_storage_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003687, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bou",
    "nds_non_robust.reset_status.reads.shader_storage_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003688, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bounds_n",
    "on_robust.reset_status.reads.shader_storage_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003689, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bo",
    "unds_non_robust.reset_status.reads.shader_storage_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003690, "dEQP-EGL.functional.robustness.reset_context.shaders.out_",
    "of_bounds_non_robust.reset_status.reads.local_array.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003691, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds_non_robust.reset_status.reads.local_array.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003692, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_boun",
    "ds_non_robust.reset_status.reads.local_array.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003693, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds_non_robust.reset_status.reads.local_array.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003694, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds_non_robust.reset_status.writes.uniform_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003695, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_",
    "bounds_non_robust.reset_status.writes.uniform_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003696, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bound",
    "s_non_robust.reset_status.writes.uniform_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003697, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds_non_robust.reset_status.writes.uniform_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003698, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bo",
    "unds_non_robust.reset_status.writes.shader_storage_block.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003699, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bou",
    "nds_non_robust.reset_status.writes.shader_storage_block.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003700, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bounds_no",
    "n_robust.reset_status.writes.shader_storage_block.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003701, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_bou",
    "nds_non_robust.reset_status.writes.shader_storage_block.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003702, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds_non_robust.reset_status.writes.local_array.vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003703, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of",
    "_bounds_non_robust.reset_status.writes.local_array.fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003704, "dEQP-EGL.functional.robustness.reset_context.shaders.out_of_boun",
    "ds_non_robust.reset_status.writes.local_array.vertex_and_fragment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003705, "dEQP-EGL.functional.robustness.reset_context.shaders.out_o",
    "f_bounds_non_robust.reset_status.writes.local_array.compute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003706, "dEQP-EGL.functional.robustness.reset_context.fixed_fun",
    "ction_pipeline.reset_status.index_buffer_out_of_bounds");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003707, "dEQP-EGL.functional.robustness.reset_context.fixed_fun",
    "ction_pipeline.reset_status.vertex_buffer_out_of_bounds");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003708, "dEQP-EGL.functional.robustness.reset_context.fixed_function",
    "_pipeline_non_robust.reset_status.index_buffer_out_of_bounds");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003709, "dEQP-EGL.functional.robustness.reset_context.fixed_function_",
    "pipeline_non_robust.reset_status.vertex_buffer_out_of_bounds");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003710, "dEQP-EGL.functional.robustness.negative",
    "_context.invalid_robust_context_creation");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003711, "dEQP-EGL.functional.robustness.negative_con",
    "text.invalid_robust_shared_context_creation");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003712, "dEQP-EGL.functional.robustness.negative_c",
    "ontext.invalid_notification_strategy_enum");

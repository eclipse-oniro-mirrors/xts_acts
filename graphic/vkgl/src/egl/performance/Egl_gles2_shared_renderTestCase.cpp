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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003855, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_context.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003856, "dEQP-EGL.performance.gles2_shared_render.no",
    "_shared_context.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003857, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_context.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003858, "dEQP-EGL.performance.gles2_shared_render.no",
    "_shared_context.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003859, "dEQP-EGL.performance.gles2_shared_render.no_s",
    "hared_context.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003860, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_context.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003861, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_context.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003862, "dEQP-EGL.performance.gles2_shared_render.no",
    "_shared_context.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003863, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_resource.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003864, "dEQP-EGL.performance.gles2_shared_render.no",
    "_shared_resource.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003865, "dEQP-EGL.performance.gles2_shared_render.no_s",
    "hared_resource.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003866, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_resource.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003867, "dEQP-EGL.performance.gles2_shared_render.no_s",
    "hared_resource.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003868, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_resource.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003869, "dEQP-EGL.performance.gles2_shared_render.no_s",
    "hared_resource.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003870, "dEQP-EGL.performance.gles2_shared_render.no_",
    "shared_resource.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003871, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_coord_buffer.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003872, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_coord_buffer.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003873, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_coord_buffer.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003874, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_coord_buffer.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003875, "dEQP-EGL.performance.gles2_shared_render.share",
    "d_coord_buffer.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003876, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_coord_buffer.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003877, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_coord_buffer.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003878, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_coord_buffer.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003879, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_index_buffer.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003880, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_index_buffer.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003881, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_index_buffer.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003882, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_index_buffer.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003883, "dEQP-EGL.performance.gles2_shared_render.share",
    "d_index_buffer.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003884, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_index_buffer.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003885, "dEQP-EGL.performance.gles2_shared_render.shar",
    "ed_index_buffer.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003886, "dEQP-EGL.performance.gles2_shared_render.sha",
    "red_index_buffer.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003887, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_texture.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003888, "dEQP-EGL.performance.gles2_shared_render.",
    "shared_texture.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003889, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_texture.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003890, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_texture.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003891, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_texture.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003892, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_texture.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003893, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_texture.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003894, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_texture.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003895, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_program.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003896, "dEQP-EGL.performance.gles2_shared_render.",
    "shared_program.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003897, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_program.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003898, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_program.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003899, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_program.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003900, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_program.2_threads_2_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003901, "dEQP-EGL.performance.gles2_shared_render.sh",
    "ared_program.4_threads_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003902, "dEQP-EGL.performance.gles2_shared_render.s",
    "hared_program.4_threads_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003903, "dEQP-EGL.performance.gles2_shared_render",
    ".shared_all.1_thread_1_context_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003904, "dEQP-EGL.performance.gles2_shared_rende",
    "r.shared_all.1_thread_1_context_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003905, "dEQP-EGL.performance.gles2_shared_render.",
    "shared_all.1_thread_4_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003906, "dEQP-EGL.performance.gles2_shared_render",
    ".shared_all.1_thread_4_contexts_big_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003907, "dEQP-EGL.performance.gles2_shared_render.",
    "shared_all.2_threads_2_contexts_small_call");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003908, "dEQP-EGL.performance.gles2_shared_render",
    ".shared_all.2_threads_2_contexts_big_call");

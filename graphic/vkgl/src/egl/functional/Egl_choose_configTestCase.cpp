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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000397, "dEQP-EGL.functional.choose_config",
    ".simple.selection_only.buffer_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000398, "dEQP-EGL.functional.choose_confi",
    "g.simple.selection_only.red_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000399, "dEQP-EGL.functional.choose_config",
    ".simple.selection_only.green_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000400, "dEQP-EGL.functional.choose_confi",
    "g.simple.selection_only.blue_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000401, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_only.luminance_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000402, "dEQP-EGL.functional.choose_config",
    ".simple.selection_only.alpha_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000403, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_only.alpha_mask_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000404, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_only.bind_to_texture_rgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000405, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_only.bind_to_texture_rgba");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000406, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_only.color_buffer_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000407, "dEQP-EGL.functional.choose_config.",
    "simple.selection_only.config_caveat");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000408, "dEQP-EGL.functional.choose_confi",
    "g.simple.selection_only.config_id");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000409, "dEQP-EGL.functional.choose_config",
    ".simple.selection_only.conformant");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000410, "dEQP-EGL.functional.choose_config",
    ".simple.selection_only.depth_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000411, "dEQP-EGL.functional.choose_con",
    "fig.simple.selection_only.level");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000412, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_only.max_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000413, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_only.min_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000414, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_only.native_renderable");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000415, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_only.native_visual_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000416, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_only.renderable_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000417, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_only.sample_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000418, "dEQP-EGL.functional.choose_conf",
    "ig.simple.selection_only.samples");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000419, "dEQP-EGL.functional.choose_config.",
    "simple.selection_only.stencil_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000420, "dEQP-EGL.functional.choose_config.",
    "simple.selection_only.sur""face_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000421, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_only.transparent_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000422, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_only.transparent_red_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000423, "dEQP-EGL.functional.choose_config.simpl",
    "e.selection_only.transparent_green_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000424, "dEQP-EGL.functional.choose_config.simpl",
    "e.selection_only.transparent_blue_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000425, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_and_sort.buffer_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000426, "dEQP-EGL.functional.choose_config.",
    "simple.selection_and_sort.red_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000427, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_and_sort.green_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000428, "dEQP-EGL.functional.choose_config.",
    "simple.selection_and_sort.blue_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000429, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_and_sort.luminance_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000430, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_and_sort.alpha_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000431, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_and_sort.alpha_mask_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000432, "dEQP-EGL.functional.choose_config.simpl",
    "e.selection_and_sort.bind_to_texture_rgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000433, "dEQP-EGL.functional.choose_config.simple",
    ".selection_and_sort.bind_to_texture_rgba");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000434, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_and_sort.color_buffer_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000435, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_and_sort.config_caveat");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000436, "dEQP-EGL.functional.choose_config.",
    "simple.selection_and_sort.config_id");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000437, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_and_sort.conformant");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000438, "dEQP-EGL.functional.choose_config.s",
    "imple.selection_and_sort.depth_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000439, "dEQP-EGL.functional.choose_confi",
    "g.simple.selection_and_sort.level");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000440, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_and_sort.max_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000441, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_and_sort.min_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000442, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_and_sort.native_renderable");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000443, "dEQP-EGL.functional.choose_config.simpl",
    "e.selection_and_sort.native_visual_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000444, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_and_sort.renderable_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000445, "dEQP-EGL.functional.choose_config.sim",
    "ple.selection_and_sort.sample_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000446, "dEQP-EGL.functional.choose_config",
    ".simple.selection_and_sort.samples");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000447, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_and_sort.stencil_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000448, "dEQP-EGL.functional.choose_config.si",
    "mple.selection_and_sort.sur""face_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000449, "dEQP-EGL.functional.choose_config.simp",
    "le.selection_and_sort.transparent_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000450, "dEQP-EGL.functional.choose_config.simple",
    ".selection_and_sort.transparent_red_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000451, "dEQP-EGL.functional.choose_config.simple.",
    "selection_and_sort.transparent_green_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000452, "dEQP-EGL.functional.choose_config.simple.",
    "selection_and_sort.transparent_blue_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000453, "dEQP-EGL.functional.choose_config.rand",
    "om.color_sizes");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000454, "dEQP-EGL.functional.choose_config",
    ".random.color_depth_stencil_sizes");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000455, "dEQP-EGL.functional.choose_config.rand",
    "om.buffer_sizes");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000456, "dEQP-EGL.functional.choose_config.rand",
    "om.sur""face_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000457, "dEQP-EGL.functional.choose_config.rand",
    "om.sample_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000458, "dEQP-EGL.functional.choose_config.rand",
    "om.all");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000459, "dEQP-EGL.functional.choose_config.",
    "color_component_type_ext.dont_care");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000460, "dEQP-EGL.functional.choose_confi",
    "g.color_component_type_ext.fixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000461, "dEQP-EGL.functional.choose_confi",
    "g.color_component_type_ext.float");

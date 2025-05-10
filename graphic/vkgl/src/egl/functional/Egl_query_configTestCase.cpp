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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000366, "dEQP-EGL.functional.query_confi",
    "g.get_configs.get_configs_bounds");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000367, "dEQP-EGL.functional.query_confi",
    "g.get_config_attrib.buffer_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000368, "dEQP-EGL.functional.query_confi",
    "g.get_config_attrib.red_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000369, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.green_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000370, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.blue_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000371, "dEQP-EGL.functional.query_config",
    ".get_config_attrib.luminance_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000372, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.alpha_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000373, "dEQP-EGL.functional.query_config.",
    "get_config_attrib.alpha_mask_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000374, "dEQP-EGL.functional.query_config.ge",
    "t_config_attrib.bind_to_texture_rgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000375, "dEQP-EGL.functional.query_config.ge",
    "t_config_attrib.bind_to_texture_rgba");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000376, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.color_buffer_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000377, "dEQP-EGL.functional.query_config",
    ".get_config_attrib.config_caveat");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000378, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.config_id");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000379, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.conformant");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000380, "dEQP-EGL.functional.query_conf",
    "ig.get_config_attrib.depth_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000381, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.level");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000382, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.max_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000383, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.min_swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000384, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.native_renderable");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000385, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.native_visual_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000386, "dEQP-EGL.functional.query_config.",
    "get_config_attrib.renderable_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000387, "dEQP-EGL.functional.query_config",
    ".get_config_attrib.sample_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000388, "dEQP-EGL.functional.query_config.g",
    "et_config_attrib.samples");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000389, "dEQP-EGL.functional.query_confi",
    "g.get_config_attrib.stencil_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000390, "dEQP-EGL.functional.query_confi",
    "g.get_config_attrib.sur""face_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000391, "dEQP-EGL.functional.query_config.",
    "get_config_attrib.transparent_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000392, "dEQP-EGL.functional.query_config.get",
    "_config_attrib.transparent_red_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000393, "dEQP-EGL.functional.query_config.get_",
    "config_attrib.transparent_green_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000394, "dEQP-EGL.functional.query_config.get",
    "_config_attrib.transparent_blue_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000395, "dEQP-EGL.functional.query_confi",
    "g.constraints.color_buffer_size");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000396, "dEQP-EGL.functional.query_confi",
    "g.constraints.transparent_value");

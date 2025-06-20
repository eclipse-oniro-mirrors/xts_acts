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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002352, "dEQP-EGL.functional.nega",
    "tive_api.bind_api");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002353, "dEQP-EGL.functional.negat",
    "ive_api.bind_tex_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002354, "dEQP-EGL.functional.negat",
    "ive_api.copy_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002355, "dEQP-EGL.functional.negat",
    "ive_api.choose_config");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002356, "dEQP-EGL.functional.negati",
    "ve_api.create_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002357, "dEQP-EGL.functional.negative_api.",
    "create_pbuffer_from_client_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002358, "dEQP-EGL.functional.negativ",
    "e_api.create_pbuffer_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002359, "dEQP-EGL.functional.negati",
    "ve_api.create_pixmap_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002360, "dEQP-EGL.functional.negativ",
    "e_api.create_window_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002361, "dEQP-EGL.functional.negativ",
    "e_api.destroy_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002362, "dEQP-EGL.functional.negati",
    "ve_api.destroy_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002363, "dEQP-EGL.functional.negati",
    "ve_api.get_config_attrib");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002364, "dEQP-EGL.functional.negativ",
    "e_api.get_configs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002365, "dEQP-EGL.functional.negati",
    "ve_api.initialize");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002366, "dEQP-EGL.functional.negati",
    "ve_api.make_current");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002367, "dEQP-EGL.functional.negati",
    "ve_api.get_current_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002368, "dEQP-EGL.functional.negativ",
    "e_api.get_current_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002369, "dEQP-EGL.functional.negativ",
    "e_api.query_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002370, "dEQP-EGL.functional.negativ",
    "e_api.query_string");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002371, "dEQP-EGL.functional.negativ",
    "e_api.query_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002372, "dEQP-EGL.functional.negativ",
    "e_api.release_tex_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002373, "dEQP-EGL.functional.negativ",
    "e_api.sur""face_attrib");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002374, "dEQP-EGL.functional.negati",
    "ve_api.swap_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002375, "dEQP-EGL.functional.negati",
    "ve_api.swap_interval");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002376, "dEQP-EGL.functional.negati",
    "ve_api.terminate");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002377, "dEQP-EGL.functional.negativ",
    "e_api.wait_native");

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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003076, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003077, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_window.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003078, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003079, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003080, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003081, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003082, "dEQP-EGL.functional.native_color_mapping",
    ".native_window.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003083, "dEQP-EGL.functional.native_color_mapping.",
    "native_window.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003084, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003085, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_window.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003086, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003087, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003088, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003089, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003090, "dEQP-EGL.functional.native_color_mapping",
    ".native_window.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003091, "dEQP-EGL.functional.native_color_mapping.",
    "native_window.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003092, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_window.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003093, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_window.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003094, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003095, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003096, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003097, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003098, "dEQP-EGL.functional.native_color_mapping.",
    "native_window.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003099, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003100, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_window.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003101, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_window.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003102, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003103, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003104, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003105, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003106, "dEQP-EGL.functional.native_color_mapping.",
    "native_window.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003107, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003108, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_window.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003109, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_window.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003110, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003111, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003112, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003113, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_window.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003114, "dEQP-EGL.functional.native_color_mapping.",
    "native_window.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003115, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_window.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003116, "dEQP-EGL.functional.native_color_",
    "mapping.native_window.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003117, "dEQP-EGL.functional.native_color_",
    "mapping.native_window.other_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003118, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003119, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_pixmap.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003120, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003121, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003122, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003123, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003124, "dEQP-EGL.functional.native_color_mapping",
    ".native_pixmap.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003125, "dEQP-EGL.functional.native_color_mapping.",
    "native_pixmap.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003126, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003127, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_pixmap.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003128, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003129, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003130, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003131, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003132, "dEQP-EGL.functional.native_color_mapping",
    ".native_pixmap.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003133, "dEQP-EGL.functional.native_color_mapping.",
    "native_pixmap.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003134, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_pixmap.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003135, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_pixmap.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003136, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003137, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003138, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003139, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003140, "dEQP-EGL.functional.native_color_mapping.",
    "native_pixmap.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003141, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003142, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_pixmap.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003143, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_pixmap.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003144, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003145, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003146, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003147, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003148, "dEQP-EGL.functional.native_color_mapping.",
    "native_pixmap.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003149, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003150, "dEQP-EGL.functional.native_color_mapping.nat",
    "ive_pixmap.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003151, "dEQP-EGL.functional.native_color_mapping.nati",
    "ve_pixmap.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003152, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003153, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003154, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003155, "dEQP-EGL.functional.native_color_mapping.na",
    "tive_pixmap.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003156, "dEQP-EGL.functional.native_color_mapping.",
    "native_pixmap.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003157, "dEQP-EGL.functional.native_color_mapping.n",
    "ative_pixmap.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003158, "dEQP-EGL.functional.native_color_",
    "mapping.native_pixmap.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003159, "dEQP-EGL.functional.native_color_",
    "mapping.native_pixmap.other_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003160, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003161, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003162, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003163, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003164, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003165, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003166, "dEQP-EGL.functional.native_color_mapping.pbuff",
    "er_to_native_pixmap.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003167, "dEQP-EGL.functional.native_color_mapping.pbuff",
    "er_to_native_pixmap.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003168, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003169, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003170, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003171, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003172, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003173, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003174, "dEQP-EGL.functional.native_color_mapping.pbuff",
    "er_to_native_pixmap.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003175, "dEQP-EGL.functional.native_color_mapping.pbuff",
    "er_to_native_pixmap.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003176, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003177, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003178, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003179, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003180, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003181, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003182, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003183, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003184, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003185, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003186, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003187, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003188, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003189, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003190, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003191, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003192, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003193, "dEQP-EGL.functional.native_color_mapping.pbuffer_t",
    "o_native_pixmap.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003194, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003195, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003196, "dEQP-EGL.functional.native_color_mapping.pbuffer",
    "_to_native_pixmap.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003197, "dEQP-EGL.functional.native_color_mapping.pbuffer_",
    "to_native_pixmap.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003198, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003199, "dEQP-EGL.functional.native_color_mapping.pbuffe",
    "r_to_native_pixmap.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003200, "dEQP-EGL.functional.native_color_mappi",
    "ng.pbuffer_to_native_pixmap.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003201, "dEQP-EGL.functional.native_color_mappin",
    "g.pbuffer_to_native_pixmap.other_render");

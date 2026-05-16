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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003202, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003203, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_window.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003204, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003205, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003206, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003207, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003208, "dEQP-EGL.functional.native_coord_mapping",
    ".native_window.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003209, "dEQP-EGL.functional.native_coord_mapping.",
    "native_window.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003210, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003211, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_window.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003212, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003213, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003214, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003215, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003216, "dEQP-EGL.functional.native_coord_mapping",
    ".native_window.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003217, "dEQP-EGL.functional.native_coord_mapping.",
    "native_window.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003218, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_window.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003219, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_window.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003220, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003221, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003222, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003223, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003224, "dEQP-EGL.functional.native_coord_mapping.",
    "native_window.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003225, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003226, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_window.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003227, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_window.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003228, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003229, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003230, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003231, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003232, "dEQP-EGL.functional.native_coord_mapping.",
    "native_window.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003233, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003234, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_window.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003235, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_window.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003236, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003237, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003238, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003239, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_window.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003240, "dEQP-EGL.functional.native_coord_mapping.",
    "native_window.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003241, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_window.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003242, "dEQP-EGL.functional.native_coord_",
    "mapping.native_window.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003243, "dEQP-EGL.functional.native_coord_",
    "mapping.native_window.other_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003244, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003245, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_pixmap.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003246, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003247, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003248, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003249, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003250, "dEQP-EGL.functional.native_coord_mapping",
    ".native_pixmap.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003251, "dEQP-EGL.functional.native_coord_mapping.",
    "native_pixmap.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003252, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003253, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_pixmap.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003254, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003255, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003256, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003257, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003258, "dEQP-EGL.functional.native_coord_mapping",
    ".native_pixmap.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003259, "dEQP-EGL.functional.native_coord_mapping.",
    "native_pixmap.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003260, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_pixmap.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003261, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_pixmap.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003262, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003263, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003264, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003265, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003266, "dEQP-EGL.functional.native_coord_mapping.",
    "native_pixmap.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003267, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003268, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_pixmap.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003269, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_pixmap.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003270, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003271, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003272, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003273, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003274, "dEQP-EGL.functional.native_coord_mapping.",
    "native_pixmap.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003275, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003276, "dEQP-EGL.functional.native_coord_mapping.nat",
    "ive_pixmap.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003277, "dEQP-EGL.functional.native_coord_mapping.nati",
    "ve_pixmap.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003278, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003279, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003280, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003281, "dEQP-EGL.functional.native_coord_mapping.na",
    "tive_pixmap.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003282, "dEQP-EGL.functional.native_coord_mapping.",
    "native_pixmap.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003283, "dEQP-EGL.functional.native_coord_mapping.n",
    "ative_pixmap.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003284, "dEQP-EGL.functional.native_coord_",
    "mapping.native_pixmap.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003285, "dEQP-EGL.functional.native_coord_",
    "mapping.native_pixmap.other_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003286, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgb565_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003287, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgb565_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003288, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgb565_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003289, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgb565_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003290, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgb565_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003291, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgb565_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003292, "dEQP-EGL.functional.native_coord_mapping.pbuff",
    "er_to_native_pixmap.rgb565_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003293, "dEQP-EGL.functional.native_coord_mapping.pbuff",
    "er_to_native_pixmap.rgb565_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003294, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgb888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003295, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgb888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003296, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgb888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003297, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgb888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003298, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgb888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003299, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgb888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003300, "dEQP-EGL.functional.native_coord_mapping.pbuff",
    "er_to_native_pixmap.rgb888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003301, "dEQP-EGL.functional.native_coord_mapping.pbuff",
    "er_to_native_pixmap.rgb888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003302, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba4444_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003303, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba4444_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003304, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba4444_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003305, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba4444_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003306, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba4444_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003307, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba4444_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003308, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba4444_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003309, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba4444_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003310, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba5551_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003311, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba5551_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003312, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba5551_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003313, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba5551_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003314, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba5551_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003315, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba5551_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003316, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba5551_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003317, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba5551_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003318, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba8888_no_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003319, "dEQP-EGL.functional.native_coord_mapping.pbuffer_t",
    "o_native_pixmap.rgba8888_no_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003320, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba8888_no_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003321, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba8888_no_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003322, "dEQP-EGL.functional.native_coord_mapping.pbuffer",
    "_to_native_pixmap.rgba8888_depth_no_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003323, "dEQP-EGL.functional.native_coord_mapping.pbuffer_",
    "to_native_pixmap.rgba8888_depth_no_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003324, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba8888_depth_stencil_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003325, "dEQP-EGL.functional.native_coord_mapping.pbuffe",
    "r_to_native_pixmap.rgba8888_depth_stencil_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003326, "dEQP-EGL.functional.native_coord_mappi",
    "ng.pbuffer_to_native_pixmap.other_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003327, "dEQP-EGL.functional.native_coord_mappin",
    "g.pbuffer_to_native_pixmap.other_render");

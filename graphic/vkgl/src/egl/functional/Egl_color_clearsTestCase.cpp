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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000462, "dEQP-EGL.functional.color_clears.",
    "single_context.gles1.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000463, "dEQP-EGL.functional.color_clears.",
    "single_context.gles1.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000464, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000465, "dEQP-EGL.functional.color_clears.",
    "single_context.gles1.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000466, "dEQP-EGL.functional.color_clears.",
    "single_context.gles1.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000467, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000468, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000469, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000470, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles1.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000471, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000472, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000473, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000474, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles1.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000475, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles1.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000476, "dEQP-EGL.functional.color_clears.sin",
    "gle_context.gles1.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000477, "dEQP-EGL.functional.color_clears.",
    "single_context.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000478, "dEQP-EGL.functional.color_clears.",
    "single_context.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000479, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000480, "dEQP-EGL.functional.color_clears.",
    "single_context.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000481, "dEQP-EGL.functional.color_clears.",
    "single_context.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000482, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000483, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000484, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000485, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000486, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000487, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000488, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000489, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000490, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000491, "dEQP-EGL.functional.color_clears.sin",
    "gle_context.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000492, "dEQP-EGL.functional.color_clears.",
    "single_context.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000493, "dEQP-EGL.functional.color_clears.",
    "single_context.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000494, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000495, "dEQP-EGL.functional.color_clears.",
    "single_context.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000496, "dEQP-EGL.functional.color_clears.",
    "single_context.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000497, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000498, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000499, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000500, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000501, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000502, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000503, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000504, "dEQP-EGL.functional.color_clears.s",
    "ingle_context.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000505, "dEQP-EGL.functional.color_clears.si",
    "ngle_context.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000506, "dEQP-EGL.functional.color_clears.sing",
    "le_context.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000507, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000508, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000509, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000510, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000511, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000512, "dEQP-EGL.functional.color_clears",
    ".single_context.vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000513, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000514, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000515, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000516, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000517, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000518, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000519, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000520, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000521, "dEQP-EGL.functional.color_clears.",
    "single_context.vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000522, "dEQP-EGL.functional.color_clears.sing",
    "le_context.vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000523, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000524, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000525, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000526, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000527, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000528, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000529, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000530, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000531, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000532, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000533, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000534, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000535, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000536, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000537, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000538, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000539, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000540, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000541, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000542, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000543, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000544, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000545, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000546, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000547, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000548, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000549, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000550, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000551, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000552, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000553, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000554, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000555, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000556, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000557, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000558, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000559, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000560, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000561, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000562, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000563, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000564, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000565, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000566, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000567, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000568, "dEQP-EGL.functional.color_clear",
    "s.multi_context.vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000569, "dEQP-EGL.functional.color_clear",
    "s.multi_context.vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000570, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000571, "dEQP-EGL.functional.color_clear",
    "s.multi_context.vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000572, "dEQP-EGL.functional.color_clear",
    "s.multi_context.vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000573, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000574, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000575, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000576, "dEQP-EGL.functional.color_clears.",
    "multi_context.vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000577, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000578, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000579, "dEQP-EGL.functional.color_clears.",
    "multi_context.vg.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000580, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000581, "dEQP-EGL.functional.color_clears",
    ".multi_context.vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000582, "dEQP-EGL.functional.color_clears.",
    "multi_context.vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000583, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000584, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000585, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000586, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000587, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000588, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000589, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000590, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000591, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000592, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000593, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000594, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000595, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000596, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000597, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000598, "dEQP-EGL.functional.color_clears",
    ".multi_context.gles1_gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000599, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000600, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000601, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000602, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000603, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000604, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000605, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000606, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000607, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000608, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000609, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000610, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000611, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000612, "dEQP-EGL.functional.color_clears.multi_c",
    "ontext.gles1_gles2_gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000613, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_gles2_gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000614, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000615, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000616, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000617, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000618, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles1_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000619, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000620, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000621, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000622, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000623, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000624, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000625, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000626, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles1_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000627, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles1_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000628, "dEQP-EGL.functional.color_clea",
    "rs.multi_context.gles1_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000629, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000630, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000631, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000632, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000633, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles2_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000634, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000635, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000636, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000637, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles2_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000638, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000639, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000640, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000641, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles2_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000642, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles2_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000643, "dEQP-EGL.functional.color_clea",
    "rs.multi_context.gles2_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000644, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000645, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000646, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000647, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000648, "dEQP-EGL.functional.color_clears.m",
    "ulti_context.gles3_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000649, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000650, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000651, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000652, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles3_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000653, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000654, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000655, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000656, "dEQP-EGL.functional.color_clears.mu",
    "lti_context.gles3_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000657, "dEQP-EGL.functional.color_clears.mul",
    "ti_context.gles3_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000658, "dEQP-EGL.functional.color_clea",
    "rs.multi_context.gles3_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000659, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000660, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000661, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000662, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000663, "dEQP-EGL.functional.color_clears.mult",
    "i_context.gles1_gles2_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000664, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000665, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000666, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000667, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000668, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000669, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000670, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000671, "dEQP-EGL.functional.color_clears.multi",
    "_context.gles1_gles2_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000672, "dEQP-EGL.functional.color_clears.multi_",
    "context.gles1_gles2_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000673, "dEQP-EGL.functional.color_clears.",
    "multi_context.gles1_gles2_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000674, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles1.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000675, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles1.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000676, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000677, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles1.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000678, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles1.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000679, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000680, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000681, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000682, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000683, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000684, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000685, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000686, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000687, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000688, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000689, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000690, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000691, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000692, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000693, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000694, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000695, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000696, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000697, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000698, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000699, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000700, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000701, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000702, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000703, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000704, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000705, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000706, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000707, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000708, "dEQP-EGL.functional.color_clears",
    ".multi_thread.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000709, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000710, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000711, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000712, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000713, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000714, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000715, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000716, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000717, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000718, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000719, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000720, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000721, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000722, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000723, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000724, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000725, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000726, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000727, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000728, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000729, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000730, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000731, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000732, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000733, "dEQP-EGL.functional.color_clears",
    ".multi_thread.vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000734, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000735, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000736, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000737, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000738, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000739, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000740, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000741, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000742, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000743, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000744, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000745, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000746, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000747, "dEQP-EGL.functional.color_clears.mul",
    "ti_thread.gles1_gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000748, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000749, "dEQP-EGL.functional.color_clear",
    "s.multi_thread.gles1_gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000750, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000751, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000752, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000753, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000754, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000755, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000756, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000757, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000758, "dEQP-EGL.functional.color_clears.multi_t",
    "hread.gles1_gles2_gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000759, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000760, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000761, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000762, "dEQP-EGL.functional.color_clears.multi_",
    "thread.gles1_gles2_gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000763, "dEQP-EGL.functional.color_clears.multi_t",
    "hread.gles1_gles2_gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000764, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_gles2_gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000765, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000766, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000767, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000768, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000769, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000770, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles1_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000771, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000772, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000773, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000774, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000775, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000776, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000777, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000778, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles1_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000779, "dEQP-EGL.functional.color_clea",
    "rs.multi_thread.gles1_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000780, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000781, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000782, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000783, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000784, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000785, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles2_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000786, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000787, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000788, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000789, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000790, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000791, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000792, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000793, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles2_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000794, "dEQP-EGL.functional.color_clea",
    "rs.multi_thread.gles2_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000795, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000796, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000797, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000798, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000799, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000800, "dEQP-EGL.functional.color_clears.m",
    "ulti_thread.gles3_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000801, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000802, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000803, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000804, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000805, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000806, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000807, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000808, "dEQP-EGL.functional.color_clears.mu",
    "lti_thread.gles3_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000809, "dEQP-EGL.functional.color_clea",
    "rs.multi_thread.gles3_vg.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000810, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000811, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000812, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000813, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000814, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000815, "dEQP-EGL.functional.color_clears.mult",
    "i_thread.gles1_gles2_vg.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000816, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000817, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000818, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000819, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000820, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000821, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000822, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000823, "dEQP-EGL.functional.color_clears.multi",
    "_thread.gles1_gles2_vg.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000824, "dEQP-EGL.functional.color_clears.",
    "multi_thread.gles1_gles2_vg.other");
